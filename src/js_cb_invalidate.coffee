###

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