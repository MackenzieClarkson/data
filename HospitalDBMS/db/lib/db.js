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
		connection.query('SELECT * FROM cares_for_patient', (err, response) => {
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

/*views required for marks
	Available_Rooms - complete
	Department_Senior - complete
	find_patient  -- complete
	Good_staff_by_dept - complete
	Large_Salary_Positions - complete
	num_patients_department -- complete
	Patients_In_Rooms - complete
	patients_per_doctor -- complete
	pay_Roll - complete
	roomInfo - complete
*/
//Get roomInfo view
const getRoomInfo = (connection, log) => {
	return new Promise((resolve, reject) => {
		connection.query(`SELECT *
                          FROM roomInfo`, (err, response) => {
				if (err) {
					reject(err);
				} else {
					log.info('Got View roomInfo');
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
	getFindPatient,
	getAvailableRooms,
	getDepartmentSenior,
	getGoodStaffByDept,
	getLargeSalaryPositions,
	getPatientsInRooms,
	getPayRoll,
	getRoomInfo
};