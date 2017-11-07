'use strict';

const records = require('./recordData').records;

module.exports = function(log){
    return function(req, res){
        res.json(records);
    };
};