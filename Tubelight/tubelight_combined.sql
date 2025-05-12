-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: tubelight_combined
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
  `Age` int DEFAULT NULL,
  `Date and Time` datetime DEFAULT NULL,
  `Venue` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Birthday Party`
--

LOCK TABLES `Birthday Party` WRITE;
/*!40000 ALTER TABLE `Birthday Party` DISABLE KEYS */;
INSERT INTO `Birthday Party` VALUES (0,'Srishti',17,'2025-05-28 17:00:00','Royal Meenakshi Mall');
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
  `Birthday Cake Cutting|Screen` varchar(100) DEFAULT NULL,
  `Birthday Cake Cutting|Venue Lighting` varchar(100) DEFAULT NULL,
  `Birthday Cake Cutting|Musician` varchar(100) DEFAULT NULL,
  `Food and Drinks|Waiters` varchar(100) DEFAULT NULL,
  `Food and Drinks|Food Caterers` varchar(100) DEFAULT NULL,
  `Food and Drinks|Food Caterers-No of Plates Required` varchar(100) DEFAULT NULL,
  `Food and Drinks|DJ` varchar(100) DEFAULT NULL,
  `Food and Drinks|Cleaning` varchar(100) DEFAULT NULL,
  `Food and Drinks|Stage Setup` varchar(100) DEFAULT NULL,
  `Post Party|Games & Activity` varchar(100) DEFAULT NULL,
  `Post Party|Cleaning` varchar(100) DEFAULT NULL,
  `Post Party|Stage Setup` varchar(100) DEFAULT NULL,
  `Post Party|Power Backup` varchar(100) DEFAULT NULL,
  `Post Party|Return Gifts` varchar(100) DEFAULT NULL,
  `Post Party|Return Gifts-No. of Gifts Required` varchar(100) DEFAULT NULL,
  `Post Party|Tent & Seating` varchar(100) DEFAULT NULL,
  `Post Party|Tent & Seating-No. of Seats Required` varchar(100) DEFAULT NULL,
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
INSERT INTO `Birthday Party_details` VALUES (0,0,'5','5','2','3','3','390','3','1','3','2','1','4','2','3','40','2','60');
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
INSERT INTO `Bouncers` VALUES (0,6,'Elite Guard Services','Professional Bouncers',15000,5000,5,'Yes',3000),(1,6,'Elite Guard Services','Professional Bouncers',15000,5000,5,'Yes',3000),(2,6,'Shield Force Security ','Event Security',12000,4500,8,'Yes',2800),(3,6,'Titan Protection','Armed Security Personnel ',25000,8000,6,'Yes',4500),(4,6,'Guardian Bouncers','Venue Protection',10000,3500,4,'Yes',2500),(5,6,'SafeShield Security','Personal Security Guards',18000,6000,3,'yes',3500),(6,6,'Fortified Defense','Crowd Management Specialists',13500,4000,10,'Yes',2800);
/*!40000 ALTER TABLE `Bouncers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Car Rental`
--

DROP TABLE IF EXISTS `Car Rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Car Rental` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Price per Day` int DEFAULT NULL,
  `No. of days` int DEFAULT NULL,
  `No. of seats` int DEFAULT NULL,
  `Vehicle Age` int DEFAULT NULL,
  `Mileage Limit` int DEFAULT NULL,
  `Cancellation Policy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `car rental_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Car Rental`
--

LOCK TABLES `Car Rental` WRITE;
/*!40000 ALTER TABLE `Car Rental` DISABLE KEYS */;
INSERT INTO `Car Rental` VALUES (0,16,'DriveIndia Rentals','Basic Car Rental',1500,NULL,6,2,100,'Yes'),(1,16,'EliteDrive Rentals','Luxury Car Rental',5000,NULL,5,1,200,'Yes'),(2,16,'VanHire India','Minivan Rental',3500,NULL,8,3,150,'Yes'),(3,16,'RoadKing Rentals','SUV Rental',4000,NULL,7,2,150,'Yes'),(4,16,'CityTravel Vehicles','Tempo Traveller Rental',7000,NULL,5,4,250,'No'),(5,16,'BigRide Transport','Bus Rental',12000,NULL,5,5,500,'Yes');
/*!40000 ALTER TABLE `Car Rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Certificate`
--

DROP TABLE IF EXISTS `Certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Certificate` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Price per Certificate` int DEFAULT NULL,
  `Certificate Type` varchar(100) DEFAULT NULL,
  `Delivery Time` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `certificate_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Certificate`
