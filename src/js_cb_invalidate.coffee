###
Copyright (c) 2013, Andrew Hanna, Burn37.com Inc.
###

class this.CallbackInvalidator
  constructor: ->
    @cbs = []

  add: (cb, scope) ->
    if typeof cb == "function"
      wrapped = (args...) =>
        cb.apply(scope || null, args) if @cbs.indexOf(cb) != -1
      @cbs.push wrapped

    wrapped

  reset: ->
    @cbs = []