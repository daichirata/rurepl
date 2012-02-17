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
      writeResult
        message: Messages.welcome
        speed: 1
      setTimeout ->
        pushResult Messages.example
      , 1.2 * 1000

      $("form").submit =>
        message = $('#input-value')
        if message.val()
          writeResult
            message: 'Connecting...'
            speed: 30
          @emit search: { message: message.val() }
        false

    @on write: ->
      writeResult @data

    @on push: ->
      pushResult @data.message

    @connect()

    Messages =
      welcome: '''
Welcome to the page (aka Rurepl) Rurema Read-eval-print loop.

Example: Array.each
'''

      example: '''



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
