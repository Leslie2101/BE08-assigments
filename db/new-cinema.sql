-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinema
-- ------------------------------------------------------
-- Server version	8.0.23

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


USE galaxy_cinema;
--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `screening_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1),(2,1,2),(3,1,3),(4,12,4),(5,12,5),(6,13,6),(7,14,7),(8,15,8),(9,15,9),(10,22,10),(11,22,11),(12,16,12),(13,16,13),(14,21,14),(15,24,15),(16,23,16),(17,5,17),(18,6,18),(19,7,19),(20,8,20),(21,9,21);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Dung','Nguyen','090909090','a1@gmail.com'),(2,'Teo','Tran','0980804654','a2@gmail.com'),(3,'David','Teo','0920804654','a3@gmail.com'),(4,'Bond','Jame','0920804654','a3@gmail.com'),(5,'Marry','Hohm','0920804654','a4@gmail.com'),(6,'Wo','Ro','0960804654','a5@gmail.com'),(7,'Ha','Nal','0320804654','a6@gmail.com'),(8,'Hui','Do','0782804654','a7@gmail.com'),(9,'Jay','Messi','0990804654','a8@gmail.com'),(10,'Denn','Tien','0920504654','a9@gmail.com'),(11,'Dum','Ngu','0920802654','a11@gmail.com'),(12,'Mie','Weo','0920805654','a32@gmail.com'),(13,'Park','Heo','0920404654','a34@gmail.com'),(14,'Seo','Jim','0920864654','a36@gmail.com'),(15,'Kyot','Tom','0920204654','a23@gmail.com'),(16,'Mina','Mi','0920104654','a63@gmail.com'),(17,'Mon','Mom','0920304654','a93@gmail.com'),(18,'Do','Daa','0920504654','a13@gmail.com'),(19,'Na','Kim','0920804654','a3@gmail.com'),(20,'Ru','Hoon','0920804454','a83@gmail.com'),(21,'To','Im','0920804674','a30@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `length_min` int DEFAULT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
INSERT INTO `film` VALUES (1,'Tom&Jerry',90,'US','children'),(2,'Minak',120,'TH','horror'),(3,'Titanic',180,'US','romantic'),(4,'Assasin',98,'RU','action'),(5,'Spiderman',150,'US','scifi'),(6,'Doctor Strange',130,'US','scifi'),(7,'Doreamon',127,'JP','children'),(8,'Death Note',99,'JP','horror'),(9,'Naruto',199,'JP','children'),(10,'NEW',99,'VN','kid');
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserved_seat`
--

DROP TABLE IF EXISTS `reserved_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserved_seat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserved_seat`
--

