teamedup
========

An app that helps build community, connection, and friendship between adults who have the commonality of having kids in sports, by providing a way to exchange information and to message others. 

## Development

### Environment
You must have npm, gulp, bower, sass, ionic, and cordova installed.

```
sudo npm install -g ionic cordova gulp-cli bower
sudo gem install sass
```

For more information on the Ionic Framework, and for help developing your app see [Ionic's Documentation](http://ionicframework.com/docs).

### Database
The database should be a MySQL database. A SQL dump of all dummy data and the table creation scripts is in the project directory as `SQL_BACKUP.sql`.

### Backend
All backend code is in the `/backend` directory of the project root. This includes all PHP scripts as well as images for the dummy data in `/backend/img`.

These scripts will run on any server that can serve PHP scripts. We used a shared [Hostgator](http://hostgator.com) account. [Heroku](http://heroku.com) will work fine as well. Edit the `init.php` file to reflect your MySQL server host, username, and password.

Throughout the frontend of the app, the backend api's url is prefixed by `http://teamedup.nudm.org`. Make sure to change this to the URL of your backend API.

### Packages
We use both npm and bower, you can update packages with:

```
npm install
bower install
```

### Build Javascript and CSS
Gulp is used to build javascript and CSS. `gulp javascript` builds the frontend javascript from the `/javascript` (excluding external libraries) and `gulp sass` builds the scss from the `/scss` directory into css.

When developing, it may be helpful to use `gulp watch` to automatically build javascript and CSS on file changes.


### Developing in the Browser
You can start a development server with the command `ionic serve`. This will let you debug you application in the web browser of your choice. This can "emulate" a mobile devices screen size if you would [like](https://developers.google.com/web/tools/chrome-devtools/device-mode/).

### Push to Ionic View
The first time you push to Ionic View you must create an `ionic.io` project. You may do so with the command:

```
ionic io init
```

You can push the current state of the app to Ionic View for testing with the command 

```
ionic upload
```

### Install on Phone
Depending on the platform, installing on a mobile device may vary. For more information, check out Ionic's [documentation](http://ionicframework.com/docs/v2/cli/run/). 

## Known Bugs and Features Mocked

### Bugs

- If you switch to a team from the default, a back button appears which would let you switch back to the original team. However, because the `team_id` does not change in `$rootScope`, requests are not made properly for the original team.

### Features Mocked
- Because there is no login page, all requests are authenticated as the parent with the id = `1`.
- The default routing of the app is to team_id = `1`. This should be generalized to take the first team that a user is authenticated to which may not always be `1`.

## Features to be Implemented
- Extending beyond the message board functionality to enable direct messaging between users
- Virtual scoreboard that updates the score in real-time for users that are not at the game
- Allow parents to edit their children's profiles (upload photo, add address, etc)
- Update interface to allow for multiple coaches per team
- Enable push notifications for messaging, schedule updates, etc.
- Create an onboarding platform for coaches to create teams, enter roster information, and send out one-time-use invitation links
- Create an onboarding flow for a first-time user where they create their own personal master profile

## Contributors
Sonia Nigam, Daniel Nussbaum, Rudolf Newman
