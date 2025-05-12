-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: tubelight
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `Birthday Party`
--

DROP TABLE IF EXISTS `Birthday Party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Birthday Party` (
  `id` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Birthday Party`
--

LOCK TABLES `Birthday Party` WRITE;
/*!40000 ALTER TABLE `Birthday Party` DISABLE KEYS */;
INSERT INTO `Birthday Party` VALUES (0,'Srishti','2025-05-28','17:50:00',17);
/*!40000 ALTER TABLE `Birthday Party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Birthday Party_details`
--

DROP TABLE IF EXISTS `Birthday Party_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Birthday Party_details` (
  `id` int NOT NULL,
  `Birthday Party_id` int DEFAULT NULL,
  `Cake Cutting|Photographers` varchar(100) DEFAULT NULL,
  `Cake Cutting|Photographers-No.  Of Photographers Required` varchar(100) DEFAULT NULL,
  `Games|DJ` varchar(100) DEFAULT NULL,
  `Games|DJ-__none__` varchar(100) DEFAULT NULL,
  `Dinner|Food Caterers` varchar(100) DEFAULT NULL,
  `Dinner|Food Caterers-No of Plates Required` varchar(100) DEFAULT NULL,
  `Dinner|Waiters` varchar(100) DEFAULT NULL,
  `Dinner|Waiters-__none__` varchar(100) DEFAULT NULL,
  `Dinner|DJ` varchar(100) DEFAULT NULL,
  `Dinner|DJ-__none__` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Birthday Party_id` (`Birthday Party_id`),
  CONSTRAINT `Birthday Party_details_ibfk_1` FOREIGN KEY (`Birthday Party_id`) REFERENCES `Birthday Party` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Birthday Party_details`
--

LOCK TABLES `Birthday Party_details` WRITE;
/*!40000 ALTER TABLE `Birthday Party_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `Birthday Party_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bouncers`
--

DROP TABLE IF EXISTS `Bouncers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bouncers` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Price per Event` int DEFAULT NULL,
  `Setup Cost` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  `Customization Options` varchar(100) DEFAULT NULL,
  `Delivery & Setup Fees` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `Bouncers_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bouncers`
--

LOCK TABLES `Bouncers` WRITE;
/*!40000 ALTER TABLE `Bouncers` DISABLE KEYS */;
INSERT INTO `Bouncers` VALUES (0,6,'Elite Guard Services','Professional Bouncers',15000,5000,5,'Yes',3000);
/*!40000 ALTER TABLE `Bouncers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DJ`
--

DROP TABLE IF EXISTS `DJ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DJ` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Fees` int DEFAULT NULL,
  `Duration (Hours)` int DEFAULT NULL,
  `Number of People` int DEFAULT NULL,
  `Equipment Provided` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `DJ_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DJ`
--

LOCK TABLES `DJ` WRITE;
/*!40000 ALTER TABLE `DJ` DISABLE KEYS */;
INSERT INTO `DJ` VALUES (0,4,'DJ Pulsewave',12000,4,3,'Sound system, DJ console, LED lights');
/*!40000 ALTER TABLE `DJ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Food Caterers`
--

DROP TABLE IF EXISTS `Food Caterers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Food Caterers` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Catering fees` int DEFAULT NULL,
  `Cost per plate` int DEFAULT NULL,
  `Service type` varchar(100) DEFAULT NULL,
  `No of Plates Required` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `Food Caterers_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Food Caterers`
--

LOCK TABLES `Food Caterers` WRITE;
/*!40000 ALTER TABLE `Food Caterers` DISABLE KEYS */;
INSERT INTO `Food Caterers` VALUES (0,1,'Gourmet Gatherings',5000,350,'Buffet',NULL),(1,1,'Spice & Spoon Caterers',7500,420,'Sit-down',NULL);
/*!40000 ALTER TABLE `Food Caterers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Furniture Rentals`
--

DROP TABLE IF EXISTS `Furniture Rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Furniture Rentals` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `Setup Time Required` int DEFAULT NULL,
  `No. of Items Required` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `Furniture Rentals_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Furniture Rentals`
--

LOCK TABLES `Furniture Rentals` WRITE;
/*!40000 ALTER TABLE `Furniture Rentals` DISABLE KEYS */;
INSERT INTO `Furniture Rentals` VALUES (0,0,'Rent-a-Furniture','Chairs (Plastic)',5000,500,15,NULL),(1,0,'FurnitureMania','Chairs (Wooden)',1500,500,15,NULL);
/*!40000 ALTER TABLE `Furniture Rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Photographers`
--

DROP TABLE IF EXISTS `Photographers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Photographers` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Fees` int DEFAULT NULL,
  `Price per hour` int DEFAULT NULL,
  `Experience (Years)` int DEFAULT NULL,
  `No.  Of Photographers Required` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `Photographers_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Photographers`
--

LOCK TABLES `Photographers` WRITE;
/*!40000 ALTER TABLE `Photographers` DISABLE KEYS */;
INSERT INTO `Photographers` VALUES (0,2,'FrameCraft Studios',25000,500,8,NULL);
/*!40000 ALTER TABLE `Photographers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sound System`
--

DROP TABLE IF EXISTS `Sound System`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sound System` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Equipment Type` varchar(100) DEFAULT NULL,
  `Price per Day` int DEFAULT NULL,
  `Setup Cost` int DEFAULT NULL,
  `Event Types Covered` varchar(100) DEFAULT NULL,
  `Customization Options` varchar(100) DEFAULT NULL,
  `Delivery & Setup Fees` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `Sound System_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sound System`
--

LOCK TABLES `Sound System` WRITE;
/*!40000 ALTER TABLE `Sound System` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sound System` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Waiters`
--

DROP TABLE IF EXISTS `Waiters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Waiters` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Fees` int DEFAULT NULL,
  `No. of Waiters Provided` int DEFAULT NULL,
  `Shift Duration (Hours)` int DEFAULT NULL,
  `Experience (Years)` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `Waiters_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Waiters`
--

LOCK TABLES `Waiters` WRITE;
/*!40000 ALTER TABLE `Waiters` DISABLE KEYS */;
/*!40000 ALTER TABLE `Waiters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `venue` varchar(1000) DEFAULT NULL,
  `chief_guest` varchar(100) DEFAULT NULL,
  `target_audience` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int NOT NULL,
  `subevent_id` int DEFAULT NULL,
  `file_order` int DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subevent_id` (`subevent_id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`subevent_id`) REFERENCES `subevents` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `columns` varchar(1000) DEFAULT NULL,
  `input_column` varchar(1000) DEFAULT NULL,
  `matching_column` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (0,'Furniture Rentals','Name-text|Service Type-text|Service Cost-number|Price per Hour-number|Setup Time Required-number|No. of Items Required-number','No. of Items Required',NULL),(1,'Food Caterers','Name-text|Catering fees-number|Cost per plate-number|Service type-text|No of Plates Required-number','No of Plates Required','Cost per plate'),(2,'Photographers','Name-text|Service Fees-number|Price per hour-number|Experience (Years)-number|No.  Of Photographers Required-number','No.  Of Photographers Required','__none__'),(3,'Waiters','Name-text|Service Fees-number|No. of Waiters Provided-number|Shift Duration (Hours)-number|Experience (Years)-number','__none__','__none__'),(4,'DJ','Name-text|Service Fees-number|Duration (Hours)-number|Number of People-number|Equipment Provided-text','__none__','__none__'),(5,'Sound System','Name-text|Equipment Type-text|Price per Day-number|Setup Cost-number|Event Types Covered-text|Customization Options-text|Delivery & Setup Fees-number','__none__','__none__'),(6,'Bouncers','Name-text|Service Type-text|Price per Event-number|Setup Cost-number|No. of People-number|Customization Options-text|Delivery & Setup Fees-number','__none__','__none__');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subevents`
--

DROP TABLE IF EXISTS `subevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subevents` (
  `id` int NOT NULL,
  `event_id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `subevents_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subevents`
--

LOCK TABLES `subevents` WRITE;
/*!40000 ALTER TABLE `subevents` DISABLE KEYS */;
/*!40000 ALTER TABLE `subevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `templates` (
  `id` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `raw` varchar(1000) DEFAULT NULL,
  `subevents` varchar(1000) DEFAULT NULL,
  `subevents_raw` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (0,'Birthday Party','Create Birthday Parties efficiently with us','Name:text|Date:date|Time:time|Age:number','Cake Cutting|Games|Dinner','Cake Cutting-[\'Photographers\']|Games-[\'DJ\']|Dinner-[\'Food Caterers\', \'Waiters\', \'DJ\']');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `events` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Aryan','R','aryan','aryan@gmail.com','b5c4f0ab95a1b29da77a4bfb2b5cf4a431b5d612572025004656d3875ed47a35','0-0|');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 21:08:08
