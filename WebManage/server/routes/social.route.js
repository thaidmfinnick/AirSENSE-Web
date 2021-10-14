const express = require('express');
const  socialCtrl = require('../controllers/social.controller.js');
const isAuthenticated = require('../middlewares/authenticate.js');
const validate = require('../config/joi.validate.js');
const schema = require('../utils/validator.js');

const router = express.Router();

router.route('/check_email').post((req, res) => {
  socialCtrl.checkEmailRegister(req, res);
})



module.exports =  router;
