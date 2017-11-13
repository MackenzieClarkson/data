'use strict';
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const createServer = function (config, log, departments, rooms, patients, records, doctors, staff, find_patients, view2, next) {
	const app = express();

	//Server settings
	app.set('view engine', 'pug');
	app.set('views', path.join(__dirname, '../views'));

	log.info(path.join(__dirname, '../public'));
	app.use(express.static(path.join(__dirname, '../public')));
	app.use(bodyParser.urlencoded({
		extended: true
	}));
	app.use(bodyParser.json());

	//Home Route
	app.get('/', require('./routes/home')(log, departments, rooms));

	//Departments page Route
	app.get('/departments', require('./routes/departments')(log, departments, rooms));

	//Patients page Route
	app.get('/patients', require('./routes/patients')(log, patients));

	//Patient Lookup Route
	app.get('/patientlookup', require('./routes/patient_selection')(log, find_patients));

	//Doctors page Route
	app.get('/doctors', require('./routes/doctors')(log, departments, doctors));

	//Patient Records Route
	app.get('/patientrecords', require('./routes/records')(log, records));

	//Staff page Route
	app.get('/staff', require('./routes/staff')(log, departments, staff));

	//View2 page Route
	app.get('/patientsbydepartment', require('./routes/patientsbydepartment')(log, view2));

	//Internal API for patients
	app.get('/patients/:id', function (req, res) {
		for (let patient in patients) {
			if (patients[patient].id == req.params.id) {
				res.setHeader('Content-Type', 'application/json');
				res.status(200).send(JSON.stringify(patients[patient]));
			}
		}
	});

	//Listen on Port
	app.listen(config.web.port);

	next(app);
};

module.exports = {
	createServer
};