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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (2,'Moscow'),(3,'St Petersburg'),(4,'Novosibirsk'),(5,'Nizni Novgorod'),(6,'Jekaterinburg'),(7,'Samara'),(8,'Omsk'),(9,'Kazan'),(10,'Ufa'),(11,'Tšeljabinsk'),(12,'Rostov-na-Donu'),(13,'Perm'),(14,'Volgograd'),(15,'Voronez'),(16,'Krasnojarsk'),(17,'Saratov'),(18,'Toljatti'),(19,'Uljanovsk'),(20,'Izevsk'),(21,'Krasnodar'),(22,'Jaroslavl'),(23,'Habarovsk'),(24,'Vladivostok'),(25,'Irkutsk'),(26,'Barnaul'),(27,'Novokuznetsk'),(28,'Penza'),(29,'Rjazan'),(30,'Orenburg'),(31,'Lipetsk'),(32,'Nabereznyje Tšelny'),(33,'Tula'),(34,'Tjumen'),(35,'Kemerovo'),(36,'Astrahan'),(37,'Tomsk'),(38,'Kirov'),(39,'Ivanovo'),(40,'Tšeboksary'),(41,'Brjansk'),(42,'Tver'),(43,'Kursk'),(44,'Magnitogorsk'),(45,'Kaliningrad'),(46,'Nizni Tagil'),(47,'Murmansk'),(48,'Ulan-Ude'),(49,'Kurgan'),(50,'Arkangeli'),(51,'Sotši'),(52,'Smolensk'),(53,'Orjol'),(54,'Stavropol'),(55,'Belgorod'),(56,'Kaluga'),(57,'Vladimir'),(58,'Mahatškala'),(59,'Tšerepovets'),(60,'Saransk'),(61,'Tambov'),(62,'Vladikavkaz'),(63,'Tšita'),(64,'Vologda'),(65,'Veliki Novgorod'),(66,'Komsomolsk-na-Amure'),(67,'Kostroma'),(68,'Volzski'),(69,'Taganrog'),(70,'Petroskoi'),(71,'Bratsk'),(72,'Dzerzinsk'),(73,'Surgut'),(74,'Orsk'),(75,'Sterlitamak'),(76,'Angarsk'),(77,'Joškar-Ola'),(78,'Rybinsk'),(79,'Prokopjevsk'),(80,'Niznevartovsk'),(81,'Naltšik'),(82,'Syktyvkar'),(83,'Severodvinsk'),(84,'Bijsk'),(85,'Niznekamsk'),(86,'Blagoveštšensk'),(87,'Šahty'),(88,'Staryi Oskol'),(89,'Zelenograd'),(90,'Balakovo'),(91,'Novorossijsk'),(92,'Pihkova'),(93,'Zlatoust'),(94,'Jakutsk'),(95,'Podolsk'),(96,'Petropavlovsk-Kamtšatski'),(97,'Kamensk-Uralski'),(98,'Engels'),(99,'Syzran'),(100,'Grozny'),(101,'Novotšerkassk'),(102,'Berezniki'),(103,'Juzno-Sahalinsk'),(104,'Volgodonsk'),(105,'Abakan'),(106,'Maikop'),(107,'Miass'),(108,'Armavir'),(109,'Ljubertsy'),(110,'Rubtsovsk'),(111,'Kovrov'),(112,'Nahodka'),(113,'Ussurijsk'),(114,'Salavat'),(115,'Mytištši'),(116,'Kolomna'),(117,'Elektrostal'),(118,'Murom'),(119,'Kolpino'),(120,'Norilsk'),(121,'Almetjevsk'),(122,'Novomoskovsk'),(123,'Dimitrovgrad'),(124,'Pervouralsk'),(125,'Himki'),(126,'Balašiha'),(127,'Nevinnomyssk'),(128,'Pjatigorsk'),(129,'Korolev'),(130,'Serpuhov'),(131,'Odintsovo'),(132,'Orehovo-Zujevo'),(133,'Kamyšin'),(134,'Novotšeboksarsk'),(135,'Tšerkessk'),(136,'Atšinsk'),(137,'Magadan'),(138,'Mitšurinsk'),(139,'Kislovodsk'),(140,'Jelets'),(141,'Seversk'),(142,'Noginsk'),(143,'Velikije Luki'),(144,'Novokuibyševsk'),(145,'Neftekamsk'),(146,'Leninsk-Kuznetski'),(147,'Oktjabrski'),(148,'Sergijev Posad'),(149,'Arzamas'),(150,'Kiseljovsk'),(151,'Novotroitsk'),(152,'Obninsk'),(153,'Kansk'),(154,'Glazov'),(155,'Solikamsk'),(156,'Sarapul'),(157,'Ust-Ilimsk'),(158,'Štšolkovo'),(159,'Mezduretšensk'),(160,'Usolje-Sibirskoje'),(161,'Elista'),(162,'Novošahtinsk'),(163,'Votkinsk'),(164,'Kyzyl'),(165,'Serov'),(166,'Zelenodolsk'),(167,'Zeleznodoroznyi'),(168,'Kinešma'),(169,'Kuznetsk'),(170,'Uhta'),(171,'Jessentuki'),(172,'Tobolsk'),(173,'Neftejugansk'),(174,'Bataisk'),(175,'Nojabrsk'),(176,'Balašov'),(177,'Zeleznogorsk'),(178,'Zukovski'),(179,'Anzero-Sudzensk'),(180,'Bugulma'),(181,'Zeleznogorsk'),(182,'Novouralsk'),(183,'Puškin'),(184,'Vorkuta'),(185,'Derbent'),(186,'Kirovo-Tšepetsk'),(187,'Krasnogorsk'),(188,'Klin'),(189,'Tšaikovski'),(190,'Novyi Urengoi');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-30 23:31:57
