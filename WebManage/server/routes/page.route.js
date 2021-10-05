const express = require('express');
const route = express.Router();


route.get('/', (req, res) => {
    res.render('home', { route: 'home' });
  });


  route.get('/login', (req, res) => {
    res.render('authen/login', { route: 'login' });
  });




module.exports = route;
