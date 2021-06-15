import { getCookie, STRAPI_URL } from './utils.js';
import { topicRequest } from './topicAPIRequest';

export const topicPageUtils = {
  /**
   * Create an add topic elements in DOM
   * @param {Object} topic - Un des topics récup avec la catégorie
   */
  createTopic: async topic => {
    // console.log(topic);
    const errors = [];
    let catName, me;
    // Récup du template :
    const template = document.getElementById('topicTemplate');
    // Clone du modèle
    const node = document.importNode(template.content, true);
    // On positionne les infos dans le modèle
    // id du topic
    node.querySelector('.topic').dataset.id = topic.id;

    try {
      // L'adresse du lien, il faut le nom de la catégorie
      // si le topic vient d'une catégorie, on a que l'id de la catégorie
      if (typeof topic.category === 'number') {
        // On doit récup le nom de la cat

        const resCatName = await fetch(
          `${STRAPI_URL}/categories/${topic.category}`
        );

        if (!resCatName.ok) {
          errors.push(`Requete categories :${resCatName.statusText}`);
        } else {
          const catNameJSON = await resCatName.json();
          catName = catNameJSON.name;
        }
      } else {
        // Sinon, c'est un nouveau topic on a l'info
        catName = topic.category.name;
      }

      const url = `/topics/${catName}/${topic.id}`;
      node.querySelector('.topicMessagesHref').href = url;

      // Nom de l'auteur
      node.querySelector('.topicAuthor').textContent = topic.author_name;

      // console.log('author', author);
      // Date de création
      node.querySelector('.topicCreatedAt').textContent = new Date(
        topic.created_at
      ).toLocaleDateString();

      // Nb de messages
      const resNbMessage = await fetch(`${STRAPI_URL}/topics/${topic.id}`);
      if (!resNbMessage.ok) {
        errors.push(`Requete nombre de messages :${resNbMessage.statusText}`);
      } else {
        const topicMessages = await resNbMessage.json();
        node.querySelector('.nbMessages').textContent =
          topicMessages.messages.length;
      }

      // Le titre
      node.querySelector('.topic__main__title').textContent = topic.title;

      // Description, il faut créer un éditeur Quill
      // Pour repérer l'éditeur on lui donne en param l'id du topic
      node.querySelector('.topic__main__description').id = `editor${topic.id}`;

      /*--- IF USER AUTHENTICATED ---*/

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
        } catch (error) {
          errors.push(`Requête données utilisateur : `, me);
        }

        // Comparer les deux si 'same' on continue
        if (topic.author === me.id || topic.author.id === me.id) {
          // Ajouter les boutons edit et delete dans le footer
          const footer = node.querySelector(
            '.topic__footer .topic__button__row'
          );

          const deleteBtn = document.createElement('button');
          deleteBtn.classList.add('topic__button__control', 'edit__btn');
          deleteBtn.innerHTML = '<i class="far fa-trash-alt"></i>';
          deleteBtn.addEventListener('click', topicRequest.deleteTopic);

          const editBtn = document.createElement('button');
          editBtn.classList.add('topic__button__control', 'delete__btn');
          editBtn.innerHTML = '<i class="far fa-edit"></i>';
          editBtn.addEventListener('click', topicPageUtils.handleUpdateTopic);

          footer.appendChild(deleteBtn);
          footer.appendChild(editBtn);
        }
      }

      /*-------------------------------*/
      // ADD elt in DOM
      document.querySelector('.topics__container').appendChild(node);

      // On créé l'editeur
      const quill = new Quill(`#editor${topic.id}`, {});

      // Les données mise en forme sont stockées en format JSON,
      // c'est la propriété 'ops' pour les récupérer
      quill.setContents(topic.topic_content.ops, 'api');
      // Il n'est pas possible pour l'instant d'éditer le topic
      quill.enable(false);

      if (!errors.length) {
        return true;
      } else {
        errors.forEach(error => alert(error));
      }
    } catch (error) {
      console.log('createQuill catch :', error);
    }
  },

  /**
   * When loading a topic page, creates the topics related to a category
   */
  makeTopicList: async () => {
    if (
      document.getElementsByClassName('categorypage__main__container').length
    ) {
      // On récup l'id' de la catégorie
      const catId = document.querySelector('#catId').textContent.toLowerCase();

      try {
        // On récupère la liste de topics pour cette catégorie
        const data = await fetch(`${STRAPI_URL}/categories/${catId}`);

        if (data.ok) {
          // On affiche un 'article' pour chaque topic
          const catTopics = await data.json();
          for (const topic of catTopics.topics) {
            topicPageUtils.createTopic(topic);
          }
        } else {
          throw data.statusText;
        }
      } catch (error) {
        console.log('makeTopicList: ', error);
      }
    }
  },

  /**
   *
   * @param {Event} event
   */
  handleUpdateTopic: event => {
    // A ce niveau là, normalement les boutons de modification
    // n'apparaissent que si c'est l'auteur
    // La sécu ultime est assurée par strapi qui vérifie que
    // c'est l'auteur du message qui cherche à le modifier

    // Récupérer le quill
    const editor = event.target
      .closest('.topic')
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
    // console.log(Quill.find(editor) === quill); // Should be true

    // Ajouter un bouton valider et un quitter
    const topicBtnRow = event.target.closest('.topic__button__row');

    const validBtn = document.createElement('button');
    validBtn.classList.add('topic__button__control');
    validBtn.innerHTML = '<i class="far fa-check-circle"></i>';
    // PUT le nouveau message,
    validBtn.addEventListener('click', async event => {
      await topicRequest.putTopic(event);

      // revenir à un quill sans rien
      event.target.closest('.topic').querySelector('.ql-toolbar').remove();
      editor.style.border = 'none';
      quitBtn.remove();
      validBtn.remove();
      quill.disable();
    });

    const quitBtn = document.createElement('button');
    quitBtn.classList.add('topic__button__control');
    quitBtn.innerHTML = '<i class="far fa-times-circle"></i>';
    quitBtn.addEventListener('click', () => {
      // revenir à un quill sans rien
      event.target.closest('.topic').querySelector('.ql-toolbar').remove();
      editor.style.border = 'none';
      quitBtn.remove();
      validBtn.remove();
      quill.disable();
    });

    topicBtnRow.appendChild(quitBtn);
    topicBtnRow.appendChild(validBtn);
  },
};
