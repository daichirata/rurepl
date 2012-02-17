h1 @title
div id: 'repl', ->

  pre id: 'result', -> 'Connecting...'

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

