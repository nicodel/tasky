// Generated by CoffeeScript 1.7.1
var americano, application;

americano = require('americano');

application = module.exports.start = function(root, port, callback) {
  var options;
  options = {
    name: 'tasky',
    root: root || __dirname,
    port: port || process.env.PORT,
    host: process.env.HOST || '0.0.0.0'
  };
  return americano.start(options, callback);
};

if (!module.parent) {
  application();
}
