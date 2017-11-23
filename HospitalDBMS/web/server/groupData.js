'use strict';
/*
 * The purpose of this function is to group a views data by a given column
 * This is to emulate a NoSQL style structure
 */
// module.exports = function(data, groupIndex){
module.exports = function(data, prop) {
	return data.reduce(function(groups, item) {
		var val = item[prop];
		groups[val] = groups[val] || [];
		groups[val].push(item);
		return groups;
	}, {});
};
// let groupedInfo = {};
// for (let entry of data){
// 	// if (!entry[groupIndex]) continue;
// 	if (!groupedInfo[entry[groupIndex]]){
// 		groupedInfo[entry[groupIndex]] = [];
// 	}
// 	let newEntry = '';
// 	for (let index in entry){
// 		if (index != groupIndex){
// 			newEntry += `"${index}":"${entry[index]}",`; 
// 		}
// 	}
// 	newEntry = '{' + newEntry;
// 	newEntry = newEntry.slice(0,-1) + '}';
// 	groupedInfo[entry[groupIndex]].push(JSON.parse(newEntry));
// }
// return groupedInfo;