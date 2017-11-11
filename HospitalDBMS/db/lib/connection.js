const mysql = require('mysql');

const connect = (config) => {
	return new Promise((resolve, reject) => {
		const log = require('bunyan').createLogger(config.log);
		const connection = mysql.createConnection({
			host: config.mysql.host,
			database: config.mysql.database,
			user: config.mysql.user,
			password: config.mysql.password
			// dateStrings: true
		});

		// connect to db
		connection.connect((err) => {
			if (err) {
				log.error('Could not connect to local database');
				reject(err);
			} else {
				log.info('Connected to local database');
				resolve(connection);
			}
		});
	});
};
module.exports = {
	connect
};