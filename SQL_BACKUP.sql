# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: mysql.nudm.org (MySQL 5.6.25-log)
# Database: teamedup
# Generation Time: 2016-12-04 20:17:09 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table coaches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `coaches`;

CREATE TABLE `coaches` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;

INSERT INTO `coaches` (`id`, `team_id`, `name`, `phone`, `email`, `photo`, `description`)
VALUES
	(1,1,'Jerry Culver','1234568907','fake@email.com','team_1coach.jpg','I\'ve been coaching soccer teams for over 6 years now! I believe in making everyone part of the team and I want everyone to reach to their highest potential! Go team!\n\nParents, feel free to call me if you have any concerns.'),
	(2,2,'Roy Williams','1234567890','fake2@email.com','team_2coach.jpg','I love to have fun and make sure the kids are having fun too!  But I also know how to win!');

/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;

INSERT INTO `comments` (`id`, `message_id`, `parent_id`, `team_id`, `comment`, `created_at`)
VALUES
	(1,1,6,1,'Dave, I can bring one.  It doesn\'t have wheels though.','2016-11-28 07:32:06'),
	(2,1,7,1,'David, I have one on wheels.  I\'ll bring it, too, so you can have options.','2016-11-28 04:42:06'),
	(3,2,3,1,'Excellent! I\'ll have my juicer ready to go!!','2016-11-28 04:32:06'),
	(4,3,2,1,'How could I forget!?  I can\'t wait!','2016-11-23 03:42:06'),
	(5,3,5,1,'I\'ve been looking forward to your party for weeks!  See you soon!','2016-11-23 06:42:06'),
	(6,4,23,2,'Cory, I can bring one.  It\'s a lounger though.','2016-11-23 07:32:06'),
	(7,4,26,2,'Cory, I can bring one!','2016-11-24 09:42:06'),
	(8,5,34,2,'Excellent! I\'ll bring ice cream!','2016-11-30 06:42:06'),
	(9,6,21,2,'How could I forget!?  Go team go!','2016-11-30 09:32:06'),
	(10,6,24,2,'These lil tikes are really kickin\' some butts! Haha!','2016-11-24 07:42:06');

/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;

INSERT INTO `messages` (`id`, `parent_id`, `team_id`, `message`, `created_at`)
VALUES
	(1,2,1,'Can someone bring an extra, large cooler to the game today?  Empty is fine.','2016-11-29 15:32:17'),
	(2,1,1,'I\'ll pick up the oranges for the game this week.','2016-11-20 18:32:17'),
	(3,3,1,'Reminder that our mid-season party is today at my home!','2016-11-23 18:42:17'),
	(4,22,2,'Can someone bring an extra lawn chair to the game today?','2016-11-18 15:34:17'),
	(5,30,2,'I\'ll pick up apple pie for the game this week.','2016-11-15 19:31:15'),
	(6,32,2,'Just a reminder that we are 4 - 0!  Doing so well this season!','2016-11-19 18:32:17'),
	(36,1,1,'Hey guys, is anyone available to carpool to practice today?','2016-11-09 18:32:17'),
	(37,3,1,'Reminder that our mid-season party is today at my home!','2016-11-07 12:43:16'),
	(38,4,1,'Does anyone have an extra Blue jersey? Jessica forgot hers!','2016-11-06 11:45:12'),
	(39,5,1,'I\'m bringing orange slices for half-time today!','2016-11-06 11:30:13'),
	(40,2,1,'Can someone call me- we can\'t find the field for today\'s game.','2016-11-01 10:28:15'),
	(41,3,1,'Daniel has the flu, so he won\'t be at the game tonight.  Wishing the team good luck!','2016-10-31 14:03:17'),
	(42,5,1,'The game is delayed because of rain.  Referees will keep us posted on whether or not we need to reschedule.','2016-10-31 18:03:45'),
	(43,37,2,'Hi guys, could someone bring extra shinguards to practice today?','2016-11-08 19:04:06'),
	(44,34,2,'Let\'s plan an end-of-season party soon!','2016-11-07 08:31:32'),
	(45,1,2,'Who\'s bringing orange slices for halftime today?','2016-11-11 13:01:49'),
	(55,1,1,'Chris Rock just made an awesome save!','2016-12-01 11:46:05'),
	(56,1,2,'I\'ll be 5 minutes late','2016-12-01 13:42:06'),
	(57,1,2,'We\'ll be a little late see you all soon!!','2016-12-01 13:43:23'),
	(58,1,2,'Well be give min late','2016-12-02 10:33:11');

/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table parents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `parents`;

