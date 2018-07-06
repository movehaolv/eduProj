-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: educate
-- ------------------------------------------------------
-- Server version	5.7.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'游客');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,64),(2,1,65),(3,1,66),(4,1,67),(5,1,68),(6,1,69),(7,1,70),(8,1,71),(9,1,72),(10,1,73),(11,1,74),(12,1,75),(13,1,76),(14,1,77),(15,1,78),(16,1,79),(17,1,80),(18,1,81),(19,1,82),(20,1,83),(21,1,84),(22,1,97),(23,1,98),(24,1,99),(25,1,100),(26,1,104),(27,1,108);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add t1',6,'add_t1'),(17,'Can change t1',6,'change_t1'),(18,'Can delete t1',6,'delete_t1'),(19,'Can add 用户信息',7,'add_userprofile'),(20,'Can change 用户信息',7,'change_userprofile'),(21,'Can delete 用户信息',7,'delete_userprofile'),(22,'Can add 邮箱验证',8,'add_emailverifyrecord'),(23,'Can change 邮箱验证',8,'change_emailverifyrecord'),(24,'Can delete 邮箱验证',8,'delete_emailverifyrecord'),(25,'Can add 轮播图片',9,'add_banner'),(26,'Can change 轮播图片',9,'change_banner'),(27,'Can delete 轮播图片',9,'delete_banner'),(28,'Can add 课程',10,'add_course'),(29,'Can change 课程',10,'change_course'),(30,'Can delete 课程',10,'delete_course'),(31,'Can add 章节',11,'add_lesson'),(32,'Can change 章节',11,'change_lesson'),(33,'Can delete 章节',11,'delete_lesson'),(34,'Can add 视频',12,'add_video'),(35,'Can change 视频',12,'change_video'),(36,'Can delete 视频',12,'delete_video'),(37,'Can add 课程资源',13,'add_courseresource'),(38,'Can change 课程资源',13,'change_courseresource'),(39,'Can delete 课程资源',13,'delete_courseresource'),(40,'Can add 城市',14,'add_citydict'),(41,'Can change 城市',14,'change_citydict'),(42,'Can delete 城市',14,'delete_citydict'),(43,'Can add 课程机构',15,'add_courseorg'),(44,'Can change 课程机构',15,'change_courseorg'),(45,'Can delete 课程机构',15,'delete_courseorg'),(46,'Can add 教师',16,'add_teacher'),(47,'Can change 教师',16,'change_teacher'),(48,'Can delete 教师',16,'delete_teacher'),(49,'Can add 用户咨询',17,'add_userask'),(50,'Can change 用户咨询',17,'change_userask'),(51,'Can delete 用户咨询',17,'delete_userask'),(52,'Can add 课程评论',18,'add_coursecommemt'),(53,'Can change 课程评论',18,'change_coursecommemt'),(54,'Can delete 课程评论',18,'delete_coursecommemt'),(55,'Can add 用户收藏',19,'add_userfavorite'),(56,'Can change 用户收藏',19,'change_userfavorite'),(57,'Can delete 用户收藏',19,'delete_userfavorite'),(58,'Can add 用户消息',20,'add_usermessage'),(59,'Can change 用户消息',20,'change_usermessage'),(60,'Can delete 用户消息',20,'delete_usermessage'),(61,'Can add 用户课程',21,'add_usercourse'),(62,'Can change 用户课程',21,'change_usercourse'),(63,'Can delete 用户课程',21,'delete_usercourse'),(64,'Can view log entry',1,'view_logentry'),(65,'Can view group',3,'view_group'),(66,'Can view permission',2,'view_permission'),(67,'Can view content type',4,'view_contenttype'),(68,'Can view 课程',10,'view_course'),(69,'Can view 课程资源',13,'view_courseresource'),(70,'Can view 章节',11,'view_lesson'),(71,'Can view 视频',12,'view_video'),(72,'Can view 课程评论',18,'view_coursecommemt'),(73,'Can view 用户咨询',17,'view_userask'),(74,'Can view 用户课程',21,'view_usercourse'),(75,'Can view 用户收藏',19,'view_userfavorite'),(76,'Can view 用户消息',20,'view_usermessage'),(77,'Can view 城市',14,'view_citydict'),(78,'Can view 课程机构',15,'view_courseorg'),(79,'Can view 教师',16,'view_teacher'),(80,'Can view session',5,'view_session'),(81,'Can view t1',6,'view_t1'),(82,'Can view 轮播图片',9,'view_banner'),(83,'Can view 邮箱验证',8,'view_emailverifyrecord'),(84,'Can view 用户信息',7,'view_userprofile'),(85,'Can add Bookmark',22,'add_bookmark'),(86,'Can change Bookmark',22,'change_bookmark'),(87,'Can delete Bookmark',22,'delete_bookmark'),(88,'Can add User Setting',23,'add_usersettings'),(89,'Can change User Setting',23,'change_usersettings'),(90,'Can delete User Setting',23,'delete_usersettings'),(91,'Can add User Widget',24,'add_userwidget'),(92,'Can change User Widget',24,'change_userwidget'),(93,'Can delete User Widget',24,'delete_userwidget'),(94,'Can add log entry',25,'add_log'),(95,'Can change log entry',25,'change_log'),(96,'Can delete log entry',25,'delete_log'),(97,'Can view Bookmark',22,'view_bookmark'),(98,'Can view log entry',25,'view_log'),(99,'Can view User Setting',23,'view_usersettings'),(100,'Can view User Widget',24,'view_userwidget'),(101,'Can add captcha store',26,'add_captchastore'),(102,'Can change captcha store',26,'change_captchastore'),(103,'Can delete captcha store',26,'delete_captchastore'),(104,'Can view captcha store',26,'view_captchastore'),(105,'Can add 低级课程',10,'add_lowlevelcourse'),(106,'Can change 低级课程',10,'change_lowlevelcourse'),(107,'Can delete 低级课程',10,'delete_lowlevelcourse'),(108,'Can view 低级课程',27,'view_lowlevelcourse');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (141,'PWVL','pwvl','d69658f3b6edbb775c176403a7d0c2c4edcc2a7c','2018-06-02 11:34:31.708386'),(142,'RWLV','rwlv','496145b63f8b6285b95eeee2fb2a4ba510e3aa3c','2018-06-02 11:38:24.248686'),(144,'UITP','uitp','411e0774b36474e05e8cdbff752ef0883dd32a52','2018-06-03 23:41:40.362334'),(145,'CNDN','cndn','26e2ffa8db50e76f53ef83066fa95aada9e84814','2018-06-05 21:47:14.303638');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `desc` varchar(100) NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `detail` longtext NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11),
  `category` varchar(20) NOT NULL,
  `tag` varchar(20),
  `teacher_id` int(11),
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'python入门','courses/2018/05/b_HJG4rzA.jpg','python入门','cj',100,0,0,100,'南京大学python入门','2018-05-28 22:34:41.000000',6,'后端开发','python',63),(2,'python进阶教程','courses/2018/05/a_bCXxT6m.jpg','python进阶教程','zj',200,4,0,67,'老男孩python进阶教程','2018-05-28 22:34:41.000000',2,'后端开发','python',54),(3,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',100,0,0,5,'北京大学java入门','2018-05-28 22:34:41.000000',5,'后端开发','java',45),(4,'mysql入门','courses/2018/05/mysql_FAv2Zsq.jpg','mysql入门','cj',100,0,0,4,'慕课网mysql入门','2018-05-28 22:34:41.000000',4,'后端开发','mysql',31),(5,'mysql入门','courses/2018/05/mysql.jpg','mysql入门','cj',100,0,0,9,'北京大学mysql入门','2018-05-28 22:34:41.000000',5,'后端开发','mysql',44),(6,'python入门','courses/2018/05/b_6e5374Y.jpg','python入门','cj',200,0,0,3,'清华大学python入门','2018-05-28 22:34:41.000000',7,'后端开发','python',37),(7,'python入门','courses/2018/05/b_eLi8FmC.jpg','python入门','cj',110,0,0,0,'阿里python入门','2018-05-28 22:34:41.000000',8,'后端开发','python',51),(8,'python入门','courses/2018/05/b_pHXHJKb.jpg','python入门','cj',120,0,0,0,'腾讯python入门','2018-05-28 22:34:41.000000',10,'后端开发','python',43),(9,'java进阶','courses/2018/05/d_3s8nQXk.jpg','java进阶','zj',220,0,0,0,'慕课网java进阶','2018-05-28 22:34:41.000000',4,'后端开发','java',33),(10,'java进阶','courses/2018/05/d_MMtBNIU.jpg','java进阶','zj',330,0,0,0,'南京大学java进阶','2018-05-28 22:34:41.000000',6,'后端开发','java',62),(11,'java进阶','courses/2018/05/d_9PB0fl8.jpg','java进阶','zj',340,0,0,0,'苏州大学java进阶','2018-05-28 22:34:41.000000',9,'后端开发','java',42),(12,'java高阶','courses/2018/05/e_H3Vk2oq.jpg','java高阶','gj',455,0,0,9,'老男孩java高阶','2018-05-28 22:34:41.000000',2,'后端开发','java',27),(13,'java高阶','courses/2018/05/e_CVlDZTE.jpg','java高阶','gj',555,0,0,0,'南京大学java高阶','2018-05-28 22:34:41.000000',6,'后端开发','java',34),(14,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',432,0,0,4,'南京大学python高阶','2018-05-28 22:34:41.000000',6,'后端开发','python',61),(15,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_ZI2x1oi.jpg','python高阶','gj',777,0,0,0,'清华大学python高阶','2018-05-28 22:34:41.000000',7,'后端开发','python',37),(16,'mysql入门','courses/2018/05/mysql_ZQcWblS.jpg','mysql入门','cj',111,0,0,0,'慕课网分校mysql入门','2018-05-28 22:34:41.000000',3,'后端开发','mysql',30),(17,'python入门','courses/2018/05/b_pHXHJKb.jpg','python入门','cj',200,0,0,2,'python入门','2018-05-28 22:34:41.000000',2,'后端开发','python',28),(18,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',700,0,0,80,'老男孩python高阶','2018-05-28 22:34:41.000000',2,'后端开发','python',26),(19,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'老男孩java入门','2018-05-28 22:34:41.000000',2,'后端开发','java',27),(20,'mysql入门','courses/2018/05/mysql.jpg','mysql入门','cj',200,0,0,1,'老男孩mysql入门','2018-05-28 22:34:41.000000',2,'后端开发','mysql',28),(21,'java进阶','courses/2018/05/d_9PB0fl8.jpg','java进阶','zj',500,0,0,2,'老男孩java进阶','2018-05-28 22:34:41.000000',2,'后端开发','java',52),(22,'python入门','courses/2018/05/b_pHXHJKb.jpg','python入门','cj',200,0,0,0,'慕课网分校python入门','2018-05-28 22:34:41.000000',3,'后端开发','python',29),(23,'python进阶','courses/2018/05/a_bCXxT6m.jpg','python进阶','zj',400,0,0,0,'慕课网分校python进阶','2018-05-28 22:34:41.000000',3,'后端开发','python',55),(24,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',700,0,0,0,'慕课网分校python高阶','2018-05-28 22:34:41.000000',3,'后端开发','python',30),(25,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'慕课网分校java入门','2018-05-28 22:34:41.000000',3,'后端开发','java',56),(26,'java进阶','courses/2018/05/d_9PB0fl8.jpg','java进阶','zj',500,0,0,0,'慕课网分校java进阶','2018-05-28 22:34:41.000000',3,'后端开发','java',55),(27,'python入门','courses/2018/05/b_pHXHJKb.jpg','python入门','cj',200,0,0,0,'慕课网python入门','2018-05-28 22:34:41.000000',4,'后端开发','python',32),(28,'python进阶','courses/2018/05/a_bCXxT6m.jpg','python进阶','zj',400,0,0,0,'慕课网python进阶','2018-05-28 22:34:41.000000',4,'后端开发','python',31),(29,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',700,0,0,0,'慕课网python高阶','2018-05-28 22:34:41.000000',4,'后端开发','python',33),(30,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'慕课网java入门','2018-05-28 22:34:41.000000',4,'后端开发','java',32),(31,'python入门','courses/2018/05/b_pHXHJKb.jpg','python入门','cj',200,0,0,0,'北京大学python入门','2018-05-28 22:34:41.000000',5,'后端开发','python',46),(32,'python进阶','courses/2018/05/a_bCXxT6m.jpg','python进阶','zj',400,0,0,0,'北京大学python进阶','2018-05-28 22:34:41.000000',5,'后端开发','python',45),(33,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',700,0,0,0,'北京大学python高阶','2018-05-28 22:34:41.000000',5,'后端开发','python',58),(34,'java进阶','courses/2018/05/d_9PB0fl8.jpg','java进阶','zj',500,0,0,1,'北京大学Java进阶','2018-05-28 22:34:41.000000',5,'后端开发','java',46),(35,'python进阶','courses/2018/05/a_bCXxT6m.jpg','python进阶','zj',400,0,0,0,'南京大学python进阶','2018-05-28 22:34:41.000000',6,'后端开发','python',35),(36,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'南京大学java入门','2018-05-28 22:34:41.000000',6,'后端开发','java',36),(37,'mysql入门','courses/2018/05/mysql.jpg','mysql入门','cj',200,0,0,0,'南京大学mysql入门','2018-05-28 22:34:41.000000',6,'后端开发','mysql',61),(38,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'清华大学java入门','2018-05-28 22:34:41.000000',7,'后端开发','java',66),(39,'mysql入门','courses/2018/05/mysql.jpg','mysql入门','cj',200,0,0,0,'清华大学mysql入门','2018-05-28 22:34:41.000000',7,'后端开发','mysql',37),(40,'java进阶','courses/2018/05/d_9PB0fl8.jpg','java进阶','zj',500,0,0,0,'清华大学java进阶','2018-05-28 22:34:41.000000',7,'后端开发','java',64),(41,'python进阶','courses/2018/05/a_bCXxT6m.jpg','python进阶','zj',400,0,0,0,'阿里python进阶','2018-05-28 22:34:41.000000',8,'后端开发','python',50),(42,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',700,0,0,0,'阿里python高阶','2018-05-28 22:34:41.000000',8,'后端开发','python',38),(43,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'阿里java入门','2018-05-28 22:34:41.000000',8,'后端开发','java',51),(44,'mysql入门','courses/2018/05/mysql.jpg','mysql入门','cj',200,0,0,0,'阿里mysql入门','2018-05-28 22:34:41.000000',8,'后端开发','mysql',39),(45,'java进阶','courses/2018/05/d_9PB0fl8.jpg','java进阶','zj',500,0,0,0,'阿里java进阶','2018-05-28 22:34:41.000000',8,'后端开发','java',38),(46,'python入门','courses/2018/05/b_pHXHJKb.jpg','python入门','cj',200,0,0,0,'苏州大学python入门','2018-05-28 22:34:41.000000',9,'后端开发','python',42),(47,'python进阶','courses/2018/05/a_bCXxT6m.jpg','python进阶','zj',300,0,0,0,'苏州大学python进阶','2018-05-28 22:34:41.000000',9,'后端开发','python',40),(48,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',700,0,0,0,'苏州大学python高阶','2018-05-28 22:34:41.000000',9,'后端开发','python',42),(49,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'苏州大学java入门','2018-05-28 22:34:41.000000',9,'后端开发','java',41),(50,'mysql入门','courses/2018/05/mysql.jpg','mysql入门','cj',200,0,0,0,'苏州大学mysql入门','2018-05-28 22:34:41.000000',9,'后端开发','mysql',40),(51,'python进阶','courses/2018/05/a_bCXxT6m.jpg','python进阶','zj',400,0,0,0,'腾讯python进阶','2018-05-28 22:34:41.000000',10,'后端开发','python',69),(52,'python高阶','courses/2018/05/540e57300001d6d906000338-240-135_KGu7CXL.jpg','python高阶','gj',700,0,0,0,'腾讯python高阶','2018-05-28 22:34:41.000000',10,'后端开发','python',67),(53,'java入门','courses/2018/05/c_LsTEb0Z.jpg','java入门','cj',300,0,0,0,'腾讯java入门','2018-05-28 22:34:41.000000',10,'后端开发','java',43),(54,'mysql入门','courses/2018/05/mysql.jpg','mysql入门','cj',200,0,0,0,'腾讯mysql入门','2018-05-28 22:34:41.000000',10,'后端开发','mysql',68),(55,'java进阶','courses/2018/05/d_9PB0fl8.jpg','java进阶','zj',500,0,0,0,'腾讯java进阶','2018-05-28 22:34:00.000000',10,'后端开发','java',67);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'南京大学python入门','course/resource/201805/南京大学python入门.zip','2018-05-28 21:33:43.000000',1),(2,'老男孩python进阶教程','course/resource/201805/老男孩python进阶教程.zip','2018-05-28 21:31:18.000000',2),(3,'北京大学java入门','course/resource/201805/北京大学java入门.zip','2018-05-28 21:31:18.000000',3),(4,'慕课网mysql入门','course/resource/201805/慕课网mysql入门.zip','2018-05-28 21:31:18.000000',4),(6,'清华大学python入门','course/resource/201805/清华大学python入门.zip','2018-05-28 21:31:18.000000',6),(7,'阿里python入门','course/resource/201805/阿里python入门.zip','2018-05-28 21:31:18.000000',7),(8,'腾讯python入门','course/resource/201805/腾讯python入门.zip','2018-05-28 21:31:18.000000',8),(9,'慕课网java进阶','course/resource/201805/慕课网java进阶.zip','2018-05-28 21:31:18.000000',9),(10,'南京大学java进阶','course/resource/201805/南京大学java进阶.zip','2018-05-28 21:31:18.000000',10),(11,'苏州大学java进阶','course/resource/201805/苏州大学java进阶.zip','2018-05-28 21:31:18.000000',11),(12,'老男孩java高阶','course/resource/201805/老男孩java高阶.zip','2018-05-28 21:31:18.000000',12),(13,'南京大学java高阶','course/resource/201805/南京大学java高阶.zip','2018-05-28 21:31:18.000000',13),(14,'南京大学python高阶','course/resource/201805/南京大学python高阶.zip','2018-05-28 21:31:18.000000',14),(15,'清华大学python高阶','course/resource/201805/清华大学python高阶.zip','2018-05-28 21:31:18.000000',15),(16,'慕课网分校mysql入门','course/resource/201805/慕课网分校mysql入门.zip','2018-05-28 21:31:18.000000',16),(17,'python入门','course/resource/201805/python入门.zip','2018-05-28 21:31:18.000000',17),(18,'老男孩python高阶','course/resource/201805/老男孩python高阶.zip','2018-05-28 21:31:18.000000',18),(19,'老男孩java入门','course/resource/201805/老男孩java入门.zip','2018-05-28 21:31:18.000000',19),(20,'老男孩mysql入门','course/resource/201805/老男孩mysql入门.zip','2018-05-28 21:31:18.000000',20),(21,'老男孩java进阶','course/resource/201805/老男孩java进阶.zip','2018-05-28 21:31:18.000000',21),(22,'慕课网分校python入门','course/resource/201805/慕课网分校python入门.zip','2018-05-28 21:31:18.000000',22),(23,'慕课网分校python进阶','course/resource/201805/慕课网分校python进阶.zip','2018-05-28 21:31:18.000000',23),(24,'慕课网分校python高阶','course/resource/201805/慕课网分校python高阶.zip','2018-05-28 21:31:18.000000',24),(25,'慕课网分校java入门','course/resource/201805/慕课网分校java入门.zip','2018-05-28 21:31:18.000000',25),(26,'慕课网分校java进阶','course/resource/201805/慕课网分校java进阶.zip','2018-05-28 21:31:18.000000',26),(27,'慕课网python入门','course/resource/201805/慕课网python入门.zip','2018-05-28 21:31:18.000000',27),(28,'慕课网python进阶','course/resource/201805/慕课网python进阶.zip','2018-05-28 21:31:18.000000',28),(29,'慕课网python高阶','course/resource/201805/慕课网python高阶.zip','2018-05-28 21:31:18.000000',29),(30,'慕课网java入门','course/resource/201805/慕课网java入门.zip','2018-05-28 21:31:18.000000',30),(31,'北京大学python入门','course/resource/201805/北京大学python入门.zip','2018-05-28 21:31:18.000000',31),(32,'北京大学python进阶','course/resource/201805/北京大学python进阶.zip','2018-05-28 21:31:18.000000',32),(33,'北京大学python高阶','course/resource/201805/北京大学python高阶.zip','2018-05-28 21:31:18.000000',33),(34,'北京大学Java进阶','course/resource/201805/北京大学Java进阶.zip','2018-05-28 21:31:18.000000',34),(35,'南京大学python进阶','course/resource/201805/南京大学python进阶.zip','2018-05-28 21:31:18.000000',35),(36,'南京大学java入门','course/resource/201805/南京大学java入门.zip','2018-05-28 21:31:18.000000',36),(37,'南京大学mysql入门','course/resource/201805/南京大学mysql入门.zip','2018-05-28 21:31:18.000000',37),(38,'清华大学java入门','course/resource/201805/清华大学java入门.zip','2018-05-28 21:31:18.000000',38),(39,'清华大学mysql入门','course/resource/201805/清华大学mysql入门.zip','2018-05-28 21:31:00.000000',39),(40,'清华大学java进阶','course/resource/201805/清华大学java进阶.zip','2018-05-28 21:31:18.000000',40),(41,'阿里python进阶','course/resource/201805/阿里python进阶.zip','2018-05-28 21:31:18.000000',41),(42,'阿里python高阶','course/resource/201805/阿里python高阶.zip','2018-05-28 21:31:18.000000',42),(43,'阿里java入门','course/resource/201805/阿里java入门.zip','2018-05-28 21:31:18.000000',43),(44,'阿里mysql入门','course/resource/201805/阿里mysql入门.zip','2018-05-28 21:31:18.000000',44),(45,'阿里java进阶','course/resource/201805/阿里java进阶.zip','2018-05-28 21:31:18.000000',45),(46,'苏州大学python入门','course/resource/201805/苏州大学python入门.zip','2018-05-28 21:31:18.000000',46),(47,'苏州大学python进阶','course/resource/201805/苏州大学python进阶.zip','2018-05-28 21:31:18.000000',47),(48,'苏州大学python高阶','course/resource/201805/苏州大学python高阶.zip','2018-05-28 21:31:18.000000',48),(49,'苏州大学java入门','course/resource/201805/苏州大学java入门.zip','2018-05-28 21:31:18.000000',49),(50,'苏州大学mysql入门','course/resource/201805/苏州大学mysql入门.zip','2018-05-28 21:31:18.000000',50),(51,'腾讯python进阶','course/resource/201805/腾讯python进阶.zip','2018-05-28 21:31:18.000000',51),(52,'腾讯python高阶','course/resource/201805/腾讯python高阶.zip','2018-05-28 21:31:18.000000',52),(53,'腾讯java入门','course/resource/201805/腾讯java入门.zip','2018-05-28 21:31:18.000000',53),(54,'腾讯mysql入门','course/resource/201805/腾讯mysql入门.zip','2018-05-28 21:31:18.000000',54),(55,'腾讯java进阶','course/resource/201805/腾讯java进阶.zip','2018-05-28 21:31:00.000000',55),(64,'北京大学mysql入门','course/resource/201806/北京大学mysql入门.zip','2018-06-07 20:14:00.000000',5);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (2,'第 1章 快速上手：基础知识1','2018-05-13 23:44:00.000000',2),(3,'第 2章 列表和元组23','2018-05-27 15:42:23.000000',2),(4,'第3章 使用字符串41','2018-05-27 15:42:39.000000',2);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `learn_time` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1 交互式解释器1','2018-05-27 15:46:44.000000',2,50,'https://ke.qq.com/'),(2,'1.2 算法是什么2','2018-05-27 15:46:48.000000',2,100,'https://ke.qq.com/'),(3,'1.3 数和表达式3','2018-05-27 15:46:52.000000',2,100,'https://ke.qq.com/'),(4,'2.1 序列概述23','2018-05-27 15:46:55.000000',3,112,'https://ke.qq.com/'),(5,'2.2 通用的序列操作24','2018-05-27 15:46:59.000000',3,123,'https://ke.qq.com/'),(7,'2.2.1 索引24','2018-05-27 15:47:02.000000',3,123,'https://ke.qq.com/'),(8,'2.2.2 切片26','2018-05-27 15:47:05.000000',3,232,'https://ke.qq.com/'),(9,'2.2.3 序列相加28','2018-05-27 15:47:09.000000',3,200,'https://ke.qq.com/'),(10,'3.1 字符串基本操作4','2018-05-27 15:47:11.000000',4,300,'https://ke.qq.com/'),(11,'3.2 设置字符串的格式：精简版41','2018-05-27 15:47:15.000000',4,120,'https://ke.qq.com/'),(12,'3.3 设置字符串的格式：完整版43','2018-05-27 15:46:33.000000',4,130,'https://ke.qq.com/');
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-05-13 15:37:53.493688','2','bob1',1,'已添加。',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(26,'captcha','captchastore'),(4,'contenttypes','contenttype'),(10,'courses','course'),(13,'courses','courseresource'),(11,'courses','lesson'),(27,'courses','lowlevelcourse'),(12,'courses','video'),(18,'operation','coursecommemt'),(17,'operation','userask'),(21,'operation','usercourse'),(19,'operation','userfavorite'),(20,'operation','usermessage'),(14,'organization','citydict'),(15,'organization','courseorg'),(16,'organization','teacher'),(5,'sessions','session'),(6,'t1','t1'),(9,'users','banner'),(8,'users','emailverifyrecord'),(7,'users','userprofile'),(22,'xadmin','bookmark'),(25,'xadmin','log'),(23,'xadmin','usersettings'),(24,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-05-13 15:32:40.978813'),(2,'contenttypes','0002_remove_content_type_name','2018-05-13 15:32:41.213826'),(3,'auth','0001_initial','2018-05-13 15:32:41.637851'),(4,'auth','0002_alter_permission_name_max_length','2018-05-13 15:32:41.767858'),(5,'auth','0003_alter_user_email_max_length','2018-05-13 15:32:41.838862'),(6,'auth','0004_alter_user_username_opts','2018-05-13 15:32:41.909866'),(7,'auth','0005_alter_user_last_login_null','2018-05-13 15:32:41.979870'),(8,'auth','0006_require_contenttypes_0002','2018-05-13 15:32:42.039874'),(9,'auth','0007_alter_validators_add_error_messages','2018-05-13 15:32:42.110878'),(10,'users','0001_initial','2018-05-13 15:32:42.568904'),(11,'admin','0001_initial','2018-05-13 15:32:42.798917'),(12,'admin','0002_logentry_remove_auto_add','2018-05-13 15:32:42.900923'),(13,'courses','0001_initial','2018-05-13 15:32:43.299946'),(14,'operation','0001_initial','2018-05-13 15:32:43.936982'),(15,'organization','0001_initial','2018-05-13 15:32:44.247000'),(16,'sessions','0001_initial','2018-05-13 15:32:44.371007'),(17,'t1','0001_initial','2018-05-13 15:32:44.480013'),(18,'users','0002_banner_emailverifyrecord','2018-05-13 15:32:44.631022'),(19,'users','0003_auto_20180513_1408','2018-05-13 15:32:44.761029'),(20,'xadmin','0001_initial','2018-05-13 18:10:30.716451'),(21,'xadmin','0002_log','2018-05-13 18:10:30.939464'),(22,'xadmin','0003_auto_20160715_0100','2018-05-13 18:10:31.069471'),(23,'captcha','0001_initial','2018-05-17 21:57:00.334825'),(24,'courses','0002_auto_20180517_2156','2018-05-17 21:57:00.416830'),(25,'organization','0002_auto_20180517_2156','2018-05-17 21:57:00.609841'),(26,'users','0004_auto_20180517_2156','2018-05-17 21:57:00.726848'),(27,'organization','0003_courseorg_category','2018-05-20 17:17:39.345220'),(28,'organization','0004_auto_20180522_1256','2018-05-22 12:56:12.717760'),(29,'courses','0003_course_course_org','2018-05-23 17:52:25.193468'),(30,'organization','0005_teacher_image','2018-05-23 22:30:23.199395'),(31,'courses','0004_course_category','2018-05-26 22:28:58.236528'),(32,'courses','0005_course_tag','2018-05-27 17:38:53.527960'),(33,'courses','0006_auto_20180528_2019','2018-05-28 20:19:31.026919'),(34,'courses','0007_auto_20180528_2032','2018-05-28 20:33:04.004419'),(35,'organization','0006_auto_20180528_2234','2018-05-28 22:34:32.431293'),(36,'courses','0008_course_teacher','2018-05-28 22:34:33.045328'),(37,'users','0005_auto_20180602_1111','2018-06-02 11:12:34.778221'),(38,'users','0006_auto_20180605_1326','2018-06-05 13:26:35.392670'),(39,'users','0007_auto_20180605_2118','2018-06-05 21:18:49.099265'),(40,'users','0008_auto_20180605_2345','2018-06-05 23:46:09.383901');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c2eyvzqnzocvns0unj81pqw0ml5wibbg','ZWQxNGJjZTViNzBmYmRiMThjZGJjZjBlMjk0NzEyMDM3NzFmOTI4MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg3ZjUwYTgyOWZkOGQyODRmNTc4MmEyYmE5NThmMGQxZjJmOGE5ZGMiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJ0ZWFjaGVyIl0sIiJdfQ==','2018-06-06 22:42:04.015480'),('sjcz3tr6vnqdhc9tkhs5d9jznv90q1xo','MjA2YjcwYjA1YjdjYzRkMjdhMDI5YmVjMWMzZmIzM2Y4YWUwNTY4Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4N2Y1MGE4MjlmZDhkMjg0ZjU3ODJhMmJhOTU4ZjBkMWYyZjhhOWRjIiwiTElTVF9RVUVSWSI6W1sib3JnYW5pemF0aW9uIiwidGVhY2hlciJdLCIiXX0=','2018-05-28 00:14:30.140595'),('vlqbg8pp57jzfd4fdcpp7t7psim8zevc','ZmM2NTc5ZDZlOGVjNDc1ODdlNjYwNjFmZWIzZDNkMTdlMDM0Y2ZlYTp7ImxvZ2luX2Zyb20iOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvdXNlci9jZW50ZXIvIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOGMyMDE3OTFkYzA2YTViYjA2YTU2Yjc4NTI2M2E5ODE2NTUyOGQ0ZCIsIkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl19','2018-06-21 20:16:48.086589');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecommemt`
--

