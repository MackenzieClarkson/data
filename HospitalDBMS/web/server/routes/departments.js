'use strict';
const db = require('../../../db/lib/db');

module.exports = function (connection, log) {
	return function(req, res){
		db.getDepartments(connection, log).then((departments) => {
			db.getRooms(connection, log).then((rooms) => {
				res.render('departments.pug', {
					departments: departments,
					rooms: rooms
				});
			});
		});
	};
};