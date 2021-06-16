"use strict";

var nodemailer = require('nodemailer');

var smtpTransport = require('nodemailer-smtp-transport');

var transporter = nodemailer.createTransport(smtpTransport({
  service: "gmail",
  host: "smtp.gmail.com",
  auth: {
    user: process.env.EMAIL,
    pass: process.env.EMAILPASSWORD
  }
}));

var setMailOptions = function setMailOptions(userEmail, message) {
  return {
    from: process.env.EMAIL,
    to: userEmail,
    subject: "Lien de r\xE9initialisation du mot de passe",
    html: message
  };
};

var sendMail = function sendMail(userEmail, message) {
  var mailOptions = setMailOptions(userEmail, message);
  console.log(mailOptions);
  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log(error);
    } else {
      console.log("Email sent: ", info.response);
    }
  });
};

module.exports = {
  sendMail: sendMail,
  setMailOptions: setMailOptions,
  transporter: transporter
};