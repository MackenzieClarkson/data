'use strict';

module.exports = function(log, departments, staff){
    return function(req, res){
        res.render('staff.pug', {
          departments: departments,
          staff: staff
        });
    };
};
