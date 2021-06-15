import { getCookie, STRAPI_URL } from './utils.js';
// TODO : Customiser /users/me pour update profile
export const profileRequest = {
  /**
   *Updates authenticated user's pseudo
   * @param {Event} event
   */

  updatePseudo: async event => {
    event.preventDefault();
    // console.log('dans update');
    const form = event.target;

    // console.log(form);
    // Récup du champ pseudo
    const newPseudo = form.querySelector('#pseudo').value;
    if (newPseudo === '') return;

    profileRequest.doUpdate({ username: newPseudo });
  },

  updateEmail: async event => {
    event.preventDefault();
    // console.log('dans update');

    const form = event.target;

    console.log(form);
    // Récup du champ pseudo
    const newEmail_1 = form.querySelector('#email1').value;
    const newEmail_2 = form.querySelector('#email2').value;
    if (newEmail_1 === '' && newEmail_2 === '') return;
    if (newEmail_1 !== newEmail_2) {
      alert('les deux emails ne sont pas identiques');
      return;
    }

    profileRequest.doUpdate({ email: newEmail_1 });
  },

  updatePassword: async event => {
    event.preventDefault();
    console.log('dans update');

    const form = event.target;

    console.log(form);
    // Récup du champ pseudo
    const newPassword_1 = form.querySelector('#password1').value;
    const newPassword_2 = form.querySelector('#password2').value;
    if (newPassword_1 === '' && newPassword_2 === '') return;
    if (newPassword_1 !== newPassword_2) {
      alert('les deux mots de passe ne sont pas identiques');
      return;
    }

    profileRequest.doUpdate({ password: newPassword_1 });
  },

  doUpdate: async data => {
    // Récupérer le token laissé au moment de la connexion
    // Il est utilisé comme password par la route /users/me
    const token = getCookie('token');

    if (!token) {
      alert("Vous n'êtes pas autorisé, désolé...");
      return;
    }

    try {
      const response = await fetch(`${STRAPI_URL}/users/me`, {
        method: 'PUT',
        headers: {
          'content-type': 'application/json',
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(data),
      });

      if (response.ok) {
        // prendre en compte les infos
        //TODO : faire login auto après modif du profil.
        alert(
          'Pas encore fait le nécessaire, donc il faut se reconnecter pour que les modifs prennent effet'
        );
        return;
      } else {
        throw { resStatus: response.status };
      }
    } catch (error) {
      const errors = [];
      errors.push(error);

      console.log(errors);
      alert("voir l'erreur en console");
    }
    return false;
  },
};
