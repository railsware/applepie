module.exports = (grunt) =>
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
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
        
  grunt.registerTask "build", ["sass:dist", "cssmin"]
        