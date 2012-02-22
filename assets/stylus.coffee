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
      width 1020px
      margin 0 auto

    #repl, #input-select, #input-value
      font-family monospace
      font-size 14px
      color #ddd
      background-color #111

    #repl
      font-size 18px
      padding 10px 20px 20px
      border-radius 5px

    #result
      padding-bottom 50px
      white-space pre-wrap
      word-wrap break-word

    #input-value
      border-radius 3px
      background-color #303030
      border 0px solid #6F6F6F
      width 98%
      padding 4px

    #how-to
      margin 40px 0

    #how-to li
      margin-bottom 10px

    #meta-data
      margin 30px 0

    .mgn-lr
      margin 0 10px

    dl.input-version dd
      white-space nowrap

    dl.input-version dd li
      left -80px
      top -20px
      position relative
      list-style none
      float left

    ul.window li
      left 0px !important

    dl.input-version dd label
      background #111
      padding 10px 30px
      border 1px solid #999
      border-radius 0 0px 0px 0
      color #aaa
      text-align center

    dl.input-version dd li:first-child label
      border-radius 10px 0 0 10px

    dl.input-version dd li:last-child label
      border-radius 0 10px 10px 0

    dl.input-version dd li input[type="radio"]
      opacity 0
      position absolute

      width 100%
      height 100%
      padding 0

    dl.input-version dd li input:checked + label
      background #303030

    dl.input-version dd li input:disabled + label
      color #222

    #copyright
      padding 10px 0
      color #666
      border-top 1px solid #111
      text-align center
  '''