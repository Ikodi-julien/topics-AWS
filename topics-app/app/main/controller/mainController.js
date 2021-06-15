const mainViews = require('../views/mainViews');

const mainController = {
  // code associé à la route '/'
  index: (request, response) => {
    mainViews.index(request, response);
  },

  /**
   * Set the session' infos
   *
   * session = user : {
   *                  id: -1,
   *                  token: '',
   *                  message: '',
   *                },
   *           messageFirstDisplay: false,
   *           connexionFirstRound: false
   */
  checkSession: function (request, response, next) {
    const session = request.session;
    // Si les paramètres de session par défaut n'existent pas,
    // On les crée
    if (!session.user) {
      session.user = {
        id: -1,
        token: '',
        message: 'Hello :-)',
      };
      // Servira à une condition à l'affichage des messages,
      session.messageFirstDisplay = true;
      // Servira à une condition pour nouvelle session lors de l'inscription,
      session.connexionFirstRound = false;

      // console.log('creation data user');
      // console.log('user message : ', session.user.message);
    }

    if (session.messageFirstDisplay) {
      // console.log('1er passage message');
      // console.log('user message avant false : ', session.user.message);
      session.messageFirstDisplay = false;
    } else {
      session.user.message = '';
    }

    mainController.checkFirstConnexion(request, response, next);
  },

  sessionDisconnect: (request, response, next) => {
    request.session = null;
    response.redirect('/');
  },

  checkFirstConnexion: (request, response, next) => {
    const user = [];

    if (request.session.connexionFirstRound) {
      // Récup des données de session de l'utilisateur.
      user.push(request.session.user);

      // console.log('1ere connexion');
      // console.log('user message : ', request.session.user.message);
      // Je regenère une session pour éviter les problèmes d'identifiant lié à la session
      request.session.regenerate(error => {
        if (error) console.log('session regenerate error : ', error);
        // console.log('New SID : ', request.sessionID);
        // On remet les données de session
        request.session.user = user[0];
        request.session.messageFirstDisplay = true;
        request.session.connexionFirstRound = false;
        // console.log(JSON.stringify(session.user));
        next();
      });
    } else {
      next();
    }
  },
};

module.exports = mainController;
