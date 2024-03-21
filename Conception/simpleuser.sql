-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: dbforuser
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_emailaddress_user_id_email_987c8728_uniq` (`user_id`,`email`),
  KEY `account_emailaddress_upper` ((upper(`email`))),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'moisechristianjunior464@gmail.com',0,1,1),(2,'lorie@gmail.com',0,1,2),(3,'guest@test.com',0,1,3),(4,'test@mail.test',0,1,4);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add email address',9,'add_emailaddress'),(34,'Can change email address',9,'change_emailaddress'),(35,'Can delete email address',9,'delete_emailaddress'),(36,'Can view email address',9,'view_emailaddress'),(37,'Can add email confirmation',10,'add_emailconfirmation'),(38,'Can change email confirmation',10,'change_emailconfirmation'),(39,'Can delete email confirmation',10,'delete_emailconfirmation'),(40,'Can view email confirmation',10,'view_emailconfirmation'),(41,'Can add social account',11,'add_socialaccount'),(42,'Can change social account',11,'change_socialaccount'),(43,'Can delete social account',11,'delete_socialaccount'),(44,'Can view social account',11,'view_socialaccount'),(45,'Can add social application',12,'add_socialapp'),(46,'Can change social application',12,'change_socialapp'),(47,'Can delete social application',12,'delete_socialapp'),(48,'Can view social application',12,'view_socialapp'),(49,'Can add social application token',13,'add_socialtoken'),(50,'Can change social application token',13,'change_socialtoken'),(51,'Can delete social application token',13,'delete_socialtoken'),(52,'Can view social application token',13,'view_socialtoken'),(53,'Can add health_ problem',14,'add_health_problem'),(54,'Can change health_ problem',14,'change_health_problem'),(55,'Can delete health_ problem',14,'delete_health_problem'),(56,'Can view health_ problem',14,'view_health_problem'),(57,'Can add simple_ user',15,'add_simple_user'),(58,'Can change simple_ user',15,'change_simple_user'),(59,'Can delete simple_ user',15,'delete_simple_user'),(60,'Can view simple_ user',15,'view_simple_user'),(61,'Can add city',16,'add_city'),(62,'Can change city',16,'change_city'),(63,'Can delete city',16,'delete_city'),(64,'Can view city',16,'view_city'),(65,'Can add country',17,'add_country'),(66,'Can change country',17,'change_country'),(67,'Can delete country',17,'delete_country'),(68,'Can view country',17,'view_country'),(69,'Can add menu',18,'add_menu'),(70,'Can change menu',18,'change_menu'),(71,'Can delete menu',18,'delete_menu'),(72,'Can view menu',18,'view_menu'),(73,'Can add plat',19,'add_plat'),(74,'Can change plat',19,'change_plat'),(75,'Can delete plat',19,'delete_plat'),(76,'Can view plat',19,'view_plat'),(77,'Can add quartier',20,'add_quartier'),(78,'Can change quartier',20,'change_quartier'),(79,'Can delete quartier',20,'delete_quartier'),(80,'Can view quartier',20,'view_quartier'),(81,'Can add restaurant',21,'add_restaurant'),(82,'Can change restaurant',21,'change_restaurant'),(83,'Can delete restaurant',21,'delete_restaurant'),(84,'Can view restaurant',21,'view_restaurant'),(85,'Can add plat menu',22,'add_platmenu'),(86,'Can change plat menu',22,'change_platmenu'),(87,'Can delete plat menu',22,'delete_platmenu'),(88,'Can view plat menu',22,'view_platmenu'),(89,'Can add ingredient',23,'add_ingredient'),(90,'Can change ingredient',23,'change_ingredient'),(91,'Can delete ingredient',23,'delete_ingredient'),(92,'Can view ingredient',23,'view_ingredient'),(93,'Can add commande',24,'add_commande'),(94,'Can change commande',24,'change_commande'),(95,'Can delete commande',24,'delete_commande'),(96,'Can view commande',24,'view_commande'),(97,'Can add apreciation user',25,'add_apreciationuser'),(98,'Can change apreciation user',25,'change_apreciationuser'),(99,'Can delete apreciation user',25,'delete_apreciationuser'),(100,'Can view apreciation user',25,'view_apreciationuser'),(101,'Can add rechercher plat',26,'add_rechercherplat'),(102,'Can change rechercher plat',26,'change_rechercherplat'),(103,'Can delete rechercher plat',26,'delete_rechercherplat'),(104,'Can view rechercher plat',26,'view_rechercherplat'),(105,'Can add rechercher par description',27,'add_rechercherpardescription'),(106,'Can change rechercher par description',27,'change_rechercherpardescription'),(107,'Can delete rechercher par description',27,'delete_rechercherpardescription'),(108,'Can view rechercher par description',27,'view_rechercherpardescription'),(109,'Can add rechercher par image',28,'add_rechercherparimage'),(110,'Can change rechercher par image',28,'change_rechercherparimage'),(111,'Can delete rechercher par image',28,'delete_rechercherparimage'),(112,'Can view rechercher par image',28,'view_rechercherparimage'),(113,'Can add plat health pb',29,'add_plathealthpb'),(114,'Can change plat health pb',29,'change_plathealthpb'),(115,'Can delete plat health pb',29,'delete_plathealthpb'),(116,'Can view plat health pb',29,'view_plathealthpb');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$9kVGxp3BSiWps02TTtjGPI$zCCURvCFYzIZNsDYOYJBT44qqFQxnMh3N2M5IfOL2uY=','2024-01-19 21:01:12.717785',0,'MEKA','MOISE CHRISTIAN JUNIOR','MEKA','moisechristianjunior464@gmail.com',0,1,'2023-12-30 02:31:55.256703'),(2,'pbkdf2_sha256$600000$manIMwsgkXzuaJSuEbr4JT$BQxfIqs1rJiSR5tDFFa7QaI+1uXIsf2pf3fqmIlipeg=','2024-01-01 20:23:24.171117',0,'lorie','','','lorie@gmail.com',0,1,'2023-12-31 00:09:05.748017'),(3,'pbkdf2_sha256$600000$4ZM6HJZCw6YvsjOpVmq8cW$ExURXL9ZNqrP1plfGaDrU5euvs4umD5v1f4H1G4Zh9o=','2024-01-19 11:37:32.478170',0,'guest','','','guest@test.com',0,1,'2024-01-19 11:37:30.069451'),(4,'pbkdf2_sha256$600000$Jzd68EB8nzgvxO3dgYaDRI$wb9CHccc5VRI5HbzrA48jcZyaxFWWE2gVkI5+BgNr2s=','2024-01-19 11:50:26.065879',0,'test','','','test@mail.test',0,1,'2024-01-19 11:50:24.085107');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('cabaff54e23d3bd3504a216d456d9a15e36fd9bf','2024-01-01 20:23:24.154521',2),('fa5f5bcc0d4f6e6004deaa0273b631bddc4075fe','2023-12-30 10:15:01.534158',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'account','emailaddress'),(10,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(25,'shopapp','apreciationuser'),(16,'shopapp','city'),(24,'shopapp','commande'),(17,'shopapp','country'),(23,'shopapp','ingredient'),(18,'shopapp','menu'),(19,'shopapp','plat'),(29,'shopapp','plathealthpb'),(22,'shopapp','platmenu'),(20,'shopapp','quartier'),(27,'shopapp','rechercherpardescription'),(28,'shopapp','rechercherparimage'),(26,'shopapp','rechercherplat'),(21,'shopapp','restaurant'),(11,'socialaccount','socialaccount'),(12,'socialaccount','socialapp'),(13,'socialaccount','socialtoken'),(14,'userapp','health_problem'),(15,'userapp','simple_user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-30 01:46:25.024226'),(2,'auth','0001_initial','2023-12-30 01:46:26.192639'),(3,'account','0001_initial','2023-12-30 01:46:26.644084'),(4,'account','0002_email_max_length','2023-12-30 01:46:26.717675'),(5,'account','0003_alter_emailaddress_create_unique_verified_email','2023-12-30 01:46:26.843198'),(6,'account','0004_alter_emailaddress_drop_unique_email','2023-12-30 01:46:26.978994'),(7,'account','0005_emailaddress_idx_upper_email','2023-12-30 01:46:27.083130'),(8,'admin','0001_initial','2023-12-30 01:46:27.428435'),(9,'admin','0002_logentry_remove_auto_add','2023-12-30 01:46:27.467178'),(10,'admin','0003_logentry_add_action_flag_choices','2023-12-30 01:46:27.518120'),(11,'contenttypes','0002_remove_content_type_name','2023-12-30 01:46:27.737987'),(12,'auth','0002_alter_permission_name_max_length','2023-12-30 01:46:27.942467'),(13,'auth','0003_alter_user_email_max_length','2023-12-30 01:46:28.086335'),(14,'auth','0004_alter_user_username_opts','2023-12-30 01:46:28.140557'),(15,'auth','0005_alter_user_last_login_null','2023-12-30 01:46:28.332994'),(16,'auth','0006_require_contenttypes_0002','2023-12-30 01:46:28.345932'),(17,'auth','0007_alter_validators_add_error_messages','2023-12-30 01:46:28.392766'),(18,'auth','0008_alter_user_username_max_length','2023-12-30 01:46:28.602008'),(19,'auth','0009_alter_user_last_name_max_length','2023-12-30 01:46:28.797546'),(20,'auth','0010_alter_group_name_max_length','2023-12-30 01:46:28.889052'),(21,'auth','0011_update_proxy_permissions','2023-12-30 01:46:28.940912'),(22,'auth','0012_alter_user_first_name_max_length','2023-12-30 01:46:29.153341'),(23,'authtoken','0001_initial','2023-12-30 01:46:29.397526'),(24,'authtoken','0002_auto_20160226_1747','2023-12-30 01:46:29.551022'),(25,'authtoken','0003_tokenproxy','2023-12-30 01:46:29.566708'),(26,'sessions','0001_initial','2023-12-30 01:46:29.684648'),(27,'userapp','0001_initial','2023-12-30 01:46:30.352964'),(28,'userapp','0002_alter_simple_user_date_of_birth','2023-12-30 01:46:30.429845'),(29,'userapp','0003_alter_simple_user_date_of_birth','2023-12-30 01:46:30.499046'),(30,'shopapp','0001_initial','2023-12-30 01:46:32.716316'),(31,'shopapp','0002_alter_commande_date_commande_alter_ingredient_id_and_more','2023-12-30 01:46:34.845373'),(32,'shopapp','0003_alter_commande_date_commande','2023-12-30 01:46:34.911946'),(33,'shopapp','0004_alter_commande_date_commande','2023-12-30 01:46:34.998081'),(34,'shopapp','0005_alter_commande_date_commande','2023-12-30 01:46:35.072752'),(35,'shopapp','0006_restaurant_livraison_service_and_more','2023-12-30 01:46:35.266634'),(36,'shopapp','0007_alter_commande_date_commande','2023-12-30 01:46:35.336422'),(37,'socialaccount','0001_initial','2023-12-30 01:46:36.242366'),(38,'socialaccount','0002_token_max_lengths','2023-12-30 01:46:36.453948'),(39,'socialaccount','0003_extra_data_default_dict','2023-12-30 01:46:36.522109'),(40,'socialaccount','0004_app_provider_id_settings','2023-12-30 01:46:36.945254'),(41,'socialaccount','0005_socialtoken_nullable_app','2023-12-30 01:46:37.357325'),(42,'userapp','0004_alter_simple_user_date_of_birth','2023-12-30 01:46:37.435274'),(43,'userapp','0005_alter_simple_user_date_of_birth','2023-12-30 01:46:37.512351'),(44,'userapp','0006_alter_simple_user_date_of_birth','2023-12-30 01:46:37.578125'),(45,'userapp','0007_alter_simple_user_date_of_birth','2023-12-30 01:46:37.649909'),(46,'userapp','0008_alter_simple_user_date_of_birth','2023-12-30 01:46:37.726677'),(47,'userapp','0009_alter_simple_user_date_of_birth','2023-12-30 01:46:37.806092'),(48,'shopapp','0008_alter_commande_date_commande','2023-12-30 10:09:03.699380'),(49,'userapp','0010_alter_simple_user_date_of_birth','2023-12-30 10:09:03.794414'),(50,'shopapp','0009_alter_commande_date_commande','2023-12-30 22:31:46.580202'),(51,'userapp','0011_alter_simple_user_date_of_birth','2023-12-30 22:31:46.606783'),(52,'shopapp','0010_remove_ingredient_plat_plat_ingredients_and_more','2023-12-30 23:09:27.457334'),(53,'userapp','0012_alter_simple_user_date_of_birth','2023-12-30 23:09:27.502923'),(54,'userapp','0013_alter_simple_user_date_of_birth','2023-12-31 10:05:54.622129'),(55,'shopapp','0011_remove_platmenu_nb_etoile_and_more','2023-12-31 10:05:55.112515'),(56,'shopapp','0012_alter_commande_date_commande','2023-12-31 19:15:25.695066'),(57,'userapp','0014_alter_simple_user_date_of_birth','2023-12-31 19:15:25.744742'),(58,'shopapp','0013_rechercherplat_alter_commande_date_commande_and_more','2024-01-01 18:25:05.783458'),(59,'userapp','0015_alter_simple_user_date_of_birth','2024-01-01 18:25:05.803391'),(60,'shopapp','0014_alter_commande_date_commande_and_more','2024-01-01 19:23:35.425636'),(61,'userapp','0016_alter_simple_user_date_of_birth','2024-01-01 19:23:35.449172'),(62,'shopapp','0015_alter_commande_date_commande_and_more','2024-01-01 19:46:31.792046'),(63,'userapp','0017_alter_simple_user_date_of_birth','2024-01-01 19:46:31.815117'),(64,'userapp','0018_alter_simple_user_date_of_birth','2024-01-05 00:25:44.063849'),(65,'shopapp','0016_alter_commande_date_commande_and_more','2024-01-05 00:25:44.533785'),(66,'shopapp','0017_commande_quantite_alter_commande_date_commande_and_more','2024-01-07 19:21:49.051037'),(67,'userapp','0019_alter_simple_user_date_of_birth','2024-01-07 19:21:49.109654'),(68,'shopapp','0018_commande_date_delai_alter_commande_date_commande_and_more','2024-01-19 05:57:25.163089'),(69,'userapp','0020_alter_simple_user_date_of_birth','2024-01-19 05:57:25.216012');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('111f9y7ix9cc5pmc8g2mk7ve6u2aroou','.eJxVjDsOwjAQBe_iGlnxZx2Zkp4zWOvdDQ4gW4qTCnF3iJQC2jcz76USbmtJW5clzazOyqjT75aRHlJ3wHest6ap1XWZs94VfdCur43leTncv4OCvXxrnxnJuRCJecCRQNDA6IBEAhlrPBAEJ2ziMAXnJouUwYJEnz0Z8ur9AfyqOEw:1rLY5f:7LpMOgLpKFQhWQwAWzr3jiPzQN5E4gD15oCzAjYVmCY','2024-01-19 00:29:35.875505'),('8svewu8pfa3sp9x3e6a8s4zfs5qz60gz','.eJxVjDsOwjAQBe_iGlnxZx2Zkp4zWOvdDQ4gW4qTCnF3iJQC2jcz76USbmtJW5clzazOyqjT75aRHlJ3wHest6ap1XWZs94VfdCur43leTncv4OCvXxrnxnJuRCJecCRQNDA6IBEAhlrPBAEJ2ziMAXnJouUwYJEnz0Z8ur9AfyqOEw:1rQvC8:IrnFSoXS3y840kIGwaqHH06_eYzkHxaceClJj7MjpWI','2024-02-02 20:10:28.797383'),('ggltixmqzjbw296nethjwcv65kwhwrk5','.eJxVjDsOwjAQBe_iGlnxZx2Zkp4zWOvdDQ4gW4qTCnF3iJQC2jcz76USbmtJW5clzazOyqjT75aRHlJ3wHest6ap1XWZs94VfdCur43leTncv4OCvXxrnxnJuRCJecCRQNDA6IBEAhlrPBAEJ2ziMAXnJouUwYJEnz0Z8ur9AfyqOEw:1rJWMv:z3CuVTqMycb8Ba7KRMYDXlPPnLKjcsP36L1oyBXn2V0','2024-01-13 10:15:01.675887'),('ginbbjubdkkcswum03g1az2d20betljp','.eJxVjDsOwjAQBe_iGln-fyjpOYO163VwANlSnFSIu0OkFNC-mXkvlmBba9pGWdJM7MwUO_1uCPlR2g7oDu3Wee5tXWbku8IPOvi1U3leDvfvoMKo31rHEJSXULBgNlE5LGSDRQMiGJEJMU5Oax-1kkRaWogewaGQk3UgFHt_AOaKN8k:1rKOom:5WUxNMyW47W0Lwj_NqdD5KTdtKWVAHybzBBHZtaqnO0','2024-01-15 20:23:24.190271'),('mgdmuf8byrqppwjxyx9wtchdwl4580me','.eJxVjssOwiAURP-FtSHA5enSvd9A7gVqqwaSlq6M_25rutDtnJmTebGIax_jupQ5TpmdmWKn34wwPUrdQb5jvTWeWu3zRHyv8IMu_NpyeV6O7p9gxGXc1hC8V05ioUJJB2WpZOMNaRRei5SJwmABXAAlcwZpMDhCS0IOxqLYX2FKba396y61Twl7yRE7O0snNr8EbTkAWK_8-wNeNUX_:1rJjO6:wIHNnMjMsgXy8eiJ9MFFX3Lf0exGxg_ZX0MO3UmOP5E','2024-01-14 00:09:06.354556'),('oud4ty7vrib2sgnqkzuo8thva39d3mqo','.eJxVj8EOgyAQRP-Fc0NAWA0ee-83kGVZK63FRKGXpv9eTezB67yZl8xHINFcc_FvXtKQOHp-YZpEn-s0XYTHWkZfV158iqIXWpyygPTkvIP4wHyfJc25LCnIvSIPusrbHHm6Ht2TYMR13NY2RCRjWkcxKuwIGDV0Boi5Jd1oCwSt4aidGlpjhgYpQAPsbLCkyW7S_4_dzbkkwrKdwSJ63SnjlAHdSdWAA2W_P-w5Udo:1rJP8n:efCf94bx0iFHyRPJwv8UomWioJFO_eFHv9ls6KhEewc','2024-01-13 02:31:57.048289'),('p8w6u3n7iju8lrp6v7ty3mfva7b0df8i','e30:1rQn1a:JOYQvoVG2rkjHsDdSYwXyH2BYvgsPQnFKfLmiwVEWmk','2024-02-02 11:27:02.038186'),('qvmxe5rhd4c764fobwxyziq4orjnrtef','.eJxVjEEOgjAQRe_StWmK7RSGpXvPQKYzg6CmJFBWxrsLhoVu_3v_vUxHaxm6ddG5G8W0JpjT75aIH5p3IHfKt8nylMs8Jrsr9qCLvU6iz8vh_gUGWobtzYFAfNWE5AM4dE4QCPsUg4JUygGFPCRG1N5HoTqCr11k5T5QQtyixDytuXzbmsvIVFQ6KqatagcxgjtH62poKoT3B3F7Rnc:1rQnOE:IuqJgty9xNMFijZUBuZUm9oajHByEVuoumBT4Jl2aiM','2024-02-02 11:50:26.106197'),('u19gqk2jflpdqqufumthwt5pgjogrqfb','.eJxVjDsOwjAQBe_iGlnxZx2Zkp4zWOvdDQ4gW4qTCnF3iJQC2jcz76USbmtJW5clzazOyqjT75aRHlJ3wHest6ap1XWZs94VfdCur43leTncv4OCvXxrnxnJuRCJecCRQNDA6IBEAhlrPBAEJ2ziMAXnJouUwYJEnz0Z8ur9AfyqOEw:1rQvzE:Orw6G6FQv6vkQ3OfMLn0YsYLr-K4POj5s9_wySLfaD0','2024-02-02 21:01:12.725249'),('y5eeyydye9ux88i1w4kdl35u9ymugyok','e30:1rQmkv:QdvVcNxzDjSzxyCgDXxSXZl-xajFCWk5-qSLqeQsLSs','2024-02-02 11:09:49.565693');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_apreciationuser`
