const express = require('express');
require('dotenv').config();

const router = require('./app/router');
const connexionViews = require('./app/connexion/view/connexionViews');
const app = express();

const expressSession = require('express-session');

// user urlencoded to get data from post
app.use(express.urlencoded({ extended: false }));

/*
 ** set functionnalities
 */
// set views directory
app.set('views', './views');
//set template engine to ejs
app.set('view engine', 'ejs');
//set the static file directory
app.use(express.static('public'));

// http://expressjs.com/en/resources/middleware/express-session.html
app.use(
  expressSession({
    secret: 'quillers',
    resave: false,
    saveUninitialized: false,
    unset: 'destroy',
    cookie: {
      maxAge: 1000 * 60 * 20,
      secure: false,
    },
    name: 'topics.sid',
  })
);

//use the router
app.use(router);

// A la fin la page 404 si besoin
app.use(connexionViews.page404);
/*------------------------------------------*/

app.listen(
  process.env.PORT,
  console.log('server started at http://localhost:', process.env.PORT)
);
