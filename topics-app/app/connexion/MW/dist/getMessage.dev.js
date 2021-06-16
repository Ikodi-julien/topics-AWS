"use strict";

/**
 * Gets the message code included in url when redirected
 */
var getMessage = function getMessage(request, response, next) {
  response.info = request.query.message;
  next();
};

module.exports = getMessage;