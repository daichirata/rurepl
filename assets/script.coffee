@include = ->
  @client '/index.js': ->
    @connect()

    $ =>
      $("form").submit =>
        message = $('#input-value')
        @emit search: { message: message.val() }
#        message.attr('value', '')
        false

    @helper writeResult: (option) ->
      speed = option.speed
      message = option.message
      target = $('#result')

      if speed
        progress = 0
        timer = setInterval ->
          clearInterval timer if progress >= (message.length + 1)
          target.text(message.substring(0, progress++) + (if progress & 1 then '_' else ''))
        , speed
      else
        target.text message

    @helper pushResult: (message) ->
      $('#result').append message

    @on write: ->
      @writeResult @data

    @on push: ->
      @pushResult @data.message






