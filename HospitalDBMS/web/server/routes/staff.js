'use strict';
const db = require('../../../db/lib/db');
const groupData = require('../groupData');

module.exports = function(connection, log){
	return function(req, res){
		db.getStaff(connection, log).then((data) => {
			const groupedInfo = groupData(data, 'Dno');
			res.render('staff', {
				departments: groupedInfo
			});
		});
	};
};
