-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: dbforapp
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'moisechristianjunior464@gmail.com',0,1,1),(2,'lorie@gmail.com',0,1,2),(3,'guest@test.com',0,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add email address',9,'add_emailaddress'),(34,'Can change email address',9,'change_emailaddress'),(35,'Can delete email address',9,'delete_emailaddress'),(36,'Can view email address',9,'view_emailaddress'),(37,'Can add email confirmation',10,'add_emailconfirmation'),(38,'Can change email confirmation',10,'change_emailconfirmation'),(39,'Can delete email confirmation',10,'delete_emailconfirmation'),(40,'Can view email confirmation',10,'view_emailconfirmation'),(41,'Can add social account',11,'add_socialaccount'),(42,'Can change social account',11,'change_socialaccount'),(43,'Can delete social account',11,'delete_socialaccount'),(44,'Can view social account',11,'view_socialaccount'),(45,'Can add social application',12,'add_socialapp'),(46,'Can change social application',12,'change_socialapp'),(47,'Can delete social application',12,'delete_socialapp'),(48,'Can view social application',12,'view_socialapp'),(49,'Can add social application token',13,'add_socialtoken'),(50,'Can change social application token',13,'change_socialtoken'),(51,'Can delete social application token',13,'delete_socialtoken'),(52,'Can view social application token',13,'view_socialtoken'),(53,'Can add city',14,'add_city'),(54,'Can change city',14,'change_city'),(55,'Can delete city',14,'delete_city'),(56,'Can view city',14,'view_city'),(57,'Can add country',15,'add_country'),(58,'Can change country',15,'change_country'),(59,'Can delete country',15,'delete_country'),(60,'Can view country',15,'view_country'),(61,'Can add menu',16,'add_menu'),(62,'Can change menu',16,'change_menu'),(63,'Can delete menu',16,'delete_menu'),(64,'Can view menu',16,'view_menu'),(65,'Can add plat',17,'add_plat'),(66,'Can change plat',17,'change_plat'),(67,'Can delete plat',17,'delete_plat'),(68,'Can view plat',17,'view_plat'),(69,'Can add quartier',18,'add_quartier'),(70,'Can change quartier',18,'change_quartier'),(71,'Can delete quartier',18,'delete_quartier'),(72,'Can view quartier',18,'view_quartier'),(73,'Can add restaurant',19,'add_restaurant'),(74,'Can change restaurant',19,'change_restaurant'),(75,'Can delete restaurant',19,'delete_restaurant'),(76,'Can view restaurant',19,'view_restaurant'),(77,'Can add plat menu',20,'add_platmenu'),(78,'Can change plat menu',20,'change_platmenu'),(79,'Can delete plat menu',20,'delete_platmenu'),(80,'Can view plat menu',20,'view_platmenu'),(81,'Can add ingredient',21,'add_ingredient'),(82,'Can change ingredient',21,'change_ingredient'),(83,'Can delete ingredient',21,'delete_ingredient'),(84,'Can view ingredient',21,'view_ingredient'),(85,'Can add simple user',22,'add_simpleuser'),(86,'Can change simple user',22,'change_simpleuser'),(87,'Can delete simple user',22,'delete_simpleuser'),(88,'Can view simple user',22,'view_simpleuser'),(89,'Can add commande',23,'add_commande'),(90,'Can change commande',23,'change_commande'),(91,'Can delete commande',23,'delete_commande'),(92,'Can view commande',23,'view_commande'),(93,'Can add apreciation user',24,'add_apreciationuser'),(94,'Can change apreciation user',24,'change_apreciationuser'),(95,'Can delete apreciation user',24,'delete_apreciationuser'),(96,'Can view apreciation user',24,'view_apreciationuser');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$edusV9bXf5HrvAAwp6U2QK$ybCI/lQ904qsbSeS+cBsCIwMnwk+CYtHasnsgEpkHKg=','2024-01-04 22:26:04.271365',0,'MEKA','','','moisechristianjunior464@gmail.com',0,1,'2023-12-30 02:25:57.758736'),(2,'pbkdf2_sha256$600000$xudh3GrcpPDOtAkx8Ipabl$UF8gpWk2k9CU9skdDibgMw+TroLIcH2ApzCLk+r5w7A=','2023-12-31 00:54:46.374331',0,'lorie','','','lorie@gmail.com',0,1,'2023-12-31 00:54:45.784875'),(3,'pbkdf2_sha256$600000$JCiogSReo0gjBaJYrxgLLe$XNh5y3MMBOkQ44INB0ptKoI8TWagqcUVrd3G/OSlxaQ=','2024-01-19 20:14:49.254519',0,'guest','','','guest@test.com',0,1,'2024-01-19 20:12:43.953745');
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
INSERT INTO `authtoken_token` VALUES ('1e2eb838708208733647690b37ca483200c9a026','2023-12-30 10:15:29.185783',1),('6c255102fd535a61cdc65db52b41bbf2bf643eeb','2024-01-19 20:14:49.231076',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'account','emailaddress'),(10,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(14,'merchantuserapp','city'),(15,'merchantuserapp','country'),(21,'merchantuserapp','ingredient'),(16,'merchantuserapp','menu'),(17,'merchantuserapp','plat'),(20,'merchantuserapp','platmenu'),(18,'merchantuserapp','quartier'),(19,'merchantuserapp','restaurant'),(6,'sessions','session'),(24,'shopapp','apreciationuser'),(23,'shopapp','commande'),(22,'shopapp','simpleuser'),(11,'socialaccount','socialaccount'),(12,'socialaccount','socialapp'),(13,'socialaccount','socialtoken');
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-30 01:42:47.726432'),(2,'auth','0001_initial','2023-12-30 01:42:49.280269'),(3,'account','0001_initial','2023-12-30 01:42:49.797376'),(4,'account','0002_email_max_length','2023-12-30 01:42:49.890310'),(5,'account','0003_alter_emailaddress_create_unique_verified_email','2023-12-30 01:42:50.024129'),(6,'account','0004_alter_emailaddress_drop_unique_email','2023-12-30 01:42:50.210902'),(7,'account','0005_emailaddress_idx_upper_email','2023-12-30 01:42:50.335601'),(8,'admin','0001_initial','2023-12-30 01:42:50.744998'),(9,'admin','0002_logentry_remove_auto_add','2023-12-30 01:42:50.793032'),(10,'admin','0003_logentry_add_action_flag_choices','2023-12-30 01:42:50.851057'),(11,'contenttypes','0002_remove_content_type_name','2023-12-30 01:42:51.092308'),(12,'auth','0002_alter_permission_name_max_length','2023-12-30 01:42:51.280807'),(13,'auth','0003_alter_user_email_max_length','2023-12-30 01:42:51.394919'),(14,'auth','0004_alter_user_username_opts','2023-12-30 01:42:51.444955'),(15,'auth','0005_alter_user_last_login_null','2023-12-30 01:42:51.632702'),(16,'auth','0006_require_contenttypes_0002','2023-12-30 01:42:51.646154'),(17,'auth','0007_alter_validators_add_error_messages','2023-12-30 01:42:51.698919'),(18,'auth','0008_alter_user_username_max_length','2023-12-30 01:42:51.934617'),(19,'auth','0009_alter_user_last_name_max_length','2023-12-30 01:42:52.143283'),(20,'auth','0010_alter_group_name_max_length','2023-12-30 01:42:52.251340'),(21,'auth','0011_update_proxy_permissions','2023-12-30 01:42:52.299244'),(22,'auth','0012_alter_user_first_name_max_length','2023-12-30 01:42:52.510812'),(23,'authtoken','0001_initial','2023-12-30 01:42:52.741177'),(24,'authtoken','0002_auto_20160226_1747','2023-12-30 01:42:52.902926'),(25,'authtoken','0003_tokenproxy','2023-12-30 01:42:52.921311'),(26,'merchantuserapp','0001_initial','2023-12-30 01:42:55.059712'),(27,'merchantuserapp','0002_restaurant_livraison_service','2023-12-30 01:42:55.213818'),(28,'sessions','0001_initial','2023-12-30 01:42:55.341673'),(29,'shopapp','0001_initial','2023-12-30 01:42:56.041097'),(30,'shopapp','0002_commande_numero_alter_commande_date_commande_and_more','2023-12-30 01:42:56.604780'),(31,'shopapp','0003_alter_commande_date_commande','2023-12-30 01:42:56.662341'),(32,'shopapp','0004_alter_commande_date_commande','2023-12-30 01:42:56.717826'),(33,'shopapp','0005_alter_commande_date_commande','2023-12-30 01:42:56.792474'),(34,'shopapp','0006_alter_commande_date_commande','2023-12-30 01:42:56.865341'),(35,'shopapp','0007_alter_commande_date_commande','2023-12-30 01:42:56.958254'),(36,'socialaccount','0001_initial','2023-12-30 01:42:57.957439'),(37,'socialaccount','0002_token_max_lengths','2023-12-30 01:42:58.265785'),(38,'socialaccount','0003_extra_data_default_dict','2023-12-30 01:42:58.391049'),(39,'socialaccount','0004_app_provider_id_settings','2023-12-30 01:42:59.174048'),(40,'socialaccount','0005_socialtoken_nullable_app','2023-12-30 01:42:59.655525'),(41,'shopapp','0008_alter_commande_date_commande','2023-12-30 10:06:03.915925'),(42,'shopapp','0009_remove_simpleuser_first_name_and_more','2023-12-30 22:32:18.030917'),(43,'merchantuserapp','0003_remove_ingredient_plat_plat_ingredients_and_more','2023-12-30 23:11:15.081465'),(44,'shopapp','0010_alter_commande_date_commande','2023-12-30 23:11:15.115961'),(45,'shopapp','0011_alter_commande_date_commande_apreciationuser','2023-12-31 19:11:04.152540'),(46,'shopapp','0012_alter_commande_date_commande','2024-01-04 22:15:08.649737'),(47,'shopapp','0013_commande_quantite_alter_commande_date_commande','2024-01-07 19:22:22.438150'),(48,'shopapp','0014_alter_commande_date_commande','2024-01-19 20:35:23.501195'),(49,'shopapp','0015_commande_date_delai_alter_commande_date_commande','2024-01-19 20:39:15.036830'),(50,'shopapp','0016_alter_commande_date_commande_and_more','2024-01-19 20:57:57.823137'),(51,'shopapp','0017_alter_commande_date_commande_and_more','2024-01-19 21:05:59.518639');
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
INSERT INTO `django_session` VALUES ('0ajx1y9uydj635vvgas9n8673d280n9o','.eJxVjDsOwjAQRO_iGlnxZ7GWkp4zWLv2GgeQI8VJhbg7iZQCutG8N_NWkdalxrXLHMesLsqp02_HlJ7SdpAf1O6TTlNb5pH1ruiDdn2bsryuh_t3UKnXbR0QMdlsLIAMA6C3AiH4LXNm68RQMWeLiUtyyMUnJGEykNmDI0D1-QLQhzf_:1rQvGL:1mun-GrZAQSB0DOCMPZUL81YO4Blhzc-wn4KA-QHyHU','2024-02-02 20:14:49.288280'),('6kvyogc80frxrc930fqln762rrb01k37','.eJxVjMsOwiAQRf-FtSGURxlcuvcbyAxMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJcxZnMYjT70aYHlx3kO9Yb02mVtdlJrkr8qBdXlvm5-Vw_w4K9vKtnZ6cCYBKsWdvgSGB1czOm8mB9pYoAdpREw_GOGKFYzAp-MAArLN4fwDQCDeU:1rLWA8:Fk-HOcBAXXgjTou0H32Dl4H2smAj0vXIgULENbk3T_I','2024-01-18 22:26:04.340200'),('e4vpegw7ed4csavgv4ha76cqm2961ybg','.eJxVj00OgjAQhe_StWloy4DD0r1naKbTQapYEihujHcXEly4e3k_X_LeipinNRf_kjn1SaKXJ6VRdXkdx5PytJbBr4vMPkXVKaf-vED8kLwH8U75NmmecplT0HtFH-mir1OU8XJ0_wADLcO2bhGRbTQWQKoKsLYCbVtvOsRgnRjqTWORQ88OQ18zkgQyEEMNjgA36O_HzpZcElPZzlBRnWkraBBMA_oMDtHZzxezHFGk:1rQvEL:Y5NeEA3yRjFh0EIMSxV2RgYLD8zzgRQLrlwTyiWsQQc','2024-02-02 20:12:45.879500'),('gejwj9w4td27q0fszgb0ixvj2msz6hzr','.eJxVj8sOwiAURP-FtSE8SoEu3fsN5AK3Fq00acGN8d8tSV10O2fmJPMhEMJSc3FvXNOYMDp8QZrJkOs8X4iDWiZXN1xdimQgnJwyD-GJuYH4gHxfaFhyWZOnrUIPutHbEnG-Ht2TYIJt2tdKjEpaA4yhRt0ZNMF0AlFpOSojdOd9MND1wiOXUnlk0FsZrLZoDIom_f9obswlBSj7GShk4JpJyyRXliormRL2-wOex1Es:1rJP31:vj4z34cijtYGOmsFI7MuFwoSnzGEGNsUxjG7GjVaRdM','2024-01-13 02:25:59.621322'),('xzfx0n63hslui8334f1crs8lhpqtru2j','.eJxVjMsOwiAQRf-FtSGURxlcuvcbyAxMpWogKe3K-O_apAvd3nPOfYmI21ri1nmJcxZnMYjT70aYHlx3kO9Yb02mVtdlJrkr8qBdXlvm5-Vw_w4K9vKtnZ6cCYBKsWdvgSGB1czOm8mB9pYoAdpREw_GOGKFYzAp-MAArLN4fwDQCDeU:1rJWNN:MefCw1PVp9Xycjhl9ddWNviN18_eyVCmjg5pHvxcmSk','2024-01-13 10:15:29.307071');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_city`
--

DROP TABLE IF EXISTS `merchantuserapp_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_city` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchantuserapp_city_country_id_0421d8bf_fk_merchantu` (`country_id`),
  CONSTRAINT `merchantuserapp_city_country_id_0421d8bf_fk_merchantu` FOREIGN KEY (`country_id`) REFERENCES `merchantuserapp_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_city`
--

LOCK TABLES `merchantuserapp_city` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_city` DISABLE KEYS */;
INSERT INTO `merchantuserapp_city` VALUES (1,'Yaounde',4),(2,'Douala',7);
/*!40000 ALTER TABLE `merchantuserapp_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_country`
--

DROP TABLE IF EXISTS `merchantuserapp_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_country` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_country`
--

LOCK TABLES `merchantuserapp_country` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_country` DISABLE KEYS */;
INSERT INTO `merchantuserapp_country` VALUES (4,'Cameroon'),(5,'Cameroun'),(2,'Ethiopian'),(3,'Ethiopian2'),(1,'Ghana'),(6,'TestPays'),(7,'TestPays2');
/*!40000 ALTER TABLE `merchantuserapp_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_ingredient`
--

DROP TABLE IF EXISTS `merchantuserapp_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_ingredient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_ingredient` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom_ingredient` (`nom_ingredient`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_ingredient`
--

LOCK TABLES `merchantuserapp_ingredient` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_ingredient` DISABLE KEYS */;
INSERT INTO `merchantuserapp_ingredient` VALUES (1,'okok','legume d\'origine africaine');
/*!40000 ALTER TABLE `merchantuserapp_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_menu`
--

DROP TABLE IF EXISTS `merchantuserapp_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `jour_semaine` varchar(10) NOT NULL,
  `restaurant_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `merchantuserapp_menu_restaurant_id_3c730597_fk_merchantu` (`restaurant_id`),
  CONSTRAINT `merchantuserapp_menu_restaurant_id_3c730597_fk_merchantu` FOREIGN KEY (`restaurant_id`) REFERENCES `merchantuserapp_restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_menu`
--

LOCK TABLES `merchantuserapp_menu` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchantuserapp_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_plat`
--

DROP TABLE IF EXISTS `merchantuserapp_plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_plat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nom_plat` varchar(255) NOT NULL,
  `description` longtext,
  `image_plat` varchar(100) DEFAULT NULL,
  `recette` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom_plat` (`nom_plat`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_plat`
--

LOCK TABLES `merchantuserapp_plat` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_plat` DISABLE KEYS */;
INSERT INTO `merchantuserapp_plat` VALUES (1,'Eru','Plat préféré des camerounais','plat_img/eru0007.jpg','Juste un test'),(2,'Eru2','Plat préféré des camerounais','','Juste un test'),(3,'Eru3','plat du cameroun','plat_img/eru0007_7WxDSGg.jpg','Juste un test'),(4,'Eru4','plat du cameroun','','Juste un test'),(5,'Eru5','plat du cameroun','','Juste un test'),(6,'Eru6','plat du cameroun','','Juste un test'),(7,'Eru7','plat du cameroun','','Juste un test'),(8,'Eru8','plat du cameroun','','Juste un test');
/*!40000 ALTER TABLE `merchantuserapp_plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_plat_ingredients`
--

DROP TABLE IF EXISTS `merchantuserapp_plat_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_plat_ingredients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plat_id` bigint NOT NULL,
  `ingredient_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `merchantuserapp_plat_ing_plat_id_ingredient_id_ea1a31cb_uniq` (`plat_id`,`ingredient_id`),
  KEY `merchantuserapp_plat_ingredient_id_2d558fc8_fk_merchantu` (`ingredient_id`),
  CONSTRAINT `merchantuserapp_plat_ingredient_id_2d558fc8_fk_merchantu` FOREIGN KEY (`ingredient_id`) REFERENCES `merchantuserapp_ingredient` (`id`),
  CONSTRAINT `merchantuserapp_plat_plat_id_d2e2e5e5_fk_merchantu` FOREIGN KEY (`plat_id`) REFERENCES `merchantuserapp_plat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_plat_ingredients`
--

LOCK TABLES `merchantuserapp_plat_ingredients` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_plat_ingredients` DISABLE KEYS */;
INSERT INTO `merchantuserapp_plat_ingredients` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1);
/*!40000 ALTER TABLE `merchantuserapp_plat_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_platmenu`
--

DROP TABLE IF EXISTS `merchantuserapp_platmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_platmenu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `prix` int NOT NULL,
  `quantite` int NOT NULL,
  `unite_quantite` varchar(255) NOT NULL,
  `menu_id` bigint NOT NULL,
  `plat_id` bigint NOT NULL,
  `nb_etoile` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchantuserapp_plat_menu_id_132dcc98_fk_merchantu` (`menu_id`),
  KEY `merchantuserapp_plat_plat_id_fa316c83_fk_merchantu` (`plat_id`),
  CONSTRAINT `merchantuserapp_plat_menu_id_132dcc98_fk_merchantu` FOREIGN KEY (`menu_id`) REFERENCES `merchantuserapp_menu` (`id`),
  CONSTRAINT `merchantuserapp_plat_plat_id_fa316c83_fk_merchantu` FOREIGN KEY (`plat_id`) REFERENCES `merchantuserapp_plat` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_platmenu`
--

LOCK TABLES `merchantuserapp_platmenu` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_platmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchantuserapp_platmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_quartier`
--

DROP TABLE IF EXISTS `merchantuserapp_quartier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_quartier` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `merchantuserapp_quar_city_id_8d7f5864_fk_merchantu` (`city_id`),
  CONSTRAINT `merchantuserapp_quar_city_id_8d7f5864_fk_merchantu` FOREIGN KEY (`city_id`) REFERENCES `merchantuserapp_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_quartier`
--

LOCK TABLES `merchantuserapp_quartier` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_quartier` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchantuserapp_quartier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchantuserapp_restaurant`
--

DROP TABLE IF EXISTS `merchantuserapp_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `merchantuserapp_restaurant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `restorent_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `account_id` int NOT NULL,
  `quartier_id` bigint DEFAULT NULL,
  `livraison_service` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `merchantuserapp_rest_quartier_id_014c5af4_fk_merchantu` (`quartier_id`),
  CONSTRAINT `merchantuserapp_rest_quartier_id_014c5af4_fk_merchantu` FOREIGN KEY (`quartier_id`) REFERENCES `merchantuserapp_quartier` (`id`),
  CONSTRAINT `merchantuserapp_restaurant_account_id_b13e89f6_fk_auth_user_id` FOREIGN KEY (`account_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchantuserapp_restaurant`
--

LOCK TABLES `merchantuserapp_restaurant` WRITE;
/*!40000 ALTER TABLE `merchantuserapp_restaurant` DISABLE KEYS */;
INSERT INTO `merchantuserapp_restaurant` VALUES (1,'resto de meka','+237657848837',0,0,'',1,NULL,1),(2,'resto de lorie','+237657848837',0,0,'resto_img/eru0007.jpg',2,NULL,1),(3,'Guest testo','+237698246125',0,0,'',3,NULL,1);
/*!40000 ALTER TABLE `merchantuserapp_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_apreciationuser`
--

DROP TABLE IF EXISTS `shopapp_apreciationuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_apreciationuser` (
  `id` int unsigned NOT NULL,
  `nb_etoile` int NOT NULL,
  `plat_id` bigint NOT NULL,
  `utilisateur_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_apreciationu_plat_id_dad7fbf2_fk_merchantu` (`plat_id`),
  KEY `shopapp_apreciationu_utilisateur_id_90296739_fk_shopapp_s` (`utilisateur_id`),
  CONSTRAINT `shopapp_apreciationu_plat_id_dad7fbf2_fk_merchantu` FOREIGN KEY (`plat_id`) REFERENCES `merchantuserapp_platmenu` (`id`),
  CONSTRAINT `shopapp_apreciationu_utilisateur_id_90296739_fk_shopapp_s` FOREIGN KEY (`utilisateur_id`) REFERENCES `shopapp_simpleuser` (`id`),
  CONSTRAINT `shopapp_apreciationuser_chk_1` CHECK ((`id` >= 0))
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
-- Table structure for table `shopapp_commande`
--

DROP TABLE IF EXISTS `shopapp_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_commande` (
  `id` int unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `date_commande` date NOT NULL,
  `plat_id` bigint NOT NULL,
  `restaurant_id` bigint NOT NULL,
  `utilisateur_id` int unsigned NOT NULL,
  `numero` varchar(20) NOT NULL,
  `quantite` int NOT NULL,
  `date_delai` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopapp_commande_plat_id_d34bc1f1_fk_merchantuserapp_plat_id` (`plat_id`),
  KEY `shopapp_commande_restaurant_id_8fce531d_fk_merchantu` (`restaurant_id`),
  KEY `shopapp_commande_utilisateur_id_9ebbdfa0_fk_shopapp_s` (`utilisateur_id`),
  CONSTRAINT `shopapp_commande_plat_id_d34bc1f1_fk_merchantuserapp_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `merchantuserapp_plat` (`id`),
  CONSTRAINT `shopapp_commande_restaurant_id_8fce531d_fk_merchantu` FOREIGN KEY (`restaurant_id`) REFERENCES `merchantuserapp_restaurant` (`id`),
  CONSTRAINT `shopapp_commande_utilisateur_id_9ebbdfa0_fk_shopapp_s` FOREIGN KEY (`utilisateur_id`) REFERENCES `shopapp_simpleuser` (`id`),
  CONSTRAINT `shopapp_commande_id_2354e517_check` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_commande`
--

LOCK TABLES `shopapp_commande` WRITE;
/*!40000 ALTER TABLE `shopapp_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopapp_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopapp_simpleuser`
--

DROP TABLE IF EXISTS `shopapp_simpleuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopapp_simpleuser` (
  `id` int unsigned NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `shopapp_simpleuser_chk_1` CHECK ((`id` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopapp_simpleuser`
--

LOCK TABLES `shopapp_simpleuser` WRITE;
/*!40000 ALTER TABLE `shopapp_simpleuser` DISABLE KEYS */;
INSERT INTO `shopapp_simpleuser` VALUES (1,' ','+237698246125'),(2,'','+237657848837');
/*!40000 ALTER TABLE `shopapp_simpleuser` ENABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 22:24:23
