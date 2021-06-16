"use strict";

var googleTools = require('./../MW/googleTools');

var githubTools = require('./../MW/githubTools');

var connexionDB = require('./../model/connexionDB');

var APIController = {
  /**
   * After a user is identified, retrieve infos from google redirect url <code>
   * @param {Objet} request 
   * @param {Objet} response 
   */
  google: function google(request, response) {
    var dataUser;
    return regeneratorRuntime.async(function google$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.prev = 0;
            _context.next = 3;
            return regeneratorRuntime.awrap(googleTools.getGoogleAccountFromCode(request.query.code));

          case 3:
            dataUser = _context.sent;

            if (dataUser) {
              APIController.manageDB(dataUser, request, response);
            } else {
              response.redirect('/connexion/stdLogin?msg_code=EC001');
            }

            _context.next = 11;
            break;

          case 7:
            _context.prev = 7;
            _context.t0 = _context["catch"](0);
            console.log(_context.t0);
            response.redirect('/connexion/stdLogin?msg_code=EC010');

          case 11:
          case "end":
            return _context.stop();
        }
      }
    }, null, null, [[0, 7]]);
  },
  github: function github(request, response) {
    var accessToken, dataUser;
    return regeneratorRuntime.async(function github$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
            _context2.prev = 0;
            _context2.next = 3;
            return regeneratorRuntime.awrap(githubTools.getAccessTokenFromGithub(request, response));

          case 3:
            accessToken = _context2.sent;
            _context2.next = 6;
            return regeneratorRuntime.awrap(githubTools.getUserFromToken(accessToken));

          case 6:
            dataUser = _context2.sent;

            // console.log(dataUser)
            if (dataUser) {
              APIController.manageDB(dataUser, request, response);
            } else {
              response.redirect('/connexion/stdLogin?msg_code=EC011');
            }

            _context2.next = 14;
            break;

          case 10:
            _context2.prev = 10;
            _context2.t0 = _context2["catch"](0);
            console.log(_context2.t0);
            response.redirect('/connexion/stdLogin?msg_code=EC100');

          case 14:
          case "end":
            return _context2.stop();
        }
      }
    }, null, null, [[0, 10]]);
  },
  manageDB: function manageDB(dataUser, request, response) {
    // Ici on vérifie si l'utilisateur existe en DBUser
    connexionDB.getUserByEmail(dataUser.email, function (err, res) {
      if (err) {
        // Erreur dans la requête SELECT
        console.log(err);
        response.redirect('/connexion/stdLogin?msg_code=FC000');
      } else if (res.rows.length) {
        request.session.data.logguedIn = true;
        request.session.data.userInfos = res.rows[0];
        response.redirect('/categories?msg_code=IC000');
      } else {
        connexionDB.insertProfil(dataUser, function (err, res) {
          if (err) {
            // Erreur requête INSERT INTO
            console.log(err);
            response.redirect('/?msg_code=FC000');
          } else {
            // console.log('result', res);
            // ici mettre les valeurs d'identification dans la session
            request.session.data.logguedIn = true;
            request.session.data.userInfos = {
              id: res.rows[0].id,
              status: res.rows[0].status,
              pseudo: res.rows[0].pseudo
            };
            response.redirect('/categories?msg_code=IC000');
          }
        });
      }
    });
  }
};
module.exports = APIController;