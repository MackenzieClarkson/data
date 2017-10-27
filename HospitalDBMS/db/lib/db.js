'use strict';

const Promise = require('bluebird');
const mysql = require('mysql');

//Get Patients
const getPatients = (connection, log) => {
    return new Promise ((resolve, reject) => {
        connection.query('SELECT * FROM patient', (err, response) => {
            if (err){
                reject(err);
            }else{
                log.info('Got Patients');
                resolve(response);
            }
        });
    });
};

module.exports = {
    getPatients
};