@include = ->

  @client '/index.js': ->
    writeResult = (option) ->
      speed = option.speed
      message = option.message
      target = $('#result')

      if speed
        progress = 0
        timer = setInterval ->
          target.text(message.substring(0, progress++) + (if progress & 1 and progress <= message.length then '_' else ''))
          clearInterval timer if (progress >= message.length + 1)
        , speed
      else
        target.text message

    pushResult = (message) ->
      $('#result').append message

    $ =>
      $("form").submit =>
        writeResult
          message: 'Connecting...'
          speed: 30
        message = $('#input-value')
        @emit search: { message: message.val() }
        false

    @on write: ->
      writeResult @data

    @on push: ->
      pushResult @data.message

    @connect()






