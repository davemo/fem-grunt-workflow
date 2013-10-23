// controllers/character_selector_controller.js
angular.module('tbs.BattlePlannerNG').controller('CharacterSelector', [
  '$scope', 'UnitGroupings', 'Units', function($scope, UnitGroupings, Units) {
    var nextAvailableLoadoutSlot;
    $scope.unitGroupings = UnitGroupings;
    $scope.$on('edit:unit', function() {
      return $scope.editing = true;
    });
    $scope.$on('choose:unit', function() {
      return $scope.editing = false;
    });
    $scope.assignUnitToNextAvailableLoadoutSlot = function(presetUnit) {
      return _(nextAvailableLoadoutSlot()).extend(angular.copy(presetUnit));
    };
    return nextAvailableLoadoutSlot = function() {
      return _(Units).find(function(u) {
        return _.isEmpty(u.stats);
      }) || _(Units).last();
    };
  }
]);