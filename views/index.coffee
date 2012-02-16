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