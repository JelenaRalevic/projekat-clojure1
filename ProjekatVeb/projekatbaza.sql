/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 10.1.25-MariaDB : Database - projekatbaza
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`projekatbaza` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `projekatbaza`;

/*Table structure for table `izlozba` */

DROP TABLE IF EXISTS `izlozba`;

CREATE TABLE `izlozba` (
  `izlozbaID` int(11) NOT NULL,
  `tip` varchar(255) DEFAULT NULL,
  `naziv` varchar(255) DEFAULT NULL,
  `grad` varchar(255) DEFAULT NULL,
  `pasID` int(11) DEFAULT NULL,
  PRIMARY KEY (`izlozbaID`),
  KEY `pasID` (`pasID`),
  CONSTRAINT `izlozba_ibfk_1` FOREIGN KEY (`pasID`) REFERENCES `pas` (`pasID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `izlozba` */

/*Table structure for table `pas` */

DROP TABLE IF EXISTS `pas`;

CREATE TABLE `pas` (
  `pasID` int(11) NOT NULL,
  `ime` varchar(255) DEFAULT NULL,
  `starost` int(11) DEFAULT NULL,
  `boja` varchar(255) DEFAULT NULL,
  `rasa` varchar(255) DEFAULT NULL,
  `sampion` varchar(255) DEFAULT NULL,
  `grad` varchar(255) DEFAULT NULL,
  `link` varchar(255) NOT NULL,
  `sajt` varchar(255) DEFAULT NULL,
  `slika` varchar(255) DEFAULT NULL,
  `opisPsa` varchar(255) DEFAULT NULL,
  `vlasnikID` int(11) NOT NULL,
  PRIMARY KEY (`pasID`),
  KEY `vlasnikID` (`link`),
  KEY `vlasnikID_2` (`vlasnikID`),
  CONSTRAINT `pas_ibfk_2` FOREIGN KEY (`vlasnikID`) REFERENCES `vlasnik` (`vlasnikID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pas` */

/*Table structure for table `podednik` */

DROP TABLE IF EXISTS `podednik`;

CREATE TABLE `podednik` (
  `pobednikID` int(11) NOT NULL,
  `pasID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  PRIMARY KEY (`pobednikID`),
  KEY `pasID` (`pasID`),
  KEY `userID` (`userID`),
  CONSTRAINT `podednik_ibfk_1` FOREIGN KEY (`pasID`) REFERENCES `pas` (`pasID`),
  CONSTRAINT `podednik_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `podednik` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `imePrezime` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`userID`,`imePrezime`,`email`,`username`,`password`,`role`) values 
(0,'Jelena Ralevic',NULL,NULL,NULL,NULL);

/*Table structure for table `vlasnik` */

DROP TABLE IF EXISTS `vlasnik`;

CREATE TABLE `vlasnik` (
  `vlasnikID` int(11) NOT NULL AUTO_INCREMENT,
  `imePrezime` varchar(255) DEFAULT NULL,
  `grad` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`vlasnikID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vlasnik` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
