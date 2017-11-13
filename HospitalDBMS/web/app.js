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
	app.get('/', require('./server/routes/home')(log));

	//Determine user type
	app.get('/:type/*', function(req, res, next){
		let userTypes = {
			doctors: 'doctors',
			staff: 'staff'
		};
		if(userTypes[req.params.type]){
			res.locals.user = userTypes[req.params.type];			
		}
		next();
	});
	
	//Departments
	app.get('/*/departments', require('./server/routes/departments')(connection, log));

	//Patients page Route
	app.get('/*/patients', require('./server/routes/patients')(connection, log));

	//Patient Lookup Route
	app.get('/*/patientlookup', require('./server/routes/patient_selection')(connection, log));

	//Doctors page Route
	app.get('/*/doctors', require('./server/routes/doctors')(connection, log));

	//Patient Records Route
	app.get('/*/patientrecords', require('./server/routes/records')(connection, log));

	//Staff page Route
	app.get('/*/staff', require('./server/routes/staff')(connection, log));

	//View2 page Route
	app.get('/*/patientsbydepartment', require('./server/routes/patientsbydepartment')(connection, log));

	//Internal API Route
	app.get('/*/patient/:hcn', require('./server/routes/patientreq')(connection, log));

	//Listen on Port
	app.listen(config.web.port);

}).catch((err) => {
	log.info('Could not connect to db: ', err);
});
