module.exports = (grunt) ->

  # task configurations
  # initializing task configuration
  grunt.initConfig

    # files that our tasks will use
    files:
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

  # loading local tasks
  grunt.loadTasks "tasks"

  # loading external tasks (aka: plugins)
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-less"

  # creating workflows
  grunt.registerTask "default", ["less", "concat", "watch"]
