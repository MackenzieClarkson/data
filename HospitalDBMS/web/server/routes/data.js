'use strict';

module.exports = function(log, departments, rooms){
    return function(req, res){
        res.render('home.pug', {
            departments: departments,
            rooms: rooms
        });
    };
};