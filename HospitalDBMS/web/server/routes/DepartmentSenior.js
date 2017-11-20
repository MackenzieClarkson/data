'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getDepartmentSenior(connection, log).then((DepartmentSenior) => {
			res.render('DepartmentSeniorView.pug', {
				DepartmentSenior: DepartmentSenior
			});
		});
	};
};