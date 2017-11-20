'use strict';
const db = require('../../../db/lib/db');

module.exports = function (connection, log) {
	return function (req, res) {
		db.getDoctors(connection, log).then((doctors) => {
			db.getCaresForPatient(connection, log).then((patients) => {
				res.render('patientsByDoctor.pug', {
					doctors: doctors,
					patients: patients
				});
			});
		});
	};
};