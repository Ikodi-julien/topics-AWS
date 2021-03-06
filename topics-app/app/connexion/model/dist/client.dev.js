"use strict";

var _require = require('pg'),
    Client = _require.Client; // Les variables d'env sont rechargées dans chaque module si besoin
// et définies dans .env


require('dotenv').config(); // 'process' est une variable globale dispo partout dans le dossier


var client = new Client({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  user: process.env.DB_LOGIN,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME
});
client.connect();
module.exports = {
  client: client
};