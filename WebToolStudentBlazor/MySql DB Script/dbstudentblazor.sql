/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.7.28-log : Database - dbstudentblazor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbstudentblazor` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `dbstudentblazor`;

/*Table structure for table `__efmigrationshistory` */

DROP TABLE IF EXISTS `__efmigrationshistory`;

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `__efmigrationshistory` */

insert  into `__efmigrationshistory`(`MigrationId`,`ProductVersion`) values 
('20191228084805_identity','3.1.0');

/*Table structure for table `aspnetroleclaims` */

DROP TABLE IF EXISTS `aspnetroleclaims`;

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4,
  `ClaimValue` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aspnetroleclaims` */

/*Table structure for table `aspnetroles` */

DROP TABLE IF EXISTS `aspnetroles`;

CREATE TABLE `aspnetroles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aspnetroles` */

/*Table structure for table `aspnetuserclaims` */

DROP TABLE IF EXISTS `aspnetuserclaims`;

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4,
  `ClaimValue` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aspnetuserclaims` */

/*Table structure for table `aspnetuserlogins` */

DROP TABLE IF EXISTS `aspnetuserlogins`;

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `ProviderKey` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4,
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aspnetuserlogins` */

/*Table structure for table `aspnetuserroles` */

DROP TABLE IF EXISTS `aspnetuserroles`;

CREATE TABLE `aspnetuserroles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `aspnetroles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aspnetuserroles` */

/*Table structure for table `aspnetusers` */

DROP TABLE IF EXISTS `aspnetusers`;

CREATE TABLE `aspnetusers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `UserName` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Email` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4,
  `SecurityStamp` longtext CHARACTER SET utf8mb4,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4,
  `PhoneNumber` longtext CHARACTER SET utf8mb4,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aspnetusers` */

insert  into `aspnetusers`(`Id`,`UserName`,`NormalizedUserName`,`Email`,`NormalizedEmail`,`EmailConfirmed`,`PasswordHash`,`SecurityStamp`,`ConcurrencyStamp`,`PhoneNumber`,`PhoneNumberConfirmed`,`TwoFactorEnabled`,`LockoutEnd`,`LockoutEnabled`,`AccessFailedCount`) values 
('02fb8ee7-923f-475c-b685-14b5c5dba331','j@yahoo.com','J@YAHOO.COM','j@yahoo.com','J@YAHOO.COM',0,'AQAAAAEAACcQAAAAELqO1cR2cLZp1RyAJg/OJYzt8RebRShTwFBFDYQPng0c0Lg1Yfg9/p2PfIj/CfCSMg==','RGXAHNQIWVNLWCGNYJIDCOPSYBWPPIYG','e8b977bb-a0ef-4400-8889-5204b756e477',NULL,0,0,NULL,1,0),
('bee376ef-6683-4b92-a5d3-ae6a445280b7','jr@yahoo.com','JR@YAHOO.COM','jr@yahoo.com','JR@YAHOO.COM',0,'AQAAAAEAACcQAAAAEMH/DT5Wx+3I8W1mWowY2x7VKxm9SMbbrpwgHQs9+Cj4OPc0nobljOz7w5eS3zD1ew==','T4A7UPYBZWDQAE45SWYWXEH7BQU7RCVX','13218e6e-9d6a-4fc3-9f0c-463dd7d97915',NULL,0,0,NULL,1,0),
('c726f901-533a-49d6-9172-c86253d22745','je@yahoo.com','JE@YAHOO.COM','je@yahoo.com','JE@YAHOO.COM',0,'AQAAAAEAACcQAAAAELe1IpxL7w2zA4FLqN7XanwEtgnJP1iQYf8BU/hh5UqVgTG7uSs9YLa8qJ184XSqqg==','VAWE5I7BRKKVP4FS6LFSVCPX6XQN2NU4','a343e3fc-5301-456a-8cfe-238c49e75ee2',NULL,0,0,NULL,1,0);

/*Table structure for table `aspnetusertokens` */

DROP TABLE IF EXISTS `aspnetusertokens`;

CREATE TABLE `aspnetusertokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `LoginProvider` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `Name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `aspnetusers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aspnetusertokens` */

/*Table structure for table `tblcourse` */

DROP TABLE IF EXISTS `tblcourse`;

CREATE TABLE `tblcourse` (
  `courseid` int(11) NOT NULL,
  `Id` int(11) DEFAULT NULL,
  `CourseCode` varchar(15) DEFAULT NULL,
  `CourseName` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`courseid`),
  KEY `sfkey` (`Id`),
  CONSTRAINT `sfkey` FOREIGN KEY (`Id`) REFERENCES `tblstudinfo` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tblcourse` */

/*Table structure for table `tblstudinfo` */

DROP TABLE IF EXISTS `tblstudinfo`;

CREATE TABLE `tblstudinfo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `MI` varchar(2) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `tblstudinfo` */

insert  into `tblstudinfo`(`Id`,`FirstName`,`MI`,`LastName`,`Birthdate`,`Address`,`Email`) values 
(35,'Jerry','O','Mates','2021-08-05','Jr.','jahblessmates@gmail.com');

/* Procedure structure for procedure `Sproc_Save` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sproc_Save` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`User`@`%` PROCEDURE `Sproc_Save`(
pfname varchar(50),
pmi varchar(2),
plname varchar(50),
pbdate date,
paddress varchar(100),
pemail varchar(50)
)
BEGIN
INSERT INTO `dbstudentblazor`.`tblstudinfo`
(`FirstName`,`MI`,`LastName`,`Birthdate`,`Address`,`Email`)
VALUES
(pfname,pmi,plname,pbdate,paddress,pemail);

END */$$
DELIMITER ;

/* Procedure structure for procedure `Sproc_StudentList` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sproc_StudentList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`User`@`%` PROCEDURE `Sproc_StudentList`()
BEGIN
SELECT * FROM dbstudentblazor.tblstudinfo;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
