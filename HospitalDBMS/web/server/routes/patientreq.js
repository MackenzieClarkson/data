'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getFindPatient(connection, log, req.params.hcn).then((patient) => {
			res.json(patient);
		});
	};
};