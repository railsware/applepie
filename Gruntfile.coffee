module.exports = (grunt) =>
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    copy:
      dist:
        files: [
          expand: true
          cwd: 'src/fonts/'
          src: '**'
          dest: 'build/applepie/fonts/'
        ]
    sass:
      dev:
        files:
          'development/stylesheets/applepie.css': 'src/stylesheets/applepie.sass'
      dist:
        files:
          'build/applepie/css/applepie.css': 'src/stylesheets/applepie.sass'
    watch:
      css:
        files: 'src/**/*.sass'
        tasks: ['sass:dev']
    cssmin:
      minify:
        expand: true
        cwd: 'build/applepie/css/'
        src: ['*.css', '!*.min.css']
        dest: 'build/applepie/css/'
        ext: '.min.css'

  grunt.registerTask "build", ["sass:dist", "cssmin", "copy:dist"]