--

DROP TABLE IF EXISTS `shopapp_apreciationuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_apreciationuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nb_etoile` int NOT NULL,
  `plat_id` int unsigned NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_apreciationuser_plat_id_dad7fbf2_fk_shopapp_platmenu_id` (`plat_id`),
  KEY `shopapp_apreciationu_utilisateur_id_90296739_fk_userapp_s` (`utilisateur_id`),
  CONSTRAINT `shopapp_apreciationu_utilisateur_id_90296739_fk_userapp_s` FOREIGN KEY (`utilisateur_id`) REFERENCES `userapp_simple_user` (`id`),
  CONSTRAINT `shopapp_apreciationuser_plat_id_dad7fbf2_fk_shopapp_platmenu_id` FOREIGN KEY (`plat_id`) REFERENCES `shopapp_platmenu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_apreciationuser`
--

LOCK TABLES `shopapp_apreciationuser` WRITE;
/*!40000 ALTER TABLE `shopapp_apreciationuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopapp_apreciationuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_city`
--

DROP TABLE IF EXISTS `shopapp_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_city` (
  `id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_city_country_id_00e5d9ca_fk_shopapp_country_id` (`country_id`),
  CONSTRAINT `shopapp_city_country_id_00e5d9ca_fk_shopapp_country_id` FOREIGN KEY (`country_id`) REFERENCES `shopapp_country` (`id`),
  CONSTRAINT `shopapp_city_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_city`
--

LOCK TABLES `shopapp_city` WRITE;
/*!40000 ALTER TABLE `shopapp_city` DISABLE KEYS */;
INSERT INTO `shopapp_city` VALUES (2,'Douala',7);
/*!40000 ALTER TABLE `shopapp_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_commande`
--

DROP TABLE IF EXISTS `shopapp_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_commande` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `date_commande` datetime(6) NOT NULL,
  `plat_id` int unsigned NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  `utilisateur_id` bigint NOT NULL,
  `quantite` int NOT NULL,
  `date_delai` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_commande_restaurant_id_8fce531d_fk_shopapp_restaurant_id` (`restaurant_id`),
  KEY `shopapp_commande_utilisateur_id_9ebbdfa0_fk_userapp_s` (`utilisateur_id`),
  KEY `shopapp_commande_plat_id_d34bc1f1_fk` (`plat_id`),
  CONSTRAINT `shopapp_commande_plat_id_d34bc1f1_fk` FOREIGN KEY (`plat_id`) REFERENCES `shopapp_plat` (`id`),
  CONSTRAINT `shopapp_commande_restaurant_id_8fce531d_fk_shopapp_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `shopapp_restaurant` (`id`),
  CONSTRAINT `shopapp_commande_utilisateur_id_9ebbdfa0_fk_userapp_s` FOREIGN KEY (`utilisateur_id`) REFERENCES `userapp_simple_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_commande`
--

LOCK TABLES `shopapp_commande` WRITE;
/*!40000 ALTER TABLE `shopapp_commande` DISABLE KEYS */;
INSERT INTO `shopapp_commande` VALUES (1,'IWVJCQBJQZBPPSHSPHXU','En cours','2024-01-19 21:19:00.000000',2,3,1,2,'2024-01-21 21:19:00.000000'),(2,'CAGLEPZXDMGXSKSGZUNO','En cours','2024-01-19 21:28:00.000000',2,3,2,1,'2024-01-19 21:28:00.000000');
/*!40000 ALTER TABLE `shopapp_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_country`
--

DROP TABLE IF EXISTS `shopapp_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_country` (
  `id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `shopapp_country_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_country`
