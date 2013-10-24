'use strict';

class yeomanWorkflow.Views.LoadoutSlotView extends Backbone.Fixins.SuperView
  tagName: "li"

  events:
    "mouseover"         : "showOverlay"
    "mouseout"          : "hideOverlay"
    "click .remove"     : "removeFromLoadout"
    "click .move-left"  : "moveLeft"
    "click .move-right" : "moveRight"

  removeFromLoadout: (e) ->
    if confirm("Remove #{@model.get('name')} from slot #{@slot + 1}?")
      @model.clear()
      @model.set(new window.yeomanWorkflow.Models.UnitModel().attributes)
      Backbone.trigger("choose:unit")
    else
      e.preventDefault()
      e.stopPropagation()

  attributes: =>
    "class"     : "character #{@model.get('name')}"
    "data-slot" : @slot

  showOverlay: =>
    if @model.isChosen() then @$(".remove").show()
    if @model.isChosen()
      @$(".move-left, .move-right").show()

      if @position() is 0 then @$(".move-left").hide()
      if @position() is 5 then @$(".move-right").hide()

  moveLeft: (e) =>
    e.stopPropagation()
    @move(@position(-1))

  moveRight: (e) =>
    e.stopPropagation()
    @move(@position(1))

  move: (new_position_index) =>
    original_attrs = _(@model.attributes).clone()
    new_attrs      = _(@model.collection.at(new_position_index).attributes).clone()
    other_model    = @model.collection.at(new_position_index)
    @model.clear()
    @model.set(new_attrs)
    other_model.clear()
    other_model.set(original_attrs)
    Backbone.trigger("loadout:reorganized", other_model)

  position: (offset=0)=>
    @model.collection.indexOf(@model) + offset

  hideOverlay: =>
    @$(".remove, .move-left, .move-right").hide()

  initialize: (options) ->
    @slot = options.slot
    @model.on("change", @render, @)
    @model.on("change:rank", @updateMaxStatPoints)

  renderAttributes: =>
    attrs = @attributes()
    @$el.attr("class",     attrs.class)
    @$el.attr("data-slot", attrs['data-slot'])

  renderStatsOverlay: =>
    if stats = @model.get('stats')
      stats.each (stat) =>
        @$(".stats-overlay .#{stat.get('stat')}").text(stat.get('current'))

  renderAllocatedStatsOverlay: =>
    @$(".allocated-max-stats .allocated").text(@model.get("allocated_stat_points"))
    @$(".allocated-max-stats .max").text(@model.get("max_stat_points"))

  renderHelpText: =>
    if @model.isChosen()
      @$(".help-text").text("")
    else
      @$(".help-text").text("Click a unit below")

  updateMaxStatPoints: (__, new_rank) =>
    @model.set("max_stat_points", BattlePlanner.maxStatPointsForRank(new_rank))




