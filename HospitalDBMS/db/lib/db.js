'use strict';

const request = require('request');
const Promise = require('bluebird');
const mysql = require('mysql');

//Get Departments
const getDepartments = (connection, log) => {
    return new Promise ((resolve, reject) => {
        connection.query('SELECT * FROM department', (err, response) => {
            if (err){
                reject(err);
            }else{
                log.info('Got Departments');
                resolve(response);
            }
        });
    });
};

//Get Rooms
const getRooms = (connection, log) => {
    return new Promise ((resolve, reject) => {
        connection.query('SELECT * FROM rooms', (err, response) => {
            if (err){
                reject(err);
            }else{
                log.info('Got Rooms');
                resolve(response);
            }
        });
    });
};

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

const getRecords = (connection, log) => {
    return new Promise ((resolve, reject) => {
        connection.query(`SELECT P.PName, R.*
                          FROM patient AS P, patientrecords AS R
                          WHERE P.Hcn=R.PHcn`, (err, response) => {
            if (err){
                reject(err);
            }else{
                log.info('Got patient records');
                resolve(response);
            }
        });
    });
};

const getDoctors = (connection, log) => {
  return new Promise ((resolve, reject) => {
    connection.query('SELECT * FROM doctors', (err, response) => {
      if (err){
        reject(err);
      }else{
        log.info('Got Doctors');
        resolve(response);
      }
    });
  });
};

const getStaff = (connection, log) => {
  return new Promise ((resolve, reject) => {
    connection.query('SELECT * FROM staff ORDER BY Dno', (err, response) => {
      if (err){
        reject(err);
      }else{
        log.info('Got Staff');
        resolve(response);
      }
    });
  });
};

const getView1 = (connection, log) => {
    return new Promise ((resolve, reject) => {
        connection.query(`SELECT *
                          FROM department AS D, rooms AS R
                          WHERE D.Dno=R.Dno`, (err, response) => {
            if (err){
                reject(err);
            }else{
                log.info('Got View 1');
                resolve(response);
            }
        });
    });
};

const getView2 = (connection, log) => {
    return new Promise ((resolve, reject) => {
        connection.query(`SELECT *
                          FROM num_patients_department`, (err, response) => {
            if (err){
                reject(err);
            }else{
                log.info('Got View 2');
                resolve(response);
            }
        });
    });
};

const getFindPatients = (connection, log) => {
    return new Promise ((resolve, reject) => {
        connection.query(`SELECT *
                          FROM find_patient`, (err, response) => {
            if (err){
                reject(err);
            }else{
                log.info('Got find_patients');
                resolve(response);
            }
        });
    });
};

module.exports = {
    getDepartments,
    getRooms,
    getPatients,
    getRecords,
    getDoctors,
    getStaff,
    getView1,
    getView2,
    getFindPatients
};
