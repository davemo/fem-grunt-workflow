def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units          = new tbs.collections.Units(@defaultUnits())
    @loadout_units  = new tbs.collections.Units(@defaultLoadoutUnits())
    @router         = new tbs.Router(loadout: @loadout_units)

    # stat editor
    @stat_editor = new tbs.views.StatEditor(el: "#stat-editor")

    # loadout
    @loadout = new tbs.views.Loadout(
      el: "#loadout"
      collection: @loadout_units
    ).render()

    #character_selector
    @character_selector = new tbs.views.CharacterSelector(
      el: "#character-selector"
      collection: @unitTypesWithoutBase()
    ).render()

  unitTypesWithoutBase: =>
    _(@units.groupBy("type")).tap (types) -> delete types.base

  defaultLoadoutUnits: =>
    _(_.range(0,6)).map (slot) =>
      new tbs.models.Unit

  defaultUnits: =>
    _(tbs.data.Units()).tap (units) =>
      _(units).each (unit) =>
        unit.max_stat_points = @maxStatPointsForRank(unit.rank)
        unit.allocated_stat_points = 0

  maxStatPointsForRank: (rank) =>
    switch rank
      when 0 then 10
      when 1 then 11
      when 2 then 12
      when 3 then 13

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()

