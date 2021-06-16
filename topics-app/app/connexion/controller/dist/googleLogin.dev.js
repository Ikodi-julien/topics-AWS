"use strict";

var _require = require('googleapis'),
    google = _require.google;

var OAuth2Data = require('./google_key.json');
/**
 * Create a OAuthClient 2.0 that handles flow with API
 */


var oAuth2Client = new google.auth.OAuth2(OAuth2Data.web.client_id, OAuth2Data.web.client_secret, OAuth2Data.web.redirect_uris);
/**
 * Generates the google account identification's url.
 */

var url = oAuth2Client.generateAuthUrl({
  access_type: 'offline',
  prompt: 'consent',
  scope: ['https://www.googleapis.com/auth/userinfo.email', 'https://www.googleapis.com/auth/userinfo.profile']
});
/**
 * Gets the informations sent by google People API
 * @param {string} code 
 */

var getGoogleAccountFromCode = function getGoogleAccountFromCode(code) {
  var data, tokens, people, me, firstName, lastName, pseudo;
  return regeneratorRuntime.async(function getGoogleAccountFromCode$(_context) {
    while (1) {
      switch (_context.prev = _context.next) {
        case 0:
          _context.prev = 0;
          _context.next = 3;
          return regeneratorRuntime.awrap(oAuth2Client.getToken(code));

        case 3:
          data = _context.sent;
          tokens = data.tokens; // Sets the auth credentials.

          oAuth2Client.setCredentials(tokens); // The user agreed to allow our app by giving appropriates tokens.
          // We can now use those tokens with our client to get the corresponding infos from the API

          people = google.people({
            version: 'v1',
            auth: oAuth2Client
          });
          _context.next = 9;
          return regeneratorRuntime.awrap(people.people.get({
            personFields: ["emailAddresses", "names"],
            resourceName: 'people/me'
          }));

        case 9:
          me = _context.sent;
          firstName = me.data.names[0].givenName;
          lastName = me.data.names[0].familyName;
          pseudo = "".concat(firstName.substring(0, 1), "-").concat(lastName.substring(0, 1));
          return _context.abrupt("return", {
            pseudo: pseudo,
            firstName: firstName,
            lastName: lastName,
            hashedPass: "####",
            email: me.data.emailAddresses[0].value
          });

        case 16:
          _context.prev = 16;
          _context.t0 = _context["catch"](0);
          console.log(_context.t0);

        case 19:
        case "end":
          return _context.stop();
      }
    }
  }, null, null, [[0, 16]]);
};

module.exports = {
  url: url,
  getGoogleAccountFromCode: getGoogleAccountFromCode
};