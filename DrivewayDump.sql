CREATE DATABASE  IF NOT EXISTS `driveway` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `driveway`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: driveway
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `accountId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `creationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `expirationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`accountId`),
  UNIQUE KEY `accountId_UNIQUE` (`accountId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'michael@driveways.com','5f4dcc3b5aa765d61d8327deb882cf99','2022-07-09 17:23:12',NULL),(2,'mohit@driveways.com','5f4dcc3b5aa765d61d8327deb882cf99','2022-07-09 17:23:35',NULL),(3,'dat@driveways.com','5f4dcc3b5aa765d61d8327deb882cf99','2022-07-09 17:23:52',NULL),(4,'mike@gmail.com','5f4dcc3b5aa765d61d8327deb882cf99','2022-07-09 17:24:10',NULL),(5,'Jane@hotmail.com','48cccca3bab2ad18832233ee8dff1b0b','2022-07-09 17:24:47',NULL),(6,'Ann1993@hotmail.com','21744541587a40702377ca4350377130','2022-07-09 17:25:18',NULL),(7,'baseball123@yahoo.com','d3fe7fbb93d2119902ab4c55e6866574','2022-07-09 17:25:37',NULL),(8,'1337coder@msn.com','808b57c2867ba6129c1a045caf78a88c','2022-07-09 17:26:01',NULL),(9,'jimmy@gmail.com','b7a052618919e26ab74f4bc83904d4f8','2022-07-09 17:26:25',NULL),(10,'realperson@gmail.com','6701a210751b76568650b050b30b541b','2022-07-09 17:26:59',NULL),(11,'melissa@gmail.com','2998a1bb2719bbf6b58a945354aed6b0','2022-07-09 18:24:56',NULL),(12,'caveperson@gmail.com','bb2f1cffc8887d18b30edb7361b0fb24','2022-07-09 18:26:41',NULL),(13,'orangelover@hotmail.com','42a1292ffd8abbb7c4b2201488996e03','2022-07-09 18:27:27',NULL),(16,'gon@gmail.com','8fe4c11451281c094a6578e6ddbf5eed',NULL,NULL),(17,'assassin@gmail.com','8fe4c11451281c094a6578e6ddbf5eed',NULL,NULL),(19,'dat@gmail.com','202cb962ac59075b964b07152d234b70',NULL,NULL),(20,'michael@gmail.com','202cb962ac59075b964b07152d234b70',NULL,NULL),(21,'mikewu@gmail.com','202cb962ac59075b964b07152d234b70',NULL,NULL),(22,'Mike@wu.com','202cb962ac59075b964b07152d234b70',NULL,NULL),(23,'michael@michael.com','202cb962ac59075b964b07152d234b70',NULL,NULL),(24,'Moore','8fe4c11451281c094a6578e6ddbf5eed',NULL,NULL),(25,'mike@driveways.com','8fe4c11451281c094a6578e6ddbf5eed',NULL,NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressId` int NOT NULL AUTO_INCREMENT,
  `Country` varchar(45) DEFAULT 'United State of America',
  `State` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Zipcode` int DEFAULT NULL,
  `Street` varchar(45) DEFAULT NULL,
  `Number` int DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (22,'U.S.A.','California','San Jose',95112,'1st Street',123),(23,'U.S.A.','California','San Jose',951112,'2nd Street',123),(24,'U.S.A.','California','San Jose',95112,'3rd Street',123456),(29,'U.S.A.','California','San Jose',95110,'S Almaden Ave',1217),(30,'U.S.A.','California','San Jose',95111,'Meadowfaire Dr',2706),(31,'U.S.A.','California','Mountain View',94041,'California St',1721),(32,'U.S.A.','California','San Carlos',94070,'Howare Ave',2540),(33,'U.S.A.','California','Millbrae',94030,'San Anselmo Ave',1129),(34,'U.S.A.','California','San Jose',95112,'E Julian St',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` int NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `account` (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Full'),(2,'Full'),(3,'Full'),(23,'Full'),(25,'Full');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guestId` int NOT NULL,
  `vehicleId` int NOT NULL,
  PRIMARY KEY (`guestId`,`vehicleId`),
  KEY `vehicleId_idx` (`vehicleId`),
  KEY `guest_ibfk_1_idx` (`guestId`),
  CONSTRAINT `guest_ibfk_3` FOREIGN KEY (`guestId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `vehicleId_fk` FOREIGN KEY (`vehicleId`) REFERENCES `vehicle` (`vehicleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (4,1),(5,2),(6,3),(7,4),(8,5),(19,36),(21,37),(22,38),(25,39),(16,50);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host` (
  `accountId` int NOT NULL,
  `listingId` int NOT NULL,
  PRIMARY KEY (`accountId`,`listingId`),
  KEY `host_ibfk_1_idx` (`accountId`),
  KEY `listing_id_fk_idx` (`listingId`),
  CONSTRAINT `host_ibfk_3` FOREIGN KEY (`accountId`) REFERENCES `account` (`accountId`),
  CONSTRAINT `listing_id_fk` FOREIGN KEY (`listingId`) REFERENCES `listing` (`listingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES (16,26),(17,34),(19,28),(19,35),(19,36),(21,29),(21,37),(21,38),(22,30),(23,39);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listing` (
  `listingId` int NOT NULL AUTO_INCREMENT,
  `Status` varchar(45) DEFAULT NULL,
  `parking_size` varchar(45) DEFAULT NULL,
  `addressId` int DEFAULT NULL,
  `dailyRate` decimal(2,0) DEFAULT '5',
  PRIMARY KEY (`listingId`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing`
--

LOCK TABLES `listing` WRITE;
/*!40000 ALTER TABLE `listing` DISABLE KEYS */;
INSERT INTO `listing` VALUES (26,NULL,'Medium',20,5),(28,'Unavailable','Medium',22,5),(29,NULL,'Medium',23,5),(30,NULL,'Large',24,5),(34,NULL,'Medium',29,5),(35,NULL,'Small',30,5),(36,NULL,'Medium',31,5),(37,NULL,'Large',32,5),(38,NULL,'Large',33,5),(39,NULL,'Small',34,5);
/*!40000 ALTER TABLE `listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` int NOT NULL,
  `vehicleId` int DEFAULT NULL,
  `listingId` int DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2,5),(2,3,6),(3,1,4),(4,1,7),(5,8,2),(6,4,1),(7,9,10),(8,5,3),(9,6,8),(10,7,9);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentinformation`
--

DROP TABLE IF EXISTS `paymentinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentinformation` (
  `userId` int DEFAULT NULL,
  `CardNumber` int NOT NULL,
  `ExpDate` datetime DEFAULT NULL,
  PRIMARY KEY (`CardNumber`),
  KEY `paymentinformation_ibfk_1` (`userId`),
  CONSTRAINT `paymentinformation_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentinformation`
--

LOCK TABLES `paymentinformation` WRITE;
/*!40000 ALTER TABLE `paymentinformation` DISABLE KEYS */;
INSERT INTO `paymentinformation` VALUES (16,696969,NULL),(25,1234556,NULL),(22,23456789,NULL),(21,123456789,NULL),(4,132045024,NULL),(7,207261273,NULL),(5,327208572,NULL),(6,439539436,NULL),(10,528968566,NULL),(13,547966870,NULL),(12,576294234,NULL),(9,838207995,NULL),(8,891100594,NULL),(11,948707708,NULL);
/*!40000 ALTER TABLE `paymentinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `guestId` int NOT NULL,
  `orderId` int NOT NULL,
  PRIMARY KEY (`guestId`,`orderId`),
  KEY `orderId_idx` (`orderId`),
  CONSTRAINT `guestId` FOREIGN KEY (`guestId`) REFERENCES `guest` (`guestId`),
  CONSTRAINT `orderId` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (4,1),(6,2),(8,3),(7,4),(4,5),(4,6),(8,7),(7,8),(6,9),(5,10);
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserves`
--

DROP TABLE IF EXISTS `reserves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserves` (
  `orderId` int NOT NULL,
  `listingId` int NOT NULL,
  PRIMARY KEY (`orderId`,`listingId`),
  KEY `listingId_idx` (`listingId`),
  CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`listingId`) REFERENCES `listing` (`listingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserves`
--

LOCK TABLES `reserves` WRITE;
/*!40000 ALTER TABLE `reserves` DISABLE KEYS */;
INSERT INTO `reserves` VALUES (4,1),(5,2),(6,3),(2,4),(9,5),(10,7),(1,8),(3,9),(7,9),(8,10);
/*!40000 ALTER TABLE `reserves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `account` (`accountId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Michael','Moore'),(2,'Mohit','Sonwane'),(3,'Dat','Le'),(4,'Mike','Wu'),(5,'Jane','Dough'),(6,'Ann','Denton'),(7,'John','Texas'),(8,'Thomas','Anderson'),(9,'Jim','McAfee'),(10,'May','Bee'),(11,'Melissa','May'),(12,'Cory','Fields'),(13,'Oliver','Company'),(16,'Gon','Freecs'),(17,'Killua','Zoldick'),(19,'Dat2','Le'),(20,'Michael','Moore'),(21,'Mike','Wu'),(22,'Mike','Wu'),(23,'Michael1','Moore1'),(25,'Mike','Moore');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicleId` int NOT NULL AUTO_INCREMENT,
  `Make` varchar(45) DEFAULT NULL,
  `Model` varchar(45) DEFAULT NULL,
  `Color` varchar(45) DEFAULT NULL,
  `license_plate` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vehicleId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,'Subaru','Forester','White','1HJ-42K'),(2,'Toyota','Corolla','Grey','435-4JAA'),(3,'Jeep','Wrangler','Black','08A-OC7A'),(4,'Mazda','Miata','Red','J8R-097C'),(5,'Kia','Sol','Blue','P01-Y7XK'),(6,'Lamborghini','Diablo','Yellow','L1T-F4M'),(7,'Tesla','Model S','Black','09H-1SO3'),(8,'Ford','F-150','Silver','7S8-KC75'),(9,'Rivian','R1S','Blue','1IX-S094'),(10,'Porsche','911','Green','09Y-YCUS'),(36,'Tesla','X','White','DAT-A$$'),(37,'Mercedes','Benz','Black','MY-B3NZ'),(38,'Mercedes','Benz','Black','1234-0HJK'),(39,'Subaru','Forester','White','123-45L'),(50,'Jeep','Wrangler','White','123-tyty');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 21:34:30
