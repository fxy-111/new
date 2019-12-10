/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.48 : Database - hospital
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `hospital`;

/*Table structure for table `t_itemtypes` */

DROP TABLE IF EXISTS `t_itemtypes`;

CREATE TABLE `t_itemtypes` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typeName` varchar(30) NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_itemtypes` */

insert  into `t_itemtypes`(`typeId`,`typeName`) values (1,'内科检查'),(2,'外科检查');

/*Table structure for table `t_peitems` */

DROP TABLE IF EXISTS `t_peitems`;

CREATE TABLE `t_peitems` (
  `intemId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `intemName` varchar(30) NOT NULL COMMENT '项目名称',
  `typeId` int(11) NOT NULL COMMENT '项目类别主键',
  `necessary` int(11) DEFAULT NULL COMMENT '是否必查',
  `ref` varchar(20) DEFAULT NULL COMMENT '参考值',
  `price` double NOT NULL COMMENT '价格',
  `info` varchar(50) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`intemId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_peitems` */

insert  into `t_peitems`(`intemId`,`intemName`,`typeId`,`necessary`,`ref`,`price`,`info`) values (4,'威威齐威王',1,1,'500cc',60,'免费验血'),(5,'adas',2,1,'as',60,'dad'),(6,'3213',2,2,'1111',11,'1111'),(7,'1111',1,2,'1111',111,'1111'),(8,'身高',1,1,'500cc',60,'免费验血');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
