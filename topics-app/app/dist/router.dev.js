"use strict";

var express = require('express');

var path = require('path'); // import database functionality


var mainController = require('./main/controller/mainController');

var forumController = require('./forum/controller/forumController');

var connexionSwitch = require('./connexion/MW/connexionSwitch');

var profileController = require('./profile/controller/profileController');

var getMessage = require('./main/MW/getMessage');

var router = express.Router();
/*------------ GET REQUESTS --------------*/

router.use(mainController.checkSession); // FORUM

router.get('/', getMessage, mainController.index);
router.get('/categories', getMessage, forumController.getCategories);
router.get('/categories/:categoryName', forumController.getAllTopicsByCategoryId);
router.get('/topics/:categoryName/:topicId', forumController.getAllMessagesByTopicId); // CONNEXION

router.get('/connexion/:view', getMessage, connexionSwitch.GET); // PROFILE

router.get('/myProfile', profileController.getProfile);
/*------------ POST REQUESTS --------------*/
// FORUM

router.post('/topics/:categoryName/post', forumController.createNewTopic);
router.post('/topics/:categoryName/:topicId/:pass', forumController.selectPOST); // CONNEXION

router.post('/postConnexion/:view', connexionSwitch.POST); // PROFILE

router.post('/postProfile/:pass', profileController.selectPOST);
/*--------------------------------------------*/

module.exports = router;