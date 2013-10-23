// directives/show_if_unit_has_stats_when_hovered.js
angular.module('tbs.BattlePlannerNG').directive("showIfUnitHasStatsWhenParentIsHovered", function() {
  return function(scope, element, attributes) {
    element.parent().bind("mouseenter", function() {
      if (scope.isChosen(scope.$index) && scope.$index.toString() !== attributes.position) {
        return element.css({
          display: "block"
        });
      }
    });
    return element.parent().bind("mouseleave", function() {
      return element.css({
        display: "none"
      });
    });
  };
});