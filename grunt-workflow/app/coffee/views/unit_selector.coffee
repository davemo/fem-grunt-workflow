def 'tbs.views.UnitSelector', class UnitSelector extends Backbone.Fixins.SuperView

  tagName: "li"

  attributes: =>
    class: "character #{@model.get('name')}"

  events:
    "click" : "assignUnitToNextAvailableLoadoutSlot"

  assignUnitToNextAvailableLoadoutSlot: =>
    # get the next active loadout slot
    loadout_unit = tbs.BattlePlanner.loadout_units.find (unit) => unit.isEmpty()
    if not loadout_unit then loadout_unit = tbs.BattlePlanner.loadout_units.at(5)
    loadout_unit.clear(silent: true)
    loadout_unit.set(@model.clone().attributes)
