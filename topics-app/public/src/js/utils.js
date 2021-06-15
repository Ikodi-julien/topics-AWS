export const STRAPI_URL = 'https://strapi.ikodi.eu';

export const quill = {
  newQuill: null,

  toolbarOptions: {
    container: [
      ['bold', 'italic', 'underline', 'strike'],
      ['blockquote', 'code-block'],
      // [{ 'header': 1 }, { 'header': 2 }],
      [{ list: 'ordered' }, { list: 'bullet' }],
      // [{ 'script': 'sub' }, { 'script': 'super' }],
      [{ indent: '-1' }, { indent: '+1' }],
      // [{ 'direction': 'rtl' }],
      // [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
      [{ color: [] }, { background: [] }],
      // [{ 'font': [] }],
      // [{ 'align': [] }],
      // ['clean'],
      // ['emoji'],
      ['link', 'image'], // 'video' possible
    ],
    handlers: {
      emoji: function () {},
    },
  },

  /**
   * Create a Quill form if one is available
   */
  makeForm: () => {
    // for topics and messages pages only
    if (document.querySelectorAll('#editor').length) {
      quill.newQuill = new Quill('#editor', {
        modules: {
          toolbar: quill.toolbarOptions,
          'emoji-toolbar': true,
          'emoji-textarea': true,
          'emoji-shortname': true,
        },
        placeholder: 'Kessessé ?...',
        theme: 'snow',
      });
    }
  },
};

export const checkInfo = () => {
  const message = document.getElementById('infoMessage').textContent.trim();

  // console.log('message', message);
  // Je ne comprend pas pourquoi ?
  if (!message.length) showInfo();
};

/**
 * Affiche les infos destinées à l'utilisateur
 */
export const showInfo = () => {
  const infouserSection = document.getElementById('infouser');
  // console.log(infouserSection);
  let shownTimeout;

  if (shownTimeout) clearTimeout(shownTimeout);

  infouserSection.classList.toggle('--showInfo');

  shownTimeout = setTimeout(() => {
    if (infouserSection.classList.contains('--showInfo')) {
      infouserSection.classList.remove('--showInfo');
    }
  }, 3000);
};

/**
 * Gets a cookie value from his name
 * @param {String} name
 * @returns {String | boolean}
 */
export const getCookie = name => {
  try {
    return document.cookie
      .split('; ')
      .find(cookie => cookie.startsWith(`${name}=`))
      .split('=')[1];
  } catch (error) {
    return false;
  }
};

/**
 * Add the home button when on connexion modale
 */
export const connexionAddHomeButton = () => {
  if (document.getElementsByClassName('connexion').length) {
    const infouserButton = document.getElementById('infouserButton');

    const homeButton = document.createElement('div');
    homeButton.classList.add('infouser__button');
    homeButton.id = 'quitConnexionButton';
    homeButton.innerHTML = '<i class="fas fa-caravan"></i>';

    infouserButton.before(homeButton);

    homeButton.addEventListener('click', () => {
      location.href = '/';
    });
  }
};

/**
 * Show selected form on profile page
 * @param {Event} event
 */
export const profileShowForm = event => {
  const form = event.target;
  form.closest('.profile__formContainer').classList.toggle('--showProfileForm');
};

/**
 * Hide selected form on profile page
 * @param {Event} event
 */
export const profileHideForm = event => {
  const form = event.target;
  form.closest('.profile__formContainer').classList.remove('--showProfileForm');
};
