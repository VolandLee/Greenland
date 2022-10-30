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
-- Table structure for table `premises`
--

DROP TABLE IF EXISTS `premises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premises` (
  `premise_id` int NOT NULL AUTO_INCREMENT,
  `premise_type` int NOT NULL,
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
  KEY `premise_type_fk_idx` (`premise_type`),
  CONSTRAINT `premise_type_fk` FOREIGN KEY (`premise_type`) REFERENCES `premise_type` (`premise_type_id`),
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-30 23:31:58
