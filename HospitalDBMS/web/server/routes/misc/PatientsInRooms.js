'use strict';
const db = require('../../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getPatientsInRooms(connection, log).then((PatientsInRooms) => {
			res.render('misc/PatientsInRoomsView.pug', {
				PatientsInRooms: PatientsInRooms
			});
		});
	};
};