//Imports
//require("dotenv-safe").config();
var http = require('http');
const express = require('express');
const httpProxy = require('express-http-proxy');
const app = express();
var cors = require('cors');
var logger = require('morgan');
const helmet = require('helmet');
var routes = require('./routes/routeManager');

//Configuration
const port = process.env.PORT || 5000;
app.use(logger('dev'));
app.use(helmet());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());
routes.defineRoutes(app, httpProxy);

var server = http.createServer(app);
server.listen(port);