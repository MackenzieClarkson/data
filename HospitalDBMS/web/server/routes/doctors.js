'use strict';
const db = require('../../../db/lib/db');

module.exports = function (connection, log) {
	return function (req, res) {
		db.getDepartments(connection, log).then((departments) => {
			db.getDoctors(connection, log).then((doctors) => {
				res.render('doctors.pug', {
					departments: departments,
					doctors: doctors
				});
			});
		});
	};
};