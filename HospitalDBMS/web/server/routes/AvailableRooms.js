'use strict';
const db = require('../../../db/lib/db');

module.exports = function(connection, log){
	return function(req, res){
		db.getAvailableRooms(connection, log).then((AvailableRooms) => {
			res.render('AvailableRoomsView.pug', {
				AvailableRooms: AvailableRooms
			});
		});
	};
};