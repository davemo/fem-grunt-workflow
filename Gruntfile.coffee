module.exports = (grunt) ->

  # task configurations
  # initializing task configuration
  grunt.initConfig

    # meta data
    pkg: grunt.file.readJSON("package.json")
    banner: "/*! <%= pkg.title || pkg.name %> - v<%= pkg.version %> - " +
      "<%= grunt.template.today(\"yyyy-mm-dd\") %>\n" +
      "<%= pkg.homepage ? \"* \" + pkg.homepage + \"\\n\" : \"\" %>" +
      "* Copyright (c) <%= grunt.template.today(\"yyyy\") %> <%= pkg.author.name %>;" +
      " Licensed <%= _.pluck(pkg.licenses, \"type\").join(\", \") %> */\n"

    # files that our tasks will use
    files:
      html:
        src: "app/index.html"

      less:
        src: ["app/css/style.less"]

      js:
        vendor: [
          "bower_modules/jquery/jquery.js"
          "bower_modules/angular/angular.js"
          "bower_modules/angular-route/angular-route.js"
          "bower_modules/underscore/underscore.js"
          "bower_modules/extend.js/index.js"
          "bower_modules/base64js/base64.js"
        ]

      coffee:
        dest: "generated/compiled-coffee"
        compiled: [
          "generated/compiled-coffee/config/**/*.js"
          "generated/compiled-coffee/app.js"
          "generated/compiled-coffee/data/**/*.js"
          "generated/compiled-coffee/directives/**/*.js"
          "generated/compiled-coffee/controllers/**/*.js"
          "generated/compiled-coffee/services/**/*.js"
          "generated/compiled-coffee/**/*.js"
        ]

      templates:
        src: "app/templates/**/*.html"
        compiled: "generated/template-cache.js"

    # task configuration
    coffee:
      compile:
        expand: true
        cwd: 'app/coffee'
        src: '**/*.coffee'
        dest: '<%= files.coffee.dest %>'
        ext: '.js'

    concat_sourcemap:
      options:
        sourcesContent: true
      app:
        src: [
          "<%= files.js.vendor %>"
          "<%= files.coffee.compiled %>"
          "<%= files.templates.compiled %>"
        ]
        dest: "generated/js/app.min.js"

    watch:
      options:
        livereload: true

      # targets for watch
      html:
        files: ["<%= files.html.src %>"]
        tasks: ["copy"]

      js:
        files: ["<%= files.js.vendor %>"]
        tasks: ["concat_sourcemap"]

      coffee:
        files: ["coffee/**/*.coffee"]
        tasks: ["coffee", "concat_sourcemap"]

      less:
        files: ["<%= files.less.src %>"]
        tasks: ["less:dev"]

    less:
      options:
        ieCompat: false

      dev:
        src: "<%= files.less.src %>"
        dest: "generated/css/style.css"

      dist:
        options:
          cleancss: true
          compress: true
        src: "<%= files.less.src %>"
        dest: "dist/css/style.css"

    ngtemplates:
      "tbs.BattlePlannerNG":
        options:
          base: "app/templates"
        src:  "<%= files.templates.src %>"
        dest: "<%= files.templates.compiled %>"

    copy:
      html:
        files:
          "generated/index.html" : "<%= files.html.src %>"
          "dist/index.html"      : "<%= files.html.src %>"

    server:
      base: "#{process.env.SERVER_BASE || 'generated'}"
      web:
        port: 8000

    open:
      dev:
        path: "http://localhost:<%= server.web.port %>"

    uglify:
      options:
        banner: "<%= banner %>"

      dist:
        sourceMapIn: "dist/js/app.min.js.map"
        sourceMap:   "dist/js/app.min.js.map"
        src: "<%= concat_sourcemap.app.dest %>" # input from the concat_sourcemap process
        dest: "dist/js/app.min.js"

    clean:
      workspaces: ["dist", "generated"]

  # loading local tasks
  grunt.loadTasks "tasks"

  # loading external tasks (aka: plugins)
  # Loads all plugins that match "grunt-", in this case all of our current plugins
  require('matchdep').filterAll('grunt-*').forEach(grunt.loadNpmTasks)

  # creating workflows
  grunt.registerTask "default", ["ngtemplates", "less:dev", "coffee", "concat_sourcemap", "copy", "server", "open", "watch"]
  grunt.registerTask "build", ["clean", "ngtemplates", "less:dist", "coffee", "concat_sourcemap", "uglify", "copy"]
  grunt.registerTask "prodsim", ["build", "server", "open", "watch"]
