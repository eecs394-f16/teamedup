angular.module('app.controllers', [])

.controller('tabsCtrl',
['$scope', '$rootScope', '$stateParams', '$state',
function ($scope, $rootScope, $stateParams, $state) {
	$rootScope.team_id = $stateParams.team_id;
	$scope.$on("TeamChange", function(evt,data){
		$rootScope.team_id = data.team_id;
		$scope.team_id = $rootScope.team_id;
	});

	$scope.tabClicked = function($event, the_state, the_team) {
    	//"#/profile/more/"
    	$event.preventDefault();
		$rootScope.team_id = the_team;
    	$state.transitionTo(the_state, {
       		team_id: the_team
    	});
	}
}])

.controller('teamsCtrl',
['$scope', '$state', '$rootScope', '$window', '$http', '$stateParams',
function ($scope, $state, $rootScope, $window, $http, $stateParams) {
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_teams.php',
	}).then(function(response){
		$scope.teams = response.data;
	});

	$scope.changeTeam = function(team_id) {
		$rootScope.team_id = team_id;
		$rootScope.$broadcast("TeamChange",{"team_id": $rootScope.team_id});
		$state.go("tabsController.roster", {"team_id": $rootScope.team_id})
	}
}])

.controller('calendarCtrl',
['$scope', '$rootScope', '$http', '$stateParams',
function ($scope, $rootScope, $http, $stateParams) {
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_schedule.php',
		params: {team_id: $rootScope.team_id}

	}).then(function(response){
		$scope.schedule = response.data;
	});

	$scope.formatDateTime = function(datetime) {
		return moment(datetime).format('MMMM Do, h:mm a');
	}

}])

.controller('eventCtrl',
['$scope', '$rootScope', '$http', '$stateParams',
function ($scope, $rootScope, $http, $stateParams) {
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_event.php',
		params: {team_id: $rootScope.team_id, event_id: $stateParams.eventid}

	}).then(function(response){
		$scope.event = response.data;
	});

	$scope.launchDirections = function(address) {
		console.log(address);
		window.location.href = "maps://maps.apple.com/?daddr=" + address;
	}

	$scope.formatTime = function(datetime) {
		return moment(datetime).format('h:mm a');
	}

	$scope.formatDate = function(datetime) {
		return moment(datetime).format('MMMM Do');
	}

}])

.controller('rosterCtrl',
['$scope', '$rootScope', '$stateParams', '$http',
function($scope, $rootScope, $stateParams, $http) {
	$scope.roster = {};
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_roster.php',
		params: {team_id: $rootScope.team_id}

	}).then(function(response){
		$scope.roster = response.data.roster;
		$scope.team = response.data.team;
	});

}])

.controller('messagesCtrl',
['$scope', '$rootScope','$stateParams','$http',
function($scope, $rootScope, $stateParams, $http) {
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
			method: "GET",
			url: 'http://teamedup.nudm.org/post_message.php',
			params: {message: $scope.inputb.text, team_id: $rootScope.team_id}
		});

		$http({
			method: "GET",
			url: "http://teamedup.nudm.org/get_messages.php?team_id=" + $rootScope.team_id,
		}).then(function(response){
			$scope.messages = response.data;
		});

		$scope.inputb.text="";
	};

	$scope.formatDateTime = function(datetime) {
		return moment(datetime).calendar();
	}

	$scope.toggleComments = function(index) {
		var message = $scope.messages[index];
		message.show_comments = !message.show_comments;
	}

	$scope.newcomment = {};

    $scope.postComment = function(id, index){

    	$http({
			method: "POST",
			url: 'http://teamedup.nudm.org/post_comment.php',
			params: {
				message_id: id,
				comment: $scope.newcomment.comment,
				team_id: $rootScope.team_id
			}
		}).then(function(res) {
			var message = $scope.messages[index];
			message.comments.push(res.data);
		});

		$scope.newcomment = {};
    };

}])

.controller('coachCtrl',
['$scope', '$rootScope', '$stateParams','$http',
function($scope, $rootScope, $stateParams, $http) {
	$scope.coach = {};
	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_coach.php?team_id=' + $rootScope.team_id+"&coach_id="+ $rootScope.team_id,
	}).then(function(response){
		$scope.coach = response.data;
		//console.log($scope.coach);
	});


}])

.controller('playerCtrl',
['$scope', '$rootScope', '$stateParams','$http',
function($scope, $rootScope, $stateParams, $http) {
	$scope.parents = {};
	$scope.playerid = $stateParams.playerid;

	$http({
		method: 'GET',
		url: 'http://teamedup.nudm.org/get_parents.php',
		params: {player_id: $scope.playerid, team_id: $rootScope.team_id}

	}).then(function(response){
		$scope.parents = response.data.parents;
		$scope.player = response.data.player;
	});

}]);
