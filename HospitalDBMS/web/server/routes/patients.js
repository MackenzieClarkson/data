'use strict';

module.exports = function(log, patients){
    return function(req, res){
        res.render('patients.pug', {patients: patients});
    };
};