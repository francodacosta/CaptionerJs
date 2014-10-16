module.exports = (grunt) ->

  grunt.initConfig
    meta:
        banner: '
/*!\n
 * CaptionerJs | Beautiful and semantically correct captions\n
 * http://francodacosta.com/captionerjs/\n
 *\n
 * Copyright 2013-2014, Nuno Costa <nuno@francodacosta.com>\n
 * Released under the MIT license\n
 * https://github.com/francodacosta/CaptionerJs/blob/master/LICENSE\n
 *\n
 */'

    usebanner:
        dist:
            options:
                position: 'top',
                banner: '<%= meta.banner %>'
            files:
                src: [ 'dist/*.js', 'dist/*.css' ]

    coffee:
      compileJoined:
        banner: '<%= meta.banner %>'
        options:
            join: true
        files:
            'dist/CaptionerJs.js': [
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
        banner: '<%= meta.banner %>'
        files:
                "dist/CaptionerJs.css": "src/css/*"

    uglify:
        options:
            mangle:
                except: ['jQuery', '$']

        dist:
            files:
                'dist/CaptionerJs.min.js': ['dist/CaptionerJs.js']

    cssmin:
        combine:
            files:
                'dist/CaptionerJs.min.css': ['dist/CaptionerJs.css']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-jasmine-node'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-banner'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'


  grunt.registerTask 'default', ['less', 'coffee']
  grunt.registerTask 'dist', ['default', 'uglify', 'cssmin','usebanner']
  grunt.registerTask 'tests', 'compile and run tests', ->
      grunt.config.set('coffee', grunt.config.get('coffee_tests'))
      grunt.task.run('coffee')
      grunt.task.run('jasmine_node')
