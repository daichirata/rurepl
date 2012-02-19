@include = ->

  @client '/index.js': ->
    @on write: ->
      writeResult false, @data.message

    @on push: ->
      writeResult 100, @data.notice, 100, =>
        pushResult @data.message

    @connect()

    writeResult = (speed, message, interval, callback) ->
      element = $('#result')

      write = (time) ->
        next = element.text().length + 1
        if next <= message.length
          element.text(message.substr(0, next))
          setTimeout ->
            write(time)
          , time
        else
          if callback
            setTimeout ->
              callback()
            , interval

      if speed
        element.each ->
          element.text('')
          write speed/message.length
      else
        element.text(message)

    pushResult = (message) ->
      $('#result').append message

    $ =>
      writeResult 2000, Messages.welcome, 600, ->
        writeResult 1000, Messages.example.subject, 600, ->
          pushResult Messages.example.value

      $("form").submit =>
        message = $('#input-value')
        version = $('input[name=version]:checked').val()

        if message.val()
          writeResult 1000, 'Connecting...'
          @emit search: { message: message.val(), version: version }
        false

      $('input:radio').click =>
        message = $('#input-value')
        version = $('input[name=version]:checked').val()

        if message.val()
          writeResult 1000, 'Connecting...'
          @emit search: { message: message.val(), version: version }

    Messages =
      welcome: '''
Welcome to the page (aka Rurepl) Rurema Read-eval-print loop.
'''

      example:
        subject: '''
Example: Array.each
'''
        value: '''



Array#each
--- each {|item| .... }    -> self
--- each                   -> Enumerator
各要素に対してブロックを評価します。
ブロックが与えられなかった場合は、自身と each から生成した[[c:Enumerator]] オブジェクトを返します。

[1, 2, 3].each do |i|
  puts i
end
#=> 1
        2
        3
'''
