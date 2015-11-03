/*
SQLyog Ultimate v8.55 
MySQL - 5.0.96-community-nt : Database - project2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`project2` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `project2`;

/*Table structure for table `admindetail` */

DROP TABLE IF EXISTS `admindetail`;

CREATE TABLE `admindetail` (
  `Admin_id` int(11) NOT NULL,
  `Admin_name` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `password` varchar(200) default NULL,
  `user_type` varchar(200) default NULL,
  PRIMARY KEY  (`Admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admindetail` */

insert  into `admindetail`(`Admin_id`,`Admin_name`,`email`,`password`,`user_type`) values (3,'Nish','nish.patwa@utdallas.edu','nish1234','admin');

/*Table structure for table `clientdetail` */

DROP TABLE IF EXISTS `clientdetail`;

CREATE TABLE `clientdetail` (
  `client_id` int(100) NOT NULL auto_increment,
  `client_name` varchar(100) default NULL,
  `company_name` varchar(100) default NULL,
  `company_address` varchar(100) default NULL,
  `description` varchar(100) default NULL,
  `domain` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `contact_no` decimal(10,0) default NULL,
  PRIMARY KEY  (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `clientdetail` */

insert  into `clientdetail`(`client_id`,`client_name`,`company_name`,`company_address`,`description`,`domain`,`email`,`contact_no`) values (1,'Nish','Nish','Dallas','Demo Project','Test','nish@gmail.com','4698038689');

/*Table structure for table `employeedetail` */

DROP TABLE IF EXISTS `employeedetail`;

CREATE TABLE `employeedetail` (
  `employee_id` int(100) NOT NULL auto_increment,
  `employee_name` varchar(100) default NULL,
  `gender` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `contact_no` varchar(200) default NULL,
  `employee_type` varchar(200) default NULL,
  PRIMARY KEY  (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `employeedetail` */

insert  into `employeedetail`(`employee_id`,`employee_name`,`gender`,`address`,`email`,`contact_no`,`employee_type`) values (1,'Raghul ','Male','7777 McCallum Blvd APT#307','raghul@gmail.com','4698038689','Analyst'),(5,'Bhoomika Kakani','Female','7740 McCallum Blvd APT#261','bhoomika.kakani@gmail.com','4698038698','Manager'),(7,'Priyanka','Female','duashk','priyanka@gmail.com','6786768','admin');

/*Table structure for table `employeemodule` */

DROP TABLE IF EXISTS `employeemodule`;

CREATE TABLE `employeemodule` (
  `module_number` varchar(100) NOT NULL,
  `employee_id` varchar(100) NOT NULL,
  `project_id` varchar(100) NOT NULL,
  `employee_work_status` varchar(100) default NULL,
  `read_flag` int(10) default '0',
  PRIMARY KEY  (`module_number`,`employee_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employeemodule` */

insert  into `employeemodule`(`module_number`,`employee_id`,`project_id`,`employee_work_status`,`read_flag`) values ('1','1','1','Under Review',1),('2','1','2','Under Review',1);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) default NULL,
  `user_type` varchar(100) default NULL,
  `login_id` int(100) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`login_id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `employeedetail` (`employee_id`),
  CONSTRAINT `login_ibfk_2` FOREIGN KEY (`login_id`) REFERENCES `employeedetail` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`email`,`password`,`user_type`,`login_id`,`name`) values ('raghul@gmail.com','raghul123','employee',1,'Raghul'),('bhoomika.kakani@gmail.com','bhoomi123','Manager',5,'Bhoomika Kakani'),('priyanka@gmail.com','priyanka','admin',7,'Priyanka');

/*Table structure for table `messagedetail` */

DROP TABLE IF EXISTS `messagedetail`;

CREATE TABLE `messagedetail` (
  `Message_id` int(100) NOT NULL auto_increment,
  `Sender_id` int(100) default NULL,
  `subject` varchar(200) default NULL,
  `message` varchar(200) default NULL,
  `Read_flag` varchar(200) default NULL,
  `receiver_id` varchar(200) default NULL,
  `Send_date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`Message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `messagedetail` */

insert  into `messagedetail`(`Message_id`,`Sender_id`,`subject`,`message`,`Read_flag`,`receiver_id`,`Send_date`) values (1,1,'Test','<b>This is a test Message</b>','read','5','2015-03-30 21:56:39');

/*Table structure for table `moduledetail` */

DROP TABLE IF EXISTS `moduledetail`;

CREATE TABLE `moduledetail` (
  `module_number` varchar(200) NOT NULL,
  `project_id` int(200) default NULL,
  `module_name` varchar(200) default NULL,
  `module_start_date` varchar(200) default NULL,
  `module_end_date` varchar(200) default NULL,
  `module_status` varchar(200) default NULL,
  `employee_id` varchar(200) default NULL,
  `module_id` int(100) default '0',
  PRIMARY KEY  (`module_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `moduledetail` */

insert  into `moduledetail`(`module_number`,`project_id`,`module_name`,`module_start_date`,`module_end_date`,`module_status`,`employee_id`,`module_id`) values ('1',1,'First Iteration','02/25/2015','03/25/2015','Running','1',0),('2',2,'Second Iteration','03/25/2015','04/30/2015','Running','1',1);

/*Table structure for table `notification` */

DROP TABLE IF EXISTS `notification`;

CREATE TABLE `notification` (
  `Notification_id` int(100) NOT NULL auto_increment,
  `Login_id` int(100) default NULL,
  `Module_number` varchar(300) default NULL,
  `description` varchar(300) default NULL,
  `Priority` varchar(300) default NULL,
  `Expiry_date` date default NULL,
  PRIMARY KEY  (`Notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `notification` */

insert  into `notification`(`Notification_id`,`Login_id`,`Module_number`,`description`,`Priority`,`Expiry_date`) values (1,1,'Select Module','','Medium Priority','2015-03-16');

/*Table structure for table `projectdetail` */

DROP TABLE IF EXISTS `projectdetail`;

CREATE TABLE `projectdetail` (
  `project_manager_id` varchar(100) NOT NULL,
  `project_id` int(100) NOT NULL auto_increment,
  `project_name` varchar(100) default NULL,
  `final_start_date` date default NULL,
  `final_end_date` date default NULL,
  `Client_id` varchar(100) default NULL,
  `expected_start_date` date default NULL,
  `expected_end_date` date default NULL,
  `expected_cost` varchar(200) default NULL,
  `final_cost` varchar(200) default NULL,
  `payment_mode` varchar(200) default NULL,
  `project_status` varchar(200) default NULL,
  `description` varchar(200) default NULL,
  PRIMARY KEY  (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `projectdetail` */

insert  into `projectdetail`(`project_manager_id`,`project_id`,`project_name`,`final_start_date`,`final_end_date`,`Client_id`,`expected_start_date`,`expected_end_date`,`expected_cost`,`final_cost`,`payment_mode`,`project_status`,`description`) values ('5',1,'Collaborate','2008-11-11','2008-11-11','1','2008-11-11','2008-11-11',NULL,NULL,NULL,'Running','Sofware project management tool'),('5',2,'Demo','2015-03-02','2015-03-11','1','2015-03-02','2015-03-11','0','0','Cash','Not Started','This is a demo project.....');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
