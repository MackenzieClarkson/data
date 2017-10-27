'use strict'
/*
    POPULATE DATABASE
*/
const config = require('../config.js');
// const api = require('./lib/api');
// const dbConnection = require('./lib/connection');
const log = require('bunyan').createLogger(config.json);

dbConnection.connect(config).then((connection) => {
    api.deleteData(log, connection).then(() => {
        api.getData(log, config, connection).then(() => {
            log.info('Succesfully inserted data into mysql database');
            connection.end();
        });
    });
}).catch((err) => {
    log.error('Error inserting data into collection: ', err);
});