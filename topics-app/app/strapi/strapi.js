const fetch = require('node-fetch');

const strapi = {

  logUser: async body => {
    // console.log(body);
    try {
      const response = await fetch(`${process.env.STRAPI_URL}/auth/local`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
      });

      return await response.json();
    } catch (error) {
      console.log(error);
      return error;
    }
  },

  /**
   * Register a new user in strapi API
   * @param {Object} body - Will be stringified to be POST
   * @return {Object} user or error
   */
  registerUser: async body => {
    try {
      const response = await fetch(
        `${process.env.STRAPI_URL}/auth/local/register`,
        {
          method: 'POST',
          headers: {
            Accept: 'application/json',
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(body),
        }
      );

      const resJSON = await response.json();

      // Faire la gestion d'erreur ici, car c'est mon choix !
      if (typeof resJSON.data !== 'undefined') {
        console.log(resJSON.data[0].messages[0].message);
        return { message: resJSON.data[0].messages[0].message };
      } else if (typeof resJSON.user !== 'undefined') {
        return resJSON;
      } else {
        return { error: 'c la misère !' };
      }
    } catch (error) {
      return { error };
    }
  },

  /**
   * Register a new token in strapi API
   * @param {Object} body - Will be stringified to be POST
   * @return { Object } token or error
   */
  setToken: async body => {
    try {
      const response = await fetch(`${process.env.STRAPI_URL}/tokens`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(body),
      });

      const resJSON = await response.json();

      // Faire la gestion d'erreur ici, car c'est mon choix !
      if (typeof resJSON.data !== 'undefined') {
        console.log(resJSON);
        return { message: resJSON.data[0].messages[0].message };
      } else if (typeof resJSON.token !== 'undefined') {
        return resJSON;
      } else {
        return { error: 'Problème dans setToken' };
      }
    } catch (error) {
      return { error };
    }
  },
};

module.exports = strapi;
