'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getPatients(connection, log).then((patients) => {
			res.render('patients.pug', {
				patients: patients
			});
		});
	};
};