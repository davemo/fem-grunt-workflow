'use strict';

class yeomanWorkflow.Views.UnitGroupingView extends Backbone.Fixins.SuperView
  attributes:
    class: "unit-type"

  initialize: (options) ->
    @type  = options.type
    @units = options.units

  renderTitle: =>
    @$(".title").text(@type)

  renderUnits: =>
    _(@units).each (unit) =>
      @$(".classes").append(new window.yeomanWorkflow.Views.UnitSelectorView(
        model: unit
      ).render().el)
