module.exports = (grunt) ->

  # task configurations
  # initializing task configuration
  grunt.initConfig
    concat:
      app:
        dest: "generated/js/app.min.js"
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

    watch:
      js:
        files: ["<%= concat.app.src %>"]
        tasks: ["concat"]

      less:
        files: ["<%= less.dev.src %>"]
        tasks: ["less:dev"]

    less:
      options:
        paths: ["app/css"]
        ieCompat: false

      dev:
        src: "css/style.less"
        dest: "generated/css/style.css"

  # loading local tasks
  grunt.loadTasks "tasks"

  # loading external tasks (aka: plugins)
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-less"

  # creating workflows
  grunt.registerTask "default", ["less", "concat", "watch"]
