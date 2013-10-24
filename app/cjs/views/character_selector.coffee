UnitGrouping = require("./unit_grouping.coffee")

module.exports = class CharacterSelector extends Backbone.View

  initialize: (options) =>
    Backbone.on("edit:unit", @hide)
    Backbone.on("choose:unit", @show)
    @loadout_units = options.loadout_units

  render: =>
    _(@collection).each (units, type) =>
      @$("#unit-groupings").append(new UnitGrouping(
        units: units
        type: type
        loadout_units: @loadout_units
      ).render().el)

  hide: =>
    @$el.hide()

  show: =>
    @$el.show()

