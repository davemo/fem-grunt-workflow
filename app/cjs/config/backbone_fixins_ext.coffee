module.exports = ->
  Backbone.Fixins.configure
    templateFunction: (name) ->
      JST[name] || throw "Could not find a template in JST[#{name}]"

    defaultTemplateLocator: (view) ->
      "app/templates/#{subPathFor(view)}.hb"

  subPathFor = (view) ->
    Backbone.Fixins.helpers.titleToSnakeCase(view.constructor.name)
