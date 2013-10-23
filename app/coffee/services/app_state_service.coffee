angular.module('tbs.BattlePlannerNG').factory 'AppStateService', ['$rootScope', ($rootScope) ->
  edit: (unit) ->
    $rootScope.$broadcast('edit:unit', unit)
  choose: ->
    $rootScope.$broadcast('choose:unit')]
