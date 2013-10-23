angular.module('tbs.BattlePlannerNG', []).run(['$rootScope', ($rootScope) ->
  $rootScope.log = (things...) ->
    console.log(things)

  $rootScope.alert = (something) ->
    alert(something)
])
