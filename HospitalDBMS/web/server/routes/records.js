'use strict';
const db = require('../../../db/lib/db');
const groupData = require('../groupData');

module.exports = function(connection, log){
	return function(req, res){
		db.getRecords(connection, log).then((data) => {
			const groupedInfo = groupData(data, 'Hcn');
			res.render('records', {
				patients: groupedInfo
			});
		});
	};
};