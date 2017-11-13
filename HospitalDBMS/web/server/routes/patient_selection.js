'use strict';
const db = require('../../../db/lib/db');

module.exports = function (connection, log) {
	return function (req, res) {	
		db.getFindPatients(connection, log).then((findpatients) => {
			res.render('patient_selection.pug', {
				patients: findpatients
			});
		});
	};
};