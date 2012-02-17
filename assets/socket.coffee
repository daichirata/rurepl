@include = ->
  http = require 'http'
#  sys = require 'util'

  @on connection: ->
    @emit write:
      message: Messages.welcome
      speed: 1

    @sleep 1, =>
      @emit push:
        message: Messages.example

  @on search: ->
    _message = @data.message
    message = _message.split(' ')
    switch message.length
      when 1
        query = "/search/#{message[0]}"
      when 2
        query = "/search/#{message[0]}/#{message[1]}"
      else
        query = "/search/"

    # TODO host port
    request = http.get
      "host": "rurea-192.heroku.com",
      "port": 80,
      "path": query
    , (response) =>
        body = ''
        response.on 'data', (chunk)->
          body += chunk.toString()
        response.on 'end', =>
          try
            res = JSON.parse(body)
          catch e
            res = { status: 500, result: "Internal Server Error #{e}" }

          switch res.status
            when 200, 500
              @emit write:
                message: res.result
            when 202
              @emit write:
                message: Messages.multiple
                speed: 1
              @sleep 0.8, =>
                @emit push:
                  message: res.result.join("")
            when 400, 404
              @emit write:
                message: Messages.search
                speed: 5
              @sleep 0.8, =>
                @emit push:
                  message: res.result



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

    search: '''
Please search in the ClassName.method or method


'''

    multiple: '''
More than one candidate, you can choose a candidate in the "method number" ( for example: each 2 )


'''