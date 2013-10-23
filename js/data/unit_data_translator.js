// data/unit_data_translator.js
var STAT_NAME_ENCODED_TO_FULL, STAT_NAME_FULL_TO_ENCODED, UNIT_NAME_ENCODED_TO_FULL, UNIT_NAME_FULL_TO_ENCODED, encodedStatMapper;

UNIT_NAME_FULL_TO_ENCODED = {
  'raidmaster': 'rm',
  'thrasher': 'th',
  'backbiter': 'bb',
  'bowmaster': 'bm',
  'skystriker': 'ss',
  'siegearcher': 'sg',
  'warmaster': 'wm',
  'warhawk': 'wh',
  'warleader': 'wl',
  'provoker': 'pk',
  'strongarm': 'sa',
  'shieldmaster': 'sm'
};

UNIT_NAME_ENCODED_TO_FULL = {
  'rm': 'raidmaster',
  'th': 'thrasher',
  'bb': 'backbiter',
  'bm': 'bowmaster',
  'ss': 'skystriker',
  'sg': 'siegearcher',
  'wm': 'warmaster',
  'wh': 'warhawk',
  'wl': 'warleader',
  'pk': 'provoker',
  'sa': 'strongarm',
  'sm': 'shieldmaster'
};

STAT_NAME_FULL_TO_ENCODED = {
  'armor': 'a',
  'strength': 's',
  'willpower': 'w',
  'exertion': 'e',
  'break': 'b'
};

STAT_NAME_ENCODED_TO_FULL = {
  'a': 'armor',
  's': 'strength',
  'w': 'willpower',
  'e': 'exertion',
  'b': 'break'
};

encodedStatMapper = function(stats) {
  var _this = this;
  return _(stats).map(function(stat) {
    return {
      name: STAT_NAME_ENCODED_TO_FULL[stat[0]],
      current: stat[1],
      min: stat[2],
      max: stat[3]
    };
  });
};

def('tbs.data.UnitDataTranslator', {
  serialize: function(units) {
    var output;
    output = [];
    _(units).each(function(u) {
      var stats;
      stats = _(u.stats).map(function(s) {
        return [STAT_NAME_FULL_TO_ENCODED[s.name], s.current, s.min, s.max];
      });
      return output.push([UNIT_NAME_FULL_TO_ENCODED[u.name], u.rank, u.allocated_stat_points, u.max_stat_points, stats]);
    });
    return Base64.encode(JSON.stringify(output));
  },
  deserialize: function(encoded) {
    var models, units;
    units = JSON.parse(Base64.decode(encoded));
    models = [];
    _(units).each(function(unit) {
      if (unit[4] === void 0) {
        return models.push(tbs.core.defaultUnit());
      } else {
        return models.push({
          name: UNIT_NAME_ENCODED_TO_FULL[unit[0]],
          rank: unit[1],
          allocated_stat_points: unit[2],
          max_stat_points: unit[3],
          stats: encodedStatMapper(unit[4])
        });
      }
    });
    return models;
  }
});