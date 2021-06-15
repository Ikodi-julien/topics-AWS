const profileViews = {
  view: (request, response) => {
    response.render('profile', {
      session: request.session
    });
  },

  page404: (request, response) => {
    response.info = "C'est pas la bonne route";

    response.status(404)
      .render('404', { session: request.session });
  },
}

module.exports = profileViews;