DROP TABLE IF EXISTS `operation_coursecommemt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecommemt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(500) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecommemt_course_id_18a95a02_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecommemt_user_id_9173961c_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecommemt_course_id_18a95a02_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_coursecommemt_user_id_9173961c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecommemt`
--

LOCK TABLES `operation_coursecommemt` WRITE;
/*!40000 ALTER TABLE `operation_coursecommemt` DISABLE KEYS */;
INSERT INTO `operation_coursecommemt` VALUES (1,'kankan','2018-05-29 21:44:47.000000',2,3),(15,'这种重中之重重中之重重中之重重中之重','2018-05-29 22:47:33.273588',2,1),(16,'看一下','2018-06-07 21:30:30.614543',5,1);
/*!40000 ALTER TABLE `operation_coursecommemt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
INSERT INTO `operation_userask` VALUES (1,'jan11111','18321538930','kkk1112','2018-05-22 23:40:57.317393'),(3,'ton','18121508933','asdasd','2018-05-25 18:59:48.900207'),(4,'asd','18321508930','laonan','2018-06-05 15:21:27.891898'),(5,'sadsa','18321508931','asd','2018-06-05 15:22:41.738122'),(6,'asd','18321508930','asd','2018-06-06 15:06:24.106330'),(7,'tom','18321508930','django','2018-06-06 22:37:17.232680');
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2018-05-27 14:13:47.000000',2,3),(2,'2018-05-27 14:14:39.000000',2,1),(4,'0000-00-00 00:00:00.000000',2,2),(5,'0000-00-00 00:00:00.000000',6,6),(6,'2018-05-29 16:12:32.640989',5,1),(8,'2018-05-29 17:59:25.007756',1,1),(9,'2018-05-29 18:00:15.000000',2,2),(10,'2018-05-29 18:58:20.843994',3,1),(11,'2018-06-03 21:53:42.285969',4,1);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` varchar(10) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (7,10,'2','2018-05-25 19:00:27.647424',1),(23,29,'3','2018-06-03 19:38:59.308649',1),(26,28,'3','2018-06-03 20:12:18.503996',1),(29,27,'3','2018-06-03 20:54:22.642369',1),(30,32,'3','2018-06-03 21:40:31.875760',1),(35,55,'3','2018-06-03 21:47:30.041678',1),(84,3,'1','2018-06-07 13:25:43.134835',1),(86,2,'1','2018-06-07 13:28:25.330112',1),(87,2,'2','2018-06-07 13:31:05.741287',1),(103,6,'2','2018-06-07 17:15:31.432480',1);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (4,'北京市','北京市','2018-05-20 17:20:00.000000'),(5,'上海市','上海市','2018-05-20 17:21:00.000000'),(6,'南京市','南京市','2018-05-20 17:21:00.000000'),(7,'广州市','广州市','2018-05-20 17:22:00.000000'),(8,'杭州市','杭州市','2018-05-20 17:22:00.000000'),(9,'苏州市','苏州市','2018-05-20 17:22:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(10) NOT NULL,
  `courses_num` int(11) NOT NULL,
  `students_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (2,'老男孩教育','老男孩教育（一天天教育科技有限公司）是一家IT职业教育培训公司，总部位于北京市。\r\n老男孩教育（一天天教育科技有限公司）主要的课程有Linux运维、Linux运维架构、Python自动化运维，Python全栈开发和大数据课程。\r\n老男孩教育2014-2016年度，所有学员就业平均为10000以上。',0,10,'北京市','org/201805/lnh.png','2018-05-20 17:35:00.000000',4,'pxjg',3,10),(3,'慕学网分校','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n        慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] \r\n        4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]',0,20,'上海市','org/201805/imooc.png','2018-05-20 17:36:00.000000',5,'pxjg',1,12),(4,'慕课网','慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。\r\n慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。 [1] \r\n4月2日，国内首个IT技能学习类应用——慕课网3.1.0版本在应用宝首发。据了解，在此次上线的版本中，慕课网新增了课程历史记录、相关课程推荐等四大功能，为用户营造更加丰富的移动端IT学习体验。 [2]',0,15,'北京市','org/201805/imooc_Gn1sRjp.png','2018-05-20 17:38:00.000000',4,'pxjg',6,33),(5,'北京大学','北京大学（Peking University）简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是最早以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。北大是中国近代以来唯一以国家最高学府身份创立的学校，最初也是国家最高教育行政机关，行使教育部职能，统管全国教育。北大催生了中国最早的现代学制，开创了中国最早的文科、理科、社科、农科、医科等大学学科，是近代以来中国高等教育的奠基者 [1-3]  。\r\n1912年5月3日，京师大学堂改称北京大学校，严复为首任校长 [4]  。1917年，蔡元培出任校长，“循思想自由原则、取兼容并包之义”，把北大办成全国学术和思想中心，使北大成为新文化运动中心、五四运动策源地。1937年抗日战争爆发，北大与清华大学、南开大学南迁长沙，组成国立长沙临时大学。不久迁往昆明，改称国立西南联合大学。1946年10月在北平复学 [5]  。',0,0,'北京','org/201805/bjdx.jpg','2018-05-20 17:39:00.000000',4,'gx',1,12),(6,'南京大学','南京大学（Nanjing University），简称“南大”，是中华人民共和国教育部直属、中央直管副部级建制的全国重点大学，国家首批“双一流”、“211工程”、“985工程”重点建设高校，入选首批“珠峰计划”、“111计划”、“2011计划”、“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“卓越法律人才教育培养计划”，九校联盟、中国大学校长联谊会、环太平洋大学联盟、21世纪学术联盟和东亚研究型大学协会成员。\r\n南京大学是中国第一所集教学和研究于一体的现代大学，其学脉可追溯自孙吴永安元年（258年）的南京太学，近代校史肇始于1902年筹办的三江师范学堂，此后历经多次变迁。1920年在中国国立高等学府中首开“女禁”，引领男女同校之风。最早在中国开展现代学术研究，建立中国最早的现代科学研究实验室，成为中国最早的以大学自治、学术自由、文理为基本兼有农工商等专门应用科、集教学和研究于一体为特征的现代大学。《学衡》月刊的创办，使得学校成为中西学术文化交流的中心，被誉为“东方教育的中心”。1949年由民国时期中国最高学府“国立中央大学”易名“国立南京大学”，翌年径称“南京大学”，沿用至今。',0,5,'南京','org/201805/njdx.jpg','2018-05-20 17:41:00.000000',6,'gx',3,34),(7,'清华大学','清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、东亚研究型大学协会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉为“红色工程师的摇篮”。',0,0,'北京','org/201805/qhdx-logo.png','2018-05-20 17:41:00.000000',4,'gx',4,2),(8,'阿里巴巴IT培训','阿里巴巴网络技术有限公司（简称：阿里巴巴集团）是以曾担任英语教师的马云为首的18人于1999年在浙江杭州创立。 [1-2] \r\n阿里巴巴集团经营多项业务，另外也从关联公司的业务和服务中取得经营商业生态系统上的支援。业务和关联公司的业务包括：淘宝网、天猫、聚划算、全球速卖通、阿里巴巴国际交易市场、1688、阿里妈妈、阿里云、蚂蚁金服、菜鸟网络等。 [3]',0,3,'杭州','org/201805/albb.png','2018-05-20 17:43:00.000000',8,'gr',3,1),(9,'苏州大学','苏州大学（Soochow University），简称“苏大”，坐落于历史文化名城苏州，国家“211工程”重点建设高校，国家国防科技工业局和江苏省人民政府共建高校，国家“双一流”世界一流学科建设高校，全国博士研究生教育综合改革试点高校，江苏省属重点综合性大学，首批入选“2011计划”、“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“国家大学生创新性实验计划”，入选“111计划”、“海外高层次人才引进计划”、“中非高校20+20合作计划”、“国家建设高水平大学公派研究生项目”。',0,19,'苏州','org/201805/szdx.png','2018-05-20 17:44:00.000000',9,'gx',1,34),(10,'腾讯IT培训','深圳市腾讯计算机系统有限公司成立于1998年11月 [1]  ，由马化腾、张志东、许晨晔、陈一丹、曾李青五位创始人共同创立。 [1]  是中国最大的互联网综合服务提供商之一，也是中国服务用户最多的互联网企业之一。 [2]',0,30,'广州','org/201805/tx.png','2018-05-20 17:46:00.000000',7,'gr',0,1);
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `points` varchar(100) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_position` varchar(100) NOT NULL,
  `work_company` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100),
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (26,'oldboy1','oldboy1',0,33,5,'#','#','2018-05-23 22:17:00.000000',2,'teacher/201805/aobama.png'),(27,'oldboy2','oldboy2',1,4,3,'#','#','2018-05-23 22:17:00.000000',2,'teacher/201805/fqy_AYGc6ND.png'),(28,'oldboy3','oldboy3',0,3,5,'#','#','2018-05-23 22:17:00.000000',2,'teacher/201805/gx_VHq6NSV.png'),(29,'mu4','mu4',1,3,5,'#','#','2018-05-23 22:17:00.000000',3,'teacher/201805/aobama_HwZKAIa.png'),(30,'mu5','mu5',0,5,3,'#','#','2018-05-23 22:17:00.000000',3,'teacher/201805/gj_YgxSBSl.png'),(31,'mu1','mu1',0,5,5,'#','#','2018-05-23 22:17:00.000000',4,'teacher/201805/aobama_3kZLAbo.png'),(32,'mu2','mu2',0,11,3,'#','#','2018-05-23 22:17:00.000000',4,'teacher/201805/aobama_0cd2fMQ.png'),(33,'mu3','mu3',0,0,2,'#','#','2018-05-23 22:17:00.000000',4,'teacher/201805/gx_GSZkGrx.png'),(34,'nan1','nan1',0,0,5,'#','#','2018-05-23 22:17:00.000000',6,'teacher/201805/mayun_Bdeqr4t.png'),(35,'nan2','nan2',0,0,3,'#','#','2018-05-23 22:17:00.000000',6,'teacher/201805/gj_8wMcYKm.png'),(36,'nan3','nan3',0,0,2,'#','#','2018-05-23 22:17:00.000000',6,'teacher/201805/fqy_A0unaQ3.png'),(37,'qinghua','qianghua',0,0,5,'#','#','2018-05-23 22:17:00.000000',7,'teacher/201805/aobama_BNboYs8.png'),(38,'ali1','ali1',0,0,1,'#','#','2018-05-23 22:17:00.000000',8,'teacher/201805/zwj.png'),(39,'ali2','ali2',0,0,5,'#','#','2018-05-23 22:17:00.000000',8,'teacher/201805/oyf.png'),(40,'su1','su1',0,0,1,'#','#','2018-05-23 22:17:00.000000',9,'teacher/201805/gx_3gsl3q8.png'),(41,'su2','su2',0,0,3,'#','#','2018-05-23 22:17:00.000000',9,'teacher/201805/mayun.png'),(42,'su3','su3',0,0,5,'#','#','2018-05-23 22:17:00.000000',9,'teacher/201805/gx.png'),(43,'tx1','tx1',0,0,2,'#','#','2018-05-23 22:17:00.000000',10,'teacher/201805/fqy.png'),(44,'bj1','bj1',0,1,5,'#','#','2018-05-23 22:17:00.000000',5,'teacher/201805/gj.png'),(45,'bj2','bj2',0,0,1,'#','#','2018-05-23 22:17:00.000000',5,'teacher/201805/aobama_CXWwMef_zNSHId4.png'),(46,'bj3','bj3',0,1,2,'#','#','2018-05-23 22:17:00.000000',5,'teacher/201805/aobama_CXWwMef.png'),(50,'ali3','ali3',0,0,3,'#','#','2018-05-24 11:33:28.000000',8,'teacher/201805/aobama.png'),(51,'ali4','ali4',0,0,6,'#','#','2018-05-24 11:33:28.000000',8,'teacher/201805/gj.png'),(52,'oldboy4','oldboy4',0,2,3,'#','#','2018-05-24 11:44:52.000000',2,'teacher/201805/aobama.png'),(53,'oldboy5','oldboy5',0,0,6,'#','#','2018-05-24 11:44:52.000000',2,'teacher/201805/gj.png'),(54,'oldboy6','oldboy6',0,1,1,'#','#','2018-05-24 11:44:52.000000',2,'teacher/201805/fqy.png'),(55,'mu6','mu6',1,3,3,'#','#','2018-05-24 11:44:52.000000',3,'teacher/201805/aobama.png'),(56,'mu7','mu7',0,0,2,'#','#','2018-05-24 11:44:52.000000',3,'teacher/201805/gj.png'),(58,'bj6','bj6',0,0,3,'#','#','2018-05-24 11:44:52.000000',5,'teacher/201805/aobama.png'),(61,'nan4','nan4',0,0,3,'#','#','2018-05-24 11:44:53.000000',6,'teacher/201805/aobama.png'),(62,'nan5','nan5',0,0,2,'#','#','2018-05-24 11:44:53.000000',6,'teacher/201805/gj.png'),(63,'nan6','nan6',0,0,1,'#','#','2018-05-24 11:44:53.000000',6,'teacher/201805/fqy.png'),(64,'qinghua2','qinghua2',0,0,3,'#','#','2018-05-24 11:44:53.000000',7,'teacher/201805/aobama.png'),(65,'qinghua3','qinghua3',0,1,2,'#','#','2018-05-24 11:44:53.000000',7,'teacher/201805/gj.png'),(66,'qinghua4','qinghua4',0,1,1,'#','#','2018-05-24 11:44:53.000000',7,'teacher/201805/fqy.png'),(67,'tx2','tx2',0,0,3,'#','#','2018-05-24 11:44:53.000000',10,'teacher/201805/aobama.png'),(68,'tx3','tx3',0,0,2,'#','#','2018-05-24 11:44:53.000000',10,'teacher/201805/gj.png'),(69,'tx4','tx4',0,0,1,'#','#','2018-05-24 11:44:53.000000',10,'teacher/201805/fqy.png'),(70,'tx5','tx5',0,0,2,'#','#','2018-05-24 11:44:53.000000',10,'teacher/201805/gj.png'),(71,'tx6','tx6',0,0,1,'#','#','2018-05-24 11:44:53.000000',10,'teacher/201805/fqy.png');
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t1_t1`
--

DROP TABLE IF EXISTS `t1_t1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t1_t1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) NOT NULL,
  `t1` varchar(10) NOT NULL,
  `t2` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weight` (`weight`),
  UNIQUE KEY `height` (`height`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t1_t1`
--

LOCK TABLES `t1_t1` WRITE;
/*!40000 ALTER TABLE `t1_t1` DISABLE KEYS */;
/*!40000 ALTER TABLE `t1_t1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1` (
  `id` int(11) NOT NULL DEFAULT '0',
  `group_concat(b.user_id)` text CHARACTER SET utf8mb4,
  `count(a.name)` bigint(21) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1`
--

LOCK TABLES `test1` WRITE;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
INSERT INTO `test1` VALUES (2,'3,1,2,6',4);
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `send_type` varchar(100) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (1,'admin','admin@126.com','register','2018-05-13 21:21:00.000000'),(2,'bob','admin@126.com','register','2018-05-13 21:23:00.000000'),(11,'0V6LeXm3C3ImhT8x','1986268100@qq.com','register','2018-05-18 20:35:18.497102'),(12,'0D8nVYNELH9fXiD1','1986268100@qq.com','register','2018-05-18 20:44:10.131509'),(13,'zVa7QtsUVGeOWHBw','19862681a00@qq.com','register','2018-05-19 12:51:39.503221'),(14,'7dh1SpmIQQX2wFJo','1986268200@qq.com','register','2018-05-19 12:52:23.515739'),(15,'ihL1thBJqdjs3wE7','1986268300@qq.com','register','2018-05-19 12:55:10.946315'),(16,'9s0HAJ0W9MFJroT0','83998588321@qq.com','register','2018-05-19 12:56:34.280082'),(17,'ZcyBMdNacGV2fGjc','1986268100@qq.com','forget','2018-05-19 20:39:39.216289'),(18,'NeAGk25t8e51ZZ0b','1986268100@qq.com','forget','2018-05-19 23:35:41.697429'),(19,'9VGBKEThCj0V3N1u','1986268100@qq.com','forget','2018-05-19 23:36:29.928187'),(20,'5B0m2ENKvUPJxnXi','839985880@qq.com','forget','2018-06-01 20:22:14.201418'),(21,'RPJz7jcCkIm3J6jD','839985880@qq.com','forget','2018-06-01 20:43:20.871867'),(22,'V9ttHjlo3wrzUuya','839985880@qq.com','forget','2018-06-01 20:55:32.876736'),(23,'OgE0buyjMvfo0zDR','1986268100@qq.com','forget','2018-06-01 22:10:51.850206'),(24,'U8dARke5ezYJTPHb','1986268100@qq.com','forget','2018-06-01 22:11:06.631052'),(25,'AZwj8La764y0F9cC','1986268100@qq.com','forget','2018-06-01 22:16:59.213218'),(26,'pL8erCzLiihVE2I6','1986268100@qq.com','forget','2018-06-01 22:55:04.001901'),(27,'bbQtDMQm6MKfNuQD','1986268100@qq.com','forget','2018-06-01 23:13:52.253433'),(28,'raYLzCdCGZosfZPv','839985880@qq.com','register','2018-06-02 11:19:46.159894'),(29,'3aAYodWqvkwrx3dE','test1@126.com','register','2018-06-02 11:34:02.858895'),(30,'dwd5','3208496872@qq.com','update','2018-06-05 22:00:13.491364'),(31,'Nwc2','3208496872@qq.com','update','2018-06-05 22:04:36.790424'),(32,'kffC','3208496872@qq.com','update','2018-06-05 22:05:33.885690'),(33,'mvXL','3208496872@qq.com','update','2018-06-05 22:06:16.537129'),(34,'f7Y9','3208496872@qq.com','update','2018-06-05 22:06:20.380349'),(35,'GErg','asdasd@qq.com','update','2018-06-05 22:21:22.436944'),(36,'TC4p','1986268100@qq,com','update','2018-06-05 22:50:00.224196'),(37,'Pdv7','1986268100@qq,com','update','2018-06-05 22:50:02.258312'),(38,'5XMH','1986268100@qq,com','update','2018-06-05 22:50:05.604503'),(39,'5OfA','3208496872@qq.com','update','2018-06-05 23:08:48.586734'),(40,'mx8R','1986268100@qq.com','update','2018-06-05 23:22:24.963428'),(41,'ZyuV','123123123213@qq.com','update','2018-06-07 15:24:09.727309'),(42,'oelF','123123123213@qq.com','update','2018-06-07 15:24:17.637761'),(43,'HX27','839985230@qq.com','update','2018-06-07 15:24:33.888690');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `users_userprofile_email_ee577bf6_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (1,'pbkdf2_sha256$24000$owLlN5g8FtPK$lxmSBNyqoXJv+FTvS3QSo85dGEMQY9KM1KNYhg23nW8=','2018-06-05 20:10:08.139560',1,'bob','','','1986268100@qq.com',1,1,'2018-05-13 15:36:07.378618','bob','2011-06-06','male','上海','18321208633','image/2018/06/default_middile_8_69Ass9A.png'),(2,'bob123123','2018-05-13 15:36:00.000000',0,'bob5','','','bob1@126.com',0,1,'2018-05-13 15:36:00.000000','bob1',NULL,'female','bob1.home','','image/2018/05/default_middile_2.png'),(3,'pbkdf2_sha256$24000$UdufmjEOUysJ$uUlRJbKBmQLqw6qBDKx3E2sKqoTiKnPhDD2nY2YxOTA=',NULL,0,'bob2','','','bob2@126.com',0,1,'2018-05-13 18:15:00.000000','bob2',NULL,'female','bob2.home','','image/2018/05/default_middile_2.png'),(6,'pbkdf2_sha256$24000$xhkrwUl0ald8$cj7tXji+8ohKYn0FhsO3M++OJxT8SKSvdAK5+zh4MD4=',NULL,0,'bob3','','','lv@123.com',0,1,'2018-05-17 23:10:08.443811','',NULL,'female','',NULL,'image/2018/05/default_middile_2.png'),(7,'pbkdf2_sha256$24000$8z8W8mLQMJqF$vjAkAT/fh2SjrSd8+m+QDuhgj70YOELFm2qzHlmH/u8=',NULL,1,'bob123','','','bob123@126.com',1,1,'2018-05-18 15:01:32.778696','',NULL,'female','',NULL,'image/2018/05/default_middile_2.png'),(21,'pbkdf2_sha256$24000$2He1jIuVMv9y$twH0TttThuwOjFU9MVnMyvkahqSHV68EzM4QZcF6zZc=','2018-05-20 13:26:18.449278',0,'1986268100@qq.com','','','bob3@126.com',1,1,'2018-05-18 20:44:10.027503','',NULL,'female','',NULL,'image/2018/05/default_middile_2.png'),(30,'pbkdf2_sha256$24000$SehYhWllnG42$DCj8svesQKIhqpVBIy/KBQ/jcrG3jEGqmIFtOt371Tk=',NULL,1,'admin','','','admin@126.com',1,1,'2018-06-02 11:18:10.426419','',NULL,'female','',NULL,'image/2018/05/default_middile_2.png'),(31,'pbkdf2_sha256$24000$SfTlPWWqgztV$qW94PFLe2d3Sp2XAXe3AeP4TafouluvUBrfHz+Boac0=','2018-06-02 11:22:06.817940',0,'839985880@qq.com','','','839985880@qq.com',0,1,'2018-06-02 11:19:46.077890','',NULL,'female','',NULL,'image/2018/05/default_middile_2.png'),(32,'pbkdf2_sha256$24000$CUr4fZuMuJJn$vQ6NSQ5pCchqb6vjtChAaHaQdCoZo5qDNVMVDdXQHOI=','2018-06-02 11:48:38.492978',0,'test1','','','test1@126.com',1,1,'2018-06-02 11:34:00.000000','test1',NULL,'female','bendi','','image/2018/05/default_middile_2.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
INSERT INTO `users_userprofile_groups` VALUES (1,32,1);
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-05-13 18:15:30.559601','127.0.0.1','3','bob2','create','已添加。',7,1),(2,'2018-05-13 18:16:47.923026','127.0.0.1','3','bob2','change','已修改 nick_name 和 address 。',7,1),(3,'2018-05-13 21:22:02.919767','127.0.0.1','1','EmailVerifyRecord object','create','已添加。',8,1),(4,'2018-05-13 21:23:43.523522','127.0.0.1','2','admin@126.com,2018-05-13 21:23:00','create','已添加。',8,1),(5,'2018-05-13 22:24:27.837965','127.0.0.1','1','Course object','create','已添加。',10,1),(6,'2018-05-13 22:27:18.472724','127.0.0.1','2','Django进阶教程','create','已添加。',10,1),(7,'2018-05-13 22:31:47.587117','127.0.0.1','1','Lesson object','create','已添加。',11,1),(8,'2018-05-13 22:37:06.010329','127.0.0.1',NULL,'','delete','批量删除 1 个 章节',NULL,1),(9,'2018-05-13 23:30:08.336348','127.0.0.1','1','CityDict object','create','已添加。',14,1),(10,'2018-05-13 23:30:21.375094','127.0.0.1','2','CityDict object','create','已添加。',14,1),(11,'2018-05-13 23:30:31.684684','127.0.0.1','3','CityDict object','create','已添加。',14,1),(12,'2018-05-13 23:33:40.826502','127.0.0.1','1','上海py1','create','已添加。',15,1),(13,'2018-05-13 23:44:26.925457','127.0.0.1','2','Lesson object','create','已添加。',11,1),(14,'2018-05-13 23:46:54.240883','127.0.0.1','1','Teacher object','create','已添加。',16,1),(15,'2018-05-13 23:50:57.315786','127.0.0.1','2','Teacher object','create','已添加。',16,1),(16,'2018-05-13 23:51:40.049230','127.0.0.1','3','teach3','create','已添加。',16,1),(17,'2018-05-20 17:19:41.524208','127.0.0.1',NULL,'','delete','批量删除 3 个 教师',NULL,1),(18,'2018-05-20 17:20:02.198391','127.0.0.1',NULL,'','delete','批量删除 1 个 课程机构',NULL,1),(19,'2018-05-20 17:20:33.144161','127.0.0.1',NULL,'','delete','批量删除 3 个 城市',NULL,1),(20,'2018-05-20 17:21:43.512186','127.0.0.1','4','北京市','create','已添加。',14,1),(21,'2018-05-20 17:21:57.238971','127.0.0.1','5','上海市','create','已添加。',14,1),(22,'2018-05-20 17:22:08.999644','127.0.0.1','6','南京市','create','已添加。',14,1),(23,'2018-05-20 17:22:23.829492','127.0.0.1','7','广州市','create','已添加。',14,1),(24,'2018-05-20 17:22:33.171026','127.0.0.1','8','杭州市','create','已添加。',14,1),(25,'2018-05-20 17:22:44.877696','127.0.0.1','9','苏州市','create','已添加。',14,1),(26,'2018-05-20 17:35:59.295134','127.0.0.1','2','老男孩教育','create','已添加。',15,1),(27,'2018-05-20 17:38:28.176649','127.0.0.1','3','慕学网','create','已添加。',15,1),(28,'2018-05-20 17:39:21.338690','127.0.0.1','4','慕课网','create','已添加。',15,1),(29,'2018-05-20 17:40:39.261147','127.0.0.1','5','北京大学','create','已添加。',15,1),(30,'2018-05-20 17:41:55.575512','127.0.0.1','6','南郊大学','create','已添加。',15,1),(31,'2018-05-20 17:43:25.834674','127.0.0.1','7','清华大学','create','已添加。',15,1),(32,'2018-05-20 17:44:51.732587','127.0.0.1','8','阿里巴巴IT培训','create','已添加。',15,1),(33,'2018-05-20 17:46:19.937632','127.0.0.1','9','苏州大学','create','已添加。',15,1),(34,'2018-05-20 17:48:00.564388','127.0.0.1','10','腾讯IT培训','create','已添加。',15,1),(35,'2018-05-21 16:52:17.085785','127.0.0.1','6','南京大学','change','已修改 name 。',15,1),(36,'2018-05-23 17:58:25.587081','127.0.0.1','3','java','create','已添加。',10,1),(37,'2018-05-23 17:59:45.885674','127.0.0.1','2','Django进阶教程','change','已修改 course_org 和 image 。',10,1),(38,'2018-05-23 18:00:06.040827','127.0.0.1','2','Django进阶教程','change','没有字段被修改。',10,1),(39,'2018-05-23 18:10:52.494802','127.0.0.1','1','Django入门教程','change','已修改 image 和 detail 。',10,1),(40,'2018-05-23 18:11:36.060294','127.0.0.1','3','java','change','已修改 detail 。',10,1),(41,'2018-05-23 18:11:56.553466','127.0.0.1','2','Django进阶教程','change','已修改 detail 。',10,1),(42,'2018-05-23 18:12:33.023552','127.0.0.1','4','mysql入门','create','已添加。',10,1),(43,'2018-05-23 18:13:03.910319','127.0.0.1','5','mysql入门','create','已添加。',10,1),(44,'2018-05-23 18:13:40.503412','127.0.0.1','6','python入门','create','已添加。',10,1),(45,'2018-05-23 18:14:06.311888','127.0.0.1','7','python入门','create','已添加。',10,1),(46,'2018-05-23 18:14:30.280259','127.0.0.1','8','python入门','create','已添加。',10,1),(47,'2018-05-23 18:15:12.691685','127.0.0.1','9','java进阶','create','已添加。',10,1),(48,'2018-05-23 18:15:33.574879','127.0.0.1','10','java进阶','create','已添加。',10,1),(49,'2018-05-23 18:15:59.787378','127.0.0.1','11','java进阶','create','已添加。',10,1),(50,'2018-05-23 18:16:43.722891','127.0.0.1','12','java高阶','create','已添加。',10,1),(51,'2018-05-23 18:17:13.362586','127.0.0.1','13','java高阶','create','已添加。',10,1),(52,'2018-05-23 18:17:51.675778','127.0.0.1','14','python高阶','create','已添加。',10,1),(53,'2018-05-23 18:18:16.379191','127.0.0.1','15','python高阶','create','已添加。',10,1),(54,'2018-05-23 21:07:04.092463','127.0.0.1','15','python高阶','change','已修改 image 。',10,1),(55,'2018-05-23 21:07:06.756615','127.0.0.1','15','python高阶','change','已修改 image 。',10,1),(56,'2018-05-23 21:07:18.945312','127.0.0.1','15','python高阶','change','没有字段被修改。',10,1),(57,'2018-05-23 21:07:30.152953','127.0.0.1','14','python高阶','change','已修改 image 。',10,1),(58,'2018-05-23 21:07:44.429770','127.0.0.1','13','java高阶','change','已修改 image 。',10,1),(59,'2018-05-23 21:08:04.043892','127.0.0.1','12','java高阶','change','已修改 image 。',10,1),(60,'2018-05-23 21:08:22.365940','127.0.0.1','11','java进阶','change','已修改 image 。',10,1),(61,'2018-05-23 21:08:37.109783','127.0.0.1','10','java进阶','change','已修改 image 。',10,1),(62,'2018-05-23 21:08:53.781737','127.0.0.1','9','java进阶','change','已修改 image 。',10,1),(63,'2018-05-23 21:09:08.999607','127.0.0.1','8','python入门','change','已修改 image 。',10,1),(64,'2018-05-23 21:09:24.992522','127.0.0.1','7','python入门','change','已修改 image 。',10,1),(65,'2018-05-23 21:09:40.072384','127.0.0.1','6','python入门','change','已修改 image 。',10,1),(66,'2018-05-23 21:09:57.147361','127.0.0.1','5','mysql入门','change','已修改 image 。',10,1),(67,'2018-05-23 21:10:10.114103','127.0.0.1','4','mysql入门','change','已修改 image 。',10,1),(68,'2018-05-23 21:10:29.947237','127.0.0.1','3','java入门','change','已修改 image 。',10,1),(69,'2018-05-23 21:11:05.341262','127.0.0.1','2','python进阶教程','change','已修改 name，image，desc 和 detail 。',10,1),(70,'2018-05-23 21:11:32.583820','127.0.0.1','1','python入门','change','已修改 name，image，desc 和 detail 。',10,1),(71,'2018-05-23 21:52:04.762932','127.0.0.1','4','oldboy1','create','已添加。',16,1),(72,'2018-05-23 21:52:31.965488','127.0.0.1','5','oldboy2','create','已添加。',16,1),(73,'2018-05-23 21:53:07.614527','127.0.0.1','6','nanjing1','create','已添加。',16,1),(74,'2018-05-23 21:53:41.078441','127.0.0.1','7','nanjing2','create','已添加。',16,1),(75,'2018-05-23 21:54:09.038041','127.0.0.1','8','nanjing3','create','已添加。',16,1),(76,'2018-05-23 22:18:23.606237','127.0.0.1','16','mysql入门','create','已添加。',10,1),(77,'2018-05-23 22:32:20.412100','127.0.0.1','46','bj3','change','已修改 image 。',16,1),(78,'2018-05-23 22:33:39.509624','127.0.0.1','45','bj2','change','已修改 image 。',16,1),(79,'2018-05-23 22:34:07.342216','127.0.0.1','44','bj1','change','已修改 image 。',16,1),(80,'2018-05-23 22:34:24.173178','127.0.0.1','43','tx1','change','已修改 image 。',16,1),(81,'2018-05-23 22:34:37.894963','127.0.0.1','43','tx1','change','没有字段被修改。',16,1),(82,'2018-05-23 22:35:00.754271','127.0.0.1','42','su3','change','已修改 image 。',16,1),(83,'2018-05-23 22:35:20.146380','127.0.0.1','41','su2','change','已修改 image 。',16,1),(84,'2018-05-23 22:35:35.034231','127.0.0.1','40','su1','change','已修改 image 。',16,1),(85,'2018-05-23 22:35:52.212214','127.0.0.1','39','ali2','change','已修改 image 。',16,1),(86,'2018-05-23 22:36:11.488316','127.0.0.1','38','ali1','change','已修改 image 。',16,1),(87,'2018-05-23 22:36:25.967145','127.0.0.1','26','oldboy1','change','已修改 image 。',16,1),(88,'2018-05-23 22:37:00.359112','127.0.0.1','28','oldboy3','change','已修改 image 。',16,1),(89,'2018-05-23 22:37:11.084725','127.0.0.1','37','qinghua','change','已修改 image 。',16,1),(90,'2018-05-23 22:37:31.003864','127.0.0.1','36','nan3','change','已修改 image 。',16,1),(91,'2018-05-23 22:37:40.621415','127.0.0.1','29','mu1','change','已修改 image 。',16,1),(92,'2018-05-23 22:37:52.021067','127.0.0.1','35','nan2','change','已修改 image 。',16,1),(93,'2018-05-23 22:38:03.158704','127.0.0.1','30','mu2','change','已修改 image 。',16,1),(94,'2018-05-23 22:38:14.898375','127.0.0.1','34','nan1','change','已修改 image 。',16,1),(95,'2018-05-23 22:38:23.900890','127.0.0.1','31','mu1','change','已修改 image 。',16,1),(96,'2018-05-23 22:38:35.464551','127.0.0.1','33','mu2','change','已修改 image 。',16,1),(97,'2018-05-23 22:38:54.997669','127.0.0.1','32','mu2','change','已修改 image 。',16,1),(98,'2018-05-23 22:41:39.252063','127.0.0.1','31','mu1','change','没有字段被修改。',16,1),(99,'2018-05-23 22:42:01.731349','127.0.0.1','27','oldboy2','change','已修改 image 。',16,1),(100,'2018-05-27 14:53:02.400788','127.0.0.1','2','bob1','change','已修改 image 。',7,1),(101,'2018-05-27 14:54:18.782157','127.0.0.1','22','19862681a00@qq.com','change','已修改 nick_name 和 address 。',7,1),(102,'2018-05-28 20:40:33.695139','127.0.0.1','2','python进阶教程','change','没有字段被修改。',10,1),(103,'2018-05-28 21:46:48.863506','127.0.0.1','55','CourseResource object','change','已修改 download 。',13,1),(104,'2018-05-29 12:39:31.320939','127.0.0.1','55','java进阶','change','没有字段被修改。',10,1),(105,'2018-06-02 11:43:52.653629','127.0.0.1','1','游客','create','已添加。',3,1),(106,'2018-06-02 11:45:06.354845','127.0.0.1','32','test1','change','已修改 last_login，groups，nick_name 和 address 。',7,1),(107,'2018-06-02 11:48:21.273993','127.0.0.1','32','test1','change','已修改 is_staff 。',7,1),(108,'2018-06-07 20:04:23.376994','127.0.0.1','55','CourseResource object','change','没有字段被修改。',13,1),(109,'2018-06-07 20:05:05.581408','127.0.0.1','39','CourseResource object','change','没有字段被修改。',13,1),(110,'2018-06-07 20:13:48.566321','127.0.0.1',NULL,'','delete','批量删除 1 个 课程资源',NULL,1),(111,'2018-06-07 20:15:20.941605','127.0.0.1','64','CourseResource object','create','已添加。',13,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'dashboard:home:pos','',21),(3,'users_userprofile_editform_portal','box-0,box-2,box-1,box-3,box-4|box-5',1),(4,'dashboard:home:pos','',32);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-07 22:20:27
