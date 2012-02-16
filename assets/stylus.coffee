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
      margin 0
      border-top 3px solid #33A

    h1
      color white
      background-color #33A
      font-size 200%
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
      padding 10px 20px 20px
      border-radius 5px

    #result
      min-height: 330px;
      padding-bottom 20px

    #input-value
      border-radius 3px
      background-color #303030
      border 0px solid #6F6F6F
      width 98%
      padding 4px

    #how-to
      margin-top 40px

    #how-to li
      margin-bottom 10px
  '''