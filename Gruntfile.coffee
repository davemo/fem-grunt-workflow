module.exports = (grunt) ->

  # task configurations
  # initializing task configuration
  grunt.initConfig

    # files that our tasks will use
    files:
      html:
        src: "index.html"

      less:
        src: ["css/style.less"]

      js:
        src: [
          "vendor/js/jquery.js"
          "vendor/js/angular.js"
          "vendor/js/underscore.js"
          "vendor/js/base64.js"
          "vendor/js/extend.js"
          "js/config/**/*.js"
          "js/app.js"
          "js/data/**/*.js"
          "js/directives/**/*.js"
          "js/controllers/**/*.js"
          "js/services/**/*.js"
          "js/**/*.js"
        ]

    # task configuration targets
    concat:
      js:
        src: "<%= files.js.src %>"
        dest: "generated/js/app.min.js"

    watch:
      options:
        livereload: true

      html:
        files: ["<%= files.html.src %>"]
        tasks: ["copy"]

      js:
        files: ["<%= files.js.src %>"]
        tasks: ["concat"]

      less:
        files: ["<%= files.less.src %>"]
        tasks: ["less:dev"]

    less:
      options:
        paths: ["app/css"]
        ieCompat: false

      dev:
        src: "<%= files.less.src %>"
        dest: "generated/css/style.css"

    copy:
      html:
        src: "<%= files.html.src %>"
        dest: "generated/index.html"

    server:
      base: "generated"
      web:
        port: 8000

    clean:
      workspaces: ["dist", "generated"]

  # loading local tasks
  grunt.loadTasks "tasks"

  # loading external tasks (aka: plugins)
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-clean"

  # creating workflows
  grunt.registerTask "default", ["less", "concat", "copy", "server", "watch"]
