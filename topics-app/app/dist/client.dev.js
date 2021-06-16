"use strict";

var _require = require('pg'),
    Client = _require.Client; // 'process' est une variable globale dispo partout dans le dossier


var client = new Client({
  host: '127.0.0.1',
  database: 'quiltuuc_forum_ju',
  user: 'quiltuuc_ju',
  password: 'createForum',
  port: 5432
});
client.connect();
module.exports = client;