doctype 5
html ->
  head ->
    link rel: 'stylesheet', href: '/style.css'
    script(src: src) for src in [
      '/socket.io/socket.io.js'
      '/zappa/jquery.js'
      '/zappa/zappa.js'
      '/index.js'
    ]
    title 'Rurepl - Rurema Read Eval Print Loop'
  body ->
    @body
