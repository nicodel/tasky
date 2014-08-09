// Generated by CoffeeScript 1.7.1
var americano, application;

americano = require('americano');

application = module.exports.start = function(options, callback) {
  if (options == null) {
    options = {};
  }
  options.name = 'tasky';
  options.root = options.root || __dirname;
  options.port = options.port || process.env.PORT;
  options.host = process.env.HOST || '0.0.0.0';
  return americano.start(options, function(app, server) {
    return callback();
  });
};

if (!module.parent) {
  application();
}
