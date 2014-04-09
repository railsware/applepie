module.exports = (grunt) =>
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    buildBanner:       '/*!\n' +
                       ' * ApplePie v<%= pkg.version %> (<%= pkg.homepage %>)\n' +
                       ' * Copyright <%= grunt.template.today("yyyy") %> <%= pkg.author %>\n' +
                       ' * Licensed under <%= pkg.license.type %> (<%= pkg.license.url %>)\n' +
                       ' */\n'

    manifestBanner:    '/*-----------------------------------------------------------------\n'+
                       '/*  [ Stylesheet Manifest ]\n/*\n'+
                       '/*  Project: ApplePie\n'+
                       '/*  Version: <%= pkg.version %>\n/*\n'+
                       '/*  Defines all components names and uses ApplePie mixins for default styling.\n'+
                       '/*  If you want to modify styling of elements consider configuring manifest by using\n'+
                       '/*  another mixins library for components or by wtiting custom css for existing selectors.\n/*\n'+
                       '/*-----------------------------------------------------------------\n'
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
        ,
          src: 'src/setup/manifest.sass'
          dest: 'dist/sass/manifest.sass'
        ]
    sass:
      dev:
        files:
          'development/stylesheets/applepie.css': 'src/setup/applepie.sass'
      dist:
        files:
          'dist/css/<%= pkg.name%>.css': 'src/setup/applepie.sass'
    usebanner:
      dist:
        options:
          position: 'top'
          banner: '<%= buildBanner%>'
        files:
          src: [
            'dist/css/<%= pkg.name %>.css',
            'dist/css/<%= pkg.name %>.min.css'
            'dist/sass/<%= pkg.name %>.sass'
          ]
      manifest:
        options:
          banner: '<%= manifestBanner%>'
        files:
          src: ['dist/sass/manifest.sass']
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

  grunt.registerTask "build", ["sass:dist", "cssmin",  "copy:dist", "usebanner:dist", "usebanner:manifest", "compress"]
