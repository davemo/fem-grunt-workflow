Units                = require("./collections/units.coffee")
Router               = require("./router.coffee")
Editor               = require("./views/stat_editor.coffee")
Loadout              = require("./views/loadout.coffee")
Selector             = require("./views/character_selector.coffee")
Unit                 = require("./models/unit.coffee")
UnitData             = require("./data/unit_data.coffee")
maxStatPointsForRank = require("./config/max_stat_points_for_rank.coffee")

module.exports = class BattlePlanner

  constructor: ->
    @units          = new Units(@defaultUnits())
    @loadout_units  = new Units(@defaultLoadoutUnits())
    @router         = new Router(loadout: @loadout_units)

    # stat editor
    @stat_editor = new Editor(el: "#stat-editor")

    # loadout
    @loadout = new Loadout(
      el: "#loadout"
      collection: @loadout_units
    ).render()

    #character_selector
    @character_selector = new Selector(
      el: "#character-selector"
      collection: @unitTypesWithoutBase()
      loadout_units: @loadout_units
    ).render()

  unitTypesWithoutBase: =>
    _(@units.groupBy("type")).tap (types) -> delete types.base

  defaultLoadoutUnits: =>
    _(_.range(0,6)).map (slot) => new Unit

  defaultUnits: =>
    _(UnitData()).tap (units) =>
      _(units).each (unit) =>
        unit.max_stat_points = maxStatPointsForRank(unit.rank)
        unit.allocated_stat_points = 0

  start: ->
    Backbone.history.start()
