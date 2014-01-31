window.onload = ->
  myTextarea = document.querySelector('textarea');
  CodeMirror.fromTextArea myTextarea,
    mode: "text/html"
    keyMap: 'vim'
