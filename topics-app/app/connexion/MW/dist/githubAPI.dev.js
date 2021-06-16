"use strict";

var github_key_local = require('./github_key_local.json');

var axios = require('axios');

module.exports = {
  getAccessTokenFromGithub: function getAccessTokenFromGithub(request, response) {
    var githubResponse;
    return regeneratorRuntime.async(function getAccessTokenFromGithub$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.prev = 0;
            _context.next = 3;
            return regeneratorRuntime.awrap(axios.post("https://github.com/login/oauth/access_token", {
              client_id: github_key_local.client_id,
              client_secret: github_key_local.client_secret,
              code: request.query.code
            }, {
              headers: {
                accept: 'application/json'
              }
            }));

          case 3:
            githubResponse = _context.sent;
            return _context.abrupt("return", githubResponse.data.access_token);

          case 7:
            _context.prev = 7;
            _context.t0 = _context["catch"](0);
            console.log(_context.t0);
            return _context.abrupt("return", false);

          case 11:
            ;

          case 12:
          case "end":
            return _context.stop();
        }
      }
    }, null, null, [[0, 7]]);
  },
  getUserFromToken: function getUserFromToken(accesstoken) {
    var user;
    return regeneratorRuntime.async(function getUserFromToken$(_context2) {
      while (1) {
        switch (_context2.prev = _context2.next) {
          case 0:
            _context2.prev = 0;
            _context2.next = 3;
            return regeneratorRuntime.awrap(axios({
              method: 'get',
              url: "https://api.github.com/user",
              headers: {
                Authorization: 'token ' + accessToken
              }
            }));

          case 3:
            user = _context2.sent;
            return _context2.abrupt("return", user.data);

          case 7:
            _context2.prev = 7;
            _context2.t0 = _context2["catch"](0);
            console.log(_context2.t0);
            return _context2.abrupt("return", false);

          case 11:
            ;

          case 12:
          case "end":
            return _context2.stop();
        }
      }
    }, null, null, [[0, 7]]);
  },
  githubURL: "https://github.com/login/oauth/authorize?client_id=".concat(github_key_local.client_id)
};