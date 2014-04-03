module.exports = (grunt) =>
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    banner: '/*!\n' +
            ' * ApplePie v<%= pkg.version %> (<%= pkg.homepage %>)\n' +
            ' * Copyright <%= grunt.template.today("yyyy") %> <%= pkg.author %>\n' +
            ' * Licensed under <%= pkg.license.type %> (<%= pkg.license.url %>)\n' +
            ' */\n',
    copy:
      dist:
        files: [
          expand: true
          cwd: 'src/fonts/'
          src: '**'
          dest: 'dist/fonts/'
        ,
          expand: true
          cwd: 'src/stylesheets/'
          src: '**'
          dest: 'dist/sass/'
        ]
    sass:
      dev:
        files:
          'development/stylesheets/applepie.css': 'src/stylesheets/applepie.sass'
      dist:
        files:
          'dist/css/<%= pkg.name%>.css': 'src/stylesheets/applepie.sass'
    usebanner:
      dist:
        options:
          position: 'top'
          banner: '<%= banner%>'
        files:
          src: [
            'dist/css/<%= pkg.name %>.css',
            'dist/css/<%= pkg.name %>.min.css'
            'dist/sass/<%= pkg.name %>.sass'
          ]
    compress:
      main:
        options:
          archive: "package/<%=pkg.name%>-<%=pkg.version%>.zip"
        files: [
          expand: true
          cwd: 'dist/'
          src: ['fonts/**', 'css/**']
        ]
    cssmin:
      minify:
        expand: true
        cwd: 'dist/css/'
        src: ['*.css', '!*.min.css']
        dest: 'dist/css/'
        ext: '.min.css'
    watch:
      css:
        files: 'src/**/*.sass'
        tasks: ['sass:dev']

  grunt.registerTask "build", ["sass:dist", "cssmin", "usebanner:dist", "copy:dist", "compress"]
