// import './css/reset.css';
import './css/quill-emoji.css';
// import './css/style.css';

import { quillRegister } from './js/quill-emoji/src/quill-emoji.js';
import { quill, checkInfo, connexionAddHomeButton } from './js/utils.js';
import { topicPageUtils } from './js/topicUtils.js';
import { messagePageUtils } from './js/messageUtils.js';
import { addEventListener } from './js/addEventListener.js';

const app = {
  disconnectButton: document.getElementById('topicsDisconnect'),

  disconnect: () => {
    console.log('disconnect');
    // Supprime le cookie d'identification et de session du navigateur
    document.cookie = 'token=true; expires=Thu, 01 Jan 1970 00:00:00 GMT';
    document.cookie = 'topics.sid=true; expires=Thu, 01 Jan 1970 00:00:00 GMT';

    /* Remarque : Si l'utilisateur ne ferme pas son navigateur et/ou ne se 
    deconnecte pas, les cookies restent en place */
    // La session sera réinitialisée à cette adresse
    location.href = '/connexion/disconnect';
  },

  init: () => {
    quillRegister();
    quill.makeForm();
    topicPageUtils.makeTopicList();
    messagePageUtils.populateTopic();
    messagePageUtils.makeMessageList();
    addEventListener.init();
    connexionAddHomeButton();
    checkInfo();

    if (app.disconnectButton !== null) {
      app.disconnectButton.addEventListener('click', app.disconnect);
    }
  },
};

document.addEventListener('DOMContentLoaded', app.init);
