'use strict';

const config = require('../config.js');
const db = require('../db/lib/db');
const log = require('bunyan').createLogger(config.log);
const server = require('./server/server');
const dbConnection = require('../db/lib/connection');

dbConnection.connect(config).then((connection) => {
    //Query data base
    db.getDepartments(connection, log).then((departments) => {
        db.getRooms(connection, log).then((rooms) => {
            db.getPatients(connection, log).then((patients) => {
                db.getRecords(connection, log).then((records) => {
                  db.getDoctors(connection, log).then((doctors) => {
                    db.getStaff(connection, log).then((staff) => {
                      db.getFindPatients(connection, log).then((find_patients) => {
                        db.getView2(connection, log).then((view2) => {
                          //Create server (nest in query functions later)
                          server.createServer(config, log, departments, rooms, patients, records, doctors, staff, find_patients, view2, () => {
                            log.info('template started successfully on: '+config.web.url);
                          });
                        });
                      });
                    });
                  });
                });
            });
        });
    });
}).catch((err) => {
    log.info('Could not connect to db: ', err);
});
