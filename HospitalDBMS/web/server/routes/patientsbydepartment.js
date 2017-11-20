'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getPatientsByDepartment(connection, log).then((patientsByDepartment) => {
			res.render('numpatients.pug', {
				num_patients_department: patientsByDepartment
			});
		});
	};
};