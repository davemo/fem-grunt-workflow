def 'tbs.converters.buildStatsCollection', (raw_stats_array, rank) ->

  STATS = ["armor", "strength", "willpower", "exertion", "break"]

  # stats come in from unit_data.coffee
  #  arm     str    wil     exr   brk (min,max)
  # [[6,9], [6,9], [4,6,] [1,2,] [1,2]]

  model_values = _(raw_stats_array).map (min_max, i) ->
    min: min_max[0]
    max: min_max[1]
    current: min_max[0]
    stat: STATS[i]

  new tbs.collections.UnitStats(model_values)


