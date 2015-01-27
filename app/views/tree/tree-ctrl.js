'use strict';
angular.module('ngScaffoldApp').controller('TreeCtrl', [
  '$scope', '$sce', '$stateParams', 'DataFactory', 'DB', 'FilterFactory', 'UrlFactory', function($scope, $sce, $stateParams, DataFactory, DB, FilterFactory, UrlFactory) {
    var getTree;
    $scope.openfolders = [];
    $scope.$watch('openfolders', function(newValue, oldValue) {
      return console.log('chnaged;');
    });
    getTree = function() {
      return DB.getTree(UrlFactory.decode($stateParams.path)).then(function(tree) {
        return $scope.node = tree;
      });
    };
    $scope.openfile = function() {
      return $scope.htmlurl = $sce.trustAsResourceUrl('http://bisnode.com');
    };
    $scope.closefile = function() {
      return $scope.htmlurl = '';
    };
    $scope.addtotrash = function(path) {
      return DB.trash(UrlFactory.decode(path)).then(function(json) {
        return getTree();
      });
    };
    return getTree();
  }
]);

//# sourceMappingURL=tree-ctrl.js.map
