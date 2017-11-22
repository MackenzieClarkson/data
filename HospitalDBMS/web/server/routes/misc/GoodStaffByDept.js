'use strict';
const db = require('../../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getGoodStaffByDept(connection, log).then((GoodStaffByDept) => {
			res.render('misc/GoodStaffByDeptView.pug', {
				GoodStaffByDept: GoodStaffByDept
			});
		});
	};
};