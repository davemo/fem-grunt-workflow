angular.module('tbs.BattlePlannerNG').config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/:encoded',
    controller: "LoadoutController"
])
