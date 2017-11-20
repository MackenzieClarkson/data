'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getLargeSalaryPositions(connection, log).then((LargeSalaryPositions) => {
			res.render('LargeSalaryPositionsView.pug', {
				LargeSalaryPositions: LargeSalaryPositions
			});
		});
	};
};