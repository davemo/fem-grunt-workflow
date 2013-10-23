angular.module('tbs.BattlePlannerNG').controller 'Loadout', ['$scope', '$location', 'Units', 'AppStateService',
  ($scope, $location, Units, AppStateService) ->

    $scope.units = Units

    $scope.$watch('units',((newUnits)->
      $location.replace() #note: this is really bizzare, but here's the docs
      # replace: If called, all changes to $location during current $digest will be replacing current history record, instead of adding new one.
      $location.hash(tbs.data.UnitDataTranslator.serialize(newUnits))
    ),true)

    $scope.isChosen = (index) ->
      !_.isEmpty($scope.units[index].stats)

    $scope.moveUnit = (unit, from, to, e) ->
      e.stopPropagation()
      otherUnit = $scope.units[from+to]
      $scope.units[from+to] = unit
      $scope.units[from]    = otherUnit

    $scope.statsOrEmpty = (unit, name) ->
      if !_.isEmpty(unit.stats)
        _(unit.stats).findWhere({name}).current
      else
        ""

    $scope.clearUnit = (unit) ->
      _(unit).extend(tbs.core.defaultUnit())
      AppStateService.choose()

    $scope.edit = (unit) ->
      if !_.isEmpty(unit.stats)
        AppStateService.edit(unit)
]
