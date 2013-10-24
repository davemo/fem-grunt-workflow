require("./config/backbone_fixins_ext.coffee")()

app = require("./app.coffee")

$ ->
  window.app = new app();
  window.app.start()
