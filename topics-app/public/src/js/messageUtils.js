import { messageRequest } from './messageAPIRequest.js';
import { getCookie, STRAPI_URL } from './utils.js';

export const messagePageUtils = {
  populateTopic: async () => {
    // For messages page only, the topic.
    if (document.querySelectorAll('#mainTopicEditor').length) {
      try {
        // Récup du contenu à afficher avec l'id du topic,
        const topicId = document.getElementById('topicId').textContent;
        const rawTopic = await fetch(`${STRAPI_URL}/topics/${topicId}`);
        const topic = await rawTopic.json();

        // On indique l'auteur
        document.querySelector('.topic__header__author').textContent =
          topic.author.username;

        // On indique la date de création
        document.querySelector(
          '.topic__header__createDate time'
        ).textContent = new Date(topic.created_at).toLocaleDateString();

        // Le titre
        document.querySelector('.topic__main__title').textContent = topic.title;

        // On fait un quill pour garder la mise en forme
        const quill = new Quill('#mainTopicEditor', {});

        // quill prend un objet json pour définir son contenu
        quill.setContents(topic.topic_content.ops);
        quill.disable();
      } catch (error) {
        console.log(error);
      }
    }
  },

  /**
   * Create an add message elements in DOM
   * @param {Object} message - Un des messages récup avec le topic
   */
  createMessage: async message => {
    console.log(message);
    /************ LES VARIABLES !!!!************/
    const errors = [];
    let authorId, me;

    // Récup du template :
    const template = document.getElementById('messageTemplate');

    /************ POPULATE ************/
    // Clone du modèle
    const node = document.importNode(template.content, true);
    // id du topic
    node.querySelector('.message').dataset.id = message.id;

    // Nom de l'auteur
    node.querySelector('.message__header__author').textContent =
      message.author_name;

    // Date de création
    node.querySelector('#messageCreatedAt').textContent = new Date(
      message.created_at
    ).toLocaleDateString();

    // Description, il faut créer un éditeur Quill
    // Pour repérer l'éditeur on lui donne en param l'id du message
    node.querySelector(
      '.message__main__description'
    ).id = `editor${message.id}`;

    /*********** BUTTONS IF CONNECTED ***********/

    if (getCookie('token')) {
      // De plus, vérifier si l'utilisateur est l'auteur du topic
      // console.log('author-id : ', authorId);

      const token = getCookie('token');

      if (!token) {
        alert('Pas de token... pas de token.');
        return;
      }

      const authorization = `Bearer ${token}`;
      // Récupérer le user (me) à l'aide du token
      try {
        const rawMe = await fetch(`${STRAPI_URL}/users/me`, {
          method: 'GET',
          headers: {
            'content-type': 'application/json',
            Authorization: authorization,
          },
        });
        me = await rawMe.json();
        // console.log(me);
      } catch (error) {
        errors.push(`Requête données utilisateur : `, me);
      }

      // Comparer les deux si 'same' on continue
      if (message.author === me.id || message.author.id === me.id) {
        // Ajouter les boutons edit et delete dans le footer
        const footer = node.querySelector('.message__footer');

        const deleteBtn = document.createElement('button');
        deleteBtn.classList.add('message__button__control', 'delete__btn');
        deleteBtn.innerHTML = '<i class="far fa-trash-alt"></i>';
        deleteBtn.addEventListener('click', messageRequest.deleteMessage);

        const editBtn = document.createElement('button');
        editBtn.classList.add('message__button__control', 'edit__btn');
        editBtn.innerHTML = '<i class="far fa-edit"></i>';
        editBtn.addEventListener(
          'click',
          messagePageUtils.updateMessageManager
        );

        footer.appendChild(deleteBtn);
        footer.appendChild(editBtn);
      }
    }
    /********************************************/

    // ADD elt in DOM
    document.querySelector('.message__list').appendChild(node);

    /************** QUILL ****************** */

    // On créé l'editeur
    const quill = new Quill(`#editor${message.id}`, {});

    // Les données mise en forme sont stockées en format JSON,
    // c'est la propriété 'ops' pour les récupérer
    quill.setContents(message.message_content.ops, 'api');
    // Il n'est pas possible pour l'instant d'éditer le topic
    quill.enable(false);

    if (!errors.length) {
      return true;
    } else {
      errors.forEach(error => alert(error));
    }
  },

  /**
   * When loading a topic page, creates the topics related to a category
   */
  makeMessageList: async () => {
    if (document.getElementsByClassName('messagesPage__mainContainer').length) {
      // On récupère l'id du topic
      const topicId = document
        .querySelector('#topicId')
        .textContent.toLowerCase();
      // On récupère la liste des messages pour ce topic
      try {
        const data = await fetch(`${STRAPI_URL}/topics/${topicId}`);

        if (data.ok) {
          const topic = await data.json();
          // On affiche un 'article' pour chaque message
          for (const message of topic.messages) {
            // console.log(message.message_content);
            messagePageUtils.createMessage(message);
          }
        } else {
          throw new Error(data.statusText);
        }
      } catch (error) {
        console.log('makemessage :', error);
      }
    }
  },

  updateMessageManager: event => {
    // Récupérer le quill
    const editor = event.target
      .closest('.message')
      .querySelector('.ql-container');
    var quill = new Quill(editor, {
      toolbar: {
        container: [
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote'],
          [{ list: 'ordered' }, { list: 'bullet' }],
          [{ indent: '-1' }, { indent: '+1' }],
          [{ color: [] }, { background: [] }],
          ['emoji'],
        ],
        handlers: {
          emoji: function () {},
        },
      },
      'emoji-toolbar': true,
      'emoji-textarea': true,
      'emoji-shortname': true,
      theme: 'snow',
    });

    // Le rendre editable
    quill.enable();
    console.log(Quill.find(editor) === quill); // Should be true

    // Ajouter un bouton valider et un quitter
    const messageFooter = event.target.closest('.message__footer');

    const validBtn = document.createElement('button');
    validBtn.classList.add('message__button__control');
    validBtn.innerHTML = '<i class="far fa-check-circle"></i>';

    // PUT le nouveau message,
    validBtn.addEventListener('click', async event => {
      await messageRequest.putMessage(event);

      // revenir à un quill sans rien
      event.target.closest('.message').querySelector('.ql-toolbar').remove();
      editor.style.border = 'none';
      quitBtn.remove();
      validBtn.remove();
      quill.disable();
    });

    const quitBtn = document.createElement('button');
    quitBtn.classList.add('message__button__control');
    quitBtn.innerHTML = '<i class="far fa-times-circle"></i>';
    quitBtn.addEventListener('click', () => {
      // revenir à un quill sans rien
      event.target.closest('.message').querySelector('.ql-toolbar').remove();
      editor.style.border = 'none';
      quitBtn.remove();
      validBtn.remove();
      quill.disable();
    });

    messageFooter.appendChild(quitBtn);
    messageFooter.appendChild(validBtn);
  },
};
