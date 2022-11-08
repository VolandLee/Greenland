-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actions` (
  `action_id` int NOT NULL,
  `action_name` varchar(45) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add catalog',7,'add_catalog'),(26,'Can change catalog',7,'change_catalog'),(27,'Can delete catalog',7,'delete_catalog'),(28,'Can view catalog',7,'view_catalog'),(29,'Can add city',8,'add_city'),(30,'Can change city',8,'change_city'),(31,'Can delete city',8,'delete_city'),(32,'Can view city',8,'view_city'),(33,'Can add clients',9,'add_clients'),(34,'Can change clients',9,'change_clients'),(35,'Can delete clients',9,'delete_clients'),(36,'Can view clients',9,'view_clients'),(37,'Can add region',10,'add_region'),(38,'Can change region',10,'change_region'),(39,'Can delete region',10,'delete_region'),(40,'Can view region',10,'view_region'),(41,'Can add employees',11,'add_employees'),(42,'Can change employees',11,'change_employees'),(43,'Can delete employees',11,'delete_employees'),(44,'Can view employees',11,'view_employees'),(45,'Can add premise_type',12,'add_premise_type'),(46,'Can change premise_type',12,'change_premise_type'),(47,'Can delete premise_type',12,'delete_premise_type'),(48,'Can view premise_type',12,'view_premise_type'),(49,'Can add premises',13,'add_premises'),(50,'Can change premises',13,'change_premises'),(51,'Can delete premises',13,'delete_premises'),(52,'Can view premises',13,'view_premises'),(53,'Can add pre',14,'add_pre'),(54,'Can change pre',14,'change_pre'),(55,'Can delete pre',14,'delete_pre'),(56,'Can view pre',14,'view_pre'),(57,'Can add actions',15,'add_actions'),(58,'Can change actions',15,'change_actions'),(59,'Can delete actions',15,'delete_actions'),(60,'Can view actions',15,'view_actions'),(61,'Can add clients_order',16,'add_clients_order'),(62,'Can change clients_order',16,'change_clients_order'),(63,'Can delete clients_order',16,'delete_clients_order'),(64,'Can view clients_order',16,'view_clients_order'),(65,'Can add control_points',17,'add_control_points'),(66,'Can change control_points',17,'change_control_points'),(67,'Can delete control_points',17,'delete_control_points'),(68,'Can view control_points',17,'view_control_points'),(69,'Can add delivery',18,'add_delivery'),(70,'Can change delivery',18,'change_delivery'),(71,'Can delete delivery',18,'delete_delivery'),(72,'Can view delivery',18,'view_delivery'),(73,'Can add goodslist',19,'add_goodslist'),(74,'Can change goodslist',19,'change_goodslist'),(75,'Can delete goodslist',19,'delete_goodslist'),(76,'Can view goodslist',19,'view_goodslist'),(77,'Can add products',20,'add_products'),(78,'Can change products',20,'change_products'),(79,'Can delete products',20,'delete_products'),(80,'Can view products',20,'view_products'),(81,'Can add supplier_order',21,'add_supplier_order'),(82,'Can change supplier_order',21,'change_supplier_order'),(83,'Can delete supplier_order',21,'delete_supplier_order'),(84,'Can view supplier_order',21,'view_supplier_order'),(85,'Can add suppliers',22,'add_suppliers'),(86,'Can change suppliers',22,'change_suppliers'),(87,'Can delete suppliers',22,'delete_suppliers'),(88,'Can view suppliers',22,'view_suppliers'),(89,'Can add transfers',23,'add_transfers'),(90,'Can change transfers',23,'change_transfers'),(91,'Can delete transfers',23,'delete_transfers'),(92,'Can view transfers',23,'view_transfers');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$uiXWxPOx5vzoQT5o36YMWE$e9+P+5hi6yLrlYGNfNXA+Qpflj3g60TzeXsDFDoK3EA=','2022-10-30 16:49:21.695560',1,'professional','','','vonkyvonkyvonky@gmail.com',1,1,'2022-10-30 16:47:25.816136');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `catalog_id` int NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(45) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`catalog_id`),
  KEY `catalog_fk_idx` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'Одежда',NULL),(2,'Обувь',1),(3,'hhh',1);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (2,'Moscow'),(3,'St Petersburg'),(4,'Novosibirsk'),(5,'Nizni Novgorod'),(6,'Jekaterinburg'),(7,'Samara'),(8,'Omsk'),(9,'Kazan'),(10,'Ufa'),(11,'Tšeljabinsk'),(12,'Rostov-na-Donu'),(13,'Perm'),(14,'Volgograd'),(15,'Voronez'),(16,'Krasnojarsk'),(17,'Saratov'),(18,'Toljatti'),(19,'Uljanovsk'),(20,'Izevsk'),(21,'Krasnodar'),(22,'Jaroslavl'),(23,'Habarovsk'),(24,'Vladivostok'),(25,'Irkutsk'),(26,'Barnaul'),(27,'Novokuznetsk'),(28,'Penza'),(29,'Rjazan'),(30,'Orenburg'),(31,'Lipetsk'),(32,'Nabereznyje Tšelny'),(33,'Tula'),(34,'Tjumen'),(35,'Kemerovo'),(36,'Astrahan'),(37,'Tomsk'),(38,'Kirov'),(39,'Ivanovo'),(40,'Tšeboksary'),(41,'Brjansk'),(42,'Tver'),(43,'Kursk'),(44,'Magnitogorsk'),(45,'Kaliningrad'),(46,'Nizni Tagil'),(47,'Murmansk'),(48,'Ulan-Ude'),(49,'Kurgan'),(50,'Arkangeli'),(51,'Sotši'),(52,'Smolensk'),(53,'Orjol'),(54,'Stavropol'),(55,'Belgorod'),(56,'Kaluga'),(57,'Vladimir'),(58,'Mahatškala'),(59,'Tšerepovets'),(60,'Saransk'),(61,'Tambov'),(62,'Vladikavkaz'),(63,'Tšita'),(64,'Vologda'),(65,'Veliki Novgorod'),(66,'Komsomolsk-na-Amure'),(67,'Kostroma'),(68,'Volzski'),(69,'Taganrog'),(70,'Petroskoi'),(71,'Bratsk'),(72,'Dzerzinsk'),(73,'Surgut'),(74,'Orsk'),(75,'Sterlitamak'),(76,'Angarsk'),(77,'Joškar-Ola'),(78,'Rybinsk'),(79,'Prokopjevsk'),(80,'Niznevartovsk'),(81,'Naltšik'),(82,'Syktyvkar'),(83,'Severodvinsk'),(84,'Bijsk'),(85,'Niznekamsk'),(86,'Blagoveštšensk'),(87,'Šahty'),(88,'Staryi Oskol'),(89,'Zelenograd'),(90,'Balakovo'),(91,'Novorossijsk'),(92,'Pihkova'),(93,'Zlatoust'),(94,'Jakutsk'),(95,'Podolsk'),(96,'Petropavlovsk-Kamtšatski'),(97,'Kamensk-Uralski'),(98,'Engels'),(99,'Syzran'),(100,'Grozny'),(101,'Novotšerkassk'),(102,'Berezniki'),(103,'Juzno-Sahalinsk'),(104,'Volgodonsk'),(105,'Abakan'),(106,'Maikop'),(107,'Miass'),(108,'Armavir'),(109,'Ljubertsy'),(110,'Rubtsovsk'),(111,'Kovrov'),(112,'Nahodka'),(113,'Ussurijsk'),(114,'Salavat'),(115,'Mytištši'),(116,'Kolomna'),(117,'Elektrostal'),(118,'Murom'),(119,'Kolpino'),(120,'Norilsk'),(121,'Almetjevsk'),(122,'Novomoskovsk'),(123,'Dimitrovgrad'),(124,'Pervouralsk'),(125,'Himki'),(126,'Balašiha'),(127,'Nevinnomyssk'),(128,'Pjatigorsk'),(129,'Korolev'),(130,'Serpuhov'),(131,'Odintsovo'),(132,'Orehovo-Zujevo'),(133,'Kamyšin'),(134,'Novotšeboksarsk'),(135,'Tšerkessk'),(136,'Atšinsk'),(137,'Magadan'),(138,'Mitšurinsk'),(139,'Kislovodsk'),(140,'Jelets'),(141,'Seversk'),(142,'Noginsk'),(143,'Velikije Luki'),(144,'Novokuibyševsk'),(145,'Neftekamsk'),(146,'Leninsk-Kuznetski'),(147,'Oktjabrski'),(148,'Sergijev Posad'),(149,'Arzamas'),(150,'Kiseljovsk'),(151,'Novotroitsk'),(152,'Obninsk'),(153,'Kansk'),(154,'Glazov'),(155,'Solikamsk'),(156,'Sarapul'),(157,'Ust-Ilimsk'),(158,'Štšolkovo'),(159,'Mezduretšensk'),(160,'Usolje-Sibirskoje'),(161,'Elista'),(162,'Novošahtinsk'),(163,'Votkinsk'),(164,'Kyzyl'),(165,'Serov'),(166,'Zelenodolsk'),(167,'Zeleznodoroznyi'),(168,'Kinešma'),(169,'Kuznetsk'),(170,'Uhta'),(171,'Jessentuki'),(172,'Tobolsk'),(173,'Neftejugansk'),(174,'Bataisk'),(175,'Nojabrsk'),(176,'Balašov'),(177,'Zeleznogorsk'),(178,'Zukovski'),(179,'Anzero-Sudzensk'),(180,'Bugulma'),(181,'Zeleznogorsk'),(182,'Novouralsk'),(183,'Puškin'),(184,'Vorkuta'),(185,'Derbent'),(186,'Kirovo-Tšepetsk'),(187,'Krasnogorsk'),(188,'Klin'),(189,'Tšaikovski'),(190,'Novyi Urengoi'),(191,'Error'),(192,'Error');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(45) NOT NULL,
  `Patronymic` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `postcode` int NOT NULL,
  `region_id` int NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `h_number` int NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birth_date` date NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `liked` json DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  CONSTRAINT `clients_chk_1` CHECK (((`phone` >= 70000000000) and (`phone` < 80000000000))),
  CONSTRAINT `clients_chk_2` CHECK (((`postcode` >= 100000) and (`postcode` < 1000000)))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24',0.00,NULL),(2,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24',2500.65,NULL),(3,'Вл','Вл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(4,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(5,'dcdcdc','dddfdfdf','fdfdfdffd','fdfdfdfddf','fdfdfdfdfd',79667163270,211222,4,5,'212213',32,1,'2022-11-04',333222.00,NULL),(6,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(7,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(8,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(9,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(10,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(11,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(12,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(13,'fvfvvf','vfvfvfvf','vfvfvfvv','fvfvfvfv','fvfvfvf',79667163270,434434,2,4,'wqereere',33,1,'2022-11-04',21234.00,NULL),(14,'Вл','fВл','Вл','cdc','ddcdcd',79667163270,623400,2,3,'cdcc',33,1,'2002-04-24',999.00,'[]'),(15,'cdd','ddd','fdfdf','fdfdfdfdf','dfdfdfdfd',79667163270,265894,3,4,'вцввцвцв',323,1,'2022-11-04',3232323.00,NULL),(16,'Ва','Вп','Вр','43fdf','ffddvf',79667163270,323232,5,5,'434vfvfv',44,1,'2002-04-24',4343.00,'[]'),(17,'Ва','Вп','Вр','@43fdf','ffddvf',79667163270,323232,5,5,'434vfvfv',44,1,'2002-04-24',4343.00,'[]'),(18,'Ва','Вп','Вр','@43fdf','ffd@dvf',79667163270,323232,5,5,'434vfvfv',44,1,'2002-04-24',4343.00,'[]'),(19,'Ва','Вп','Вр','43f@df','ffddvf',79667163270,323232,5,5,'434vfvfv',44,1,'2002-04-24',4343.00,'[]');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_order`
--

DROP TABLE IF EXISTS `clients_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_order` (
  `clients_order_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `barcode_id` bigint NOT NULL,
  `client_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `order_date` timestamp NOT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `received_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clients_order_id`),
  KEY `client_id_idx` (`client_id`),
  KEY `barcode_fk_co_idx` (`barcode_id`),
  CONSTRAINT `barcode_id_co_fk` FOREIGN KEY (`barcode_id`) REFERENCES `products` (`barcode_id`),
  CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_order`
--

LOCK TABLES `clients_order` WRITE;
/*!40000 ALTER TABLE `clients_order` DISABLE KEYS */;
INSERT INTO `clients_order` VALUES (1,1,5454545454545,15.58,5,'2022-11-03 06:14:33','2022-11-03 06:14:32','2022-11-03 06:14:30');
/*!40000 ALTER TABLE `clients_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_points`
--

DROP TABLE IF EXISTS `control_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_points` (
  `control_points_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `barcode_id` bigint NOT NULL,
  `action_id` int NOT NULL,
  `premise_id` int NOT NULL,
  `time` timestamp NOT NULL,
  PRIMARY KEY (`control_points_id`),
  KEY `action_id_fk_idx` (`action_id`),
  KEY `premise_id_fk_idx` (`premise_id`),
  KEY `employee_id_cp_fk_idx` (`employee_id`),
  KEY `barcode_fk_cp_idx` (`barcode_id`),
  CONSTRAINT `action_id_fk` FOREIGN KEY (`action_id`) REFERENCES `actions` (`action_id`),
  CONSTRAINT `barcode_fk_cp` FOREIGN KEY (`barcode_id`) REFERENCES `products` (`barcode_id`),
  CONSTRAINT `employee_id_cp_fk` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `premise_id_cp_fk` FOREIGN KEY (`premise_id`) REFERENCES `premises` (`premise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_points`
--

LOCK TABLES `control_points` WRITE;
/*!40000 ALTER TABLE `control_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `delivery_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `postcode` int NOT NULL,
  `region_id` int NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `h_number` int NOT NULL,
  `website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  CONSTRAINT `delivery_chk_1` CHECK (((`phone` >= 70000000000) and (`phone` < 80000000000))),
  CONSTRAINT `delivery_chk_2` CHECK (((`postcode` >= 100000) and (`postcode` < 1000000)))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Greenland','delivery@greenland.ru',79530507315,432214,23,34,'Ленин-гриб',32,NULL),(2,'Ва@43fdf','ffd@dvf',79667163270,323232,5,5,'434vfvfv',44,NULL);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-10-30 18:00:53.973672','2','Catalog object (2)',1,'[{\"added\": {}}]',7,1),(2,'2022-10-30 18:01:11.470815','2','Catalog object (2)',2,'[{\"changed\": {\"fields\": [\"Catalog name\", \"Parent\"]}}]',7,1),(3,'2022-11-03 06:29:52.578362','191','id=191, Error',1,'[{\"added\": {}}]',8,1),(4,'2022-11-03 06:29:59.214797','192','id=192, Error',1,'[{\"added\": {}}]',8,1),(5,'2022-11-03 07:43:49.071247','2','id=2, Владимир, Вознюк',2,'[]',9,1),(6,'2022-11-03 07:43:54.033580','2','id=2, Владимир, Вознюк',2,'[]',9,1),(7,'2022-11-03 08:09:59.799037','3','id=3, vvvv',1,'[{\"added\": {}}]',12,1),(8,'2022-11-03 11:16:17.465179','5454545454545','id=5454545454545, khjbh, Категория:id=1, Одежда, Родитель_None',1,'[{\"added\": {}}]',20,1),(9,'2022-11-03 11:16:25.036506','1','id=1, id=1, Владимир, Вознюк, id=5454545454545, khjbh, Категория:id=1, Одежда, Родитель_None, 2022-11-03 11:14:33+00:00',1,'[{\"added\": {}}]',16,1),(10,'2022-11-03 11:17:17.401719','1','id=1, id=5454545454545, khjbh, Категория:id=1, Одежда, Родитель_None, 65',1,'[{\"added\": {}}]',19,1),(11,'2022-11-04 13:05:38.192850','5','id=5, dcdcdc, dddfdfdf',1,'[{\"added\": {}}]',9,1),(12,'2022-11-04 13:10:03.375253','5','id=5, dcdcdc, dddfdfdf',2,'[]',9,1),(13,'2022-11-04 13:29:54.425613','13','id=13, fvfvvf, vfvfvfvf',1,'[{\"added\": {}}]',9,1),(14,'2022-11-04 14:13:48.478519','15','id=15, cdd, ddd',1,'[{\"added\": {}}]',9,1),(15,'2022-11-06 12:23:09.871386','3','id=3, hhh, Родитель_id=1, Одежда, Родитель_None',1,'[{\"added\": {}}]',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(15,'Supp_ord','actions'),(7,'Supp_ord','catalog'),(8,'Supp_ord','city'),(9,'Supp_ord','clients'),(16,'Supp_ord','clients_order'),(17,'Supp_ord','control_points'),(18,'Supp_ord','delivery'),(11,'Supp_ord','employees'),(19,'Supp_ord','goodslist'),(14,'Supp_ord','pre'),(13,'Supp_ord','premises'),(12,'Supp_ord','premise_type'),(20,'Supp_ord','products'),(10,'Supp_ord','region'),(22,'Supp_ord','suppliers'),(21,'Supp_ord','supplier_order'),(23,'Supp_ord','transfers');
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-10-30 16:46:38.353953'),(2,'auth','0001_initial','2022-10-30 16:46:38.666360'),(3,'admin','0001_initial','2022-10-30 16:46:38.744440'),(4,'admin','0002_logentry_remove_auto_add','2022-10-30 16:46:38.744440'),(5,'admin','0003_logentry_add_action_flag_choices','2022-10-30 16:46:38.760063'),(6,'contenttypes','0002_remove_content_type_name','2022-10-30 16:46:38.806971'),(7,'auth','0002_alter_permission_name_max_length','2022-10-30 16:46:38.838211'),(8,'auth','0003_alter_user_email_max_length','2022-10-30 16:46:38.885045'),(9,'auth','0004_alter_user_username_opts','2022-10-30 16:46:38.885045'),(10,'auth','0005_alter_user_last_login_null','2022-10-30 16:46:38.935629'),(11,'auth','0006_require_contenttypes_0002','2022-10-30 16:46:38.936770'),(12,'auth','0007_alter_validators_add_error_messages','2022-10-30 16:46:38.936770'),(13,'auth','0008_alter_user_username_max_length','2022-10-30 16:46:38.968067'),(14,'auth','0009_alter_user_last_name_max_length','2022-10-30 16:46:39.014877'),(15,'auth','0010_alter_group_name_max_length','2022-10-30 16:46:39.046120'),(16,'auth','0011_update_proxy_permissions','2022-10-30 16:46:39.046120'),(17,'auth','0012_alter_user_first_name_max_length','2022-10-30 16:46:39.093011'),(18,'sessions','0001_initial','2022-10-30 16:46:39.124252'),(19,'Supp_ord','0001_initial','2022-10-30 17:14:31.723900'),(20,'Supp_ord','0002_city','2022-11-03 06:28:23.462738'),(21,'Supp_ord','0003_clients_region','2022-11-03 07:15:03.703592'),(22,'Supp_ord','0004_alter_clients_table','2022-11-03 07:41:09.207758'),(23,'Supp_ord','0005_employees_premise_type_premises','2022-11-03 08:00:16.423034'),(24,'Supp_ord','0006_pre_delete_premise_type','2022-11-03 08:16:10.435956'),(25,'Supp_ord','0007_alter_pre_table','2022-11-03 08:21:13.654529'),(26,'Supp_ord','0008_premise_type_delete_pre','2022-11-03 08:29:59.594038'),(27,'Supp_ord','0009_actions_clients_order_control_points_delivery_and_more','2022-11-03 11:10:25.608865');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('bfediwvbhhgf8w9ovwgyiggfnqdnyq7p','.eJxVjE0OgyAYBe_CuiEgINBl956B8P1QbRtJRFdN715NXLTbNzPvLVLe1jFtjZc0kbgKLS6_G2R88nwAeuT5XiXWeV0mkIciT9rkUIlft9P9OxhzG_faIHTRo2Xw2gKS0Yqwj6qAdnGH3heOplPGWRPIcQkOgCGGnnzBSOLzBe9COHU:1opBUv:OTGGi6s_mA187jah_fSU3aFF5tbrnXEZg5Pv65NaSbQ','2022-11-13 16:49:21.698552');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `premise_id` int NOT NULL,
  `FName` varchar(45) NOT NULL,
  `LName` varchar(45) NOT NULL,
  `Patronymic` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `postcode` int NOT NULL,
  `region_id` int NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `h_number` int NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birth_date` date NOT NULL,
  `hire_date` date NOT NULL,
  `chief_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `chief_fk_idx` (`chief_id`),
  KEY `premise_id_fk_idx` (`premise_id`),
  CONSTRAINT `chief_id_fk` FOREIGN KEY (`chief_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `premise_id_e_fk` FOREIGN KEY (`premise_id`) REFERENCES `premises` (`premise_id`),
  CONSTRAINT `employees_chk_1` CHECK (((`phone` >= 70000000000) and (`phone` < 80000000000))),
  CONSTRAINT `employees_chk_2` CHECK (((`postcode` >= 100000) and (`postcode` < 1000000)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629844,2,34,'Окт',1132,0,'2002-04-24','2022-10-26',NULL),(11,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,0,'2002-04-24','2022-10-26',NULL),(12,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(13,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(14,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(15,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(16,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',11),(17,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(20,8,'Ва','Вп','Вр','@43fdf','ffd@dvf',79667163270,323232,5,5,'434vfvfv',44,1,'2002-04-24','2002-04-24',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodslist`
--

DROP TABLE IF EXISTS `goodslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodslist` (
  `goodslist_id` int NOT NULL AUTO_INCREMENT,
  `barcode_id` bigint NOT NULL,
  `premise_id` int NOT NULL,
  `quantity` int NOT NULL,
  `sizex` int NOT NULL,
  `sizey` int NOT NULL,
  `sizez` int NOT NULL,
  `weight` decimal(8,3) NOT NULL,
  PRIMARY KEY (`goodslist_id`),
  KEY `premise_id_fk_idx` (`premise_id`),
  KEY `barcode_fk_g_idx` (`barcode_id`),
  CONSTRAINT `barcode_fk_g` FOREIGN KEY (`barcode_id`) REFERENCES `products` (`barcode_id`),
  CONSTRAINT `premise_id_g_fk` FOREIGN KEY (`premise_id`) REFERENCES `premises` (`premise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodslist`
--

LOCK TABLES `goodslist` WRITE;
/*!40000 ALTER TABLE `goodslist` DISABLE KEYS */;
INSERT INTO `goodslist` VALUES (1,5454545454545,7,26,5,4,88,8888.880);
/*!40000 ALTER TABLE `goodslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premise_type`
--

DROP TABLE IF EXISTS `premise_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premise_type` (
  `premise_type_id` int NOT NULL AUTO_INCREMENT,
  `type_decryp` varchar(45) NOT NULL,
  PRIMARY KEY (`premise_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premise_type`
--

LOCK TABLES `premise_type` WRITE;
/*!40000 ALTER TABLE `premise_type` DISABLE KEYS */;
INSERT INTO `premise_type` VALUES (1,'Склад'),(2,'Пункт Выдачи'),(3,'vvvv');
/*!40000 ALTER TABLE `premise_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premises`
--

DROP TABLE IF EXISTS `premises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premises` (
  `premise_id` int NOT NULL AUTO_INCREMENT,
  `premise_type_id` int NOT NULL,
  `coord_long` float NOT NULL,
  `coord_lat` float NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `postcode` int NOT NULL,
  `region_id` int NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `h_number` int NOT NULL,
  PRIMARY KEY (`premise_id`),
  KEY `premise_type_fk_idx` (`premise_type_id`),
  CONSTRAINT `premise_type_fk` FOREIGN KEY (`premise_type_id`) REFERENCES `premise_type` (`premise_type_id`),
  CONSTRAINT `premises_chk_1` CHECK (((`phone` >= 70000000000) and (`phone` < 80000000000))),
  CONSTRAINT `premises_chk_2` CHECK (((`postcode` >= 100000) and (`postcode` < 1000000)))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premises`
--

LOCK TABLES `premises` WRITE;
/*!40000 ALTER TABLE `premises` DISABLE KEYS */;
INSERT INTO `premises` VALUES (7,1,54,54,'whererhisplace@gmail.com',79667163270,629889,2,34,'Окт',1132),(8,1,54,54,'whererhisplace@gmail.com',79667163270,629884,2,34,'Окт',1132);
/*!40000 ALTER TABLE `premises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `barcode_id` bigint NOT NULL,
  `catalog_id` int NOT NULL,
  `supplier_id` int NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `supplier_price` decimal(10,2) NOT NULL,
  `client_price` decimal(10,2) NOT NULL,
  `country` varchar(45) NOT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`barcode_id`),
  KEY `category_id_fk_idx` (`catalog_id`),
  KEY `supplier_id_fk_idx` (`supplier_id`),
  CONSTRAINT `category_id_fk` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`catalog_id`),
  CONSTRAINT `supplier_id_fk` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='available (1 Yes, 0 No)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (5454545454545,1,1,'khjbh',55.55,66.66,'Omerica',1),(6483475864345,3,1,'79667163270',323232.00,5.00,'5',0),(6483475866345,3,1,'79667163270',323232.00,5.00,'5',0),(6483475866346,3,1,'79667163270',323232.00,5.00,'5',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `region_id` int NOT NULL AUTO_INCREMENT,
  `region_name` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Алтайский край\r'),(2,'Амурская область\r'),(3,'Архангельская область\r'),(4,'Астраханская область\r'),(5,'Белгородская область\r'),(6,'Брянская область\r'),(7,'Владимирская область\r'),(8,'Волгоградская область\r'),(9,'Вологодская область\r'),(10,'Воронежская область\r'),(11,'г. Москва\r'),(12,'Еврейская автономная область\r'),(13,'Забайкальский край\r'),(14,'Ивановская область\r'),(15,'Иные территории, включая город и космодром Байконур\r'),(16,'Иркутская область\r'),(17,'Кабардино-Балкарская Республика\r'),(18,'Калининградская область\r'),(19,'Калужская область\r'),(20,'Камчатский край\r'),(21,'Карачаево-Черкесская Республика\r'),(22,'Кемеровская область — Кузбасс\r'),(23,'Кировская область\r'),(24,'Костромская область\r'),(25,'Краснодарский край\r'),(26,'Красноярский край\r'),(27,'Курганская область\r'),(28,'Курская область\r'),(29,'Ленинградская область\r'),(30,'Липецкая область\r'),(31,'Магаданская область\r'),(32,'Московская область\r'),(33,'Мурманская область\r'),(34,'Ненецкий автономный округ\r'),(35,'Нижегородская область\r'),(36,'Новгородская область\r'),(37,'Новосибирская область\r'),(38,'Омская область\r'),(39,'Оренбургская область\r'),(40,'Орловская область\r'),(41,'Пензенская область\r'),(42,'Пермский край\r'),(43,'Приморский край\r'),(44,'Псковская область\r'),(45,'Республика Адыгея (Адыгея)\r'),(46,'Республика Алтай\r'),(47,'Республика Башкортостан\r'),(48,'Республика Бурятия\r'),(49,'Республика Дагестан\r'),(50,'Республика Ингушетия\r'),(51,'Республика Калмыкия\r'),(52,'Республика Карелия\r'),(53,'Республика Коми\r'),(54,'Республика Крым\r'),(55,'Республика Марий Эл\r'),(56,'Республика Мордовия\r'),(57,'Республика Саха (Якутия)\r'),(58,'Республика Северная Осетия — Алания\r'),(59,'Республика Татарстан (Татарстан)\r'),(60,'Республика Тыва\r'),(61,'Республика Хакасия\r'),(62,'Ростовская область\r'),(63,'Рязанская область\r'),(64,'Самарская область\r'),(65,'Санкт-Петербург\r'),(66,'Саратовская область\r'),(67,'Сахалинская область\r'),(68,'Свердловская область\r'),(69,'Севастополь\r'),(70,'Смоленская область\r'),(71,'Ставропольский край\r'),(72,'Тамбовская область\r'),(73,'Тверская область\r'),(74,'Томская область\r'),(75,'Тульская область\r'),(76,'Тюменская область\r'),(77,'Удмуртская Республика\r'),(78,'Ульяновская область\r'),(79,'Хабаровский край\r'),(80,'Ханты-Мансийский автономный округ — Югра\r'),(81,'Челябинская область\r'),(82,'Чеченская Республика\r'),(83,'Чувашская Республика — Чувашия\r'),(84,'Чукотский автономный округ\r'),(85,'Ямало-Ненецкий автономный округ\r'),(86,'Ярославская область\r');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_order`
--

DROP TABLE IF EXISTS `supplier_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_order` (
  `supplier_order_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `barcode_id` bigint NOT NULL,
  `supplier_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `order_date` timestamp NOT NULL,
  `delivery_date` timestamp NULL DEFAULT NULL,
  `received_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`supplier_order_id`),
  KEY `supplier_fk_idx` (`supplier_id`),
  KEY `barcode_fk_so_idx` (`barcode_id`),
  CONSTRAINT `barcode_fk_so` FOREIGN KEY (`barcode_id`) REFERENCES `products` (`barcode_id`),
  CONSTRAINT `supplier_fk` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_order`
--

LOCK TABLES `supplier_order` WRITE;
/*!40000 ALTER TABLE `supplier_order` DISABLE KEYS */;
INSERT INTO `supplier_order` VALUES (1,1,5454545454545,3444.00,5,'2022-11-07 08:46:21',NULL,NULL);
/*!40000 ALTER TABLE `supplier_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` bigint NOT NULL,
  `postcode` int NOT NULL,
  `region_id` int NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `h_number` int NOT NULL,
  `website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`),
  CONSTRAINT `suppliers_chk_1` CHECK (((`phone` >= 70000000000) and (`phone` < 80000000000))),
  CONSTRAINT `suppliers_chk_2` CHECK (((`postcode` >= 100000) and (`postcode` < 1000000)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Mircosoft','microsoft@microsoft.com',79533627315,432214,25,64,'гриб',34,NULL),(2,'43433','vonkyvonkyvonky@gmail.com',79667163270,268452,1,3,'333',33,'2'),(3,'43433','vonkyvonkyvonky@gmail.com',79667163270,268452,1,3,'333',33,'2'),(4,'43433','vonkyvonkyvonky@gmail.com',79667163270,268452,1,3,'333',33,'2'),(5,'43433','vonkyvonkyvonky@gmail.com',79667163270,268452,1,3,'333',33,'2'),(6,'43433','vonkyvonkyvonky@gmail.com',79667163270,268452,1,3,'333',33,'2'),(7,'43433','vonkyvonkyvonky@gmail.com',79667163270,268452,1,3,'333',33,'2'),(8,'43433','vonkyvonkyvonky@gmil.com',79667163270,268452,1,3,'333',33,'2'),(9,'43433','vonkyvonkyvonky@l.com',79667163270,268452,1,3,'333',33,'2'),(10,'43433','vonkyvonkyvonky@ffff.ru',79667163270,268452,1,3,'333',33,'2');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `transfer_id` int NOT NULL AUTO_INCREMENT,
  `delivery_id` int NOT NULL,
  `barcode_id` bigint NOT NULL,
  `from_premise_id` int DEFAULT NULL,
  `to_premise_id` int NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `quantity` int NOT NULL,
  `sizex` int NOT NULL,
  `sizey` int NOT NULL,
  `sizez` int NOT NULL,
  `weight` decimal(8,3) NOT NULL,
  PRIMARY KEY (`transfer_id`),
  KEY `from_premise_fk_idx` (`to_premise_id`),
  KEY `delivery_id_fk_idx` (`delivery_id`),
  KEY `from_premise_fk_idx1` (`from_premise_id`),
  KEY `barcode_fk_t_idx` (`barcode_id`),
  CONSTRAINT `barcode_fk_t` FOREIGN KEY (`barcode_id`) REFERENCES `products` (`barcode_id`),
  CONSTRAINT `delivery_id_fk` FOREIGN KEY (`delivery_id`) REFERENCES `delivery` (`delivery_id`),
  CONSTRAINT `from_premise_fk` FOREIGN KEY (`from_premise_id`) REFERENCES `premises` (`premise_id`),
  CONSTRAINT `to_premise_fk` FOREIGN KEY (`to_premise_id`) REFERENCES `premises` (`premise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (1,1,5454545454545,7,8,'2022-11-06 12:49:00',NULL,3,344,344,2323,433.000);
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09  0:36:29
