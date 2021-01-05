/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - petstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`petstore` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `petstore`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `userid` varchar(80) NOT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `firstname` varchar(80) DEFAULT NULL,
  `lastname` varchar(80) DEFAULT NULL,
  `email` varchar(80) NOT NULL,
  `is_admin` int(1) DEFAULT NULL,
  `status` varchar(2) DEFAULT NULL,
  `addr1` varchar(80) DEFAULT NULL,
  `addr2` varchar(40) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `state` varchar(80) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `account` */

insert  into `account`(`userid`,`username`,`password`,`firstname`,`lastname`,`email`,`is_admin`,`status`,`addr1`,`addr2`,`city`,`state`,`zip`,`country`,`phone`) values ('1','admin','123456','Francis','Dennis','admin@qq.com',0,'P','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','	94303','	USA','888888'),('2','guest','888888','Tom','Rings','admin@qq.com',1,'P','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','	000000','	USA','666666'),('3','Jane','123456','Trump','Mike','admin@qq.com',1,'P','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','987654','	USA','999999');

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `userId` varchar(120) NOT NULL,
  `itemId` varchar(120) NOT NULL,
  `quantity` int(11) NOT NULL,
  `instock` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `cart` */

/*Table structure for table `cartrecord` */

DROP TABLE IF EXISTS `cartrecord`;

