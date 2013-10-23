angular.module('tbs.BattlePlannerNG', ['ngRoute']).run(['$rootScope', ($rootScope) ->
  $rootScope.log = (things...) ->
    console.log(things)

  $rootScope.alert = (something) ->
    alert(something)
])
