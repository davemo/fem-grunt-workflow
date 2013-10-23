def 'tbs.views.CharacterSelector', class CharacterSelector extends Backbone.View

  initialize: =>
    Backbone.on("edit:unit", @hide)
    Backbone.on("choose:unit", @show)

  render: =>
    _(@collection).each (units, type) =>
      @$("#unit-groupings").append(new tbs.views.UnitGrouping(
        units: units
        type: type
      ).render().el)

  hide: =>
    @$el.hide()

  show: =>
    @$el.show()

