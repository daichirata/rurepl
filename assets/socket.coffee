@include = ->
  http = require 'http'
  sys = require 'util'

  @on connection: ->

  @on search: ->
    _message = @data.message
    message = _message.split(' ')

    method = message[0].replace(/\#/, '@')
    number = message[1]

    version = @data.version

    switch message.length
      when 1
        query = "/#{version}/#{method}"
      when 2
        query = "/#{version}/#{method}/#{number}"
      else
        query = "/"

    # TODO host port
    request = http.get
      "host": 'rurea.heroku.com',
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

          sys.puts res.result

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
                  message: res.result.join(" ")
            when 400, 404
              @emit write:
                message: Messages.search
                speed: 5
              @sleep 0.8, =>
                @emit push:
                  message: res.result



  Messages =
    search: '''
Please search in the ClassName.method or method


'''

    multiple: '''
More than one candidate, you can choose a candidate in the "method number" ( for example: each 2 )


'''