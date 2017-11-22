'use strict';

module.exports = function(data, groupIndex){
	let groupedInfo = {};
	for (let entry of data){
		// if (!entry[groupIndex]) continue;
		if (!groupedInfo[entry[groupIndex]]){
			groupedInfo[entry[groupIndex]] = [];
		}
		let newEntry = '';
		for (let index in entry){
			if (index != groupIndex){
				newEntry += `"${index}":"${entry[index]}",`; 
			}
		}
		newEntry = '{' + newEntry;
		newEntry = newEntry.slice(0,-1) + '}';
		groupedInfo[entry[groupIndex]].push(JSON.parse(newEntry));
	}
	return groupedInfo;
};