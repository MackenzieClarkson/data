'use strict';

module.exports = function(log, records){
    return function(req, res){
        res.render('records.pug', {records: records});
        // res.json(records);
    };
};