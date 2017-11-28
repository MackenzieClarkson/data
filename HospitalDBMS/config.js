'use strict';

const bunyan = require('bunyan');

module.exports = require('rc')('template', {
	log: {
		name: 'template',
		serializers: {
			res: bunyan.stdSerializers.res,
			req: bunyan.stdSerializers.req,
			err: bunyan.stdSerializers.err
		},
		level: 'info'
	},
	mysql: {
		host: 'localhost',
		database: 'hospital_project',
		user: 'root',
		password: 'root'
	},
	web: {
		port: 3000,
		url: 'http://localhost:3000'
	},
	urls: {
		records: 'https://lukebaal.github.io/records.json'
	}
});
