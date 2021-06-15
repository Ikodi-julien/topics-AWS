import { profileHideForm, profileShowForm, showInfo } from './utils.js';
import { profileRequest } from './profileAPIRequest.js';
import { topicRequest } from './topicAPIRequest.js';
import { messageRequest } from './messageAPIRequest.js';

export const addEventListener = {
  init: () => {
    addEventListener.userInfo();
    addEventListener.profile();
    addEventListener.connexion();
    addEventListener.forumForm();
    addEventListener.hamMenu();
  },

  /**
   * Allow to show userInfo with a click on button
   */
  userInfo: () => {
    if (document.querySelector('#infoMessage')) showInfo();
    document
      .getElementById('infouserButton')
      .addEventListener('click', showInfo);
  },

  profile: function () {
    const showButtons = document.querySelectorAll(
      '.profile__formContainer__titleRow'
    );
    const closeButtons = document.querySelectorAll('.profile__form__close');
    const pseudoForm = document.querySelectorAll('#pseudoForm');
    const emailForm = document.querySelectorAll('#emailForm');
    const passwordForm = document.querySelectorAll('#passwordForm');

    if (showButtons.length) {
      for (const button of showButtons) {
        button.addEventListener('click', profileShowForm);
      }
      for (const button of closeButtons) {
        button.addEventListener('click', profileHideForm);
      }
    }

    if (pseudoForm.length) {
      pseudoForm[0].addEventListener('submit', profileRequest.updatePseudo);
    }

    if (emailForm.length) {
      emailForm[0].addEventListener('submit', profileRequest.updateEmail);
    }

    if (passwordForm.length) {
      passwordForm[0].addEventListener('submit', profileRequest.updatePassword);
    }
  },

  connexion: () => {
    if (document.querySelectorAll('.connexion').length) {
      const createAccountModale = document.getElementById(
        'createAccountModale'
      );
      const lostPassModale = document.getElementById('lostPassModale');
      const showCreateProfileButton = document.getElementById(
        'showCreateProfile'
      );
      const showLostPassButton = document.getElementById('showLostPass');
      const quitCreateProfil = document.getElementById('quitCreateProfil');
      const quitLostPass = document.getElementById('quitLostPass');

      showCreateProfileButton.addEventListener('click', () => {
        createAccountModale.classList.toggle('--connexion__show');
      });

      showLostPassButton.addEventListener('click', () => {
        lostPassModale.classList.toggle('--connexion__show');
      });

      quitCreateProfil.addEventListener('click', () => {
        createAccountModale.classList.toggle('--connexion__show');
      });

      quitLostPass.addEventListener('click', () => {
        lostPassModale.classList.toggle('--connexion__show');
      });
    }
  },

  forumForm: () => {
    const topicForm = document.getElementsByClassName('topic__form')[0];
    const messageForm = document.getElementsByClassName('message__form')[0];

    if (typeof topicForm !== 'undefined') {
      topicForm.addEventListener('submit', topicRequest.postTopic);
    }
    if (typeof messageForm !== 'undefined') {
      messageForm.addEventListener('submit', messageRequest.postMessage);
    }
  },

  hamMenu: () => {
    const hamburger = document.getElementById('nav-hamburger');
    const menu = document.getElementsByClassName('header__nav');

    if (menu.length) {
      hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('open');
        menu[0].classList.toggle('header__nav__show');
      });
    }
  },
};
