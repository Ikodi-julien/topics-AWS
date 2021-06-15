import { quill, getCookie, STRAPI_URL } from './utils.js';
import { topicPageUtils } from './topicUtils.js';

export const topicRequest = {
  /**
   * POST a new Topic
   * @param {Event} event
   */
  postTopic: async event => {
    event.preventDefault();
    const errors = [];
    // Récupération du formulaire, du titre, de l'url, de la cat id et user id :
    const form = event.target;
    const topicTitle = form.querySelector('input[name="topic__title"]').value;
    const catId = document.querySelector('#catId').textContent;
    const catName = document
      .querySelector('.categories__category__title')
      .textContent.toLowerCase();
    const userId = document.querySelector('#infoUserId').textContent;
    const userName = document.querySelector('#userName').textContent;

    // Récupération du contenu html du champ de saisie
    const quillContent = quill.newQuill.getContents();

    // Vérifier le contenu non-vide des champs
    if (
      topicTitle === '' ||
      catName === '' ||
      quillContent === '' ||
      userId === '' ||
      catId === '' ||
      userName === ''
    ) {
      alert('Il manque des infos dans un ou des champs de saisie');
      return;
    }

    // Préparer l'envoi du formulaire
    const body = JSON.stringify({
      title: topicTitle,
      topic_content: quillContent,
      category: catId,
      author: userId,
      author_name: userName,
    });
    // console.log(body);
    // Récupérer le token laissé au moment de la connexion
    const token = getCookie('token');

    if (!token) {
      alert('Créez un compte pour créer un topic...');
      return;
    }

    const authorization = `Bearer ${token}`;

    let response, topic;
    try {
      response = await fetch(`${STRAPI_URL}/topics`, {
        method: 'POST',
        headers: {
          'content-type': 'application/json',
          Authorization: authorization,
        },
        body,
      });

      topic = await response.json();
      // console.log('topic after post', topic);
    } catch (error) {
      errors.push(error);
    }

    if (response.ok) {
      try {
        const isCreated = await topicPageUtils.createTopic(topic);

        if (isCreated) {
          form.querySelector('input[name="topic__title"]').value = '';
          quill.newQuill.setContents('');
        }
      } catch (error) {
        errors.push(error);
      }
    } else if (response.statusText === 'Forbidden') {
      alert("Désolé, cette action n'est pas autorisée...");
      return;
    } else {
      errors.push(response.statusText);
    }

    if (errors.length) errors.forEach(error => alert(error));
  },

  /**
   * Updates a topic, only by the author of the topic.
   * @param {Event} event
   */
  putTopic: async event => {
    const errors = [];
    // Récupération de l'id du topic :
    const topicId = event.target.closest('.topic').dataset.id;
    // Récupération du contenu du topic
    const editor = event.target
      .closest('.topic')
      .querySelector('.ql-container');

    const quill = new Quill(editor);
    const content = quill.getContents();
    // Prépa des données à envoyer
    const body = JSON.stringify({
      topic_content: content,
    });
    // console.log(body);
    // Récupérer le token laissé au moment de la connexion
    const token = getCookie('token');

    if (!token) {
      alert("Vous n'êtes pas l'auteur de ce topic, désolé...");
      return;
    }

    const authorization = `Bearer ${token}`;

    try {
      const response = await fetch(`${STRAPI_URL}/topics/${topicId}`, {
        method: 'PUT',
        headers: {
          'content-type': 'application/json',
          Authorization: authorization,
        },
        body,
      });

      if (response.ok) return;
      errors.push(response.statusText);
    } catch (error) {
      errors.push(error);
    }

    if (errors.length) errors.forEach(error => alert(error));
  },

  /**
   * Delete a topic from database
   * @param {Event} event
   */
  deleteTopic: async event => {
    const topic = event.target.closest('.topic');

    try {
      // Récupérer le token laissé au moment de la connexion
      const token = getCookie('token');

      if (!token) {
        alert("Vous n'avez pas les droits pour supprimer ce topic, désolé...");
        return;
      }

      const authorization = `Bearer ${token}`;

      const response = await fetch(
        `${STRAPI_URL}/topics/${topic.dataset.id}`,
        {
          method: 'DELETE',
          headers: {
            Authorization: authorization,
          },
        }
      );

      if (response.ok) {
        document.querySelector('.topics__container').removeChild(topic);
        console.log('deleted');
      } else {
        throw response.statusText;
      }
    } catch (error) {
      console.log(error);
    }
  },
};
