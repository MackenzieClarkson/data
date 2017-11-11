'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getView2(connection, log).then((view2) => {
			res.render('numpatients.pug', {
				num_patients_department: view2
			});
		});
	};
};