'use strict';

const config = require('../config.js');
// const db = require('../db/lib/db');
const log = require('bunyan').createLogger(config.log);
// const server = require('./server/server');
const dbConnection = require('../db/lib/connection');
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const app = express();

//Server settings
app.set('view engine', 'pug');
app.set('views', path.join(__dirname, './views'));

log.info(path.join(__dirname, './public'));
app.use(express.static(path.join(__dirname, './public')));
app.use(bodyParser.urlencoded({
	extended: true
}));
app.use(bodyParser.json());

dbConnection.connect(config).then((connection) => {
	//Home Route
	app.get('/', require('./server/routes/home')(connection, log));
	
	//Departments
	app.get('/departments', require('./server/routes/departments')(connection, log));

	//Patients page Route
	app.get('/patients', require('./server/routes/patients')(connection, log));

	//Patient Lookup Route
	app.get('/patientlookup', require('./server/routes/patient_selection')(connection, log));

	//Doctors page Route
	app.get('/doctors', require('./server/routes/doctors')(connection, log));

	//Patient Records Route
	app.get('/patientrecords', require('./server/routes/records')(connection, log));

	//Staff page Route
	app.get('/staff', require('./server/routes/staff')(connection, log));

	//View2 page Route
	app.get('/patientsbydepartment', require('./server/routes/patientsbydepartment')(connection, log));

	//Listen on Port
	app.listen(config.web.port);

	// //Query data base
	// db.getDepartments(connection, log).then((departments) => {
	// 	db.getRooms(connection, log).then((rooms) => {
	// 		db.getPatients(connection, log).then((patients) => {
	// 			db.getRecords(connection, log).then((records) => {
	// 				db.getDoctors(connection, log).then((doctors) => {
	// 					db.getStaff(connection, log).then((staff) => {
	// 						db.getFindPatients(connection, log).then((find_patients) => {
	// 							db.getView2(connection, log).then((view2) => {
	// 								//Create server (nest in query functions later)
	// 								server.createServer(config, log, departments, rooms, patients, records, doctors, staff, find_patients, view2, () => {
	// 									log.info('template started successfully on: '+config.web.url);
	// 								});
	// 							});
	// 						});
	// 					});
	// 				});
	// 			});
	// 		});
	// 	});
	// });
}).catch((err) => {
	log.info('Could not connect to db: ', err);
});
