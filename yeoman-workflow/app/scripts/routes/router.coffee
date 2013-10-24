'use strict';

class yeomanWorkflow.Routers.Router extends Backbone.Router
  initialize: (options) =>
    @loadout = options.loadout
    @loadout.on("change", @storeHash)

  routes:
    ":encoded" : "loadLoadout"

  loadLoadout: (encoded) ->
    @loadout.reset(@loadout.deserialize(encoded))
    Backbone.trigger("loaded:from:hash")

  storeHash: =>
    @navigate(@loadout.serialize(), {replace: true})
