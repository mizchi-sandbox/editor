module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-node-webkit-builder'
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.initConfig
    bower_concat:
      all:
        dest: 'app/vendor.js'
        exclude: []
        dependencies:
          'horn': 'jquery'
        bowerOptions:
          relative: false

    nodewebkit:
      options:
        build_dir: './build'
        mac: true
        win: false
        linux32: false
        linux64: false
      src: ['./app/**/*']

    concat:
      'codemirror-plugins':
        options: {}
        src: [
          'bower_components/codemirror/keymap/vim.js'
          'bower_components/codemirror/keymap/emacs.js'
        ]
        dest: 'app/codemirror-plugins.js'

      css:
        options: {}
        src: ['bower_components/codemirror/lib/codemirror.css']
        dest: 'app/vendor.css'

    coffee:
      src:
        files:
          'app/all.js': ['src/**/*']

    esteWatch:
      options:
        dirs: [ "src/**/*"]
      'coffee': (fpath) ->
        ['coffee:src', 'nodewebkit']

  grunt.registerTask 'build', [
    'bower_concat',
    'coffee:src',
    'concat:css',
    'concat:codemirror-plugins'
  ]
  grunt.registerTask 'default', ['build', 'esteWatch']
