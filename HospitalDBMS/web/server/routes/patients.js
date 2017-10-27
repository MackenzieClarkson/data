'use strict';

module.exports = function(log, patients){
    return function(req, res){
        res.render('patient-selection.pug', {patients: patients});
    };
};