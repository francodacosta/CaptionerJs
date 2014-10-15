module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compileJoined:
        options:
          join: true
        files:
          'dist/iImage.js':
            [
              'build/*.coffee'
#             'otherdirectory/*.coffee'
            ]
    watch:
      files: [ 'build/*.coffee', 'build/css/*.less' ]
      tasks:
        [
          'default'
        ]



    coffee_tests:
      compileJoined:
        options:
          join: true
        files:
          './build/test/datasetTestSpec.js':
            [
              'build/*.coffee'
              'tests/*.coffee'
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
                savePath : "./build/test/reports/jasmine/",
                useDotNotation: true,
                consolidate: true
        all: ['./build/test/']

    less:
      build:
        options:
            paths: ["build/css"]
        files:
                "dist/iImage.css": "build/css/*"



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
