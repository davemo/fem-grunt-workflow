// data/unit_data.js
def('tbs.data.UnitStatMapper', function(raw_stats_array) {
  var STATS;
  STATS = ["armor", "strength", "willpower", "exertion", "break"];
  return _(raw_stats_array).map(function(min_max, i) {
    return {
      min: min_max[0],
      max: min_max[1],
      current: min_max[0],
      name: STATS[i]
    };
  });
});

def('tbs.data.Units', function() {
  return [
    {
      name: "raider",
      type: "base",
      rank: 0,
      stats: tbs.data.UnitStatMapper([[6, 9], [6, 9], [4, 6], [1, 2], [1, 2]])
    }, {
      name: "raidmaster",
      type: "raider",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[6, 12], [6, 12], [4, 11], [1, 3], [1, 3]])
    }, {
      name: "thrasher",
      type: "raider",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[5, 11], [8, 12], [3, 13], [1, 3], [1, 2]])
    }, {
      name: "backbiter",
      type: "raider",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[5, 12], [8, 10], [4, 13], [0, 3], [1, 3]])
    }, {
      name: "archer",
      type: "base",
      rank: 0,
      stats: tbs.data.UnitStatMapper([[4, 7], [4, 7], [5, 8], [1, 2], [1, 1]])
    }, {
      name: "bowmaster",
      type: "archer",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[4, 9], [4, 8], [5, 12], [1, 3], [1, 2]])
    }, {
      name: "skystriker",
      type: "archer",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[3, 9], [4, 8], [7, 13], [1, 3], [0, 1]])
    }, {
      name: "siegearcher",
      type: "archer",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[4, 9], [4, 7], [6, 13], [1, 3], [0, 2]])
    }, {
      name: "warrior",
      type: "base",
      rank: 0,
      stats: tbs.data.UnitStatMapper([[9, 9], [12, 12], [5, 5], [2, 2], [2, 2]])
    }, {
      name: "warmaster",
      type: "warrior",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[6, 11], [9, 17], [3, 10], [1, 2], [1, 3]])
    }, {
      name: "warhawk",
      type: "warrior",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[7, 12], [10, 16], [2, 11], [0, 2], [1, 2]])
    }, {
      name: "warleader",
      type: "warrior",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[5, 12], [9, 15], [5, 9], [1, 3], [0, 4]])
    }, {
      name: "shieldbanger",
      type: "base",
      rank: 0,
      stats: tbs.data.UnitStatMapper([[9, 14], [8, 10], [2, 4], [1, 1], [1, 2]])
    }, {
      name: "provoker",
      type: "shieldbanger",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[11, 18], [7, 12], [2, 8], [0, 2], [1, 3]])
    }, {
      name: "strongarm",
      type: "shieldbanger",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[9, 15], [9, 15], [2, 9], [0, 2], [1, 2]])
    }, {
      name: "shieldmaster",
      type: "shieldbanger",
      rank: 1,
      stats: tbs.data.UnitStatMapper([[9, 16], [8, 13], [2, 8], [1, 2], [1, 4]])
    }
  ];
});