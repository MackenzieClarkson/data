'use strict';

module.exports = function(log){
	return function(req, res){
		res.render('home.pug');
	};
};