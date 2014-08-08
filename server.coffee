americano = require 'americano'

application = module.exports.start = (root, port, callback) ->
    options =
        name: 'tasky'
        root: root || __dirname
        port: port || process.env.PORT
        host: process.env.HOST || '0.0.0.0'

    americano.start options, callback

if not module.parent
    application()
