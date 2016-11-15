angular.module('app.controllers', [])

.controller('tabsCtrl', ['$scope', '$rootScope', '$stateParams', function ($scope, $rootScope, $stateParams) {
	$rootScope.team_id = $stateParams.team_id;
	$scope.team_id = $stateParams.team_id;
}])

.controller('calendarCtrl', ['$scope', '$rootScope', '$http', '$stateParams', function ($scope, $rootScope, $http, $stateParams) {
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_schedule.php',
		params: {team_id: $rootScope.team_id}

	}).then(function(response){
		$scope.schedule = response.data;
	});

}])

.controller('eventCtrl', ['$scope', '$rootScope', '$http', '$stateParams', function ($scope, $rootScope, $http, $stateParams) {
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_event.php',
		params: {team_id: $rootScope.team_id, event_id: $stateParams.eventid}

	}).then(function(response){
		$scope.event = response.data;
	});

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

.controller('messagesCtrl', ['$scope', '$rootScope','$stateParams','$http', function($scope, $rootScope, $stateParams, $http) {
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
			params: {message: $scope.inputb.text, team_id: $rootScope.team_id}
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

.controller('teamsCtrl', ['$scope', '$rootScope', '$window', '$http', '$stateParams', function ($scope, $rootScope, $window, $http, $stateParams) {
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_teams.php',
	}).then(function(response){
		$scope.teams = response.data;
	});

	$scope.changeTeam = function(team_id) {
		$rootScope.team_id = team_id;
		window.location = "/#/" + team_id + "/tab";
		$window.location.reload(true);
	}
}])

.controller('playerCtrl', ['$scope', '$rootScope', '$stateParams','$http', function($scope, $rootScope, $stateParams, $http) {
$scope.parents = {};
$scope.playerid = $stateParams.playerid

	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_parents.php',
		params: {player_id: $scope.playerid, team_id: $rootScope.team_id}

	}).then(function(response){
		$scope.parents = response.data.parents;
		$scope.player = response.data.player;
	});

}]);
