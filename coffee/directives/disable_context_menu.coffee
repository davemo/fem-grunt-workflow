angular.module('tbs.BattlePlannerNG').directive "disableContextMenu", ->
  (scope, element, attributes) ->
    element.bind "contextmenu", (e) -> e.preventDefault()
