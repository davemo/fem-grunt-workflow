module.exports = class UnitSelector extends Backbone.Fixins.SuperView

  tagName: "li"

  initialize: (options) ->
    @loadout_units = options.loadout_units

  attributes: =>
    class: "character #{@model.get('name')}"

  events:
    "click" : "assignUnitToNextAvailableLoadoutSlot"

  assignUnitToNextAvailableLoadoutSlot: =>
    # get the next active loadout slot
    loadout_unit = @loadout_units.find (unit) => unit.isEmpty()
    if not loadout_unit then loadout_unit = @loadout_units.at(5)
    loadout_unit.clear(silent: true)
    loadout_unit.set(@model.clone().attributes)
