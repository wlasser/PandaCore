/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` longtext,
  `v` longtext,
  `s` longtext,
  `email` text,
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(30) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(11) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(4) NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `mutetime` bigint(40) NOT NULL DEFAULT '0',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(4) NOT NULL DEFAULT '',
  `recruiter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account System';

/*Data for the table `account` */

insert  into `account`(`id`,`username`,`sha_pass_hash`,`sessionkey`,`v`,`s`,`email`,`joindate`,`last_ip`,`failed_logins`,`locked`,`last_login`,`online`,`expansion`,`mutetime`,`locale`,`os`,`recruiter`) values (6,'BRECKY','7DC612B751ADD0B0455FACFB2965745C94DC4446','D9B36D341B6916109D5CBF98DCDFFBFAE3AF73669372CC55136410C919ED6DEE0C934494796181C9','56F162DA7B50227492A94E5CEC79528866590C1343C15B5BA5D843A38E1F1041','FDA7CE79364283D9F8D4043ED24F88429111B45B9CCCD09724D254FA4FC23137',NULL,'2012-05-24 15:32:00','127.0.0.1',0,0,'2012-05-26 01:25:41',0,3,0,0,'Win',0);

/*Table structure for table `account_access` */

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int(11) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `account_access` */

insert  into `account_access`(`id`,`gmlevel`,`RealmID`) values (5,4,-1);

/*Table structure for table `account_banned` */

DROP TABLE IF EXISTS `account_banned`;

CREATE TABLE `account_banned` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` bigint(40) NOT NULL DEFAULT '0',
  `unbandate` bigint(40) NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Ban List';

/*Data for the table `account_banned` */

/*Table structure for table `ip_banned` */

DROP TABLE IF EXISTS `ip_banned`;

CREATE TABLE `ip_banned` (
  `ip` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `bandate` bigint(40) NOT NULL,
  `unbandate` bigint(40) NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Banned IPs';

/*Data for the table `ip_banned` */

/*Table structure for table `logs` */

DROP TABLE IF EXISTS `logs`;

CREATE TABLE `logs` (
  `time` int(14) NOT NULL,
  `realm` int(4) NOT NULL,
  `type` int(4) NOT NULL,
  `string` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `logs` */

/*Table structure for table `realmcharacters` */

DROP TABLE IF EXISTS `realmcharacters`;

CREATE TABLE `realmcharacters` (
  `realmid` int(11) unsigned NOT NULL DEFAULT '0',
  `acctid` bigint(20) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm Character Tracker';

/*Data for the table `realmcharacters` */

insert  into `realmcharacters`(`realmid`,`acctid`,`numchars`) values (1,5,4),(1,6,3);

/*Table structure for table `realmlist` */

DROP TABLE IF EXISTS `realmlist`;

CREATE TABLE `realmlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(32) NOT NULL DEFAULT '127.0.0.1',
  `port` int(11) NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `color` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(11) unsigned NOT NULL DEFAULT '14545',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Realm System';

/*Data for the table `realmlist` */

insert  into `realmlist`(`id`,`name`,`address`,`port`,`icon`,`color`,`timezone`,`allowedSecurityLevel`,`population`,`gamebuild`) values (1,'Brecky','127.0.0.1',8085,0,0,1,0,0,15595);

/*Table structure for table `uptime` */

DROP TABLE IF EXISTS `uptime`;

