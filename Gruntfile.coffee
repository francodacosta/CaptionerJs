module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
        files:
          'dist/CaptionerJs.js':
            [
              'src/*.coffee'
#             'otherdirectory/*.coffee'
            ]
    watch:
      files: [ 'src/*.coffee', 'src/css/*.less' ]
      tasks:
        [
          'default'
        ]

    jasmine_node:
        options:
            forceExit: true,
            match: '.',
            matchall: false,
            extensions: 'js',
            specNameMatcher: 'Spec',
            jUnit:
                report: true,
                savePath : "./src/test/reports/jasmine/",
                useDotNotation: true,
                consolidate: true
        all: ['./src/test/']

    less:
      build:
        options:
            paths: ["src/css"]
        files:
                "dist/CaptionerJs.css": "src/css/*"



  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-jasmine-node'
  grunt.loadNpmTasks 'grunt-contrib-less
'

  grunt.registerTask 'default', ['less', 'coffee']
  grunt.registerTask 'tests', 'compile and run tests', ->
      grunt.config.set('coffee', grunt.config.get('coffee_tests'))
      grunt.task.run('coffee')
      grunt.task.run('jasmine_node')
