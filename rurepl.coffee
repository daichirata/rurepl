require('zappa') Number(process.env.PORT || 3000), ->
  @io.configure =>
    @io.set("transports", ["xhr-polling"])
    @io.set("polling duration", 10)

  @configure
    development: =>
       @use errorHandler: {showStack: true, dumpExceptions: on}
    production: =>
       @use 'errorHandler'

  @helper sleep: (secs, cb) ->
    setTimeout cb, secs * 1000

  # Stylus
  @include '/assets/stylus'

  # Javascript
  @include '/assets/script'

  # WebSocket
  @include '/assets/socket'

  # Routing
  @get '/': ->
    @render 'index'
      title: 'Rurema Read-eval-print loop (Ruby Ver1.9.2)'
