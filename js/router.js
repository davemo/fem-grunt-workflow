angular.module('tbs.BattlePlannerNG').config([
  '$routeProvider', function($routeProvider) {
    return $routeProvider.when('/:encoded', {
      controller: "LoadoutController"
    });
  }
]);