CREATE TABLE `parents` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL DEFAULT '',
  `lname` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `parents` WRITE;
/*!40000 ALTER TABLE `parents` DISABLE KEYS */;

INSERT INTO `parents` (`id`, `fname`, `lname`, `phone`, `email`, `password`)
VALUES
	(1,'Geralyn','Wiechart','2025550126','geralynwiechart@gmail.com',''),
	(2,'David','Wood','2025550198','davidwood@gmail.com',''),
	(3,'Judy','Harbison','2025550116','judyharbison@gmail.com',''),
	(4,'Pete','Harbison','2025550124','peteharbison@gmail.com',''),
	(5,'Barb','Rendleman','2025550164','barbrendleman@gmail.com',''),
	(6,'Drew','Rendleman','2025550157','drewrendleman@gmail.com',''),
	(7,'Julie','Blythe','2025550112','julieblythe@gmail.com',''),
	(8,'Bob','Blythe','2025550189','bobblythe@gmail.com',''),
	(9,'Jan','Nelson','2025550117','jannelson@gmail.com',''),
	(10,'Tim','Yowell','2025550114','timyowell@gmail.com',''),
	(11,'Trevor','Yowell','2025550179','trevoryowell@gmail.com',''),
	(12,'Nancy','Pence','2025550106','nancypence@gmail.com',''),
	(13,'Pan','Gaspard','2025550157','pangaspard@gmail.com',''),
	(14,'Tim','Gaspard','2025550130','timgaspard@gmail.com',''),
	(15,'Andrew','Strow','2025550104','andrewstrow@gmail.com',''),
	(16,'Sue','Wong','2025550108','suewong@gmail.com',''),
	(17,'Kevin','Wong','2025550160','kevinwong@gmail.com',''),
	(18,'Sheila','Reddy','2025550181','sheilareddy@gmail.com',''),
	(19,'Kat','Kripakaran','2025550148','katkripakaran@gmail.com',''),
	(20,'Jan','Nelson','2025550157','jan@gmail.com',''),
	(21,'Mark','Eagleton','2025550112','mark@gmail.com',''),
	(22,'Cory','Treiger','2025550189','cory@gmail.com',''),
	(23,'Stacy','Sutton','2025550117','stacy@gmail.com',''),
	(24,'Douglas II ','Sutton','2025550114','douglas@gmail.com',''),
	(25,'Gary','Mueller','2025550179','gary@gmail.com',''),
	(26,'John','Mckinney','2025550106','john@gmail.com',''),
	(27,'Jan','Mckinney','2025550157','jan@gmail.com',''),
	(28,'Nancy','Houlihan','2025550130','nancy@gmail.com',''),
	(29,'Ralph','Houlihan','2025550104','ralph@gmail.com',''),
	(30,'Katie','Hejmej','2025550108','katie@gmail.com',''),
	(31,'John','Hejmej','2025550160','john@gmail.com',''),
	(32,'Karen','Gerlach','2025550181','karen@gmail.com',''),
	(33,'Susan','Berger','2025550148','susan@gmail.com',''),
	(34,'Anne','Lahaug','2025550157','anne@gmail.com',''),
	(35,'Sarah','Lahaug','2025550112','sarah@gmail.com',''),
	(36,'Ren','Good','2025550189','ren@gmail.com',''),
	(37,'Pat','Good','2025550117','pat@gmail.com','');

/*!40000 ALTER TABLE `parents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table parents_teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `parents_teams`;

CREATE TABLE `parents_teams` (
  `parent_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `parents_teams` WRITE;
/*!40000 ALTER TABLE `parents_teams` DISABLE KEYS */;

