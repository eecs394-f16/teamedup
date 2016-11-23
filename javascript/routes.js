angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  $stateProvider

  .state('tabsController.calendar', {
    url: '/cal',
    views: {
      'tab1': {
        templateUrl: 'templates/calendar.html',
        controller: 'calendarCtrl'
      }
    }
  })

  .state('tabsController.event', {
    url: '/event/:eventid',
    views: {
      'tab1': {
        templateUrl: 'templates/event.html',
        controller: 'eventCtrl'
      }
    }
  })

  .state('tabsController.roster', {
    url: '/roster',
    views: {
      'tab2': {
        templateUrl: 'templates/roster.html',
        controller: 'rosterCtrl'
      }
    }
  })

  .state('tabsController.player', {
    url: '/player/:playerid',
    views: {
      'tab2': {
        templateUrl: 'templates/player.html',
        controller: 'playerCtrl'
      }
    }
  })

  .state('tabsController.messages', {
    url: '/messages',
    views: {
      'tab3': {
        templateUrl: 'templates/messages.html',
        controller: 'messagesCtrl'
      }
    }
  })

  .state('tabsController', {
    url: '/:team_id/tab',
    templateUrl: 'templates/tabsController.html',
    controller: 'tabsCtrl'
});

$urlRouterProvider.otherwise('/1/tab/roster')



});
