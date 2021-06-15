import { quill, getCookie, STRAPI_URL } from './utils.js';
import { messagePageUtils } from './messageUtils.js';

export const messageRequest = {
  /**
   * POST a new message
   * @param {Event} event
   */
  postMessage: async event => {
    event.preventDefault();
    const errors = [];
    // Récupération du formulaire et user id :
    const topicId = document.querySelector('#topicId').textContent;
    const userId = document.querySelector('#infoUserId').textContent;
    const userName = document.querySelector('#userName').textContent;

    // Récupération du contenu html du champ de saisie
    const quillContent = quill.newQuill.getContents();

    // console.log(body);
    // Vérifier le contenu non-vide des champs
    if (quillContent === '' || userId === '' || userName === '') {
      alert('Il manque des infos dans un ou des champs de saisie');
      return;
    }
    // Prépa des données à envoyer
    const body = JSON.stringify({
      topic: topicId,
      message_content: quillContent,
      author: userId,
      author_name: userName,
    });
    // Récupérer le token laissé au moment de la connexion
    const token = getCookie('token');

    if (!token) {
      alert('Créez un compte pour écrire un message...');
      return;
    }

    const authorization = `Bearer ${token}`;

    let response, message;
    try {
      response = await fetch(`${STRAPI_URL}/messages`, {
        method: 'POST',
        headers: {
          'content-type': 'application/json',
          Authorization: authorization,
        },
        body,
      });
    } catch (error) {
      erros.push(error);
    }

    if (response.ok) {
      try {
        message = await response.json();
        // console.log(message);
        const isCreated = await messagePageUtils.createMessage(message);

        if (isCreated) {
          quill.newQuill.setContents('');
        }
      } catch (error) {
        errors.push(error);
      }
    } else {
      errors.push(response.statusText);
    }

    if (errors.length) errors.forEach(error => alert(error));
  },

  /**
   * Updates a message, owner of the message only
   * @param {Event} event
   * @returns boolean
   */
  putMessage: async event => {
    const errors = [];
    // Récupération de l'id du message :
    const messageId = event.target.closest('.message').dataset.id;

    // Récupération du contenu du message
    const editor = event.target
      .closest('.message')
      .querySelector('.ql-container');

    const quill = new Quill(editor);
    const content = quill.getContents();

    // Prépa des données à envoyer
    const body = JSON.stringify({
      message_content: content,
    });
    // console.log(body);
    // Récupérer le token laissé au moment de la connexion
    const token = getCookie('token');

    if (!token) {
      alert("Vous n'êtes pas l'auteur du message, désolé...");
      return;
    }

    const authorization = `Bearer ${token}`;

    try {
      const response = await fetch(`${STRAPI_URL}/messages/${messageId}`, {
        method: 'PUT',
        headers: {
          'content-type': 'application/json',
          Authorization: authorization,
        },
        body,
      });

      if (response.ok) {
        return true;
      } else {
        errors.push(response.statusText);
      }
    } catch (error) {
      errors.push(error);
    }

    if (errors.length) errors.forEach(error => alert(error));
  },

  /**
   * Delete a message, only by the author of the topic.
   * @param {Event} event
   */
  deleteMessage: async event => {
    const errors = [];
    const message = event.target.closest('.message');
    // Récupérer le token laissé au moment de la connexion
    const token = getCookie('token');
    if (!token) {
      alert("Vous n'avez pas les droits pour supprimer ce topic, désolé...");
      return;
    }

    try {
      const authorization = `Bearer ${token}`;
      const response = await fetch(
        `${STRAPI_URL}/messages/${message.dataset.id}`,
        {
          method: 'DELETE',
          headers: {
            Authorization: authorization,
          },
        }
      );

      if (response.ok) {
        document.querySelector('.message__list').removeChild(message);
        console.log('deleted');
      } else {
        errors.push(response.statusText);
      }
    } catch (error) {
      errors.push(error.stack);
    }

    if (errors.length) errors.forEach(error => alert(error));
  },
};
