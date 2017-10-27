'use strict';

const config = require('../config.js');
const db = require('../db/lib/db');
const log = require('bunyan').createLogger(config.log);
const server = require('./server/server');
const dbConnection = require('../db/lib/connection');

dbConnection.connect(config).then((connection) => {
    //Query data base
    db.getPatients(connection, log).then((patients) => {
        //Create server (nest in query functions later)
        server.createServer(config, log, patients,  () => {
            log.info('template started successfully on: '+config.web.url);
        });
    });
}).catch((err) => {
    log.info('Could not connect to db: ', err);
});