h1 @title
div id: 'repl', ->

  pre id: 'result', -> 'Connecting...'

  div id: 'input', ->
    form id: 'input-form', ->
      dl class: 'input-version', ->
        dd -> ul -> '''
          <li><input type="radio" name="version" id="r187", value="1.8.7" /><label>Ruby 1.8.7</label></li>
          <li><input type="radio" name="version" id="r192", value="1.9.2" checked="checked"/><label>Ruby 1.9.2</label></li>
          <li><input type="radio" name="version" id="r193", value="1.9.3" /><label>Ruby 1.9.3</label></li>
        '''
      input id: 'input-value', type: 'text'

div id: 'how-to', ->
  p -> '使い方'
  ul ->
    li -> p '検索したいメソッドを入力した後、「Enter」もしくは「対応するバージョンのボタン」をクリックすると検索が開始します。'
    li -> p '「メソッド名」または「クラス名.メソッド名」で検索してください'
    li -> p '「クラス名#」でインスタンスメソッド一覧、「クラス名.」でクラスメソッド一覧が表示されます'
    li -> p '候補が複数出た場合、「メソッド名 番号」でその候補を選択できます(例： each 2)'
    li -> p 'API用のアプリケーションがスリープしている場合、初回の検索のみ時間がかかる*(7秒程)かもしれません ：( '

