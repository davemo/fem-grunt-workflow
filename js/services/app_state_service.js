// services/app_state_service.js
angular.module('tbs.BattlePlannerNG').factory('AppStateService', [
  '$rootScope', function($rootScope) {
    return {
      edit: function(unit) {
        return $rootScope.$broadcast('edit:unit', unit);
      },
      choose: function() {
        return $rootScope.$broadcast('choose:unit');
      }
    };
  }
]);