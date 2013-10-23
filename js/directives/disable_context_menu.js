// directives/disable_context_menu.js
angular.module('tbs.BattlePlannerNG').directive("disableContextMenu", function() {
  return function(scope, element, attributes) {
    return element.bind("contextmenu", function(e) {
      return e.preventDefault();
    });
  };
});