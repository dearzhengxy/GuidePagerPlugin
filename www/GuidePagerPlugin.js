var exec = require('cordova/exec');

function  GuidePagerPlugin() {};


// exports.openGuidePager = function () {
//     exec(null, null, 'GuidePagerPlugin', 'openGuidePager');
// };


GuidePagerPlugin.prototype.openGuidePager = function () {

     exec(null, null, 'GuidePagerPlugin', 'openGuidePager', []);
};


//new一个Channel的类对象，并赋值给module.exports
var guideModel = new GuidePagerPlugin();
module.exports = guideModel;