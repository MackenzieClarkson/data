'use strict';

// const request = require('request');
const Promise = require('bluebird');
const mysql = require('mysql');

//Get Doctors
const getDoctors = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM doctor_by_department', (err, response) => {
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

//Get Rooms
const getRooms = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query('SELECT * FROM room_by_department', (err, response) => {
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
		connection.query('SELECT * FROM staff_by_department', (err, response) => {
			if (err) {
				reject(err);
			} else {
				log.info('Got Staff');
				resolve(response);
			}
		});
	});
};

//Get patients and their records 
const getRecords = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT * FROM patient_records`, (err, response) =>{
			if (err){
				reject(err);
			}else{
				log.info("Got patient records");
				resolve(response);
			}
		});
	});
}

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
                          FROM patient_per_doctor`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View patients_per_doctor');
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
					log.info('Got View find_patients');
					resolve(response);
				}
			});
	});
};

//Get patient by hcn
const getFindPatient = (connection, log, hcn) => {
	return new Promise((resolve, reject) => {
		let sql = `SELECT *
							 FROM ??
							 WHERE ??=?`;
		let inserts = ['find_patient', 'Hcn', hcn];
		sql = mysql.format(sql, inserts);
		connection.query(sql, (err, response) => {
			if (err){
				reject(err);
			}else {
				log.info('Got patient');
				resolve(response);
			}
		});
	});
};

//Get patient by hcn
const getRoomInfo = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT * FROM roomInfo`, (err, response) => {
			if (err){
				reject(err);
			}else {
				log.info('Got Room Info');
				resolve(response);
			}
		});
	});
};

//Get pay_Roll view
const getPayRoll = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM pay_Roll`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View pay_Roll');
					resolve(response);
				}
			});
	});
};
//Get Patients_In_Rooms view
const getPatientsInRooms = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM Patients_In_Rooms`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View Patients_In_Rooms');
					resolve(response);
				}
			});
	});
};
//Get Large_Salary_Positions view
const getLargeSalaryPositions = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM Large_Salary_Positions`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View Large_Salary_Positions');
					resolve(response);
				}
			});
	});
};

//Get Good_staff_by_dept view
const getGoodStaffByDept = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM Good_staff_by_dept`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View Good_staff_by_dept');
					resolve(response);
				}
			});
	});
};
//Get Available_Rooms view
const getAvailableRooms = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM Available_Rooms`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View Available_Rooms');
					resolve(response);
				}
			});
	});
};

//Get Department_Senior view
const getDepartmentSenior = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM Department_Senior`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View Department_Senior');
					resolve(response);
				}
			});
	});
};

module.exports = {
	getDoctors,
	getPatients,
	getRooms,
	getStaff,
	getRecords,
	getPatientsByDepartment,
	getPatientsByDoctor,
	getFindPatients,
	getFindPatient,
	getRoomInfo,
	getAvailableRooms,
	getDepartmentSenior,
	getGoodStaffByDept,
	getLargeSalaryPositions,
	getPatientsInRooms,
	getPayRoll
};