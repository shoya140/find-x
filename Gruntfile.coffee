module.exports = (grunt) ->
  grunt.initConfig

    coffee:
      compile:
        src: 'src/*.coffee'
        dest: 'main.js'

    watch:
      coffee:
        files: 'src/*.coffee'
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default',  ['coffee', 'watch']
