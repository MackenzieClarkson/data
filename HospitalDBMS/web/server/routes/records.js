'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getPatients(connection, log).then((patients) => {
			db.getRecords(connection, log).then((records) => {
				res.render('records.pug', {
					patients: patients,
					records: records
				});
			});
		});
	};
};