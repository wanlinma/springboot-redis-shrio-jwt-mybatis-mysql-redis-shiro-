/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.16 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `test`;

/*Table structure for table `perms` */

DROP TABLE IF EXISTS `perms`;

CREATE TABLE `perms` (
  `perms_id` int(11) NOT NULL AUTO_INCREMENT,
  `perms_name` varchar(45) NOT NULL,
  PRIMARY KEY (`perms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `perms` */

insert  into `perms`(`perms_id`,`perms_name`) values (1,'admin:delete'),(2,'user:delete');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `rolename_UNIQUE` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role` */

insert  into `role`(`role_id`,`rolename`) values (1,'admin'),(3,'boss'),(2,'user');

/*Table structure for table `role_perms` */

DROP TABLE IF EXISTS `role_perms`;

CREATE TABLE `role_perms` (
  `role_perms_role_id` int(11) DEFAULT NULL,
  `role_perms_perms_id` int(11) DEFAULT NULL,
  UNIQUE KEY `index1` (`role_perms_role_id`,`role_perms_perms_id`),
  KEY `foregin_perms_id_idx` (`role_perms_perms_id`),
  CONSTRAINT `foregin_perms_id` FOREIGN KEY (`role_perms_perms_id`) REFERENCES `perms` (`perms_id`),
  CONSTRAINT `foregin_role_id` FOREIGN KEY (`role_perms_role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `role_perms` */

insert  into `role_perms`(`role_perms_role_id`,`role_perms_perms_id`) values (1,1),(1,2),(2,2);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`username`,`password`) values (1,'admin','123456'),(2,'zhangsan','123456');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_role_user_id` int(11) NOT NULL,
  `user_role_role_id` int(11) NOT NULL,
  UNIQUE KEY `index3` (`user_role_user_id`,`user_role_role_id`),
  KEY `user_role_user_id_foreign_idx` (`user_role_user_id`),
  KEY `user_role_role_id_foreign_idx` (`user_role_role_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `user_role_role_id_foreign` FOREIGN KEY (`user_role_role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_role_user_id_foreign` FOREIGN KEY (`user_role_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_role` */

insert  into `user_role`(`user_role_user_id`,`user_role_role_id`) values (1,1),(2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