CREATE TABLE `uptime` (
  `realmid` int(11) unsigned NOT NULL,
  `starttime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(64) NOT NULL DEFAULT '',
  `uptime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Uptime system';

/*Data for the table `uptime` */

insert  into `uptime`(`realmid`,`starttime`,`startstring`,`uptime`,`maxplayers`,`revision`) values (1,1335553260,'2012-04-27 21:01:00',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335553631,'2012-04-27 21:07:11',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335554269,'2012-04-27 21:17:49',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335554517,'2012-04-27 21:21:57',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335554767,'2012-04-27 21:26:07',4800,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335603553,'2012-04-28 10:59:13',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335603665,'2012-04-28 11:01:05',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335603964,'2012-04-28 11:06:04',6600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335611067,'2012-04-28 13:04:27',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335613931,'2012-04-28 13:52:11',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335614848,'2012-04-28 14:07:28',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335847069,'2012-05-01 06:37:49',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335847712,'2012-05-01 06:48:32',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335847924,'2012-05-01 06:52:04',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335849170,'2012-05-01 07:12:50',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335849612,'2012-05-01 07:20:12',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335851138,'2012-05-01 07:45:38',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335851460,'2012-05-01 07:51:00',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335852397,'2012-05-01 08:06:37',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335852855,'2012-05-01 08:14:15',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335853290,'2012-05-01 08:21:30',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335853803,'2012-05-01 08:30:03',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335854229,'2012-05-01 08:37:09',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335854747,'2012-05-01 08:45:47',672,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335855675,'2012-05-01 09:01:15',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335855900,'2012-05-01 09:05:00',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335856048,'2012-05-01 09:07:28',600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335857121,'2012-05-01 09:25:21',600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335858641,'2012-05-01 09:50:41',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335868588,'2012-05-01 12:36:28',600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335908440,'2012-05-01 23:40:40',3000,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335912043,'2012-05-02 00:40:43',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335912750,'2012-05-02 00:52:30',600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335914544,'2012-05-02 01:22:24',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335915114,'2012-05-02 01:31:54',1200,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335916883,'2012-05-02 02:01:23',600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335918050,'2012-05-02 02:20:50',600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335918960,'2012-05-02 02:36:00',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335936796,'2012-05-02 07:33:16',600,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335937623,'2012-05-02 07:47:03',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335937866,'2012-05-02 07:51:06',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335939097,'2012-05-02 08:11:37',1800,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335945940,'2012-05-02 10:05:40',1200,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335947615,'2012-05-02 10:33:35',600,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335948898,'2012-05-02 10:54:58',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335951397,'2012-05-02 11:36:37',4200,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335956319,'2012-05-02 12:58:39',640,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335957558,'2012-05-02 13:19:18',600,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335958289,'2012-05-02 13:31:29',675,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335959847,'2012-05-02 13:57:27',600,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1335961201,'2012-05-02 14:20:01',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336056812,'2012-05-03 16:53:32',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336060705,'2012-05-03 17:58:25',2400,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336064666,'2012-05-03 19:04:26',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336064884,'2012-05-03 19:08:04',603,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336066939,'2012-05-03 19:42:19',601,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336146677,'2012-05-04 17:51:17',601,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336148908,'2012-05-04 18:28:28',1201,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336151870,'2012-05-04 19:17:50',601,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336155511,'2012-05-04 20:18:31',1201,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336156915,'2012-05-04 20:41:55',2403,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336159619,'2012-05-04 21:26:59',2401,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336164782,'2012-05-04 22:53:02',601,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336167734,'2012-05-04 23:42:14',604,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336169949,'2012-05-05 00:19:09',601,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336171678,'2012-05-05 00:47:58',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336172594,'2012-05-05 01:03:14',601,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336291942,'2012-05-06 10:12:22',1801,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336341566,'2012-05-06 23:59:26',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336341862,'2012-05-07 00:04:22',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336343312,'2012-05-07 00:28:32',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336343798,'2012-05-07 00:36:38',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336345579,'2012-05-07 01:06:19',2426,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336379459,'2012-05-07 10:30:59',1332,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336387818,'2012-05-07 12:50:18',1832,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336393670,'2012-05-07 14:27:50',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336394966,'2012-05-07 14:49:26',3629,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336400082,'2012-05-07 16:14:42',630,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336412516,'2012-05-07 19:41:56',1275,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336416114,'2012-05-07 20:41:54',1916,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336419461,'2012-05-07 21:37:41',1238,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336421705,'2012-05-07 22:15:05',3100,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336460804,'2012-05-08 09:06:44',9025,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336478710,'2012-05-08 14:05:10',1069,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336480481,'2012-05-08 14:34:41',624,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336481711,'2012-05-08 14:55:11',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336482361,'2012-05-08 15:06:01',1224,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336503055,'2012-05-08 20:50:55',644,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336504287,'2012-05-08 21:11:27',4224,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336510621,'2012-05-08 22:57:01',1227,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336513138,'2012-05-08 23:38:58',1313,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336520560,'2012-05-09 01:42:40',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336544461,'2012-05-09 08:21:01',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336546951,'2012-05-09 09:02:31',1224,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336549159,'2012-05-09 09:39:19',632,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336550862,'2012-05-09 10:07:42',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336551806,'2012-05-09 10:23:26',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336552494,'2012-05-09 10:34:54',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336553027,'2012-05-09 10:43:47',830,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336555620,'2012-05-09 11:27:00',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336556449,'2012-05-09 11:40:49',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336557133,'2012-05-09 11:52:13',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336640062,'2012-05-10 10:54:22',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336641315,'2012-05-10 11:15:15',632,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336654410,'2012-05-10 14:53:30',28826,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336755220,'2012-05-11 18:53:40',1826,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336801430,'2012-05-12 07:43:50',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336804024,'2012-05-12 08:27:04',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336804853,'2012-05-12 08:40:53',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336806043,'2012-05-12 09:00:43',3635,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336851208,'2012-05-12 21:33:28',625,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336852206,'2012-05-12 21:50:06',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336853323,'2012-05-12 22:08:43',5433,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1336859090,'2012-05-12 23:44:50',625,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337011364,'2012-05-14 18:02:44',635,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337012494,'2012-05-14 18:21:34',802,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337013995,'2012-05-14 18:46:35',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337014696,'2012-05-14 18:58:16',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337015483,'2012-05-14 19:11:23',1249,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337032420,'2012-05-14 23:53:40',626,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337034883,'2012-05-15 00:34:43',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337068181,'2012-05-15 09:49:41',1825,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337243256,'2012-05-17 10:27:36',746,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337249145,'2012-05-17 12:05:45',1836,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337261815,'2012-05-17 15:36:55',6628,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337272570,'2012-05-17 18:36:10',11401,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337287589,'2012-05-17 22:46:29',12000,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337460750,'2012-05-19 22:52:30',4201,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337469514,'2012-05-20 01:18:34',1828,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337532794,'2012-05-20 18:53:14',2401,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337597538,'2012-05-21 12:52:18',1831,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337601755,'2012-05-21 14:02:35',43834,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337863919,'2012-05-24 14:51:59',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337865399,'2012-05-24 15:16:39',1800,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337885914,'2012-05-24 20:58:34',602,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337958714,'2012-05-25 17:11:54',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337964440,'2012-05-25 18:47:20',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337985201,'2012-05-26 00:33:21',0,0,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)'),(1,1337985598,'2012-05-26 00:39:58',2402,1,'TrinityCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win64, Debug)');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
