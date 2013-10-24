'use strict';

class yeomanWorkflow.Views.UnitSelectorView extends Backbone.Fixins.SuperView
  tagName: "li"

  attributes: =>
    class: "character #{@model.get('name')}"

  events:
    "click" : "assignUnitToNextAvailableLoadoutSlot"

  assignUnitToNextAvailableLoadoutSlot: =>
    # get the next active loadout slot
    loadout_unit = BattlePlanner.loadout_units.find (unit) => unit.isEmpty()
    if not loadout_unit then loadout_unit = BattlePlanner.loadout_units.at(5)
    loadout_unit.clear()
    loadout_unit.set(@model.clone().attributes)
