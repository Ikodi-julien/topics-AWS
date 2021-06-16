"use strict";

var client = require('../../client');
/*-------------------------------------------------------------*/


var connexionDB = {
  getUserByPseudo: function getUserByPseudo(pseudo, callback) {
    var query = {
      text: "SELECT * FROM forum.users \n    WHERE pseudo=$1;",
      values: [pseudo]
    };
    client.query(query, callback);
  },
  getUserByEmail: function getUserByEmail(email, callback) {
    var query = {
      text: "SELECT * FROM forum.users \n    WHERE email=$1;",
      values: [email]
    };
    client.query(query, callback);
  },
  getPseudo: function getPseudo(pseudo, callback) {
    var query = {
      text: "SELECT * FROM forum.users \n    WHERE pseudo=$1;",
      values: [pseudo]
    };
    client.query(query, callback);
  },
  getEmail: function getEmail(email, callback) {
    var query = {
      text: "SELECT * FROM forum.users \n    WHERE email=$1;",
      values: [email]
    };
    client.query(query, callback);
  },
  insertProfil: function insertProfil(dataUser, callback) {
    var query = {
      text: "INSERT INTO forum.users (pseudo, firstname, lastname, password, email, status)\n    VALUES ($1, $2, $3, $4, $5, 'stdUser') RETURNING id, pseudo, status;",
      values: [dataUser.pseudo, dataUser.firstName, dataUser.lastName, dataUser.hashedPass, dataUser.email]
    };
    client.query(query, callback);
  },
  isEmailInDB: function isEmailInDB(email, callback) {
    var query = "SELECT * FROM forum.users WHERE email = '".concat(email, "';");
    client.query(query, callback);
  },
  insertDefaultPassword: function insertDefaultPassword(data, callback) {
    var query = {
      text: "UPDATE forum.users\n    SET password = $1\n    WHERE id = $2 RETURNING password;",
      values: [data.hashedPassword, data.id]
    };
    client.query(query, callback);
  },
  deleteUser: function deleteUser(id, callback) {
    var query = "DELETE FROM users\n    WHERE id = ".concat(id, ";");
    client.query(query, callback);
  }
};
module.exports = connexionDB;