"use strict";

var _require = require('pg'),
    Client = _require.Client; // Les variables d'env sont rechargées dans chaque module si besoin
// et définies dans .env


require('dotenv').config(); // 'process' est une variable globale dispo partout dans le dossier


var client = new Client({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_LOGIN,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});
client.connect();
/*-------------------------------------------------------------*/

module.exports = {
  /**
   * Controls wether the user informations matches usersDatabase
   */
  stdLoginControl: function stdLoginControl(request, response) {
    var formPseudo = request.body.pseudo;
    var formPassword = request.body.password;
    var query = "SELECT * FROM module_connexion.users \n    WHERE pseudo='".concat(formPseudo, "'\n    AND password = '").concat(formPassword, "';");

    try {
      client.query(query, function (error, results) {
        //
        if (error === null) {
          // On continue si DBUser existe et que les passwords concordent
          if (results.rows.length) {
            // ici mettre les valeurs d'identification dans la session
            response.render('index', {
              loggedIn: true,
              info: request.session.info
            }); //
          } else {
            //
            response.render('connexion', {
              loggedIn: false,
              info: "erreur dans l'enchainement des flash-backs..."
            });
          }
        } else {
          console.log('error de la query : ', error);
        }
      });
    } catch (error) {
      console.log('error du bloc try : ', error);
    }
  },

  /**
   * Controls if form's data are good enought to create an account...
   */
  createAccountControl: function createAccountControl(request, response, next) {
    // On récupère les données à contrôler :
    var formPseudo = request.body.pseudo;
    var formPassword_1 = request.body.password_1;
    var formPassword_2 = request.body.password_2;
    var formEmail_1 = request.body.email_1;
    var formEmail_2 = request.body.email_1; // On vérifie que mots de passe, email et pseudo sont non-vides

    if (formPseudo === '' || formPassword_1 === '' || formEmail_1 === '') {
      // Les champs sont mal remplis
      response.render('createAccount', {
        info: 'Les champs sont mal remplis',
        loggedIn: request.session.loggedIn
      }); //
    } else {
      //
      if (formPassword_1 !== formPassword_2) {
        // On commence par contrôler si les deux mots de passe sont identiques
        // 'Les mots de passe ne sont pas identiques';
        response.render('createAccount', {
          info: 'Les mots de passe ne sont pas identiques',
          loggedIn: request.session.loggedIn
        }); //
      } else if (formEmail_1 !== formEmail_2) {
        // les emails ne sont pas identiques:
        response.render('createAccount', {
          info: 'Les emails ne sont pas identiques',
          loggedIn: request.session.loggedIn
        }); //
      } else {
        // C'est bon pour le mot de passe et l'email
        // Check if pseudo already exist in database
        var queryPseudo = "SELECT id \n          FROM module_connexion.users \n          WHERE pseudo = '".concat(formPseudo, "';");

        try {
          client.query(queryPseudo, function (error, results) {
            //
            if (!results.rows) {
              // On continue les vérifs,
              response.render('createAccount', {
                info: 'c bon on peut continuer',
                loggedIn: request.session.loggedIn
              }); //
            } else {
              // le pseudo est déjà pris:
              response.render('createAccount', {
                info: 'Le pseudo est déjà utilisé, il faut en choisir un autre',
                loggedIn: request.session.loggedIn
              });
            }
          });
        } catch (error) {
          console.log('error de try dans createAccountControl : ', error);
        }
      }
    }
  }
};