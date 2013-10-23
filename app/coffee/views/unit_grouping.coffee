def 'tbs.views.UnitGrouping', class UnitGrouping extends Backbone.Fixins.SuperView

  attributes:
    class: "unit-type"

  initialize: (options) ->
    @type  = options.type
    @units = options.units

  renderTitle: =>
    @$(".title").text(@type)

  renderUnits: =>
    _(@units).each (unit) =>
      @$(".classes").append(new tbs.views.UnitSelector(
        model: unit
      ).render().el)
