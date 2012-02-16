@include = ->

  @client '/index.js': ->
    @helper writeResult: (option) ->
      message = option.message
      speed   = option.speed

      if speed
        progress = 0
        timer = setInterval ->
          $('.result').text(message.substring(0, progress++) + (if progress & 1 then '_' else ''))
          clearInterval timer if progress >= (message.length + 1)
        , speed
      else
        $('.result').text message

    @on write: ->
      @writeResult @data

    @connect()