--

LOCK TABLES `shopapp_country` WRITE;
/*!40000 ALTER TABLE `shopapp_country` DISABLE KEYS */;
INSERT INTO `shopapp_country` VALUES (7,'TestPays2');
/*!40000 ALTER TABLE `shopapp_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_ingredient`
--

DROP TABLE IF EXISTS `shopapp_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_ingredient` (
  `id` int unsigned NOT NULL,
  `nom_ingredient` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom_ingredient` (`nom_ingredient`),
  CONSTRAINT `shopapp_ingredient_id_406ebfb0_check` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_ingredient`
--

LOCK TABLES `shopapp_ingredient` WRITE;
/*!40000 ALTER TABLE `shopapp_ingredient` DISABLE KEYS */;
INSERT INTO `shopapp_ingredient` VALUES (1,'okok','legume d\'origine africaine');
/*!40000 ALTER TABLE `shopapp_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_menu`
--

DROP TABLE IF EXISTS `shopapp_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_menu` (
  `id` int unsigned NOT NULL,
  `numero` varchar(20) NOT NULL,
  `jour_semaine` varchar(10) NOT NULL,
  `restaurant_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `shopapp_menu_restaurant_id_b4e060e1_fk_shopapp_restaurant_id` (`restaurant_id`),
  CONSTRAINT `shopapp_menu_restaurant_id_b4e060e1_fk_shopapp_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `shopapp_restaurant` (`id`),
  CONSTRAINT `shopapp_menu_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_menu`
--

LOCK TABLES `shopapp_menu` WRITE;
/*!40000 ALTER TABLE `shopapp_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopapp_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_plat`
--

DROP TABLE IF EXISTS `shopapp_plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_plat` (
  `id` int unsigned NOT NULL,
  `nom_plat` varchar(255) NOT NULL,
  `description` longtext,
  `image_plat` varchar(100) DEFAULT NULL,
  `recette` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom_plat` (`nom_plat`),
  CONSTRAINT `shopapp_plat_id_691aa5d9_check` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_plat`
--

LOCK TABLES `shopapp_plat` WRITE;
/*!40000 ALTER TABLE `shopapp_plat` DISABLE KEYS */;
INSERT INTO `shopapp_plat` VALUES (2,'Eru2','Plat préféré des camerounais',NULL,'Juste un test'),(3,'Eru3','plat du cameroun','/media/plat_img/eru0007_7WxDSGg.jpg','Juste un test'),(4,'Eru4','plat du cameroun',NULL,'Juste un test'),(5,'Eru5','plat du cameroun',NULL,'Juste un test'),(6,'Eru6','plat du cameroun',NULL,'Juste un test'),(7,'Eru7','plat du cameroun',NULL,'Juste un test'),(8,'Eru8','plat du cameroun',NULL,'Juste un test');
/*!40000 ALTER TABLE `shopapp_plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_plat_ingredients`
--

DROP TABLE IF EXISTS `shopapp_plat_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_plat_ingredients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plat_id` int unsigned NOT NULL,
  `ingredient_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shopapp_plat_ingredients_plat_id_ingredient_id_c22bf35f_uniq` (`plat_id`,`ingredient_id`),
  KEY `shopapp_plat_ingredi_ingredient_id_6c9f3929_fk_shopapp_i` (`ingredient_id`),
  CONSTRAINT `shopapp_plat_ingredi_ingredient_id_6c9f3929_fk_shopapp_i` FOREIGN KEY (`ingredient_id`) REFERENCES `shopapp_ingredient` (`id`),
  CONSTRAINT `shopapp_plat_ingredients_plat_id_0738d0cf_fk_shopapp_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `shopapp_plat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_plat_ingredients`
--

LOCK TABLES `shopapp_plat_ingredients` WRITE;
/*!40000 ALTER TABLE `shopapp_plat_ingredients` DISABLE KEYS */;
INSERT INTO `shopapp_plat_ingredients` VALUES (1,7,1),(2,8,1);
/*!40000 ALTER TABLE `shopapp_plat_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_plathealthpb`
--

DROP TABLE IF EXISTS `shopapp_plathealthpb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_plathealthpb` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `health_pb_id` bigint NOT NULL,
  `plat_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_plathealthpb_health_pb_id_bb2c5ef6_fk_userapp_h` (`health_pb_id`),
  KEY `shopapp_plathealthpb_plat_id_5e060368_fk_shopapp_plat_id` (`plat_id`),
  CONSTRAINT `shopapp_plathealthpb_health_pb_id_bb2c5ef6_fk_userapp_h` FOREIGN KEY (`health_pb_id`) REFERENCES `userapp_health_problem` (`id`),
  CONSTRAINT `shopapp_plathealthpb_plat_id_5e060368_fk_shopapp_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `shopapp_plat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_plathealthpb`
--

LOCK TABLES `shopapp_plathealthpb` WRITE;
/*!40000 ALTER TABLE `shopapp_plathealthpb` DISABLE KEYS */;
INSERT INTO `shopapp_plathealthpb` VALUES (1,1,2),(2,4,4);
/*!40000 ALTER TABLE `shopapp_plathealthpb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_platmenu`
--

DROP TABLE IF EXISTS `shopapp_platmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_platmenu` (
  `id` int unsigned NOT NULL,
  `prix` int NOT NULL,
  `quantite` int NOT NULL,
  `unite_quantite` varchar(255) NOT NULL,
  `menu_id` int unsigned NOT NULL,
  `plat_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_platmenu_menu_id_dc52f0f5_fk_shopapp_menu_id` (`menu_id`),
  KEY `shopapp_platmenu_plat_id_5f75a8a7_fk` (`plat_id`),
  CONSTRAINT `shopapp_platmenu_menu_id_dc52f0f5_fk_shopapp_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `shopapp_menu` (`id`),
  CONSTRAINT `shopapp_platmenu_plat_id_5f75a8a7_fk` FOREIGN KEY (`plat_id`) REFERENCES `shopapp_plat` (`id`),
  CONSTRAINT `shopapp_platmenu_id_7b324a55_check` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_platmenu`
--

LOCK TABLES `shopapp_platmenu` WRITE;
/*!40000 ALTER TABLE `shopapp_platmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopapp_platmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_quartier`
--

DROP TABLE IF EXISTS `shopapp_quartier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_quartier` (
  `id` int unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `city_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_quartier_city_id_01fc2375_fk_shopapp_city_id` (`city_id`),
  CONSTRAINT `shopapp_quartier_city_id_01fc2375_fk_shopapp_city_id` FOREIGN KEY (`city_id`) REFERENCES `shopapp_city` (`id`),
  CONSTRAINT `shopapp_quartier_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_quartier`
--

LOCK TABLES `shopapp_quartier` WRITE;
/*!40000 ALTER TABLE `shopapp_quartier` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopapp_quartier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_rechercherpardescription`
--

DROP TABLE IF EXISTS `shopapp_rechercherpardescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_rechercherpardescription` (
  `rechercherplat_ptr_id` bigint NOT NULL,
  `texte_description` longtext NOT NULL,
  PRIMARY KEY (`rechercherplat_ptr_id`),
  CONSTRAINT `shopapp_rechercherpa_rechercherplat_ptr_i_3af5e77a_fk_shopapp_r` FOREIGN KEY (`rechercherplat_ptr_id`) REFERENCES `shopapp_rechercherplat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_rechercherpardescription`
--

LOCK TABLES `shopapp_rechercherpardescription` WRITE;
/*!40000 ALTER TABLE `shopapp_rechercherpardescription` DISABLE KEYS */;
INSERT INTO `shopapp_rechercherpardescription` VALUES (1,'Couscous avec viande de boeuf, okok'),(2,'Poulet avec riz');
/*!40000 ALTER TABLE `shopapp_rechercherpardescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_rechercherparimage`
--

DROP TABLE IF EXISTS `shopapp_rechercherparimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_rechercherparimage` (
  `rechercherplat_ptr_id` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`rechercherplat_ptr_id`),
  CONSTRAINT `shopapp_rechercherpa_rechercherplat_ptr_i_a711b328_fk_shopapp_r` FOREIGN KEY (`rechercherplat_ptr_id`) REFERENCES `shopapp_rechercherplat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_rechercherparimage`
--

LOCK TABLES `shopapp_rechercherparimage` WRITE;
/*!40000 ALTER TABLE `shopapp_rechercherparimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopapp_rechercherparimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_rechercherplat`
--

DROP TABLE IF EXISTS `shopapp_rechercherplat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_rechercherplat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) DEFAULT NULL,
  `date_recherche` datetime(6) NOT NULL,
  `resultat` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_rechercherplat_user_id_601ca326_fk_auth_user_id` (`user_id`),
  CONSTRAINT `shopapp_rechercherplat_user_id_601ca326_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_rechercherplat`
--

LOCK TABLES `shopapp_rechercherplat` WRITE;
/*!40000 ALTER TABLE `shopapp_rechercherplat` DISABLE KEYS */;
INSERT INTO `shopapp_rechercherplat` VALUES (1,'QSJALMBPCGQBYZCXTXAP','2024-01-01 20:20:42.924220','eru',1),(2,'RVHKNZNSGZVZUDHAABTL','2024-01-01 20:21:43.812799','riz sauce arachide',2);
/*!40000 ALTER TABLE `shopapp_rechercherplat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_restaurant`
--

DROP TABLE IF EXISTS `shopapp_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_restaurant` (
  `id` int unsigned NOT NULL,
  `restorent_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `quartier_id` int unsigned DEFAULT NULL,
  `livraison_service` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_restaurant_quartier_id_1de82581_fk_shopapp_quartier_id` (`quartier_id`),
  CONSTRAINT `shopapp_restaurant_quartier_id_1de82581_fk_shopapp_quartier_id` FOREIGN KEY (`quartier_id`) REFERENCES `shopapp_quartier` (`id`),
  CONSTRAINT `shopapp_restaurant_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_restaurant`
--

LOCK TABLES `shopapp_restaurant` WRITE;
/*!40000 ALTER TABLE `shopapp_restaurant` DISABLE KEYS */;
INSERT INTO `shopapp_restaurant` VALUES (3,'Guest testo','+237698246125',0,0,NULL,NULL,1);
/*!40000 ALTER TABLE `shopapp_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(200) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `provider_id` varchar(200) NOT NULL,
  `settings` json NOT NULL DEFAULT (_utf8mb3'{}'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_health_problem`
--

DROP TABLE IF EXISTS `userapp_health_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_health_problem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_health_problem`
--

LOCK TABLES `userapp_health_problem` WRITE;
/*!40000 ALTER TABLE `userapp_health_problem` DISABLE KEYS */;
INSERT INTO `userapp_health_problem` VALUES (1,'hypertension','tttt'),(2,'athérosclérose','tttt'),(3,'diabète','tttt'),(4,'obésité','tttt');
/*!40000 ALTER TABLE `userapp_health_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_simple_user`
--

DROP TABLE IF EXISTS `userapp_simple_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_simple_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_of_birth` date NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `size` double NOT NULL,
  `weigth` double NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `account_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`),
  CONSTRAINT `userapp_simple_user_account_id_1245347f_fk_auth_user_id` FOREIGN KEY (`account_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_simple_user`
--

LOCK TABLES `userapp_simple_user` WRITE;
/*!40000 ALTER TABLE `userapp_simple_user` DISABLE KEYS */;
INSERT INTO `userapp_simple_user` VALUES (1,'1999-12-06','',1.55,47,'+237698246125','m',0,0,1),(2,'2004-02-24','',1.55,55,'+237657848837','f',0,0,2);
/*!40000 ALTER TABLE `userapp_simple_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_simple_user_health_problem`
--

DROP TABLE IF EXISTS `userapp_simple_user_health_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userapp_simple_user_health_problem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `simple_user_id` bigint NOT NULL,
  `health_problem_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userapp_simple_user_heal_simple_user_id_health_pr_d446a614_uniq` (`simple_user_id`,`health_problem_id`),
  KEY `userapp_simple_user__health_problem_id_58ec496e_fk_userapp_h` (`health_problem_id`),
  CONSTRAINT `userapp_simple_user__health_problem_id_58ec496e_fk_userapp_h` FOREIGN KEY (`health_problem_id`) REFERENCES `userapp_health_problem` (`id`),
  CONSTRAINT `userapp_simple_user__simple_user_id_36ff8aa3_fk_userapp_s` FOREIGN KEY (`simple_user_id`) REFERENCES `userapp_simple_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_simple_user_health_problem`
--

LOCK TABLES `userapp_simple_user_health_problem` WRITE;
/*!40000 ALTER TABLE `userapp_simple_user_health_problem` DISABLE KEYS */;
INSERT INTO `userapp_simple_user_health_problem` VALUES (2,1,4);
/*!40000 ALTER TABLE `userapp_simple_user_health_problem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 22:25:41
