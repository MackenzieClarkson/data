'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getDepartments(connection, log).then((departments) => {
			db.getStaff(connection, log).then((staff) => {
				res.render('staff.pug', {
					departments: departments,
					staff: staff
				});
			});
		});
	};
};
