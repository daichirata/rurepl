require('zappa') ->
  @configure =>
    @use 'bodyParser', 'static'

  @configure
    development: =>
       @use errorHandler: {showStack: true, dumpExceptions: on}
    production: =>
       @use 'errorHandler'

  # Stylus
  @include '/assets/stylus'

  # Javascript
  @include '/assets/script'

  # Routing
  @get '/': ->
    @render 'index'

  # WebSocket
  @on connection: ->
    @emit write: { message: "Welcome to the page (aka Rurepl) Rurema Read-eval-print loop.", speed: 5 }

