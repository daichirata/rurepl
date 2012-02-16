div id: 'container', ->
  h1 'Rurema Read Eval Print Loop'
  div id: 'repl', ->
    pre class: 'result', ->

    div id: 'input', ->
      form id: 'input-form', onsubmit: 'return false;', ->
        select id: 'input-select', name: 'version', ->
          option value: 'r187', -> '(Ruby1.8.7)'
          option value: 'r192', -> '(Ruby1.9.2)'
        input id: 'input-value', type: 'text'