"use strict";

var connexionController = require('../controller/connexionController');

var mainController = require('./../../main/controller/mainController');

var APIController = require('./../controller/APIController');

var connexionSwitch = {
  /*-------------- ROUTE SELECTOR ------------*/

  /**
   * Using ':pass', select what to do next :
   * ':pass' can take following values :
   *    - stdLogin,
   *    - createAccount,
   *    -lostPass,
   *    -deleteUser,
   */
  POST: function POST(request, response) {
    // Ici récupérer :pass et envoyer la suite en fonction, faire un switch
    var view = request.params.view;

    switch (view) {
      case 'stdLogin':
        connexionController.stdLoginControl(request, response);
        break;

      case 'createAccount':
        connexionController.createAccountControl(request, response);
        break;

      case 'lostPass':
        connexionController.lostPasswordControl(request, response);
        break;

      case 'deleteUser':
        connexionController.deleteUserControl(request, response);
        break;

      default:
        response.info = "La route post qu'elle n'existe !!";
        mainController.index(request, response);
        break;
    }
  },

  /**
   * Using ':pass', select what to do next :
   * ':pass' can take following values :
   *    - stdLogin,
   *    - createAccount,
   *    -lostPass,
   *    -deleteUser,
   */
  GET: function GET(request, response) {
    // Ici récupérer :pass et envoyer la suite en fonction, faire un switch
    var view = request.params.view;

    switch (view) {
      case 'stdLogin':
        connexionController.stdConnexion(request, response);
        break;

      case 'disconnect':
        mainController.sessionDisconnect(request, response);
        break;

      case 'deleteUser':
        connexionController.deleteUser(request, response);
        break;

      case 'google':
        APIController.google(request, response);
        break;

      case 'github':
        APIController.github(request, response);
        break;

      case 'mailConfirm':
        connexionController.checkDataMail(request, response);
        break;

      default:
        response.info = "La route get qu'elle n'existe !!";
        mainController.index(request, response);
        break;
    }
  }
};
module.exports = connexionSwitch;