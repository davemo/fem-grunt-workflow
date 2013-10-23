// controllers/stat_editor_controller.js
angular.module('tbs.BattlePlannerNG').controller('StatEditor', [
  '$scope', 'AppStateService', function($scope, AppStateService) {
    $scope.doneEditing = function() {
      return AppStateService.choose();
    };
    $scope.$on('edit:unit', function(event, unit) {
      $scope.unit = unit;
      return $scope.editing = true;
    });
    return $scope.$on('choose:unit', function() {
      return $scope.editing = false;
    });
  }
]);