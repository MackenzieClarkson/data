'use strict';

module.exports = function (log, departments, doctors) {
    return function (req, res) {
        res.render('doctors.pug', {
            departments: departments,
            doctors: doctors
        });
    };
};