"use strict";

module.exports = {
  /**
   * After a user is identified, retrieve infos from google redirect url <code>
   * @param {Objet} request 
   * @param {Objet} response 
   */
  "do": function _do(request, response) {
    var dataUser;
    return regeneratorRuntime.async(function _do$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.prev = 0;
            _context.next = 3;
            return regeneratorRuntime.awrap(getGoogleAccountFromCode(request.query.code));

          case 3:
            dataUser = _context.sent;
            // Ici on vérifie si l'utilisateur existe en DBUser
            connexionDB.getUserByEmail(dataUser.email, function (err, res) {
              if (res.rows.length) {
                request.session.data.logguedIn = true;
                request.session.data.userInfos = res.rows[0];
                response.redirect('/categories');
              } else {
                connexionDB.insertProfil(dataUser, function (err, res) {
                  if (err) {
                    response.info = err;
                    response.redirect('/');
                  } else {
                    console.log('result', res); // Ici faire la connexion directement :
                    // ici mettre les valeurs d'identification dans la session

                    request.session.data.logguedIn = true;
                    request.session.data.userInfos = {
                      id: res.rows[0].id,
                      status: res.rows[0].status,
                      pseudo: res.rows[0].pseudo
                    };
                    response.redirect('/categories');
                  }
                });
              }
            });
            _context.next = 12;
            break;

          case 7:
            _context.prev = 7;
            _context.t0 = _context["catch"](0);
            console.log(_context.t0);
            response.info = 'Aïe, le profile n\'a pas été enregistré dans la base';
            connexionViews.view(request, response);

          case 12:
          case "end":
            return _context.stop();
        }
      }
    }, null, null, [[0, 7]]);
  }
};