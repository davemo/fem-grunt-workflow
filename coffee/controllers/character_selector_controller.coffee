angular.module('tbs.BattlePlannerNG').controller 'CharacterSelector', ['$scope', 'UnitGroupings', 'Units',
  ($scope, UnitGroupings, Units) ->
    $scope.unitGroupings = UnitGroupings

    $scope.$on 'edit:unit', ->
      $scope.editing = true

    $scope.$on 'choose:unit', ->
      $scope.editing = false

    $scope.assignUnitToNextAvailableLoadoutSlot = (presetUnit) ->
      _(nextAvailableLoadoutSlot()).extend(angular.copy(presetUnit))

    # private

    nextAvailableLoadoutSlot = ->
      _(Units).find((u) -> _.isEmpty(u.stats)) || _(Units).last()
]
