'use strict';

module.exports = function(log, find_patients){
    return function(req, res){
        res.render('patient_selection.pug', {
          patients: find_patients
        });
    };
};
