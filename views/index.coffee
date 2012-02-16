div id: 'container', ->
  h1 @title
  div id: 'repl', ->

    pre id: 'result', -> ''

    div id: 'input', ->
      form id: 'input-form', ->
        input id: 'input-value', type: 'text'

  div id: 'how-to', ->
    p -> '使い方'
    ul ->
      li -> '「メソッド名」または「クラス名.メソッド名」で検索してください'
      li -> '候補が複数出た場合、「メソッド名 番号」でその候補を選択できます(例： each 2)'
    p -> '今後'
    ul ->
      li -> 'Ruby1.9.3、Ruby1.8.7に対応'
      li -> 'リスト表示、プロンプト改善'

  div id: 'meta-data', ->
    a class: 'twitter-share-button', href: 'https://twitter.com/share', 'data-url': "http://rurepl.herokuapp.com/", 'data-lang': 'ja', 'data-count': 'none', 'ツイート'
    script '!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");'
    a class: 'hatena-bookmark-button', href: 'http://b.hatena.ne.jp/entry/http://rurepl.herokuapp.com/http://rurepl.herokuapp.com/', 'data-hatena-bookmark-title': 'Rurema Read-eval-print loop', 'data-hatena-bookmark-layout': 'standard', title: 'このエントリーをはてなブックマークに追加', ->
      img src: 'http://b.st-hatena.com/images/entry-button/button-only.gif', alt: 'このエントリーをはてなブックマークに追加', width: '20', height: '20', style: 'border: none;'
    script type: 'text/javascript', src: 'http://b.st-hatena.com/js/bookmark_button.js', charset: 'utf-8', async: 'async'
    a class: 'mgn-lr', href: 'https://github.com/daic-h/rurepl', -> 'Source Code'
    span -> 'created_by'
    a class: 'mgn-lr', href: 'https://twitter.com/#!/Daic_h', -> '@Daic_h'
