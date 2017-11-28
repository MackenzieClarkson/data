'use strict';

const config = require('../config');
const api = require('./lib/api');
const dbConnection = require('./lib/connection');
const log = require('bunyan').createLogger(config.log);

dbConnection.connect(config).then((connection) => {
	api.deleteData(log, connection).then(() => {
		log.info('template started successfully on: ' + config.web.url);
		api.getData(log, config, connection).then(() => {
			log.info('Succesfully inserted data into mysql database');
			// close connection
			connection.end();
		});
	});
}).catch((err) => {
	log.error('Error inserting data into collection: ', err);
});