CREATE TABLE `cartrecord` (
  `userId` varchar(120) NOT NULL,
  `itemId` varchar(120) NOT NULL,
  `quantity` int(11) NOT NULL,
  `instock` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `cartrecord` */

insert  into `cartrecord`(`userId`,`itemId`,`quantity`,`instock`,`total`) values ('1','EST-4',1,1,'19.00'),('1','EST-4',1,1,'19.00'),('1','EST-16',3,1,'282.00'),('1','EST-6',1,1,'19.00');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `catid` varchar(120) NOT NULL,
  `name` varchar(120) NOT NULL,
  `descn` varchar(120) NOT NULL,
  PRIMARY KEY (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `category` */

insert  into `category`(`catid`,`name`,`descn`) values ('BIRDS','Birds','<image src=\"images/birds_icon.gif\"><font size=\"5\" color=\"blue\">Birds</font>'),('CATS','Cats','<image src=\"images/cats_icon.gif\"><font size=\"5\" color=\"blue\">Cats</font>'),('DOGS','Dogs','<image src=\"images/dogs_icon.gif\"><font size=\"5\" color=\"blue\">Dogs</font>'),('FISH','Fish','<image src=\"images/fish_icon.gif\"><font size=\"5\" color=\"blue\">Fish</font>'),('REPTILES','Reptiles','<image src=\"images/reptiles_icon.gif\"><font size=\"5\" color=\"blue\">Reptiles</font>');

/*Table structure for table `customrecord` */

DROP TABLE IF EXISTS `customrecord`;

CREATE TABLE `customrecord` (
  `userId` varchar(80) NOT NULL,
  `orderId` int(11) NOT NULL,
  `itemId` varchar(80) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `customrecord` */

insert  into `customrecord`(`userId`,`orderId`,`itemId`,`quantity`,`total`) values ('1',1,'EST-4',1,'19.00'),('1',2,'EST-4',1,'19.00'),('1',2,'EST-16',3,'282.00'),('1',3,'EST-6',1,'19.00');

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `itemId` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `inventory` */

insert  into `inventory`(`itemId`,`quantity`) values ('EST-1',10000),('EST-10',10000),('EST-11',10000),('EST-12',10000),('EST-13',10000),('EST-14',10000),('EST-15',10000),('EST-16',10000),('EST-17',10000),('EST-18',10000),('EST-19',10000),('EST-2',10000),('EST-20',10000),('EST-21',10000),('EST-22',10000),('EST-23',10000),('EST-24',10000),('EST-25',10000),('EST-26',10000),('EST-27',10000),('EST-28',10000),('EST-3',10000),('EST-4',10000),('EST-5',10000),('EST-6',10000),('EST-7',10000),('EST-8',10000),('EST-9',10000);

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `itemId` varchar(30) NOT NULL,
  `productId` varchar(30) NOT NULL,
  `listPrice` decimal(10,2) NOT NULL,
  `unitCost` decimal(10,2) NOT NULL,
  `supplierId` int(11) NOT NULL,
  `status` varchar(30) NOT NULL,
  `attr1` varchar(30) DEFAULT NULL,
  `attr2` varchar(30) DEFAULT NULL,
  `attr3` varchar(30) DEFAULT NULL,
  `attr4` varchar(30) DEFAULT NULL,
  `attr5` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `item` */

insert  into `item`(`itemId`,`productId`,`listPrice`,`unitCost`,`supplierId`,`status`,`attr1`,`attr2`,`attr3`,`attr4`,`attr5`) values ('EST-1','FI-SW-01','17.00','12.00',1,'P','Large',NULL,NULL,NULL,NULL),('EST-10','K9-DL-01','19.00','12.00',1,'P','Spotted Adult Female',NULL,NULL,NULL,NULL),('EST-11','RP-SN-01','19.00','12.00',1,'P','Venomless',NULL,NULL,NULL,NULL),('EST-12','RP-SN-01','19.00','12.00',1,'P','Rattleless',NULL,NULL,NULL,NULL),('EST-13','RP-LI-02','19.00','10.00',1,'P','Green Adult',NULL,NULL,NULL,NULL),('EST-14','FL-DSH-01','59.00','12.00',1,'P','Tailless',NULL,NULL,NULL,NULL),('EST-15','FL-DSH-01','24.00','12.00',1,'P','With tail',NULL,NULL,NULL,NULL),('EST-16','FL-DLH-02','94.00','12.00',1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-17','FL-DLH-02','94.00','12.00',1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-18','AV-CB-01','194.00','92.00',1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-19','AV-SB-02','16.00','2.00',1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-2','FI-SW-01','17.00','10.00',1,'P','Small',NULL,NULL,NULL,NULL),('EST-20','FI-FW-02','6.00','2.00',1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-21','FI-FW-02','6.00','1.00',1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-22','K9-RT-02','136.00','100.00',1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-23','K9-RT-02','145.00','100.00',1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-24','K9-RT-02','256.00','92.00',1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-25','K9-RT-02','325.00','90.00',1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-26','K9-CW-01','126.00','92.00',1,'P','Adult Male',NULL,NULL,NULL,NULL),('EST-27','K9-CW-01','155.00','90.00',1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-28','K9-RT-01','155.00','90.00',1,'P','Adult Female',NULL,NULL,NULL,NULL),('EST-3','FI-SW-02','19.00','12.00',1,'P','Toothless',NULL,NULL,NULL,NULL),('EST-4','FI-FW-01','19.00','12.00',1,'P','Spotted',NULL,NULL,NULL,NULL),('EST-5','FI-FW-01','19.00','12.00',1,'P','Spotless',NULL,NULL,NULL,NULL),('EST-6','K9-BD-01','19.00','12.00',1,'P','Male Adult',NULL,NULL,NULL,NULL),('EST-7','K9-BD-01','19.00','12.00',1,'P','Female Puppy',NULL,NULL,NULL,NULL),('EST-8','K9-PO-02','19.00','12.00',1,'P','Male Puppy',NULL,NULL,NULL,NULL),('EST-9','K9-DL-01','19.00','12.00',1,'P','Spotless Male Puppy',NULL,NULL,NULL,NULL);

/*Table structure for table `itemhistory` */

DROP TABLE IF EXISTS `itemhistory`;

CREATE TABLE `itemhistory` (
  `userId` varchar(120) NOT NULL,
  `itemId` varchar(120) NOT NULL,
  `productId` varchar(120) NOT NULL,
  `category` varchar(120) NOT NULL,
  `historyDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `itemhistory` */

insert  into `itemhistory`(`userId`,`itemId`,`productId`,`category`,`historyDate`) values ('1','EST-4','FI-FW-01','FISH','2020-11-16 19:36:34'),('1','EST-4','FI-FW-01','FISH','2020-11-16 19:40:12'),('1','EST-16','FL-DLH-02','CATS','2020-11-16 19:40:20'),('1','EST-18','AV-CB-01','BIRDS','2020-11-16 19:40:58'),('1','EST-11','RP-SN-01','REPTILES','2020-11-16 19:41:02'),('1','EST-18','AV-CB-01','BIRDS','2020-11-16 19:41:44'),('1','EST-19','AV-SB-02','BIRDS','2020-11-16 19:41:51');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(80) NOT NULL,
  `orderdate` date NOT NULL,
  `shipaddr1` varchar(80) NOT NULL,
  `shipaddr2` varchar(80) NOT NULL,
  `shipcity` varchar(80) NOT NULL,
  `shipstate` varchar(80) NOT NULL,
  `shipzip` varchar(80) NOT NULL,
  `shipcountry` varchar(80) NOT NULL,
  `billaddr1` varchar(80) NOT NULL,
  `billaddr2` varchar(80) NOT NULL,
  `billcity` varchar(80) NOT NULL,
  `billstate` varchar(80) NOT NULL,
  `billzip` varchar(80) NOT NULL,
  `billcountry` varchar(80) NOT NULL,
  `courier` varchar(80) NOT NULL,
  `totalprice` decimal(10,2) NOT NULL,
  `billtofirstname` varchar(80) NOT NULL,
  `billtolastname` varchar(80) NOT NULL,
  `shiptofirstname` varchar(80) NOT NULL,
  `shiptolastname` varchar(80) NOT NULL,
  `creditcard` varchar(80) NOT NULL,
  `exprdate` varchar(80) NOT NULL,
  `cardtype` varchar(80) NOT NULL,
  `locale` varchar(80) NOT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

/*Data for the table `orders` */

insert  into `orders`(`orderid`,`userid`,`orderdate`,`shipaddr1`,`shipaddr2`,`shipcity`,`shipstate`,`shipzip`,`shipcountry`,`billaddr1`,`billaddr2`,`billcity`,`billstate`,`billzip`,`billcountry`,`courier`,`totalprice`,`billtofirstname`,`billtolastname`,`shiptofirstname`,`shiptolastname`,`creditcard`,`exprdate`,`cardtype`,`locale`) values (1,'1','2020-11-16','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS','19.00','ABC','XYX','ABC','XYX','999 9999 9999 9999','12/03','Visa','CA'),(2,'1','2020-11-16','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS','301.00','ABC','XYX','ABC','XYX','999 9999 9999 9999','12/03','Visa','CA'),(3,'1','2020-11-17','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','901 San Antonio Road','MS UCUP02-206','Palo Alto','CA','94303','USA','UPS','19.00','ABC','XYX','ABC','XYX','999 9999 9999 9999','12/03','Visa','CA');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productId` varchar(60) NOT NULL,
  `category` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `descn` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `product` */

insert  into `product`(`productId`,`category`,`name`,`descn`) values ('AV-CB-01','BIRDS','Amazon Parrot','<image src=\"images/bird2.gif\">Great companion'),('AV-SB-02','BIRDS','Finch','<image src=\"images/bird1.gif\">Great stress reliever'),('FI-FW-01','FISH','Koi','<image src=\"images/fish3.gif\">Water fish from Japan'),('FI-FW-02','FISH','Goldfish','<image src=\"images/fish2.gif\">Water fish from China'),('FL-DLH-02','CATS','Persian','<image src=\"images/cat1.gif\">Friendly house cat'),('FL-DSH-01','CATS','Manx','<image src=\"images/cat2.gif\">reducing mouse'),('FL-SW-01','FISH','Angelfish','<image src=\"images/fish1.gif\">Water fish from Australia'),('FL-SW-02','FISH','Tiger Shark','<image src=\"images/fish4.gif\">Salt fish from Australia'),('K9-BD-01','DOGS','Bulldog','<image src=\"images/dog2.gif\">from England'),('K9-CW-01','DOGS','Chihuahua','<image src=\"images/dog4.gif\">companion dog'),('K9-DL-01','DOGS','Dalmation','<image src=\"images/dog6.gif\">Fire Station'),('K9-PO-02','DOGS','Poodle','<image src=\"images/dog3.gif\">Cute dog'),('K9-RT-01','DOGS','Golden Retriever','<image src=\"images/dog1.gif\">family dog'),('K9-RT-02','DOGS','Labrador Retriever','<image src=\"images/dog5.gif\">hunting dog'),('RP-LI-02','REPTILES','Iguana','<image src=\"images/lizard1.gif\">Friendly green '),('RP-SN-01','REPTILES','Rattlesnake','<image src=\"images/snake1.gif\">watch dog');

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `userid` varchar(80) NOT NULL,
  `langpref` varchar(80) NOT NULL,
  `favcategory` varchar(30) DEFAULT NULL,
  `mylistopt` tinyint(1) DEFAULT NULL,
  `banneropt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `profile` */

insert  into `profile`(`userid`,`langpref`,`favcategory`,`mylistopt`,`banneropt`) values ('1','english','CATS',1,1),('2','english','DOGS',1,1),('3','chinese','FISH',1,1);

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `account` int(11) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `is_admin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

/*Data for the table `user_info` */

insert  into `user_info`(`id`,`username`,`password`,`account`,`gender`,`age`,`email`,`is_admin`) values (1,'admin','123456',300,'M',20,'123456@qq.com',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
