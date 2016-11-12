angular.module('app.controllers', [])

.controller('tabsCtrl', ['$scope', '$rootScope', '$stateParams', function ($scope, $rootScope, $stateParams) {
	$rootScope.team_id = $stateParams.team_id;
}])

.controller('calendarCtrl', ['$scope', '$stateParams', function ($scope, $stateParams) {


}])

.controller('rosterCtrl', ['$scope', '$rootScope', '$stateParams', '$http', function($scope, $rootScope, $stateParams, $http) {
	$scope.roster = {};
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_roster.php',
		params: {team_id: $rootScope.team_id}

	}).then(function(response){
		$scope.roster = response.data;
	});

}])

.controller('messagesCtrl', ['$scope', '$stateParams','$http', function($scope, $stateParams, $http) {
	$scope.messages = [];
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_messages.php?team_id=' + $rootScope.team_id,
	}).then(function(response){
		$scope.messages = response.data;
	});

	$scope.inputb={};
	$scope.postM = function(){

			$http({
			method: 'GET',
			url: 'http://teamedup.nudm.org/post_message.php',
			params: {message: $scope.inputb.text, team_id:1}
		});

		$http({
			method: 'GET',
			url: 'http://teamedup.nudm.org/get_messages.php?team_id=' + $rootScope.team_id,
		}).then(function(response){
			$scope.messages = response.data;
		});

		$scope.inputb.text='';
	};


}])

.controller('teamsCtrl', ['$scope', '$stateParams', function ($scope, $stateParams) {


}])

.controller('playerCtrl', ['$scope', '$stateParams','$http', function($scope, $stateParams, $http) {
$scope.parents = {};
$scope.playerid = $stateParams.playerid

	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_parents.php',
		params: {player_id: $scope.playerid}

	}).then(function(response){
		$scope.parents = response.data.parents;
		$scope.player = response.data.player;
	});

}]);
