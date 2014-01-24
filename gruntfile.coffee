module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-node-webkit-builder'
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-este-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.initConfig
    bower_concat:
      all:
        dest: 'gen/vendor.js'
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
      src: [
        './index.html'
        './package.json'
        './gen/**/*'
        './node_modules/**/*'
        ]
    concat:
      css:
        options: {}
        src: ['bower_components/codemirror/lib/codemirror.css']
        dest: 'gen/all.css'
    coffee:
      src:
        files:
          'gen/all.js': ['src/**/*']

    esteWatch:
      options:
        dirs: [ "src/**/*"]
      'coffee': (fpath) ->
        ['coffee:src']