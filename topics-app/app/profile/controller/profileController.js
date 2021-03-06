const profileViews = require('../view/profileViews');
// const mainController = require('../../main/controller/mainController');
// const formController = require('./formController');

const profileController = {
  getProfile: (request, response) => {
    // Test si la variable userInfos est null ou non
    if (request.session.user.token !== '') {
      request.session.user.message = `Bienvenue ${request.session.user.username}!`;
      profileViews.view(request, response);
    } else {
      request.session.user.message =
        'Veuillez vous identifier pour accéder à cette page.';
      request.session.messageFirstDisplay = true;
      response.redirect('/connexion/stdLogin');
    }
  },

  // /*-------------- ROUTE SELECTOR ------------*/
  // /**
  //  * Using ':pass', select what to do next :
  //  * ':pass' can take following values :
  //  *    - pseudo,
  //  *    - password,
  //  *    - email,
  //  */
  // selectPOST: (request, response) => {
  //   // Ici récupérer :pass et envoyer la suite en fonction, faire un switch
  //   const pass = request.params.pass;
  //   console.log('etape 0', pass);

  //   switch (pass) {
  //     case 'pseudo':
  //       formController.controlFormPseudo(request, response);
  //       break;
  //     case 'password':
  //       formController.controlFormPassword(request, response);
  //       break;
  //     case 'email':
  //       formController.controlFormEmail(request, response);
  //       break;
  //     // case 'delete':
  //     //   profileController.deleteUserControl(request, response);
  //     //   break;

  //     default:
  //       response.info = "La route post qu'elle n'existe !!";
  //       mainController.index(request, response);
  //       break;
  //   }
  // },
};

module.exports = profileController;
