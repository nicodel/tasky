americano = require 'americano'

application = module.exports.start = (options, callback) ->
    options ?= {}
    options.name = 'tasky'
    options.root = options.root || __dirname
    options.port = options.port || process.env.PORT
    options.host = process.env.HOST || '0.0.0.0'

    americano.start options, (app, server) ->
        callback() if callback?

if not module.parent
    application()
