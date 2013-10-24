LoadoutSlot  = require("./loadout_slot.coffee")

module.exports = class Loadout extends Backbone.View

  events:
    "click .character" : "editUnit"

  initialize: =>
    Backbone.on("loaded:from:hash", @render)

  editUnit: (e) =>
    unit = @fetchUnitFromCollectionViaSlotDataAttribute(e)
    if unit.isChosen()
      Backbone.trigger("edit:unit", unit)
    else
      Backbone.trigger("choose:unit")

  fetchUnitFromCollectionViaSlotDataAttribute: (element) =>
    @collection.at($(element.currentTarget).data("slot"))

  render: =>
    @$("#selected-characters").empty()
    @collection.each (unit, i) =>
      @$("#selected-characters").append(new LoadoutSlot(
        model: unit
        slot: i
      ).render().el)
    @
