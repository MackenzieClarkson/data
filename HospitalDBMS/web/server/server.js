'use strict';
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const createServer = function(config, log, patients, next){
    const app = express();

    //Server settings
    app.set('view engine', 'pug');
    app.set('views', path.join(__dirname, '../views'));

    log.info(path.join(__dirname, '../public'));
    app.use(express.static(path.join(__dirname, '../public')));
    app.use(bodyParser.urlencoded({ extended: true}));
    app.use(bodyParser.json());
    
    //Home Route
    app.get('/', require('./routes/data')(log));

    //Patients page Route
    app.get('/patients', require('./routes/patients')(log, patients));

    //Listen on Port
    app.listen(config.web.port);
    
    next(app);
};

module.exports = {
    createServer
};