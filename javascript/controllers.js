angular.module('app.controllers', [])

.controller('calendarCtrl', ['$scope', '$stateParams', // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
function ($scope, $stateParams) {


}])

.controller('rosterCtrl', ['$scope','$stateParams', '$http', function($scope, $stateParams, $http) { // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
$scope.roster = {};
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_roster.php',
		params: {team_id: 1}

	}).then(function(response){
		$scope.roster = response.data;
	});

}])

.controller('messagesCtrl', ['$scope', '$stateParams', // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
function ($scope, $stateParams) {


}])

.controller('teamsCtrl', ['$scope', '$stateParams', // The following is the constructor function for this page's controller. See https://docs.angularjs.org/guide/controller
// You can include any angular dependencies as parameters for this function
// TIP: Access Route Parameters for your page via $stateParams.parameterName
function ($scope, $stateParams) {


}])

.controller('playerCtrl', ['$scope', '$stateParams','$http', function($scope, $stateParams, $http) {
$scope.players = {};
$scope.playerid = $stateParams.playerid

	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_parents.php',
		params: {player_id: $scope.playerid}

	}).then(function(response){
		$scope.players = response.data;
	});

}]);