INSERT INTO `parents_teams` (`parent_id`, `team_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,2),
	(21,2),
	(22,2),
	(23,2),
	(24,2),
	(25,2),
	(26,2),
	(27,2),
	(28,2),
	(29,2),
	(30,2),
	(31,2),
	(32,2),
	(33,2),
	(34,2),
	(35,2),
	(36,2),
	(37,2),
	(1,2);

/*!40000 ALTER TABLE `parents_teams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table players
# ------------------------------------------------------------

DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL DEFAULT '',
  `lname` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;

INSERT INTO `players` (`id`, `fname`, `lname`, `photo`)
VALUES
	(1,'Sarah','Wood','team_1n.jpg'),
	(2,'Lauren','Harbison','team_1m.jpg'),
	(3,'Chris','Rendleman','team_1k.jpg'),
	(4,'Kate','Rendleman','team_1j.jpg'),
	(5,'Sarah','Blythe','team_1h.jpg'),
	(6,'Kelsey','Nelson','team_1g.jpg'),
	(7,'Rita','Yowell','team_1e.jpg'),
	(8,'Megan','Pence','team_1d.jpg'),
	(9,'Kaylee','Gaspard','team_1m.jpg'),
	(10,'Meredith','Strow','team_1n.jpg'),
	(11,'Ali','Wong','team_1b.jpg'),
	(12,'Shravi','Reddy','team_1a.jpg'),
	(13,'Kranti','Kripakaran','team_1h.jpg'),
	(14,'Connor','Nelson','team_2f.jpg'),
	(15,'Zach','Eagleton','team_2c.jpg'),
	(16,'Trip','Sutton','team_2k.jpg'),
	(17,'Sam','Mueller','team_2j.jpg'),
	(18,'Matt','Mckinney','team_2h.jpg'),
	(19,'Neil','Houlihan','team_2g.jpg'),
	(20,'Connor','Hejmej','team_2e.jpg'),
	(21,'Mike','Gerlach','team_2b.jpg'),
	(22,'Eric','Berger','team_2d.jpg'),
	(23,'Lucas','Lahaug','team_2i.jpg'),
	(24,'Jeremy','Good','team_2a.jpg');

/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table players_parents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `players_parents`;

CREATE TABLE `players_parents` (
  `player_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `players_parents` WRITE;
/*!40000 ALTER TABLE `players_parents` DISABLE KEYS */;

INSERT INTO `players_parents` (`player_id`, `parent_id`)
VALUES
	(1,1),
	(1,2),
	(2,3),
	(2,4),
	(3,5),
	(3,6),
	(4,5),
	(4,6),
	(5,7),
	(5,8),
	(6,9),
	(7,10),
	(7,11),
	(8,12),
	(9,13),
	(9,14),
	(10,15),
	(11,16),
	(11,17),
	(12,18),
	(13,19),
	(14,1),
	(15,21),
	(16,22),
	(17,23),
	(17,24),
	(18,25),
	(19,26),
	(19,27),
	(20,28),
	(20,29),
	(21,30),
	(21,31),
	(22,32),
	(23,33),
	(24,34),
	(24,35),
	(25,36),
	(25,37);

/*!40000 ALTER TABLE `players_parents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `at` datetime DEFAULT NULL,
  `where` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;

INSERT INTO `schedule` (`id`, `team_id`, `name`, `at`, `where`, `address`, `description`)
VALUES
	(1,1,'GAME 1','2016-11-23 12:20:00','Ryan Field','1501 Central St, Evanston, IL 60201','Park in the purple lot for this game! '),
	(2,1,'GAME 2','2016-12-03 01:30:00','Ryan Field','1501 Central St, Evanston, IL 60201','Park in the purple lot for this game!'),
	(3,1,'PRACTICE','2016-11-15 11:31:32','Home','1501 Central St, Evanston, IL 60201','Bring lunch for this practice!! '),
	(4,2,'GAME 1','2016-11-24 01:30:00','Ryan Field','1501 Central St, Evanston, IL 60201','Park in the purple lot for this game! '),
	(5,2,'GAME 2','2016-12-04 01:30:00','Ryan Field','1501 Central St, Evanston, IL 60201','Park in the purple lot for this game!'),
	(6,2,'PRACTICE','2016-11-16 09:00:00','Home','1501 Central St, Evanston, IL 60201','Bring lunch for your kiddos for this practice!!');

/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `coach_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `photo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;

INSERT INTO `teams` (`id`, `coach_id`, `name`, `photo`)
VALUES
	(1,1,'AYSO Soccer','team_1.jpg'),
	(2,2,'Little League Baseball','team_2.jpg');

/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teams_players
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teams_players`;

CREATE TABLE `teams_players` (
  `team_id` int(11) DEFAULT NULL,
  `player_id` int(11) DEFAULT NULL,
  `player_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `teams_players` WRITE;
/*!40000 ALTER TABLE `teams_players` DISABLE KEYS */;

INSERT INTO `teams_players` (`team_id`, `player_id`, `player_number`)
VALUES
	(1,1,16),
	(1,2,17),
	(1,3,18),
	(1,4,19),
	(1,5,20),
	(1,6,21),
	(1,7,22),
	(1,8,9),
	(1,9,10),
	(1,10,11),
	(1,11,13),
	(1,12,14),
	(1,13,15),
	(2,14,15),
	(2,15,16),
	(2,16,17),
	(2,17,18),
	(2,18,19),
	(2,19,20),
	(2,20,21),
	(2,21,22),
	(2,22,23),
	(2,23,24),
	(2,24,25),
	(2,25,26);

/*!40000 ALTER TABLE `teams_players` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
