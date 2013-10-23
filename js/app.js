(function() {

  // app.js
  var __slice = [].slice;

  angular.module('tbs.BattlePlannerNG', []).run([
    '$rootScope', function($rootScope) {
      $rootScope.log = function() {
        var things;
        things = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        return console.log(things);
      };
      return $rootScope.alert = function(something) {
        return alert(something);
      };
    }
  ]);

}());
