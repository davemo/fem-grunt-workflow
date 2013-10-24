Backbone.Fixins.configure
  templateFunction: (name) ->
    JST[name] || throw "Could not find a template in JST[#{name}]"

  defaultTemplateLocator: (view) ->
    "app/scripts/templates/#{viewPathFor(view)}.hbs"

  viewPathFor = (view) ->
    Backbone.Fixins.helpers.titleToSnakeCase(view.constructor.name.split("View")[0])
