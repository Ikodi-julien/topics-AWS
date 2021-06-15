const googleTools = require('../MW/googleTools');
const githubTools = require('../MW/githubTools');
const connexionController = require('./connexionController');
const strapi = require('../../strapi/strapi');

const APIController = {
  /**
   * After a user is identified, retrieve infos from google redirect url <code>
   * @param {Objet} request
   * @param {Objet} response
   */
  google: async (request, response) => {
    try {
      const dataGoogle = await googleTools.getGoogleAccountFromCode(
        request.query.code
      );

      if (dataGoogle) {
        await APIController.setContext(dataGoogle, request, response);
        return;
      } else {
        response.redirect('/connexion/stdLogin?msg_code=EC001');
      }
    } catch (error) {
      console.log(error);
      response.redirect('/connexion/stdLogin?msg_code=EC010');
    }
  },

  github: async (request, response) => {
    // console.log('github')
    try {
      const accessToken = await githubTools.getAccessTokenFromGithub(
        request,
        response
      );
      const dataGithub = await githubTools.getUserFromToken(accessToken);

      // console.log(dataUser)
      if (dataGithub) {
        APIController.setContext(dataGithub, request, response);
        return;
      } else {
        response.redirect('/connexion/stdLogin?msg_code=EC001');
      }
    } catch (error) {
      console.log(error);
      response.redirect('/connexion/stdLogin?msg_code=EC010');
    }
  },

  setContext: async (dataUser, request, response) => {
    const body = {
      identifier: dataUser.email,
      password: dataUser.password,
    };
    console.log(body);
    // Tentative de log in
    const rawUser = await strapi.logUser(body);
    // console.log(dataUser);

    if (rawUser.statusCode !== 400) {
      //

      if (typeof rawUser.jwt !== 'undefined') {
        // console.log('user :', dataUser);
        // dire de reinitialiser la session pour éviter les soucis d'identification
        request.session.connexionFirstRound = true;
        // ici mettre les valeurs d'identification dans la session
        request.session.user = rawUser.user;
        response.cookie('token', rawUser.jwt);
        request.session.user.message = 'Ok connecté !';
        request.session.messageFirstDisplay = true;

        response.redirect('/categories');
      } else {
        request.session.user.message = rawUser.data[0].messages[0].message;
        response.redirect('/connexion/stdLogin');
      }
    } else {
      console.log(
        'setContext logUser error :',
        rawUser.data[0].messages[0].message
      );

      // Ici requête d'inscription
      await connexionController.APICreateAccountControl(
        dataUser,
        request,
        response
      );
      return;
    }
  },
};

module.exports = APIController;
