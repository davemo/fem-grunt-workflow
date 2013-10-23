angular.module('tbs.BattlePlannerNG').controller 'StatChange', ['$scope', ($scope) ->

  $scope.increaseOrDecrease = (unit, stat, e) ->
    e.preventDefault()
    e.stopPropagation()
    switch e.which
      when 1 then changeBy(unit, stat, 1)  #left click
      when 3 then changeBy(unit, stat, -1) #right click

  # private

  changeBy = (unit, stat, amount) ->
    if !(unit.allocated_stat_points + amount > unit.max_stat_points or unit.allocated_stat_points + amount < 0)
      if !(stat.current + amount < stat.min or stat.current + amount > stat.max)
        stat.current += amount
        unit.allocated_stat_points += amount
]

