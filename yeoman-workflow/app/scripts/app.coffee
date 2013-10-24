class window.yeomanWorkflow.BattlePlanner

  constructor: ->
    @units          = new window.yeomanWorkflow.Collections.UnitCollection(@defaultUnits())
    @loadout_units  = new window.yeomanWorkflow.Collections.UnitCollection(@defaultLoadoutUnits())
    @router         = new window.yeomanWorkflow.Routers.Router(loadout: @loadout_units)

    # stat editor
    @stat_editor = new window.yeomanWorkflow.Views.StatEditorView(el: "#stat-editor")

    # loadout
    @loadout = new window.yeomanWorkflow.Views.LoadoutView(
      el: "#loadout"
      collection: @loadout_units
    ).render()

    #character_selector
    @character_selector = new window.yeomanWorkflow.Views.CharacterSelectorView(
      el: "#character-selector"
      collection: @unitTypesWithoutBase()
    ).render()

  unitTypesWithoutBase: =>
    _(@units.groupBy("type")).tap (types) -> delete types.base

  defaultLoadoutUnits: =>
    _(_.range(0,6)).map (slot) =>
      new window.yeomanWorkflow.Models.UnitModel

  defaultUnits: =>
    _(window.yeomanWorkflow.Data.Units()).tap (units) =>
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

$ ->
  window.BattlePlanner = new window.yeomanWorkflow.BattlePlanner()
  window.BattlePlanner.start()
