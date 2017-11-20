'use strict';

// const request = require('request');
const Promise = require('bluebird');
// const mysql = require('mysql');

//Get Assigned
const getAssigned = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM assigned', (err, response) => {
			if (err){
				reject(err);
			}else{
				log.info('Got assigned');
				resolve(response);
			}
		});
	});
};

//Get caresfor
const getCaresForPatient = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM caresForPatient', (err, response) => {
			if (err){
				reject(err);
			}else{
				log.info('Got caresfor');
				resolve(response);
			}
		});
	});
};

//Get Departments
const getDepartments = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM department', (err, response) => {
			if (err) {
				reject(err);
			} else {
				log.info('Got Departments');
				resolve(response);
			}
		});
	});
};

//Get Doctors
const getDoctors = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM doctors', (err, response) => {
			if (err) {
				reject(err);
			} else {
				log.info('Got Doctors');
				resolve(response);
			}
		});
	});
};

//Get Patients
const getPatients = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM patient', (err, response) => {
			if (err) {
				reject(err);
			} else {
				log.info('Got Patients');
				resolve(response);
			}
		});
	});
};

//Get patient records
const getRecords = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT P.PName, R.*
                          FROM patient AS P, patientrecords AS R
                          WHERE P.Hcn=R.PHcn`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got patient records');
					resolve(response);
				}
			});
	});
};

//Get Rooms
const getRooms = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM rooms', (err, response) => {
			if (err) {
				reject(err);
			} else {
				log.info('Got Rooms');
				resolve(response);
			}
		});
	});
};

//Get staff
const getStaff = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM staff ORDER BY Dno', (err, response) => {
			if (err) {
				reject(err);
			} else {
				log.info('Got Staff');
				resolve(response);
			}
		});
	});
};

//Get patientBy Department count view
const getPatientsByDepartment = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM num_patients_department`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View 2');
					resolve(response);
				}
			});
	});
};

//Get patientByDoctor view
const getPatientsByDoctor = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM patients_per_doctor`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View 2');
					resolve(response);
				}
			});
	});
};

//Get find_patient view
const getFindPatients = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM find_patient`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got find_patients');
					resolve(response);
				}
			});
	});
};

//Get patient by hcn
const findPatient = (connection, log, hcn) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
											FROM find_patient
											WHERE hcn=${hcn}`, (err, response) => {
			if (err){
				reject(err);
			}else {
				log.info('Got patient');
				resolve(response);
			}
		});

	});
};

module.exports = {
	getAssigned,
	getCaresForPatient,
	getDepartments,
	getDoctors,
	getPatients,
	getRecords,
	getRooms,
	getStaff,
	getPatientsByDepartment,
	getPatientsByDoctor,
	getFindPatients,
	findPatient
};