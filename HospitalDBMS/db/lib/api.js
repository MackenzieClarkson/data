'use strict';

const request = require('request');
const Promise = require('bluebird');
// const mysql = require('mysql');

const deleteData = (log, connection) => {
	return new Promise((resolve, reject) => {
		truncateRecords(connection).then(() => {
			resolve();
		}).catch((err) => {
			/* istanbul ignore next */
			reject(err);
		});
	});
};

const truncateRecords = (connection) => {
	return new Promise((resolve, reject) => {
		connection.query('TRUNCATE TABLE patientrecords', (err) => {
			/* istanbul ignore if */
			if (err) {
				reject(err);
			} else {
				resolve();
			}
		});
	});
};

const getData = (log, config, connection) => {
	return new Promise((resolve, reject) => {
		// delete db on each population to avoid overlap
		Promise.all([
			getRecords(log, {
				url: config.urls.records,
				headers: config.headers,
				gzip: true
			}, connection)
		]).then(() => {
			resolve();
		}).catch((err) => {
			log.info('Could not insert record data successfully: ', err);
			reject(err);
		});
	});
};

const getRecords = (log, options, connection) => {
	return new Promise((resolve, reject) => {
		let data;

		request(options, (err, response) => {
			if (err) {
				log.info('Could not get data', err);
				reject(err);
				return;
			} else {
				log.info('Got data');
				data = JSON.parse(response.body);

				//set headers as keys
				data = data.map((record) => {
					const recordObj = [];
					for (let key in record) {
						recordObj.push(record[key]);
					}
					return recordObj;
				});

				insertRecords(connection, data).then((err) => {
					/* istanbul ignore if */
					if (err) {
						log.info('Could not save records: ', err);
						reject(err);
					} else {
						log.info('Successfully saved records');
						resolve();
					}
				});
			}
		});
	});
};

const insertRecords = (connection, data) => {
	return new Promise((resolve, reject) => {
		const query = `INSERT INTO patientrecords (
                      PHcn,
                      Illness,
                      Start,
                      End,
                      Medication,
                      Physician,
                      Symptoms,
                      CaseN)
                      VALUES ?`;
		connection.query(query, [data], (err) => {
			if (err) {
				// console.log(data);
				reject(err);
			} else {
				resolve();
			}
		});

	});
};

module.exports = {
	deleteData,
	getData
};