'use strict';
const db = require('../../../db/lib/db');
const groupData = require('../groupData');

module.exports = function (connection, log) {
	return function (req, res) {
		db.getDoctors(connection, log).then((data) => {
			const groupedInfo = groupData(data, 'Dno');
			res.render('doctors.pug', {
				departments: groupedInfo
			});
		});
	};
};