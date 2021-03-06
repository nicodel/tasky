{EventEmitter} = require 'events'
AppDispatcher = require '../../../AppDispatcher'

module.exports = class Store extends EventEmitter

    uniqID: null

    # this variable will be shared with all subclasses so we store the items by subclass
    # we don't use `@constructor.name` because it breaks when mangled
    _nextUniqID = 0
    _handlers = {}
    _addHandlers = (type, callback) ->
        _handlers[@uniqID] = {} unless _handlers[@uniqID]?
        _handlers[@uniqID][type] = callback

    # Registers the store's callbacks to the dispatcher
    _processBinding = ->
        @dispatchToken = AppDispatcher.register (payload) =>
            {type, value} = payload.action
            if (callback = _handlers[@uniqID]?[type])? then callback.call @, value


    constructor: ->
        super()
        # set a uniq ID
        @uniqID = _nextUniqID++
        @__bindHandlers _addHandlers.bind @
        _processBinding.call @

    # Must be overriden by each store
    __bindHandlers: (handle) ->
        if __DEV__
            throw new Error "The store #{@constructor.name} must define a `__bindHandlers` method"

