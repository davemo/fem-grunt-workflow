StatControl = require("./stat_control.coffee")
UnitStats = require("../collections/unit_stats.coffee")

module.exports = class StatEditor extends Backbone.Fixins.SuperView

  events:
    "click .reset"       : "resetToMinimums"
    "click .done"        : -> Backbone.trigger("choose:unit")
    "click .change-rank" : "setRank"

  initialize: =>
    Backbone.on("edit:unit", @show)
    Backbone.on("choose:unit", @hide)
    Backbone.on("loadout:reorganized", @show)

  renderVisible: =>
    if @model.isChosen() then @$el.show() else @$el.hide()

  renderStatControls: =>
    unit_stats = @model.get('stats')
    unit_stats.each (stat, i) =>
      @$(".stats").append(new StatControl(unit: @model, model: stat).render().el)

  resetToMinimums: =>
    @model.set("allocated_stat_points", 0)
    stats = @model.get('stats')
    stats.each (stat) =>
      stat.set('current', stat.get('min'))
    @model.trigger('change')

  renderTotals: =>
    @$(".total .allocated").text(@model.get("allocated_stat_points"))
    @$(".total .max").text(@model.get("max_stat_points"))

  renderRankChanger: =>
    @$("#rank-changer").prop("class", "rank#{@model.get("rank")}")

  renderRankInEditorTitle: =>
    @$(".title .rank").text(@model.get("rank"))

  setRank: (e) =>
    rank = parseInt($(e.currentTarget).text(), 10)
    oldrank = @model.get("rank")
    @model.set({rank})
    if rank < oldrank
      @resetToMinimums()

  hide: =>
    @$el.hide()

  show: (unit) =>
    @model = unit
    # had to clone stats here, as editing the same class was buggy
    @model.set("stats", new UnitStats(@model.get('stats').toJSON()))
    @model.on("change:allocated_stat_points", @renderTotals)
    @model.on("change:rank", @renderRankChanger)
    @model.on("change:rank", @renderRankInEditorTitle)
    @model.on("change:rank", @renderTotals)
    @render()
    @$el.show()
