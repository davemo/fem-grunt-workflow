// controllers/loadout_controller.js
angular.module('tbs.BattlePlannerNG').controller('Loadout', [
  '$scope', '$location', 'Units', 'AppStateService', function($scope, $location, Units, AppStateService) {
    $scope.units = Units;
    $scope.$watch('units', (function(newUnits) {
      $location.replace();
      return $location.hash(tbs.data.UnitDataTranslator.serialize(newUnits));
    }), true);
    $scope.isChosen = function(index) {
      return !_.isEmpty($scope.units[index].stats);
    };
    $scope.moveUnit = function(unit, from, to, e) {
      var otherUnit;
      e.stopPropagation();
      otherUnit = $scope.units[from + to];
      $scope.units[from + to] = unit;
      return $scope.units[from] = otherUnit;
    };
    $scope.statsOrEmpty = function(unit, name) {
      if (!_.isEmpty(unit.stats)) {
        return _(unit.stats).findWhere({
          name: name
        }).current;
      } else {
        return "";
      }
    };
    $scope.clearUnit = function(unit) {
      _(unit).extend(tbs.core.defaultUnit());
      return AppStateService.choose();
    };
    return $scope.edit = function(unit) {
      if (!_.isEmpty(unit.stats)) {
        return AppStateService.edit(unit);
      }
    };
  }
]);