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
  `chief` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `chief_fk_idx` (`chief`),
  KEY `premise_id_fk_idx` (`premise_id`),
  CONSTRAINT `chief_id_fk` FOREIGN KEY (`chief`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `premise_id_e_fk` FOREIGN KEY (`premise_id`) REFERENCES `premises` (`premise_id`),
  CONSTRAINT `employees_chk_1` CHECK (((`phone` >= 70000000000) and (`phone` < 80000000000))),
  CONSTRAINT `employees_chk_2` CHECK (((`postcode` >= 100000) and (`postcode` < 1000000)))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629844,2,34,'Окт',1132,0,'2002-04-24','2022-10-26',NULL),(11,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,0,'2002-04-24','2022-10-26',NULL),(12,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(13,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(14,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(15,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL),(16,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',11),(17,7,'Владимир','Вознюк','Владимирович','whererhisplace@gmail.com','Easybd322',79667163270,629884,2,34,'Окт',1132,1,'2002-04-24','2022-10-26',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
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
