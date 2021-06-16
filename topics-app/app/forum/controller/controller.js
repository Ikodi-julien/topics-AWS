const { default: axios } = require('axios');
const forumViews = require('../view/forumView');

const forumController = {
  categories: async (request, response) => {
    try { 
      const resCategories = await axios(process.env.STRAPI_URL + '/categories', {
        method: 'GET',
      });

    // console.log(resCategories);
      forumViews.categories(response, {
        categories: resCategories.data,
        session: request.session,
      });
      
    } catch(error ) {
      console.log(error.toString())
    }
  },

  category: async (request, response) => {
    try {
      const catName = request.params.name;
      // Récup des catégories
      const resCategories = await axios(process.env.STRAPI_URL + '/categories', {
        method: 'GET',
      });

      // Récup de la catégorie courante
      const currentCategory = resCategories.data.find(
        cat => cat.name === catName
      );

      forumViews.category(response, {
        categories: resCategories.data,
        currentCategory,
        session: request.session,
      });
      
    } catch(error ) {
      console.log(error.toJSON())
    }
  },

  topic: async (request, response) => {
    try {
      const topicId = request.params.id;
      const catName = request.params.catname;
      // Récup des catégories
      const resCategories = await axios(process.env.STRAPI_URL + '/categories', {
        method: 'GET',
      });

      // Récup de la catégorie courante
      const currentCategory = resCategories.data.find(
        cat => cat.name === catName
      );

      // Récup du topic
      const resTopic = await axios(
        process.env.STRAPI_URL + '/topics/' + topicId,
        { method: 'GET' }
      );

      forumViews.topic(response, {
        topic: resTopic.data,
        categories: resCategories.data,
        currentCategory,
        session: request.session,
      });
            
    } catch(error ) {
      console.log(error.toJSON())
    }
  },
};
module.exports = forumController;
