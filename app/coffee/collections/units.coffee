def 'tbs.collections.Units', class Units extends Backbone.Collection
  model: tbs.models.Unit

  UNIT_NAME_FULL_TO_ENCODED:
    'raidmaster'  : 'rm'
    'thrasher'    : 'th'
    'backbiter'   : 'bb'
    'bowmaster'   : 'bm'
    'skystriker'  : 'ss'
    'siegearcher' : 'sg'
    'warmaster'   : 'wm'
    'warhawk'     : 'wh'
    'warleader'   : 'wl'
    'provoker'    : 'pk'
    'strongarm'   : 'sa'
    'shieldmaster': 'sm'

  UNIT_NAME_ENCODED_TO_FULL:
    'rm' :  'raidmaster'
    'th' : 'thrasher'
    'bb' : 'backbiter'
    'bm' : 'bowmaster'
    'ss' : 'skystriker'
    'sg' : 'siegearcher'
    'wm' : 'warmaster'
    'wh' : 'warhawk'
    'wl' : 'warleader'
    'pk' : 'provoker'
    'sa' : 'strongarm'
    'sm' : 'shieldmaster'

  STAT_NAME_FULL_TO_ENCODED:
    'armor'     : 'a'
    'strength'  : 's'
    'willpower' : 'w'
    'exertion'  : 'e'
    'break'     : 'b'

  STAT_NAME_ENCODED_TO_FULL:
    'a' : 'armor'
    's' : 'strength'
    'w' : 'willpower'
    'e' : 'exertion'
    'b' : 'break'

  toJSON: =>
    @map (unit) =>
      converted = unit.toJSON()
      if converted.stats
        converted.stats = _(converted.stats.models).map (stat) =>
          stat.attributes
      converted

  serialize: =>
    output = []
    _(@toJSON()).each (u) =>
      stats = _(u.stats).map (s) => [@STAT_NAME_FULL_TO_ENCODED[s.stat],s.current,s.min,s.max]
      output.push([@UNIT_NAME_FULL_TO_ENCODED[u.name],u.rank,u.allocated_stat_points,u.max_stat_points,stats])
    base64.encode(JSON.stringify(output))

  deserialize: (encoded) =>
    units = JSON.parse(base64.decode(encoded))
    model_data = []
    _(units).each (unit_data) =>
      if unit_data[4].length is 0
        model_data.push(new tbs.models.Unit)
      else
        model_data.push(
          name: @UNIT_NAME_ENCODED_TO_FULL[unit_data[0]]
          rank: unit_data[1]
          allocated_stat_points: unit_data[2]
          max_stat_points: unit_data[3]
          stats: new tbs.collections.UnitStats(
            _(unit_data[4]).map (stat) =>
              stat: @STAT_NAME_ENCODED_TO_FULL[stat[0]]
              current: stat[1]
              min: stat[2]
              max: stat[3]
            )
        )
    model_data



