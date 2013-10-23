angular.module('tbs.BattlePlannerNG').directive "showIfUnitHasStatsWhenParentIsHovered", ->
  (scope, element, attributes) ->
    element.parent().bind "mouseenter", ->
      if scope.isChosen(scope.$index) and scope.$index.toString() isnt attributes.position
        element.css(display: "block")

    element.parent().bind "mouseleave", ->
      element.css(display: "none")
