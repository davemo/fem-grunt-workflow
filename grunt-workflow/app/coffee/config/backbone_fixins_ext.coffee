Backbone.Fixins.configure
  templateFunction: (name) ->
    JST[name] || throw "Could not find a template in JST[#{name}]"

  defaultTemplateLocator: (view) ->
    "app/templates/#{subPathFor(view)}.hb"

subPathFor = (view) ->
  _(view.namespacePath.split('.')).chain().
    rest(2). #skip "app" and "views"
    map(Backbone.Fixins.helpers.titleToSnakeCase).
    value().join('/')
