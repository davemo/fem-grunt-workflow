// services/unit_service.js
def('tbs.core.defaultUnit', function() {
  return {
    name: "",
    type: "",
    stats: void 0,
    allocated_stat_points: 0,
    max_stat_points: 11
  };
});

angular.module('tbs.BattlePlannerNG').factory('Units', [
  '$location', function($location) {
    var hash, units;
    if (hash = $location.hash()) {
      units = tbs.data.UnitDataTranslator.deserialize(hash);
    } else {
      units = _(_.range(0, 6)).map(tbs.core.defaultUnit);
    }
    return units;
  }
]);

angular.module('tbs.BattlePlannerNG').factory('UnitGroupings', function() {
  var maxStatPointsForRank, units;
  maxStatPointsForRank = function(rank) {
    switch (rank) {
      case 0:
        return 10;
      case 1:
        return 11;
      case 2:
        return 12;
      case 3:
        return 13;
    }
  };
  units = _(tbs.data.Units()).map(function(unit) {
    return _(unit).tap(function(u) {
      u.max_stat_points = maxStatPointsForRank(u.rank);
      return u.allocated_stat_points = 0;
    });
  });
  return _(_(units).groupBy("type")).tap(function(grouped) {
    return delete grouped.base;
  });
});