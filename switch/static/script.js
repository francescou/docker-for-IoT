var app = angular.module("app", ['ngResource']);

app.controller("SwitchController", function($scope, $resource) {
  var Status = $resource('/api/status');w

  function getStatus() {
    Status.get({}, function (data) {
      $scope.status = data.status;
    });
  }

  getStatus();

  $scope.setStatus = function (status) {
    Status.save({status: status}, function () {
      console.log('done');
      getStatus();
    });
  };

});
