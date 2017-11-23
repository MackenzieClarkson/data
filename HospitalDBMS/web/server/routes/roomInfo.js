'use strict';
const db = require('../../../db/lib/db');
const groupData = require('../groupData');

module.exports = function(connection, log){
	return function(req, res){
		db.getRoomInfo(connection, log).then((roomInfo) => {
			const groupedInfo = groupData(roomInfo, 'Dno');
			res.render('roomInfo.pug', {
				roomInfo: groupedInfo
			});
		});
	};
};