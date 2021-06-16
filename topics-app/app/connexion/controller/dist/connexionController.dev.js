"use strict";

var connexionViews = require('../view/connexionViews');

var connexionDB = require('../model/connexionDB');

var bcrypt = require('bcrypt');

var generatePassword = require('generate-password');

var nodemailer = require('./../MW/nodemailer');

var _require = require('../MW/githubTools'),
    githubURL = _require.githubURL;

var _require2 = require('../MW/googleTools'),
    url = _require2.url;

var connexionController = {
  /*-------------- VIEWS ----------------*/
  stdConnexion: function stdConnexion(request, response) {
    response.locals.urlGoogle = url;
    response.locals.urlGithub = githubURL;
    connexionViews.view(request, response);
  },
  createAccount: function createAccount(request, response) {
    connexionViews.view(request, response);
  },
  lostPass: function lostPass(request, response) {
    connexionViews.view(request, response);
  },
  deleteUser: function deleteUser(request, response) {
    connexionViews.view(request, response);
  },

  /*-------------- FORM CONTROL ------------*/

  /**
   * Controls wether the user informations matches usersDatabase
   */
  stdLoginControl: function stdLoginControl(request, response) {
    var formEmail = request.body.email;

    if (formEmail === '') {
      response.redirect('/connexion/stdLogin?msg_code=IC110');
      return;
    } // Ici on récupère les données user en BDD.


    connexionDB.getUserByEmail(formEmail, function (err, user) {
      if (err) {
        console.log('erreur dans connexionDB.getUserByEmail :', err);
        response.redirect('/connexion/stdLogin?msg_code=FC000');
      } else {
        // On continue si DBUser existe
        if (!user.rowCount) {
          response.redirect('/connexion/stdLogin?msg_code=IC110');
        } else {
          // https://www.npmjs.com/package/bcrypt
          bcrypt.compare(request.body.password, user.rows[0].password, function (err, same) {
            if (err) {
              console.log('erreur dans bcrypt hash :', err);
              response.redirect('/connexion/stdLogin?msg_code=FC001');
            } else if (same) {
              // ici mettre les valeurs d'identification dans la session
              request.session.data.logguedIn = true;
              request.session.data.userInfos = user.rows[0];
              response.redirect('/categories?msg_code=IC000');
            } else {
              response.redirect('/connexion/stdLogin?msg_code=IC1001');
            }
          });
        }
      }
    });
  },

  /**
   * Controls if form's data are good enought to create an account...
   */
  createAccountControl: function createAccountControl(request, response) {
    // On récupère les données à contrôler :
    var formFirstName = request.body.first_name;
    var formLastName = request.body.last_name;
    var formEmail = request.body.email;
    var formPassword_1 = request.body.password_1;
    var formPassword_2 = request.body.password_2; // Ici on fixe la vue à afficher lors du render

    request.params.pass = 'stdLogin'; // Check empty form

    if (formFirstName === '' || formLastName === '' || formEmail === '' || formPassword_1 === '') {
      response.redirect('/connexion/stdLogin?msg_code=IC1000');
    } else {
      if (formPassword_1 !== formPassword_2) {
        // Passwords check
        response.redirect('/connexion/stdLogin?msg_code=IC111');
      } else {
        // Check if Email exists in DB
        connexionDB.getEmail(formEmail, function (error, user) {
          if (error) {
            console.log('error de la query getPseudo : ', error);
            response.redirect('/connexion/stdLogin?msg_code=FC000');
          } else {
            if (!user.rowCount) {
              // If email doesn't exist
              // Ici on hash le password avant le stockage en BDD
              bcrypt.hash(formPassword_1, 10, function (err, hash) {
                if (err) {
                  console.log(err);
                  response.redirect('/connexion/stdLogin?msg_code=FC010');
                } else {
                  var dataUser = {
                    pseudo: "".concat(formFirstName, "-").concat(formLastName),
                    firstName: formFirstName,
                    lastName: formLastName,
                    email: formEmail,
                    hashedPass: hash
                  }; // Ici function avec callback pour l'insertion du profil

                  connexionDB.insertProfil(dataUser, function (err, res) {
                    if (err) {
                      console.log('error de la query insertProfil: ', err);
                      response.redirect('/connexion/stdLogin?msg_code=FC000');
                    } else {
                      // TODO: Prévoir un envoi de mail pour confirmation de l'adresse mail
                      response.redirect('/connexion/stdLogin?msg_code=IC001');
                    }
                  });
                }
              });
            } else {
              // le pseudo est déjà pris:
              response.redirect('/connexion/stdLogin?msg_code=IC010');
            }
          }
        });
      }
    }
  },

  /**
   * Performs checkings over lost password request
   */
  lostPasswordControl: function lostPasswordControl(request, response) {
    // Récup du formulaire
    var email = request.body.email; // Ici vérifier que l'email est en base de données

    connexionDB.isEmailInDB(email, function (error, data) {
      if (error) {
        console.log('dans lostPassWordControl - isEmailInDB :', error);
        response.redirect('/connexion/stdLogin?msg_code=FC000');
      } else {
        if (data.rowCount) {
          // console.log('isEmailInDB : ', data);
          // Stocker les données utilisateur
          var user = data.rows[0]; // Générer un nouveau mot de passe

          var newPassword = generatePassword.generate({
            length: 8,
            numbers: true
          }); // Le crypter avant de le mettre en DB
          // Le mettre en DB

          var insertData = {
            id: user.id,
            hashedPassword: bcrypt.hashSync(newPassword, 10)
          };
          connexionDB.insertDefaultPassword(insertData, function (error, results) {
            if (error) {
              console.log('dans lostPassWordControl - insertDefaultPassword :', error);
              response.redirect('/connexion/stdLogin?msg_code=FC000');
            } else {
              user.password = newPassword; // Sendmail personnifie le message envoyé

              nodemailer.sendLostPassMail(user, function (error, info) {
                if (error) {
                  console.log(error);
                  response.redirect('/connexion/stdLogin?msg_code=FC011');
                } else {
                  // console.log('results de insertDefaultPassword:', info.response);
                  response.redirect('/connexion/stdLogin?msg_code=IC011');
                }
              });
            }
          });
        } else {
          response.redirect('/connexion/stdLogin?msg_code=IC100');
        }
      }
    });
  },

  /**
   * Supprime un user de la BDD
   */
  deleteUserControl: function deleteUserControl(request, response) {
    connexionDB.deleteUser(request.body.id, function (error, results) {
      if (error) {
        console.log('dans deleteUser :', error);
        response.redirect('/connexion/stdLogin?msg_code=FC000');
      } else {
        response.redirect('/connexion/stdLogin?msg_code=IC101');
      }
    });
  },
  //TODO................................................................

  /**
   * When a user responds to a "reinitialize password email", 
   * we have to make sure that everything is under control
   * @param {*} request 
   * @param {*} response 
   */
  checkDataMail: function checkDataMail(request, response) {// Ascertain code
    // if code ok set session détails
    // redirect to profile in order to set a new password
  }
};
module.exports = connexionController;