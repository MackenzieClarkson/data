'use strict';
const express = require('express');

const createServer = function(config, log, next){
    const app = express();

    //"API" GET page
    app.get('/records', require('./genRecords')(log));
    
    //Listen on Port
    app.listen(config.web.port);
    
    next(app);
};

module.exports = {
    createServer
};