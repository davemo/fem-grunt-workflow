module.exports = function(grunt) {

  // task configurations
  var config = {
    concat: {
      app: {
        dest: "generated/js/app.min.js",
        src: [
          "vendor/js/jquery.js",
          "vendor/js/angular.js",
          "vendor/js/underscore.js",
          "vendor/js/base64.js",
          "vendor/js/extend.js",
          "js/config/extend_ext.js",
          "js/app.js",
          "js/data/unit_data_translator.js",
          "js/data/unit_data.js",
          "js/directives/disable_context_menu.js",
          "js/directives/show_if_unit_has_stats_when_hovered.js",
          "js/controllers/character_selector_controller.js",
          "js/controllers/loadout_controller.js",
          "js/controllers/stat_change_controller.js",
          "js/controllers/stat_editor_controller.js",
          "js/services/app_state_service.js",
          "js/services/unit_service.js",
          "js/router.js"
        ]
      }
    }
  };

  // initializing task configuration
  grunt.initConfig(config);

  // loading local tasks
  grunt.loadTasks("tasks");

  // loading external tasks (aka: plugins)
  grunt.loadNpmTasks("grunt-contrib-concat");

  // creating workflows
  grunt.registerTask('default', ['concat']);

};
