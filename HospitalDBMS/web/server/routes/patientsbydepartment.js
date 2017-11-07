'use strict';

module.exports = function(log, num_patients_department){
    return function(req, res){
        res.render('numpatients.pug', {
            num_patients_department: num_patients_department
        });
    };
};