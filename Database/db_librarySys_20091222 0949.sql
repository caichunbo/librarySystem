-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.26-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema db_librarySys
--

CREATE DATABASE IF NOT EXISTS db_librarySys;
USE db_librarySys;

--
-- Definition of table `tb_bookcase`
--

DROP TABLE IF EXISTS `tb_bookcase`;
CREATE TABLE `tb_bookcase` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `Column_3` char(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bookcase`
--

/*!40000 ALTER TABLE `tb_bookcase` DISABLE KEYS */;
INSERT INTO `tb_bookcase` (`id`,`name`,`Column_3`) VALUES 
 (3,'Êé¼Ü1',NULL);
/*!40000 ALTER TABLE `tb_bookcase` ENABLE KEYS */;


--
-- Definition of table `tb_bookinfo`
--

DROP TABLE IF EXISTS `tb_bookinfo`;
CREATE TABLE `tb_bookinfo` (
  `barcode` varchar(30) default NULL,
  `bookname` varchar(70) default NULL,
  `typeid` int(10) unsigned default NULL,
  `author` varchar(30) default NULL,
  `translator` varchar(30) default NULL,
  `ISBN` varchar(20) default NULL,
  `price` float(8,2) default NULL,
  `page` int(10) unsigned default NULL,
  `bookcase` int(10) unsigned default NULL,
  `inTime` date default NULL,
  `operator` varchar(30) default NULL,
  `del` tinyint(1) default '0',
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_bookinfo`
--

/*!40000 ALTER TABLE `tb_bookinfo` DISABLE KEYS */;
INSERT INTO `tb_bookinfo` (`barcode`,`bookname`,`typeid`,`author`,`translator`,`ISBN`,`price`,`page`,`bookcase`,`inTime`,`operator`,`del`,`id`) VALUES 
 ('9787302047230','Java 2 ÊµÓÃ½Ì³Ì',1,'***','','7-302',39.00,440,3,'2007-11-22','tsoft',0,1),
 ('jk','kjkj',1,'***','','7-302',12.00,0,1,'2007-11-22','tsoft',1,2),
 ('9787115157690','JSP³ÌÐò¿ª·¢·¶Àý±¦µä',1,'***','','978-7',89.00,816,3,'2007-11-23','tsoft',0,3),
 ('123','ÊÂÊµ',1,'11','11','7-302',11.00,11,1,'2007-12-18','tsoft',1,5);
/*!40000 ALTER TABLE `tb_bookinfo` ENABLE KEYS */;


--
-- Definition of table `tb_booktype`
--

DROP TABLE IF EXISTS `tb_booktype`;
CREATE TABLE `tb_booktype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `typename` varchar(30) default NULL,
  `days` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_booktype`
--

/*!40000 ALTER TABLE `tb_booktype` DISABLE KEYS */;
INSERT INTO `tb_booktype` (`id`,`typename`,`days`) VALUES 
 (1,'ÍøÂç±à³Ì',30),
 (3,'ÍøÒ³ÉèÖÃ',5);
/*!40000 ALTER TABLE `tb_booktype` ENABLE KEYS */;


--
-- Definition of table `tb_borrow`
--

DROP TABLE IF EXISTS `tb_borrow`;
CREATE TABLE `tb_borrow` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(10) unsigned default NULL,
  `bookid` int(10) default NULL,
  `borrowTime` date default NULL,
  `backTime` date default NULL,
  `operator` varchar(30) default NULL,
  `ifback` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_borrow`
--

/*!40000 ALTER TABLE `tb_borrow` DISABLE KEYS */;
INSERT INTO `tb_borrow` (`id`,`readerid`,`bookid`,`borrowTime`,`backTime`,`operator`,`ifback`) VALUES 
 (1,1,1,'2007-11-22','2007-12-22','tsoft',1),
 (2,1,3,'2007-11-26','2007-12-26','tsoft',0),
 (3,1,1,'2007-11-26','2007-12-26','tsoft',0),
 (4,3,6,'2007-12-29','2007-01-08','Tsoft',0),
 (5,3,1,'2007-12-29','2008-01-28','Tsoft',0),
 (6,3,3,'2007-12-29','2008-01-28','Tsoft',1);
/*!40000 ALTER TABLE `tb_borrow` ENABLE KEYS */;


--
-- Definition of table `tb_giveback`
--

DROP TABLE IF EXISTS `tb_giveback`;
CREATE TABLE `tb_giveback` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `readerid` int(11) default NULL,
  `bookid` int(11) default NULL,
  `backTime` date default NULL,
  `operator` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_giveback`
--

/*!40000 ALTER TABLE `tb_giveback` DISABLE KEYS */;
INSERT INTO `tb_giveback` (`id`,`readerid`,`bookid`,`backTime`,`operator`) VALUES 
 (1,1,1,'2007-11-22','tsoft'),
 (2,3,3,'2007-01-03','Tsoft');
/*!40000 ALTER TABLE `tb_giveback` ENABLE KEYS */;


--
-- Definition of table `tb_library`
--

DROP TABLE IF EXISTS `tb_library`;
CREATE TABLE `tb_library` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `libraryname` varchar(50) default NULL,
  `curator` varchar(10) default NULL,
  `tel` varchar(20) default NULL,
  `address` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `url` varchar(100) default NULL,
  `createDate` date default NULL,
  `introduce` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_library`
--

/*!40000 ALTER TABLE `tb_library` DISABLE KEYS */;
INSERT INTO `tb_library` (`id`,`libraryname`,`curator`,`tel`,`address`,`email`,`url`,`createDate`,`introduce`) VALUES 
 (1,'²©ÑÐÍ¼Êé¹Ý','wgh','1363********','ccs','wgh717@****.com','http://','1999-05-06','±¾ÊÐ¸ß¼¶Í¼Êé¹Ý');
/*!40000 ALTER TABLE `tb_library` ENABLE KEYS */;


--
-- Definition of table `tb_manager`
--

DROP TABLE IF EXISTS `tb_manager`;
CREATE TABLE `tb_manager` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `PWD` varchar(30) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_manager`
--

/*!40000 ALTER TABLE `tb_manager` DISABLE KEYS */;
INSERT INTO `tb_manager` (`id`,`name`,`PWD`) VALUES 
 (4,'tsoft','111'),
 (3,'admin','111');
/*!40000 ALTER TABLE `tb_manager` ENABLE KEYS */;


--
-- Definition of table `tb_parameter`
--

DROP TABLE IF EXISTS `tb_parameter`;
CREATE TABLE `tb_parameter` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cost` int(10) unsigned default NULL,
  `validity` int(10) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_parameter`
--

/*!40000 ALTER TABLE `tb_parameter` DISABLE KEYS */;
INSERT INTO `tb_parameter` (`id`,`cost`,`validity`) VALUES 
 (1,45,3);
/*!40000 ALTER TABLE `tb_parameter` ENABLE KEYS */;


--
-- Definition of table `tb_publishing`
--

DROP TABLE IF EXISTS `tb_publishing`;
CREATE TABLE `tb_publishing` (
  `ISBN` varchar(20) default NULL,
  `pubname` varchar(30) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_publishing`
--

/*!40000 ALTER TABLE `tb_publishing` DISABLE KEYS */;
INSERT INTO `tb_publishing` (`ISBN`,`pubname`) VALUES 
 ('7-302','Çå»ª´óÑ§³ö°æÉç'),
 ('978-7','ÈËÃñÓÊµç³ö°æÉç');
/*!40000 ALTER TABLE `tb_publishing` ENABLE KEYS */;


--
-- Definition of table `tb_purview`
--

DROP TABLE IF EXISTS `tb_purview`;
CREATE TABLE `tb_purview` (
  `id` int(11) NOT NULL,
  `sysset` tinyint(1) default '0',
  `readerset` tinyint(1) default '0',
  `bookset` tinyint(1) default '0',
  `borrowback` tinyint(1) default '0',
  `sysquery` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_purview`
--

/*!40000 ALTER TABLE `tb_purview` DISABLE KEYS */;
INSERT INTO `tb_purview` (`id`,`sysset`,`readerset`,`bookset`,`borrowback`,`sysquery`) VALUES 
 (4,1,1,1,1,1),
 (3,1,1,1,1,1);
/*!40000 ALTER TABLE `tb_purview` ENABLE KEYS */;


--
-- Definition of table `tb_reader`
--

DROP TABLE IF EXISTS `tb_reader`;
CREATE TABLE `tb_reader` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(20) default NULL,
  `sex` varchar(4) default NULL,
  `barcode` varchar(30) default NULL,
  `vocation` varchar(50) default NULL,
  `birthday` date default NULL,
  `paperType` varchar(10) default NULL,
  `paperNO` varchar(20) default NULL,
  `tel` varchar(20) default NULL,
  `email` varchar(100) default NULL,
  `createDate` date default NULL,
  `operator` varchar(30) default NULL,
  `remark` text,
  `typeid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_reader`
--

/*!40000 ALTER TABLE `tb_reader` DISABLE KEYS */;
INSERT INTO `tb_reader` (`id`,`name`,`sex`,`barcode`,`vocation`,`birthday`,`paperType`,`paperNO`,`tel`,`email`,`createDate`,`operator`,`remark`,`typeid`) VALUES 
 (1,'wgh','Å®','2008010100001','Ñ§Éú','1980-07-17','Éí·ÝÖ¤','2201041980********','13634*******','wgh717@****.com','2007-11-22','tsoft','ÎÞ',1),
 (2,'¸¨µ¼','ÄÐ','123123123','³ÌÐòÐòÔ±','1983-02-22','Éí·ÝÖ¤','220','','','2007-12-29','tsoft','',2);
/*!40000 ALTER TABLE `tb_reader` ENABLE KEYS */;


--
-- Definition of table `tb_readertype`
--

DROP TABLE IF EXISTS `tb_readertype`;
CREATE TABLE `tb_readertype` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `number` int(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_readertype`
--

/*!40000 ALTER TABLE `tb_readertype` DISABLE KEYS */;
INSERT INTO `tb_readertype` (`id`,`name`,`number`) VALUES 
 (1,'Ñ§Éú',2),
 (2,'³ÌÐòÔ±',1),
 (3,'½ÌÊ¦',3);
/*!40000 ALTER TABLE `tb_readertype` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
