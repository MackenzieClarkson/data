'use strict';
const db = require('../../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getPayRoll(connection, log).then((PayRoll) => {
			res.render('misc/PayRollView.pug', {
				PayRoll: PayRoll
			});
		});
	};
};