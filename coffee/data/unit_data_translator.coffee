UNIT_NAME_FULL_TO_ENCODED =
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

UNIT_NAME_ENCODED_TO_FULL =
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

STAT_NAME_FULL_TO_ENCODED =
  'armor'     : 'a'
  'strength'  : 's'
  'willpower' : 'w'
  'exertion'  : 'e'
  'break'     : 'b'

STAT_NAME_ENCODED_TO_FULL =
  'a' : 'armor'
  's' : 'strength'
  'w' : 'willpower'
  'e' : 'exertion'
  'b' : 'break'

encodedStatMapper = (stats) ->
  _(stats).map (stat) =>
    name: STAT_NAME_ENCODED_TO_FULL[stat[0]]
    current: stat[1]
    min: stat[2]
    max: stat[3]

def 'tbs.data.UnitDataTranslator',

  serialize: (units) ->
    output = []
    _(units).each (u) ->
      stats = _(u.stats).map (s) -> [STAT_NAME_FULL_TO_ENCODED[s.name],s.current,s.min,s.max]
      output.push([UNIT_NAME_FULL_TO_ENCODED[u.name],u.rank,u.allocated_stat_points,u.max_stat_points,stats])
    Base64  .encode(JSON.stringify(output))

  deserialize: (encoded) ->
    units = JSON.parse(Base64 .decode(encoded))
    models = []
    _(units).each (unit) ->
      if unit[4] is undefined
        models.push(tbs.core.defaultUnit())
      else
        models.push
          name: UNIT_NAME_ENCODED_TO_FULL[unit[0]]
          rank: unit[1]
          allocated_stat_points: unit[2]
          max_stat_points: unit[3]
          stats: encodedStatMapper(unit[4])
    models


