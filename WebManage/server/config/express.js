const express = require('express');
const path = require('path');
const app = express();
const ejs = require('ejs');

require('dotenv').config();

app.set('port', process.env.APP_PORT || 3000);
app.set('host', process.env.APP_HOST || 'localhost');

// app.use(express.static(path.join(__dirname, '../../public')));
app.set("view engine", "ejs");
app.set('views', path.join(__dirname, '../View'));

module.exports = app;