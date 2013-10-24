'use strict';

class yeomanWorkflow.Models.UnitModel extends Backbone.Model

  defaults:
    name: ""
    type: ""
    stats: undefined
    allocated_stat_points: 0
    max_stat_points: 0

  isChosen: =>
    @has("stats")

  isEmpty: =>
    not @has("stats")

  validate: (attrs) =>
    if attrs.allocated_stat_points < 0 or attrs.allocated_stat_points > attrs.max_stat_points
      "would go over"
