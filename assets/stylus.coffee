@include = ->
  @stylus '/style.css': '''
    border-radius()
      -webkit-border-radius arguments
      -moz-border-radius arguments
      border-radius arguments

    body
      background-color white
      font-family Meiryo, "Hiragino Kaku Gothic Pro", "MS Gothic", Osaka, sans-serif
      line-height 1.3

    h1
      color white
      background-color #33A
      font-size 200%
      margin 10px 20px
      padding 10px 20px

    #container
      width 960px
      margin 0 auto

    #repl, #input-select, #input-value
      font-family monospace
      font-size 14px
      color #ddd
      background-color #111

    #repl
      margin 20px 20px
      padding 10px 20px
      border-radius 3px

    #input-value
      border-radius 3px
      background-color #303030
      border 0px solid #6F6F6F
      width 80%
      padding 4px
  '''