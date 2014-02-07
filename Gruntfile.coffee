module.exports = (grunt) =>
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    copy:
      dist:
        files: [
          expand: true
          cwd: 'src/fonts/'
          src: '**'
          dest: 'dist/fonts/'
        ]
    sass:
      dev:
        files: 
          'development/stylesheets/applepie.css': 'src/stylesheets/applepie.sass'
      dist:
        files:
          'dist/stylesheets/applepie.css': 'src/stylesheets/applepie.sass'
    watch:
      css: 
        files: 'src/**/*.sass'
        tasks: ['sass:dev']
    cssmin:
      minify: 
        expand: true
        cwd: 'dist/stylesheets/'
        src: ['*.css', '!*.min.css']
        dest: 'dist/stylesheets/'
        ext: '.min.css'
        
  grunt.registerTask "build", ["sass:dist", "cssmin", "copy:dist"]
        