const message_code = require('./message_code.json');
/**
 * Gets the message code included in url when redirected
 * Delete user.message if already displayed once
 */
const getMessage = (request, response, next) => {
  if (typeof request.query.msg_code !== 'undefined') {
    const code = request.query.msg_code;
    let message = message_code[code];

    if (code.substring(0, 1) === 'F') {
      message = message + '\\ln' + message_code.FATALITY;
    }
    request.session.user.message = message;
  }

  request.session.messageFirstDisplay = false;
  next();
};
module.exports = getMessage;
