(function() {
  window.onload = function() {
    var myTextarea;
    myTextarea = document.querySelector('textarea');
    return CodeMirror.fromTextArea(myTextarea, {
      mode: "text/html"
    });
  };

}).call(this);
