// controllers/stat_change_controller.js
angular.module('tbs.BattlePlannerNG').controller('StatChange', [
  '$scope', function($scope) {
    var changeBy;
    $scope.increaseOrDecrease = function(unit, stat, e) {
      e.preventDefault();
      e.stopPropagation();
      switch (e.which) {
        case 1:
          return changeBy(unit, stat, 1);
        case 3:
          return changeBy(unit, stat, -1);
      }
    };
    return changeBy = function(unit, stat, amount) {
      if (!(unit.allocated_stat_points + amount > unit.max_stat_points || unit.allocated_stat_points + amount < 0)) {
        if (!(stat.current + amount < stat.min || stat.current + amount > stat.max)) {
          stat.current += amount;
          return unit.allocated_stat_points += amount;
        }
      }
    };
  }
]);