LOCK TABLES `reserved_seat` WRITE;
/*!40000 ALTER TABLE `reserved_seat` DISABLE KEYS */;
INSERT INTO `reserved_seat` VALUES (1,1,7),(2,1,8),(3,2,9),(4,2,10),(5,3,1),(6,3,2),(7,4,94),(8,5,95),(9,6,143),(10,6,144),(11,7,143),(12,7,144),(13,8,143),(14,9,149),(15,9,150),(16,9,151),(17,10,290),(18,11,291),(19,11,292),(20,11,293),(21,11,294),(22,12,180),(23,12,181),(24,12,182),(25,13,183),(26,13,185),(27,14,253),(28,14,254),(29,15,19),(30,16,32),(31,16,33),(32,16,34),(33,16,35),(34,16,36),(35,17,11),(36,17,12),(37,18,4),(38,19,25),(39,20,55),(40,21,55);
/*!40000 ALTER TABLE `reserved_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'Room 1'),(2,'Room 2'),(3,'Room 3'),(4,'Room 4'),(5,'Room 5'),(6,'Room 6'),(7,'Room 7');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screening`
--

DROP TABLE IF EXISTS `screening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screening` (
  `id` int NOT NULL AUTO_INCREMENT,
  `film_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `room_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screening`
--

LOCK TABLES `screening` WRITE;
/*!40000 ALTER TABLE `screening` DISABLE KEYS */;
INSERT INTO `screening` VALUES (1,1,1,'2022-05-24 08:00:00',NULL),(2,1,1,'2022-05-24 10:00:00',NULL),(3,1,2,'2022-05-24 08:00:00',NULL),(4,1,2,'2022-05-24 10:00:00',NULL),(5,1,1,'2022-05-25 08:00:00',NULL),(6,1,1,'2022-05-25 18:00:00',NULL),(7,1,2,'2022-05-25 20:00:00',NULL),(8,2,3,'2022-05-24 08:00:00',NULL),(9,2,3,'2022-05-24 10:30:00',NULL),(10,2,3,'2022-05-24 13:00:00',NULL),(11,2,4,'2022-05-24 08:00:00',NULL),(12,2,4,'2022-05-24 10:00:00',NULL),(13,3,5,'2022-05-24 08:00:00',NULL),(14,3,5,'2022-05-24 13:00:00',NULL),(15,3,5,'2022-05-24 17:00:00',NULL),(16,3,6,'2022-05-24 09:00:00',NULL),(17,3,6,'2022-05-24 16:00:00',NULL),(18,3,6,'2022-05-24 20:00:00',NULL),(19,4,7,'2022-05-24 08:00:00',NULL),(20,4,7,'2022-05-24 10:00:00',NULL),(21,4,7,'2022-05-24 18:00:00',NULL),(22,4,7,'2022-05-24 20:00:00',NULL),(23,5,2,'2022-05-25 07:30:00',NULL),(24,5,2,'2022-05-25 10:15:00',NULL),(25,5,2,'2022-05-25 15:40:00',NULL),(26,2,3,'2022-05-25 08:00:00',NULL),(27,3,3,'2022-05-25 12:15:00',NULL),(28,4,3,'2022-05-25 16:00:00',NULL),(29,5,3,'2022-05-25 18:15:00',NULL),(30,6,4,'2022-05-25 13:00:00',NULL),(31,6,4,'2022-05-25 16:00:00',NULL),(32,7,4,'2022-05-25 20:15:00',NULL),(33,8,5,'2022-05-25 13:00:00',NULL),(34,8,5,'2022-05-25 16:00:00',NULL),(35,8,5,'2022-05-25 20:15:00',NULL),(36,8,6,'2022-05-25 13:00:00',NULL),(37,8,6,'2022-05-25 16:00:00',NULL),(38,9,6,'2022-05-25 16:00:00',NULL),(39,9,6,'2022-05-25 20:15:00',NULL),(40,9,7,'2022-05-25 16:00:00',NULL),(41,9,7,'2022-05-25 20:15:00',NULL),(42,5,2,'2022-05-26 07:30:00',NULL),(43,5,2,'2022-05-26 10:15:00',NULL),(44,5,2,'2022-05-26 15:40:00',NULL),(45,2,3,'2022-05-26 08:00:00',NULL),(46,3,3,'2022-05-26 12:15:00',NULL),(47,4,3,'2022-05-26 16:00:00',NULL),(48,5,3,'2022-05-26 18:15:00',NULL),(49,6,4,'2022-05-26 13:00:00',NULL),(50,6,4,'2022-05-26 16:00:00',NULL),(51,7,4,'2022-05-26 20:15:00',NULL),(52,8,5,'2022-05-26 13:00:00',NULL),(53,8,5,'2022-05-26 16:00:00',NULL),(54,8,5,'2022-05-26 20:15:00',NULL),(55,8,6,'2022-05-26 13:00:00',NULL),(56,8,6,'2022-05-26 16:00:00',NULL),(57,9,6,'2022-05-26 16:00:00',NULL),(58,9,6,'2022-05-26 20:15:00',NULL),(59,9,7,'2022-05-26 16:00:00',NULL),(60,9,7,'2022-05-26 20:15:00',NULL),(61,2,1,'2022-05-27 07:30:00',NULL),(62,2,1,'2022-05-27 11:15:00',NULL),(63,2,1,'2022-05-27 20:00:00',NULL),(64,1,2,'2022-05-27 07:30:00',NULL),(65,5,2,'2022-05-27 10:15:00',NULL),(66,5,2,'2022-05-27 15:40:00',NULL),(67,2,3,'2022-05-27 08:00:00',NULL),(68,3,3,'2022-05-27 12:15:00',NULL),(69,4,3,'2022-05-27 16:00:00',NULL),(70,5,3,'2022-05-27 18:15:00',NULL),(71,6,4,'2022-05-27 13:00:00',NULL),(72,6,4,'2022-05-27 16:00:00',NULL),(73,7,4,'2022-05-27 20:15:00',NULL),(74,8,5,'2022-05-27 13:00:00',NULL),(75,8,5,'2022-05-27 16:00:00',NULL),(76,8,5,'2022-05-27 20:15:00',NULL),(77,8,6,'2022-05-27 13:00:00',NULL),(78,1,6,'2022-05-27 16:00:00',NULL),(79,9,6,'2022-05-27 16:00:00',NULL),(80,9,6,'2022-05-27 20:15:00',NULL),(81,9,7,'2022-05-27 16:00:00',NULL),(82,9,7,'2022-05-27 20:15:00',NULL),(83,1,1,'2022-05-28 07:30:00',NULL),(84,2,1,'2022-05-28 11:15:00',NULL),(85,2,1,'2022-05-28 20:00:00',NULL),(86,1,2,'2022-05-28 07:30:00',NULL),(87,5,2,'2022-05-28 10:15:00',NULL),(88,3,2,'2022-05-28 15:40:00',NULL),(89,2,3,'2022-05-28 08:00:00',NULL),(90,3,3,'2022-05-28 12:15:00',NULL),(91,4,3,'2022-05-28 16:00:00',NULL),(92,5,3,'2022-05-28 18:15:00',NULL),(93,6,4,'2022-05-28 13:00:00',NULL),(94,5,4,'2022-05-28 16:00:00',NULL),(95,7,4,'2022-05-28 20:15:00',NULL),(96,8,5,'2022-05-28 13:00:00',NULL),(97,8,5,'2022-05-28 16:00:00',NULL),(98,6,5,'2022-05-28 20:15:00',NULL),(99,8,6,'2022-05-28 13:00:00',NULL),(100,1,6,'2022-05-28 16:00:00',NULL),(101,9,6,'2022-05-28 16:00:00',NULL),(102,4,6,'2022-05-28 20:15:00',NULL),(103,9,7,'2022-05-28 16:00:00',NULL),(104,1,7,'2022-05-28 20:15:00',NULL),(105,1,1,'2022-05-29 07:30:00',NULL),(106,2,1,'2022-05-29 11:15:00',NULL),(107,5,1,'2022-05-29 20:00:00',NULL),(108,8,2,'2022-05-29 07:30:00',NULL),(109,5,2,'2022-05-29 10:15:00',NULL),(110,3,2,'2022-05-29 15:40:00',NULL),(111,9,3,'2022-05-29 08:00:00',NULL),(112,3,3,'2022-05-29 12:15:00',NULL),(113,4,3,'2022-05-29 16:00:00',NULL),(114,5,3,'2022-05-29 18:15:00',NULL),(115,8,4,'2022-05-29 13:00:00',NULL),(116,5,4,'2022-05-29 16:00:00',NULL),(117,7,4,'2022-05-29 20:15:00',NULL),(118,6,5,'2022-05-29 13:00:00',NULL),(119,8,5,'2022-05-29 16:00:00',NULL),(120,2,5,'2022-05-29 20:15:00',NULL),(121,8,6,'2022-05-29 13:00:00',NULL),(122,1,6,'2022-05-29 16:00:00',NULL),(123,9,6,'2022-05-29 16:00:00',NULL),(124,4,6,'2022-05-29 20:15:00',NULL),(125,7,7,'2022-05-29 16:00:00',NULL),(126,1,7,'2022-05-29 20:15:00',NULL),(127,9,1,'2022-05-30 07:30:00',NULL),(128,3,1,'2022-05-30 11:15:00',NULL),(129,5,1,'2022-05-30 20:00:00',NULL),(130,8,2,'2022-05-30 07:30:00',NULL),(131,5,2,'2022-05-30 10:15:00',NULL),(132,3,2,'2022-05-30 15:40:00',NULL),(133,5,3,'2022-05-30 08:00:00',NULL),(134,6,3,'2022-05-30 12:15:00',NULL),(135,4,3,'2022-05-30 16:00:00',NULL),(136,5,3,'2022-05-30 18:15:00',NULL),(137,8,4,'2022-05-30 13:00:00',NULL),(138,5,4,'2022-05-30 16:00:00',NULL),(139,2,4,'2022-05-30 20:15:00',NULL),(140,6,5,'2022-05-30 13:00:00',NULL),(141,8,5,'2022-05-30 16:00:00',NULL),(142,2,5,'2022-05-30 20:15:00',NULL),(143,4,6,'2022-05-30 13:00:00',NULL),(144,1,6,'2022-05-30 16:00:00',NULL),(145,9,6,'2022-05-30 16:00:00',NULL),(146,5,6,'2022-05-30 20:15:00',NULL),(147,7,7,'2022-05-30 16:00:00',NULL),(148,1,7,'2022-05-30 20:15:00',NULL);
/*!40000 ALTER TABLE `screening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `row` varchar(45) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (1,'A',1,1),(2,'A',2,1),(3,'A',3,1),(4,'A',4,1),(5,'A',5,1),(6,'B',1,1),(7,'B',2,1),(8,'B',3,1),(9,'B',4,1),(10,'B',5,1),(11,'C',1,1),(12,'C',2,1),(13,'C',3,1),(14,'C',5,1),(15,'C',6,1),(16,'A',1,2),(17,'A',2,2),(18,'A',3,2),(19,'A',4,2),(20,'A',5,2),(21,'B',1,2),(22,'B',2,2),(23,'B',3,2),(24,'B',4,2),(25,'B',5,2),(26,'C',1,2),(27,'C',2,2),(28,'C',3,2),(29,'C',4,2),(30,'C',5,2),(31,'C',6,2),(32,'D',1,2),(33,'D',2,2),(34,'D',3,2),(35,'D',5,2),(36,'D',4,2),(37,'D',6,2),(38,'E',1,2),(39,'E',2,2),(40,'E',3,2),(41,'E',5,2),(42,'E',4,2),(43,'E',6,2),(44,'A',1,3),(45,'A',2,3),(46,'A',3,3),(47,'A',4,3),(48,'A',5,3),(49,'B',1,3),(50,'B',2,3),(51,'B',3,3),(52,'B',4,3),(53,'B',5,3),(54,'C',1,3),(55,'C',2,3),(56,'C',3,3),(57,'C',4,3),(58,'C',5,3),(59,'C',6,3),(60,'D',1,3),(61,'D',2,3),(62,'D',3,3),(63,'D',5,3),(64,'D',4,3),(65,'D',6,3),(66,'E',1,3),(67,'E',2,3),(68,'E',3,3),(69,'E',5,3),(70,'E',4,3),(71,'E',6,3),(72,'F',1,3),(73,'F',2,3),(74,'F',3,3),(75,'F',5,3),(76,'F',4,3),(77,'F',6,3),(78,'A',1,4),(79,'A',2,4),(80,'A',3,4),(81,'A',4,4),(82,'A',5,4),(83,'B',1,4),(84,'B',2,4),(85,'B',3,4),(86,'B',4,4),(87,'B',5,4),(88,'C',1,4),(89,'C',2,4),(90,'C',3,4),(91,'C',4,4),(92,'C',5,4),(93,'C',6,4),(94,'D',1,4),(95,'D',2,4),(96,'D',3,4),(97,'D',5,4),(98,'D',4,4),(99,'D',6,4),(100,'E',1,4),(101,'E',2,4),(102,'E',3,4),(103,'E',5,4),(104,'E',4,4),(105,'E',6,4),(106,'F',1,4),(107,'F',2,4),(108,'F',3,4),(109,'F',5,4),(110,'F',4,4),(111,'F',6,4),(112,'G',1,4),(113,'G',2,4),(114,'G',3,4),(115,'G',5,4),(116,'G',4,4),(117,'G',6,4),(118,'A',1,5),(119,'A',2,5),(120,'A',3,5),(121,'A',4,5),(122,'A',5,5),(123,'B',1,5),(124,'B',2,5),(125,'B',3,5),(126,'B',4,5),(127,'B',5,5),(128,'C',1,5),(129,'C',2,5),(130,'C',3,5),(131,'C',4,5),(132,'C',5,5),(133,'C',6,5),(134,'D',1,5),(135,'D',2,5),(136,'D',3,5),(137,'D',5,5),(138,'D',4,5),(139,'D',6,5),(140,'E',1,5),(141,'E',2,5),(142,'E',3,5),(143,'E',5,5),(144,'E',4,5),(145,'E',6,5),(146,'F',1,5),(147,'F',2,5),(148,'F',3,5),(149,'F',5,5),(150,'F',4,5),(151,'F',6,5),(152,'G',1,5),(153,'G',2,5),(154,'G',3,5),(155,'G',5,5),(156,'G',4,5),(157,'G',6,5),(158,'A',1,6),(159,'A',2,6),(160,'A',3,6),(161,'A',4,6),(162,'A',5,6),(163,'B',1,6),(164,'B',2,6),(165,'B',3,6),(166,'B',4,6),(167,'B',5,6),(168,'C',1,6),(169,'C',2,6),(170,'C',3,6),(171,'C',4,6),(172,'C',5,6),(173,'C',6,6),(174,'D',1,6),(175,'D',2,6),(176,'D',3,6),(177,'D',5,6),(178,'D',4,6),(179,'D',6,6),(180,'E',1,6),(181,'E',2,6),(182,'E',3,6),(183,'E',5,6),(184,'E',4,6),(185,'E',6,6),(186,'F',1,6),(187,'F',2,6),(188,'F',3,6),(189,'F',5,6),(190,'F',4,6),(191,'F',6,6),(192,'G',1,6),(193,'G',2,6),(194,'G',3,6),(195,'G',5,6),(196,'G',4,6),(197,'G',6,6),(198,'H',1,6),(199,'H',2,6),(200,'H',3,6),(201,'H',5,6),(202,'H',4,6),(203,'H',6,6),(250,'A',1,7),(251,'A',2,7),(252,'A',3,7),(253,'A',4,7),(254,'A',5,7),(255,'B',1,7),(256,'B',2,7),(257,'B',3,7),(258,'B',4,7),(259,'B',5,7),(260,'C',1,7),(261,'C',2,7),(262,'C',3,7),(263,'C',4,7),(264,'C',5,7),(265,'C',6,7),(266,'D',1,7),(267,'D',2,7),(268,'D',3,7),(269,'D',5,7),(270,'D',4,7),(271,'D',6,7),(272,'E',1,7),(273,'E',2,7),(274,'E',3,7),(275,'E',5,7),(276,'E',4,7),(277,'E',6,7),(278,'F',1,7),(279,'F',2,7),(280,'F',3,7),(281,'F',5,7),(282,'F',4,7),(283,'F',6,7),(284,'G',1,7),(285,'G',2,7),(286,'G',3,7),(287,'G',5,7),(288,'G',4,7),(289,'G',6,7),(290,'H',1,7),(291,'H',2,7),(292,'H',3,7),(293,'H',5,7),(294,'H',4,7),(295,'H',6,7),(296,'I',1,7),(297,'I',2,7),(298,'I',3,7),(299,'I',5,7),(300,'I',4,7),(301,'I',6,7);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-10 16:38:45
