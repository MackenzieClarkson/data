'use strict';
const db = require('../../../db/lib/db');
const groupData = require('../groupData');

module.exports = function (connection, log) {
	return function (req, res) {
		db.getPatientsByDoctor(connection, log).then((data) => {
			const groupedInfo = groupData(data, 'Ssn');
			res.render('patientsByDoctor', {
				doctors: groupedInfo
			});
		});
	};
};