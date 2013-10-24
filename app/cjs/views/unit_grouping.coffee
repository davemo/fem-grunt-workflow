UnitSelector = require("./unit_selector.coffee")

module.exports = class UnitGrouping extends Backbone.Fixins.SuperView

  attributes:
    class: "unit-type"

  initialize: (options) ->
    @type  = options.type
    @units = options.units
    @loadout_units = options.loadout_units

  renderTitle: =>
    @$(".title").text(@type)

  renderUnits: =>
    _(@units).each (unit) =>
      @$(".classes").append(new UnitSelector(
        model: unit
        loadout_units: @loadout_units
      ).render().el)
