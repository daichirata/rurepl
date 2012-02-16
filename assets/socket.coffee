@include = ->
  http = require 'http'
  sys = require 'util'

  @on connection: ->
    @emit write:
      message: welcomeMessage
      speed: 1

    @sleep 0.8, =>
      @emit push:
        message: exampleMessage

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

    client = http.createClient 9292, 'localhost'
    request = client.request 'GET', query, { 'host': 'localhost'}

    request.end()
    request.on 'response', (response) =>
      response.on 'data', (chunk) =>
        result = JSON.parse(chunk).result
        if result instanceof Array
          @emit write:
            message: result.join("")
        else
          @emit write:
            message: result

  welcomeMessage = '''
Welcome to the page (aka Rurepl) Rurema Read-eval-print loop.

Example: Array.each
'''

  exampleMessage = '''



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
