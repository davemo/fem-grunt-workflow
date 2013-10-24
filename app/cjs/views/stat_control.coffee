module.exports = class StatControl extends Backbone.Fixins.SuperView

  tagName: "li"

  events:
    "mousedown .icon"   : "increaseOrDecreaseStat"
    "contextmenu .icon" : -> false

  initialize: (options) ->
    @unit = options.unit
    @model.on("change:current", @update)

  attributes: =>
    class: @model.get("stat")

  increaseOrDecreaseStat: (e) =>
    e.preventDefault()
    e.stopPropagation()
    switch e.which
      when 1 then @changeBy(1) #left click
      when 3 then @changeBy(-1) #right click

  changeBy: (amount) =>
    # if the amount does not exceed the units max_stat_points
      # if the amount does not exceed the stats maximum
    if !(@unit.get('allocated_stat_points') + amount > @unit.get('max_stat_points') or @unit.get('allocated_stat_points') + amount < 0)
      if !(@model.get('current') + amount < @model.get('min') or @model.get('current') + amount > @model.get('max'))
        @model.set(current: @model.get("current") + amount)
        @unit.set(allocated_stat_points: @unit.get('allocated_stat_points') + amount)

  update: =>
    @$(".current").text(@model.get("current"))

