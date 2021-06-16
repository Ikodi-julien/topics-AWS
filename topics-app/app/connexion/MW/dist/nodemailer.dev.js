"use strict";

var nodemailer = require('nodemailer');

var smtpTransport = require('nodemailer-smtp-transport');

var template = require('./lostPassMail_template');

var transporter = nodemailer.createTransport(smtpTransport({
  service: "gmail",
  host: "smtp.gmail.com",
  auth: {
    user: process.env.EMAIL,
    pass: process.env.EMAILPASSWORD
  }
}));

var sendLostPassMail = function sendLostPassMail(user, callback) {
  var message = template.before + user.firstname + template.after_name + user.password + template.after_mdp;
  transporter.sendMail({
    from: process.env.EMAIL,
    to: user.email,
    subject: "TOPIC(S) - r\xE9initialisation du mot de passe",
    html: message
  }, callback);
};

module.exports = {
  transporter: transporter,
  sendLostPassMail: sendLostPassMail
};