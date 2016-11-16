angular.module('app.routes', [])

.config(function($stateProvider, $urlRouterProvider) {

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
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
    cache:false,
    views: {
      'tab2': {
        templateUrl: 'templates/roster.html',
        controller: 'rosterCtrl'
      }
    }
  })

  .state('tabsController.player', {
    url: '/player/:playerid',
    cache:false,
    views: {
      'tab2': {
        templateUrl: 'templates/player.html',
        controller: 'playerCtrl'
      }
    }
  })

  .state('tabsController.messages', {
    url: '/messages',
    cache:false,
    views: {
      'tab3': {
        templateUrl: 'templates/messages.html',
        controller: 'messagesCtrl'
      }
    }
  })

  .state('tabsController', {
    url: '/:team_id/tab',
    cache:false,
    templateUrl: 'templates/tabsController.html',
    controller: 'tabsCtrl'
});

$urlRouterProvider.otherwise('/1/tab/roster')



});