--

LOCK TABLES `Certificate` WRITE;
/*!40000 ALTER TABLE `Certificate` DISABLE KEYS */;
INSERT INTO `Certificate` VALUES (0,18,'CertifyNow','Standard Certificate',500,'Printed Certificate',4),(1,18,'PremiumCerts Ltd.','Premium Certificate',1000,'Embossed Certificate',2),(2,18,'CustomCerts','Customizable Certificate',1500,'Personalized Certificate',3),(3,18,'CorpCert Solutions','Corporate Certificate',2000,'Company Logo Certificate',6),(4,18,'EventPro Certifiers','Event Participation Certificate',300,'Event Participation',1),(5,18,'SkillCert Academy','Training Completion Certificate',1200,'Training Certificate',4);
/*!40000 ALTER TABLE `Certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cleaning`
--

DROP TABLE IF EXISTS `Cleaning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cleaning` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost (INR)` int DEFAULT NULL,
  `Price per Hour (INR)` int DEFAULT NULL,
  `Time Required` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `cleaning_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cleaning`
--

LOCK TABLES `Cleaning` WRITE;
/*!40000 ALTER TABLE `Cleaning` DISABLE KEYS */;
INSERT INTO `Cleaning` VALUES (0,8,'Urban Company','General Venue Cleaning',5000,1200,1,3),(1,8,'CleanFanatic','Carpet Deep Cleaning',2000,1000,1,2),(2,8,'QuikClean India','Toilet & Restroom Cleaning',3000,1200,2,2),(3,8,'Cleanomatics','Post-Event Clean-up',8000,2000,1,4),(4,8,'HiCare','Sofa/Chair Shampooing',3000,1500,1,2),(5,8,'CleanStaff Services','Full-Day Cleaning Staff',1200,1500,3,1);
/*!40000 ALTER TABLE `Cleaning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cremation`
--

DROP TABLE IF EXISTS `Cremation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cremation` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Unit` int DEFAULT NULL,
  `No. of Workmen` int DEFAULT NULL,
  `Cancellation Policy` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `cremation_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cremation`
--

LOCK TABLES `Cremation` WRITE;
/*!40000 ALTER TABLE `Cremation` DISABLE KEYS */;
INSERT INTO `Cremation` VALUES (0,15,'MokshVahan Services','Hearse Van Service',2500,1000,2,'Full refund if canceled 2 hrs prior'),(1,15,'AntimYatra Solutions','Cremation Ground Booking',1000,500,1,'Non-refundable once booked'),(2,15,'MokshaPriest Services','Priest for Last Rites',3000,1000,1,'50% refund if canceled 3 hrs prior'),(3,15,'Antyeshti Essentials','Samagri Kit',1800,1800,1,'Not applicable'),(4,15,'ShantiSeva Support','Freezer Box Rental',4000,4000,2,'Full refund if canceled 12 hrs prior'),(5,15,'PeacefulFarewell India','Chautha Setup',6000,1500,3,'75% refund if canceled 24 hrs prior');
/*!40000 ALTER TABLE `Cremation` ENABLE KEYS */;
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
INSERT INTO `DJ` VALUES (0,4,'DJ Pulsewave',12000,4,3,'Sound system, DJ console, LED lights'),(1,4,'BeatStorm DJs',18000,5,4,'Full PA system, wireless mics, lighting rig'),(2,4,'EchoGroove Productions',10000,3,5,'Compact setup, speakers, mixer'),(3,4,'DJ NovaSound',25000,6,2,'Premium console, smoke machine, stage lights'),(4,4,'SonicSpree Entertainment',15000,4,3,'DJ booth, bass speakers, disco lights'),(5,4,'Bassline Vibes',20000,5,2,'Laser lights, subwoofers, visuals & screen setup');
/*!40000 ALTER TABLE `DJ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Decorations`
--

DROP TABLE IF EXISTS `Decorations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Decorations` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Fees` int DEFAULT NULL,
  `Items Provided` varchar(100) DEFAULT NULL,
  `Experience (Years)` int DEFAULT NULL,
  `No. of Items` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `decorations_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Decorations`
--

LOCK TABLES `Decorations` WRITE;
/*!40000 ALTER TABLE `Decorations` DISABLE KEYS */;
INSERT INTO `Decorations` VALUES (0,20,'Blossom & Co.',30000,'paintings, artwork, mirrors',8,5),(1,20,'Elegant Events Decor',20000,'clocks,Magazine racks,Decorative hooks and hangers  ',5,4),(2,20,'DreamWeavers Decorators',25000,'Wall decals or stickers',6,6),(3,20,'Shaadi Sparkle',50000,'Sculptures and figurines, Bowls and trays, ',10,8),(4,20,'Festive Aura Designsv',18000,'Decorative boxes, Globes and antique objects',7,5),(5,20,'PartyCanvas Creations',15000,'Bowls and trays, Lanterns and garlands, Seasonal wreaths',4,3);
/*!40000 ALTER TABLE `Decorations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Devotional Group`
--

DROP TABLE IF EXISTS `Devotional Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Devotional Group` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `Setup Time Required` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `devotional group_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Devotional Group`
--

LOCK TABLES `Devotional Group` WRITE;
/*!40000 ALTER TABLE `Devotional Group` DISABLE KEYS */;
INSERT INTO `Devotional Group` VALUES (0,14,'DivineMelodies','Bhajan Group',8000,2000,1,5),(1,14,'BhaktiSwar','Kirtan Group',10000,2500,2,6),(2,14,'SangeetSadhana','Classical Devotional Band',12000,3000,2,5),(3,14,'HariNaam Seva','Sankirtan Mandali',15000,3500,2,8),(4,14,'Anand Raga','Live Flute and Tabla Duo',6000,1500,1,2),(5,14,'Shakti Bhajan Group','Female Devotional Singers',9000,2000,1,4);
/*!40000 ALTER TABLE `Devotional Group` ENABLE KEYS */;
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
INSERT INTO `Food Caterers` VALUES (0,1,'Gourmet Gatherings',5000,350,'Buffet',NULL),(1,1,'Spice & Spoon Caterers',7500,420,'Sit-down',NULL),(2,1,'Urban Tandoor Events',4000,300,'Live Counter Buffet',NULL),(3,1,'Festive Flavors Co.',6000,390,'Boxed Meals',NULL),(4,1,'Royal Feast Services',10000,500,'Plated Dinner',NULL),(5,1,'The Green Bowl Kitchen',3000,280,'Self-serve Buffet',NULL);
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
INSERT INTO `Furniture Rentals` VALUES (0,0,'Rent-a-Furniture','Chairs (Plastic)',5000,500,15,NULL),(1,0,'FurnitureMania','Chairs (Wooden)',1500,500,15,NULL),(2,0,'EventFurniture Rentals','Tables (Round)',3300,550,20,NULL),(3,0,'RentMyFurniture','Tables (Rectangular)',500,450,15,NULL),(4,0,'SofaRent India','Sofa Set (3-Seater) ',4500,500,30,NULL),(5,0,'EventFurnishings','Full Furniture Package',2000,600,60,NULL);
/*!40000 ALTER TABLE `Furniture Rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Games & Activity`
--

DROP TABLE IF EXISTS `Games & Activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Games & Activity` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Game Type` varchar(100) DEFAULT NULL,
  `Approx. Cost (INR)` int DEFAULT NULL,
  `Price per Hour (INR)` int DEFAULT NULL,
  `Setup Time Required` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `games & activity_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Games & Activity`
--

LOCK TABLES `Games & Activity` WRITE;
/*!40000 ALTER TABLE `Games & Activity` DISABLE KEYS */;
INSERT INTO `Games & Activity` VALUES (0,7,'KidsJump India','Bouncy Castle (Small)',4500,1500,1),(1,7,'BullRide Events','Mechanical Bull Ride',15000,3500,1),(2,7,'VR Zone India','VR Gaming Booth',20000,5000,2),(3,7,'MegaBounce','Inflatable Obstacle Course',12000,4000,2),(4,7,'PlayNation','Human Foosball',13000,3500,1),(5,7,'PartyPropZ','Giant Jenga & Connect 4',4000,1000,1);
/*!40000 ALTER TABLE `Games & Activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Musician`
--

DROP TABLE IF EXISTS `Musician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Musician` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Fees` int DEFAULT NULL,
  `Setup Time Required` int DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `Experience (Years)` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `musician_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Musician`
--

LOCK TABLES `Musician` WRITE;
/*!40000 ALTER TABLE `Musician` DISABLE KEYS */;
INSERT INTO `Musician` VALUES (0,23,'Rhythm Roots Collective',20000,2,2500,7),(1,23,'Melodic Vibes',12000,1,2000,5),(2,23,'DJ PulseBeats',18000,2,3000,6),(3,23,'Strings & Harmony',15000,2,2500,8),(4,23,'DesiGroove Band',25000,3,3125,9),(5,23,'The Jazz Junction',16000,1,2000,4);
/*!40000 ALTER TABLE `Musician` ENABLE KEYS */;
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
INSERT INTO `Photographers` VALUES (0,2,'FrameCraft Studios',25000,500,8,NULL),(1,2,'SnapAura Photography',18000,650,5,NULL),(2,2,'PixelGlow Creations',30000,740,10,NULL),(3,2,'FlashFrame Studios',15000,590,4,NULL),(4,2,'ShutterTales Photography',22000,640,6,NULL),(5,2,'Moments & Memories Studio',28000,700,9,NULL);
/*!40000 ALTER TABLE `Photographers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Power Backup`
--

DROP TABLE IF EXISTS `Power Backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Power Backup` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `Setup Time Required` int DEFAULT NULL,
  `No. of Generators` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `power backup_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Power Backup`
--

LOCK TABLES `Power Backup` WRITE;
/*!40000 ALTER TABLE `Power Backup` DISABLE KEYS */;
INSERT INTO `Power Backup` VALUES (0,11,'GenPower Solutions','Generator Rental',5000,800,1,1),(1,11,'PowerGen Rentals','Generator Rental',10000,1500,1,2),(2,11,'PowerTech Rentals','Generator Rental',20000,2500,2,3),(3,11,'UPS Experts India','UPS Backup System',8000,1200,1,2),(4,11,'PowerPro Systems','Full-Event Power Backup',40000,5000,3,5),(5,11,'QuickPower Services','Battery Backup',3000,600,1,1);
/*!40000 ALTER TABLE `Power Backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Return Gifts`
--

DROP TABLE IF EXISTS `Return Gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Return Gifts` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Unit` int DEFAULT NULL,
  `No. of Gifts Required` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `return gifts_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Return Gifts`
--

LOCK TABLES `Return Gifts` WRITE;
/*!40000 ALTER TABLE `Return Gifts` DISABLE KEYS */;
INSERT INTO `Return Gifts` VALUES (0,12,'GiftBox India','Personalized Keychains',100,50,NULL,1),(1,12,'CustomGifts India','Customized Mugs',300,100,NULL,1),(2,12,'GiftWorld','Scented Candles',200,80,NULL,1),(3,12,'HamperStore India','Gift Hampers',1000,300,NULL,2),(4,12,'PrintIt India','Tote Bags',500,150,NULL,1),(5,12,'LuxeGifts India','Luxury Return Gifts',5000,1000,NULL,2);
/*!40000 ALTER TABLE `Return Gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ritual Setup`
--

DROP TABLE IF EXISTS `Ritual Setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ritual Setup` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Unit` int DEFAULT NULL,
  `Setup Time Required` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `ritual setup_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ritual Setup`
--

LOCK TABLES `Ritual Setup` WRITE;
/*!40000 ALTER TABLE `Ritual Setup` DISABLE KEYS */;
INSERT INTO `Ritual Setup` VALUES (0,13,'Rituals India','Pooja Setup Small',2000,500,1,2),(1,13,'DivineRituals','Pooja Setup Large',5000,1500,2,3),(2,13,'PujaSetup India','Hawan Setup',3000,1000,2,2),(3,13,'SacredPriests','Priest for Ceremony',2500,1000,1,1),(4,13,'MandapDesigns India','Mandap Setup',10000,2000,3,4),(5,13,'FloralRituals India','Decorative Flowers Setup',2500,500,2,2);
/*!40000 ALTER TABLE `Ritual Setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Screen`
--

DROP TABLE IF EXISTS `Screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Screen` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Price per Event` int DEFAULT NULL,
  `Setup Cost` int DEFAULT NULL,
  `Booking Duration` int DEFAULT NULL,
  `Customization Options` varchar(100) DEFAULT NULL,
  `Delivery & Setup Fees` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `screen_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Screen`
--

LOCK TABLES `Screen` WRITE;
/*!40000 ALTER TABLE `Screen` DISABLE KEYS */;
INSERT INTO `Screen` VALUES (0,25,'LED Video Wall',20000,7000,1,'Yes',4500),(1,25,'Projection Screen',8000,3000,1,'Yes',2500),(2,25,'Outdoor Giant Screen',25000,10000,1,'Yes',5500),(3,25,'Interactive Touchscreen',12000,5000,1,'Yes',3500),(4,25,'Cinema Projection Screen',15000,6500,1,'Yes',4000),(5,25,'360-Degree Display',30000,12000,1,'Yes',6000);
/*!40000 ALTER TABLE `Screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Security`
--

DROP TABLE IF EXISTS `Security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Security` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `security_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Security`
--

LOCK TABLES `Security` WRITE;
/*!40000 ALTER TABLE `Security` DISABLE KEYS */;
INSERT INTO `Security` VALUES (0,10,'SecureEvents India','Basic Event Security ',3000,500,1),(1,10,'ShieldGuard Security','Crowd Control ',6000,1200,2),(2,10,'VIPSecure Services','VIP Security ',8000,1500,1),(3,10,'GuardPro Solutions','Full Event Security ',20000,3500,5),(4,10,'SecureForce India','Emergency Response Team',15000,2500,3);
/*!40000 ALTER TABLE `Security` ENABLE KEYS */;
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
INSERT INTO `Sound System` VALUES (0,5,'Sonic Blast Audio','Professional PA System',5000,2000,'Concerts, Conferences','Yes',1500),(1,5,'Crystal Clear Sounds','DJ Equipment',7500,3000,'Weddings, Private Parties','Yes',2000),(2,5,'EchoWave Rentals','Home Theatre Setup',3500,1500,'Corporate Events, Film Screenings','Yes',1200),(3,5,'Bass Boost Audio','Large-Scale Sound System',10000,4500,'Festivals, Open-Air Events','Yes',3000),(4,5,'Sound Spectrum ','Wireless Speaker Sets',2000,1000,'Small Gatherings, Seminars','Yes',800),(5,5,'High Fidelity Audio','Studio-Grade Sound',6500,2500,'Music Production, Recording Sessions','Yes',1800);
/*!40000 ALTER TABLE `Sound System` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stage Setup`
--

DROP TABLE IF EXISTS `Stage Setup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stage Setup` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Service Cost` int DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `Setup Time Required` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `stage setup_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stage Setup`
--

LOCK TABLES `Stage Setup` WRITE;
/*!40000 ALTER TABLE `Stage Setup` DISABLE KEYS */;
INSERT INTO `Stage Setup` VALUES (0,9,'StageCraft India','Basic Stage Setup',15000,2500,2,4),(1,9,'LightSound India','LED Screen Setup',25000,4500,3,5),(2,9,'EventAudio Solutions','Sound System Setup',10000,2000,2,3),(3,9,'LightUp Events','Lighting Setup',12000,2500,2,3),(4,9,'StagePro Productions','Full Stage Production',50000,8000,5,7),(5,9,'DecorStage Events','Backdrop & Decor Setup',20000,3500,2,4);
/*!40000 ALTER TABLE `Stage Setup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tent & Seating`
--

DROP TABLE IF EXISTS `Tent & Seating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tent & Seating` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Price per Day` int DEFAULT NULL,
  `Price per Tent` int DEFAULT NULL,
  `No. of Seats Required` int DEFAULT NULL,
  `Tent Type` varchar(100) DEFAULT NULL,
  `Seating Arrangement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `tent & seating_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tent & Seating`
--

LOCK TABLES `Tent & Seating` WRITE;
/*!40000 ALTER TABLE `Tent & Seating` DISABLE KEYS */;
INSERT INTO `Tent & Seating` VALUES (0,19,'TentMasters India','Basic Tent Setup',10000,5000,NULL,'Dome Tent','Rows of Chairs'),(1,19,'LuxuryEvents Setup','Deluxe Tent Setup',20000,10000,NULL,'High-peak Tent','Round Tables'),(2,19,'WeddingEvent Planners','Wedding Tent and Seating',25000,12000,NULL,'Clear-span Tent','Banquet Style'),(3,19,'Corporate Events Ltd.','Corporate Event Tent',15000,7500,NULL,'Marquee Tent','Conference Style'),(4,19,'EventPlanners India','Party Tent Setup',12000,6000,NULL,'Pole Tent','Lounge Style'),(5,19,'FestiTents','Festival Tent and Seating',18000,9000,NULL,'Pop-up Tent','Picnic Style');
/*!40000 ALTER TABLE `Tent & Seating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tour Guide`
--

DROP TABLE IF EXISTS `Tour Guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tour Guide` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Type` varchar(100) DEFAULT NULL,
  `Price per Day` int DEFAULT NULL,
  `No. of People` int DEFAULT NULL,
  `Tour Guide Experience` int DEFAULT NULL,
  `Language` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `tour guide_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tour Guide`
--

LOCK TABLES `Tour Guide` WRITE;
/*!40000 ALTER TABLE `Tour Guide` DISABLE KEYS */;
INSERT INTO `Tour Guide` VALUES (0,17,'CityExplorers','Local City Tour Guide',2000,1,5,'English'),(1,17,'HeritageGuides India','Historical Tour Guide',3500,2,10,'English, Hindi'),(2,17,'AdventureSeekers India','Adventure Tour Guide',4500,2,8,'English, Marathi'),(3,17,'SacredJourneys','Religious Tour Guide',2500,3,6,'Hindi, Sanskrit'),(4,17,'WildNature Expeditions','Nature/ Wildlife Tour Guide',5000,1,7,'English, Kannada'),(5,17,'GlobalTour Leaders','Multi-Language Tour Guide',6000,2,15,'English, French, Spanish');
/*!40000 ALTER TABLE `Tour Guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Valet`
--

DROP TABLE IF EXISTS `Valet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Valet` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Fees` int DEFAULT NULL,
  `No. of Attendants` int DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `Experience (Years)` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `valet_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Valet`
--

LOCK TABLES `Valet` WRITE;
/*!40000 ALTER TABLE `Valet` DISABLE KEYS */;
INSERT INTO `Valet` VALUES (0,21,'SwiftPark Valet Services',7000,4,200,6),(1,21,'EliteDrive Parking Crew',9000,5,240,8),(2,21,'ParkEase Professionals',6500,3,300,4),(3,21,'RoyalWheel Valet Co.',10000,6,280,9),(4,21,'QuickPark Solutions',5800,4,350,3),(5,21,'MetroValet Pvt. Ltd.',8500,5,290,7);
/*!40000 ALTER TABLE `Valet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Venue Lighting`
--

DROP TABLE IF EXISTS `Venue Lighting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Venue Lighting` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Lighting Type` varchar(100) DEFAULT NULL,
  `Price per Event` int DEFAULT NULL,
  `Booking Duration` int DEFAULT NULL,
  `Customization Options` varchar(100) DEFAULT NULL,
  `Delivery & Setup Fees` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `venue lighting_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Venue Lighting`
--

LOCK TABLES `Venue Lighting` WRITE;
/*!40000 ALTER TABLE `Venue Lighting` DISABLE KEYS */;
INSERT INTO `Venue Lighting` VALUES (0,24,'Luminous Events','LED Ambient Lighting',11000,1,'Yes',2500),(1,24,'BrightVibes Lighting','Stage & Concert Lighting',20000,1,'Yes',3500),(2,24,'SparkGlow Rentals','Decorative Chandeliers',16000,1,'Yes',3000),(3,24,'Radiance Pro Lighting','Intelligent DMX Lighting',14500,1,'Yes',3200),(4,24,'GlowWave Systems','Outdoor & Garden Lighting',8700,1,'Yes',2000),(5,24,'NeonPulse Productions','UV & Special Effects Lighting',14400,1,'Yes',4000);
/*!40000 ALTER TABLE `Venue Lighting` ENABLE KEYS */;
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
INSERT INTO `Waiters` VALUES (0,3,'ServeSmart Hospitality',6000,4,6,5),(1,3,'Elite Serve Pvt. Ltd.',8000,6,8,7),(2,3,'EventEase Services',4500,3,5,3),(3,3,'Silver Tray Staffing',10000,7,8,10),(4,3,'PlatePerfect Cater Staff',5500,4,6,4),(5,3,'UrbanServe Hospitality ',7200,5,7,6);
/*!40000 ALTER TABLE `Waiters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wedding Coordinator`
--

DROP TABLE IF EXISTS `Wedding Coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wedding Coordinator` (
  `id` int NOT NULL,
  `services_id` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Service Fees` int DEFAULT NULL,
  `Languages Spoken` varchar(100) DEFAULT NULL,
  `Price per Hour` int DEFAULT NULL,
  `Experience (Years)` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_id` (`services_id`),
  CONSTRAINT `wedding coordinator_ibfk_1` FOREIGN KEY (`services_id`) REFERENCES `services` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wedding Coordinator`
--

LOCK TABLES `Wedding Coordinator` WRITE;
/*!40000 ALTER TABLE `Wedding Coordinator` DISABLE KEYS */;
INSERT INTO `Wedding Coordinator` VALUES (0,22,'Graceful Events Co.',15000,'English, Hindi',1875,7),(1,22,'PlanCraft Management',12000,'Hindi, Tamil',2000,5),(2,22,'EventEase Planners',18000,'English, Kannada',2250,8),(3,22,'Blissful Day Coordinators',14000,'English, Marathi, Hindi',2000,6),(4,22,'UnityEvent Managers',16000,'English, Telugu',1600,10),(5,22,'DreamSync Event Services',13500,'Hindi, Bengali, English',2700,4);
/*!40000 ALTER TABLE `Wedding Coordinator` ENABLE KEYS */;
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
INSERT INTO `services` VALUES (0,'Furniture Rentals','Name-text|Service Type-text|Service Cost-number|Price per Hour-number|Setup Time Required-number|No. of Items Required-number','No. of Items Required',NULL),(1,'Food Caterers','Name-text|Catering fees-number|Cost per plate-number|Service type-text|No of Plates Required-number','No of Plates Required','Cost per plate'),(2,'Photographers','Name-text|Service Fees-number|Price per hour-number|Experience (Years)-number|No.  Of Photographers Required-number','No.  Of Photographers Required','__none__'),(3,'Waiters','Name-text|Service Fees-number|No. of Waiters Provided-number|Shift Duration (Hours)-number|Experience (Years)-number','__none__','__none__'),(4,'DJ','Name-text|Service Fees-number|Duration (Hours)-number|Number of People-number|Equipment Provided-text','__none__','__none__'),(5,'Sound System','Name-text|Equipment Type-text|Price per Day-number|Setup Cost-number|Event Types Covered-text|Customization Options-text|Delivery & Setup Fees-number','__none__','__none__'),(6,'Bouncers','Name-text|Service Type-text|Price per Event-number|Setup Cost-number|No. of People-number|Customization Options-text|Delivery & Setup Fees-number','__none__','__none__'),(7,'Games & Activity','Name-text|Game Type-text|Approx. Cost (INR)-number|Price per Hour (INR)-number|Setup Time Required-number','__none__','__none__'),(8,'Cleaning','Name-text|Service Type-text|Service Cost (INR)-number|Price per Hour (INR)-number|Time Required-number|No. of People-number','__none__','__none__'),(9,'Stage Setup','Name-text|Service Type-text|Service Cost-number|Price per Hour-number|Setup Time Required-number|No. of People-number','__none__','__none__'),(10,'Security','Name-text|Service Type-text|Service Cost-number|Price per Hour-number|No. of People-number','__none__','__none__'),(11,'Power Backup','Name-text|Service Type-text|Service Cost-number|Price per Hour-number|Setup Time Required-number|No. of Generators-number','__none__','__none__'),(12,'Return Gifts','Name-text|Service Type-text|Service Cost-number|Price per Unit-number|No. of Gifts Required-number|No. of People-number','No. of Gifts Required','Price per Unit'),(13,'Ritual Setup','Name-text|Service Type-text|Service Cost-number|Price per Unit-number|Setup Time Required-number|No. of People-number','__none__','__none__'),(14,'Devotional Group','Name-text|Service Type-text|Service Cost-number|Price per Hour-number|Setup Time Required-number|No. of People-number','__none__','__none__'),(15,'Cremation','Name-text|Service Type-text|Service Cost-number|Price per Unit-number|No. of Workmen-number|Cancellation Policy-text','__none__','__none__'),(16,'Car Rental','Name-text|Service Type-text|Price per Day-number|No. of days-number|No. of seats-number|Vehicle Age-number|Mileage Limit-number|Cancellation Policy-text','No. of days','__none__'),(17,'Tour Guide','Name-text|Service Type-text|Price per Day-number|No. of People-number|Tour Guide Experience-number|Language-text','__none__','__none__'),(18,'Certificate','Name-text|Service Type-text|Price per Certificate-number|Certificate Type-text|Delivery Time-number','__none__','__none__'),(19,'Tent & Seating','Name-text|Service Type-text|Price per Day-number|Price per Tent-number|No. of Seats Required-number|Tent Type-text|Seating Arrangement-text','No. of Seats Required','__none__'),(20,'Decorations','Name-text|Service Fees-number|Items Provided-text|Experience (Years)-number|No. of Items-number','__none__','__none__'),(21,'Valet','Name-text|Service Fees-number|No. of Attendants-number|Price per Hour-number|Experience (Years)-number','__none__','__none__'),(22,'Wedding Coordinator','Name-text|Service Fees-number|Languages Spoken-text|Price per Hour-number|Experience (Years)-number','__none__','__none__'),(23,'Musician',' Name-text|Service Fees-number|Setup Time Required-number|Price per Hour-number|Experience (Years)-number','__none__','__none__'),(24,'Venue Lighting','Name-text|Lighting Type-text|Price per Event-number|Booking Duration-number|Customization Options-text|Delivery & Setup Fees-number','__none__','__none__'),(25,'Screen','Name-text|Price per Event-number|Setup Cost-number|Booking Duration-number|Customization Options-text|Delivery & Setup Fees-number','__none__','__none__');
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
INSERT INTO `templates` VALUES (0,'Birthday Party','Plan Birthday Parties with ease with Tubelight','Name:text|Age:number|Date and Time:datetime|Venue:textarea','Birthday Cake Cutting|Food and Drinks|Post Party','Birthday Cake Cutting-[\'Screen\', \'Venue Lighting\', \'Musician\']|Food and Drinks-[\'Waiters\', \'Food Caterers\', \'DJ\', \'Cleaning\', \'Stage Setup\']|Post Party-[\'Games & Activity\', \'Cleaning\', \'Stage Setup\', \'Power Backup\', \'Return Gifts\', \'Tent & Seating\']');
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

-- Dump completed on 2025-05-13  4:50:14
