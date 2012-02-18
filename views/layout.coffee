doctype 5
html lang: 'ja', ->
  head ->
    meta charset: 'utf-8'
    link rel: 'stylesheet', href: '/style.css'
    script(src: src) for src in [
      '/socket.io/socket.io.js'
      '/zappa/jquery.js'
      '/zappa/zappa.js'
      '/index.js'
    ]
    title 'Rurepl - Rurema Read Eval Print Loop'

    coffeescript ->
      window._gaq = window._gaq or []
      window._gaq.push [ "_setAccount", "UA-29272538-1" ]
      window._gaq.push [ "_trackPageview" ]
      do ->
        ga = document.createElement("script")
        ga.type = "text/javascript"
        ga.async = true
        ga.src = (if "https:" is document.location.protocol then "https://ssl" else "http://www") + ".google-analytics.com/ga.js"
        s = document.getElementsByTagName("script")[0]
        s.parentNode.insertBefore ga, s
  body ->
    div id: 'container', ->
      div id: 'main', ->
         @body

      div id: 'meta-data', ->
        a class: 'twitter-share-button', href: 'https://twitter.com/share', 'data-url': "http://rurepl.herokuapp.com/", 'data-lang': 'ja', 'data-count': 'none', 'ツイート'
        coffeescript ->
          [d, s, id]  = [document, 'script', 'twitter-wjs']
          !do (d,s,id) ->
              js = d.getElementsByTagName(s)[0]
              fjs = d.getElementsByTagName(s)[0]

              if !d.getElementById(id)
                js = d.createElement(s)
                js.id = id
                js.src = '//platform.twitter.com/widgets.js'
                fjs.parentNode.insertBefore(js,fjs)
        a class: 'hatena-bookmark-button', href: 'http://b.hatena.ne.jp/entry/http://rurepl.herokuapp.com/', 'data-hatena-bookmark-title': 'Rurema Read-eval-print loop', 'data-hatena-bookmark-layout': 'standard', title: 'このエントリーをはてなブックマークに追加', ->
          img src: 'http://b.st-hatena.com/images/entry-button/button-only.gif', alt: 'このエントリーをはてなブックマークに追加', width: '20', height: '20', style: 'border: none;'
          script type: 'text/javascript', src: 'http://b.st-hatena.com/js/bookmark_button.js', charset: 'utf-8', async: 'async'
        a class: 'mgn-lr', href: 'https://github.com/daic-h/rurepl', -> 'Source Code'
        span 'created_by'
        a class: 'mgn-lr', href: 'https://twitter.com/#!/Daic_h', -> '@Daic_h'

      div id: 'copyright', ->
        p '検索対象のドキュメントは<a href="http://bugs.ruby-lang.org/projects/rurema"> るりまプロジェクト </a>の成果物です。'

