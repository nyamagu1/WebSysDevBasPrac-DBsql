CREATE DATABASE  IF NOT EXISTS `point_payment_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `point_payment_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: point_payment_db
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

--
-- Table structure for table `class_fees`
--

DROP TABLE IF EXISTS `class_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_fees` (
  `member_type_id` int NOT NULL,
  `class_item_id` int NOT NULL,
  `class_fee` int NOT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`member_type_id`,`class_item_id`),
  KEY `fk_class_fees_member_types1_idx` (`member_type_id`),
  KEY `fk_class_fees_class_items1_idx` (`class_item_id`),
  CONSTRAINT `fk_class_fees_class_items1` FOREIGN KEY (`class_item_id`) REFERENCES `class_items` (`class_item_id`),
  CONSTRAINT `fk_class_fees_member_types1` FOREIGN KEY (`member_type_id`) REFERENCES `member_types` (`member_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_fees`
--

LOCK TABLES `class_fees` WRITE;
/*!40000 ALTER TABLE `class_fees` DISABLE KEYS */;
INSERT INTO `class_fees` VALUES (1,1,1000,'2026-03-11 00:00:00',NULL),(1,2,850,'2026-03-11 00:00:00',NULL),(1,3,1200,'2026-03-11 00:00:00',NULL),(1,4,550,'2026-03-11 00:00:00',NULL),(1,5,700,'2026-03-11 00:00:00',NULL),(2,1,1000,'2026-03-04 00:00:00',NULL),(2,2,850,'2026-02-17 00:00:00',NULL),(2,3,1200,'2026-03-04 00:00:00',NULL),(2,4,550,'2026-02-12 00:00:00',NULL),(2,5,550,'2026-03-11 00:00:00',NULL),(3,3,1500,'2026-03-04 00:00:00',NULL),(3,5,850,'2026-02-17 00:00:00',NULL),(5,1,1000,'2026-03-11 00:00:00',NULL),(5,2,850,'2026-03-11 00:00:00',NULL),(5,3,1200,'2026-03-11 00:00:00',NULL),(5,5,550,'2026-03-11 00:00:00',NULL);
/*!40000 ALTER TABLE `class_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_items`
--

DROP TABLE IF EXISTS `class_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_items` (
  `class_item_id` int NOT NULL AUTO_INCREMENT,
  `class_code` varchar(10) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`class_item_id`),
  UNIQUE KEY `class_item_id_UNIQUE` (`class_item_id`),
  UNIQUE KEY `class_code_UNIQUE` (`class_code`),
  UNIQUE KEY `class_name_UNIQUE` (`class_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_items`
--

LOCK TABLES `class_items` WRITE;
/*!40000 ALTER TABLE `class_items` DISABLE KEYS */;
INSERT INTO `class_items` VALUES (1,'00','事務所','2026-02-12 00:00:00',NULL),(2,'11.5','チアダンス５年','2026-02-12 00:00:00',NULL),(3,'21','ボルダリング','2026-02-12 00:00:00',NULL),(4,'31','太極拳','2026-02-12 00:00:00',NULL),(5,'55','ヨガ','2026-02-12 00:00:00',NULL);
/*!40000 ALTER TABLE `class_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `operation_type_id` int NOT NULL,
  `stuff_member_id` int NOT NULL,
  `user_member_id` int NOT NULL,
  `class_item_id` int NOT NULL,
  `charged` int DEFAULT NULL,
  `used` int DEFAULT NULL,
  `remaining` int NOT NULL,
  PRIMARY KEY (`log_id`,`stuff_member_id`,`user_member_id`),
  UNIQUE KEY `log_id_UNIQUE` (`log_id`),
  KEY `fk_logs_members1_idx` (`stuff_member_id`),
  KEY `fk_logs_members2_idx` (`user_member_id`),
  KEY `fk_logs_operation_types1_idx` (`operation_type_id`),
  CONSTRAINT `fk_logs_members1` FOREIGN KEY (`stuff_member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `fk_logs_members2` FOREIGN KEY (`user_member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `fk_logs_operation_types1` FOREIGN KEY (`operation_type_id`) REFERENCES `operation_types` (`operation_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (2,'2026-02-12 00:00:00',1,1,2,1,5000,NULL,5000),(3,'2026-02-12 00:00:00',2,1,2,3,NULL,550,4450),(4,'2026-03-03 13:12:47',1,1,3,1,1000,0,8000),(5,'2026-03-03 13:14:48',1,1,3,1,3000,0,11000),(6,'2026-03-03 13:30:13',1,1,3,1,1000,0,12000),(7,'2026-03-05 11:18:35',1,1,3,1,3000,0,15000),(9,'2026-03-05 14:56:52',2,1,3,3,0,1500,13500),(10,'2026-03-05 15:09:08',1,1,3,1,1000,0,14500),(11,'2026-03-05 15:09:20',1,1,3,1,1000,0,15500),(12,'2026-03-05 15:34:16',2,1,3,3,0,1500,14000),(13,'2026-03-05 15:34:38',2,1,3,3,0,1500,12500),(14,'2026-03-05 15:34:48',2,1,3,3,0,1500,11000),(15,'2026-03-05 15:36:34',2,1,3,3,0,1500,9500),(16,'2026-03-05 15:37:22',2,1,3,3,0,1500,8000),(17,'2026-03-05 16:00:24',2,1,3,3,0,1500,6500),(18,'2026-03-06 10:29:24',2,1,3,3,0,1500,5000),(19,'2026-03-06 10:29:58',2,1,3,3,0,1500,3500),(20,'2026-03-06 10:31:41',2,1,3,3,0,1500,2000),(21,'2026-03-06 10:34:48',1,1,5,1,10000,0,10000),(22,'2026-03-06 10:35:25',2,1,5,3,0,1200,8800),(23,'2026-03-06 10:37:16',1,1,3,1,5000,0,7000),(24,'2026-03-06 10:38:20',2,1,3,3,0,1500,5500),(25,'2026-03-06 10:38:49',1,1,3,1,10000,0,15500),(26,'2026-03-06 10:48:30',2,1,3,5,0,700,14800),(27,'2026-03-11 09:47:43',1,1,3,1,1000,0,15800),(28,'2026-03-11 09:48:05',1,1,2,1,5000,0,5000),(29,'2026-03-11 09:48:25',1,1,3,1,1000,0,16800),(30,'2026-03-11 09:48:51',1,1,3,1,1000,0,17800),(31,'2026-03-11 10:03:27',1,4,5,1,2000,0,10800),(32,'2026-03-11 10:04:04',1,4,3,1,10000,0,27800),(33,'2026-03-11 10:17:16',2,4,5,5,0,550,10250),(34,'2026-03-11 10:18:56',2,4,5,5,0,550,9700),(35,'2026-03-11 10:19:25',2,4,5,5,0,550,9150),(36,'2026-03-11 10:26:05',1,4,6,1,10000,0,10000),(37,'2026-03-11 10:26:53',2,4,6,5,0,1200,8800),(38,'2026-03-11 10:27:09',2,4,3,3,0,1500,26300),(39,'2026-03-11 10:31:56',2,6,5,3,0,850,8300),(40,'2026-03-11 10:32:15',2,6,2,3,0,850,4150),(41,'2026-03-11 10:32:51',2,6,2,3,0,550,3600),(42,'2026-03-11 12:59:28',2,1,5,3,0,550,7750),(43,'2026-03-11 13:08:46',2,1,5,4,0,550,7200),(44,'2026-03-11 13:16:57',2,1,5,4,0,550,6650),(45,'2026-03-11 13:22:53',1,1,3,1,2000,0,28300),(46,'2026-03-11 13:24:34',1,1,3,1,3000,0,31300),(47,'2026-03-11 13:28:33',1,1,2,1,2000,0,5600),(48,'2026-03-11 13:34:25',1,1,2,1,3000,0,8600),(49,'2026-03-11 13:41:31',1,1,3,1,1000,0,32300),(50,'2026-03-11 13:42:38',2,1,3,4,0,1500,30800),(51,'2026-03-11 13:47:06',2,1,3,5,0,1500,29300),(52,'2026-03-11 13:55:01',2,1,3,3,0,1500,27800),(53,'2026-03-11 13:56:17',2,6,5,2,0,850,5800);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_class_items`
--

DROP TABLE IF EXISTS `member_class_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_class_items` (
  `member_id` int NOT NULL,
  `class_item_id` int NOT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`member_id`,`class_item_id`),
  KEY `fk_member_class_item_members1_idx` (`member_id`),
  KEY `fk_member_class_item_class_items1_idx` (`class_item_id`),
  CONSTRAINT `fk_member_class_item_class_items1` FOREIGN KEY (`class_item_id`) REFERENCES `class_items` (`class_item_id`),
  CONSTRAINT `fk_member_class_item_members1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_class_items`
--

LOCK TABLES `member_class_items` WRITE;
/*!40000 ALTER TABLE `member_class_items` DISABLE KEYS */;
INSERT INTO `member_class_items` VALUES (1,1,'2026-02-12 00:00:00',NULL),(2,2,'2026-03-11 00:00:00',NULL),(2,3,'2026-02-12 00:00:00',NULL),(3,5,'2026-02-17 00:00:00',NULL),(5,3,'2026-02-17 00:00:00',NULL),(5,4,'2026-02-17 00:00:00',NULL),(5,5,'2026-02-17 00:00:00',NULL),(6,4,'2026-02-17 00:00:00',NULL),(6,5,'2026-02-17 00:00:00',NULL);
/*!40000 ALTER TABLE `member_class_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_types`
--

DROP TABLE IF EXISTS `member_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_types` (
  `member_type_id` int NOT NULL AUTO_INCREMENT,
  `member_type_code` varchar(10) NOT NULL,
  `member_type_name` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`member_type_id`),
  UNIQUE KEY `member_type_id_UNIQUE` (`member_type_id`),
  UNIQUE KEY `member_type_code_UNIQUE` (`member_type_code`),
  UNIQUE KEY `member_type_name_UNIQUE` (`member_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_types`
--

LOCK TABLES `member_types` WRITE;
/*!40000 ALTER TABLE `member_types` DISABLE KEYS */;
INSERT INTO `member_types` VALUES (1,'stuff-su','管理スタッフ','2026-02-12 00:00:00',NULL),(2,'normal','通常会員','2026-02-12 00:00:00',NULL),(3,'visitor','ビジター会員','2026-02-17 00:00:00',NULL),(4,'stuff-offc','事務所スタッフ','2026-02-25 00:00:00',NULL),(5,'stuff-recp','受付スタッフ','2026-02-25 00:00:00',NULL);
/*!40000 ALTER TABLE `member_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `member_code` varchar(10) NOT NULL,
  `member_name` varchar(10) NOT NULL,
  `hashed_pass` varchar(60) DEFAULT NULL,
  `member_type_id` int NOT NULL,
  `last_stuff_log_id` int DEFAULT NULL,
  `email1` varchar(45) DEFAULT NULL,
  `email2` varchar(45) DEFAULT NULL,
  `created` datetime NOT NULL,
  `withdrawal` datetime DEFAULT NULL,
  `point` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`),
  UNIQUE KEY `member_code_UNIQUE` (`member_code`),
  KEY `fk_members_member_types_idx` (`member_type_id`),
  KEY `fk_members_logs1_idx` (`last_stuff_log_id`),
  CONSTRAINT `fk_members_logs1` FOREIGN KEY (`last_stuff_log_id`) REFERENCES `logs` (`log_id`),
  CONSTRAINT `fk_members_member_types` FOREIGN KEY (`member_type_id`) REFERENCES `member_types` (`member_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'s001','aaa','$2a$10$iqsnVA26BKTbNoXQuyX6lO9M6mdKVqPKqvYA7a9sd9u54uud.0/h6',1,52,'abc@gmail.com',NULL,'2026-02-12 00:00:00',NULL,NULL),(2,'u222','通常次郎',NULL,2,NULL,'efg@gmail.com','xyz@gmail.com','2026-02-12 00:00:00',NULL,8600),(3,'333','山山　山VVV',NULL,3,NULL,NULL,NULL,'2026-02-17 00:00:00',NULL,27800),(4,'s002','sss',NULL,1,38,'sss@gmail.com',NULL,'2026-02-18 00:00:00',NULL,NULL),(5,'u111','通常太郎',NULL,2,NULL,'uuu@gmail.com',NULL,'2026-02-18 00:00:00',NULL,5800),(6,'r222','受付スタッフ222','$2a$10$NeYo/UGc86o2HtbPZcK6KOyASChoOqABcRNpRyiif3kO3zMVgTScm',5,53,NULL,NULL,'2026-02-25 00:00:00',NULL,8800);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_types`
--

DROP TABLE IF EXISTS `operation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation_types` (
  `operation_type_id` int NOT NULL AUTO_INCREMENT,
  `operation_type_name` varchar(10) NOT NULL,
  `created` datetime NOT NULL,
  `deleted` datetime DEFAULT NULL,
  PRIMARY KEY (`operation_type_id`),
  UNIQUE KEY `operation_type_id_UNIQUE` (`operation_type_id`),
  UNIQUE KEY `operation_type_name_UNIQUE` (`operation_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_types`
--

LOCK TABLES `operation_types` WRITE;
/*!40000 ALTER TABLE `operation_types` DISABLE KEYS */;
INSERT INTO `operation_types` VALUES (1,'チャージ','2026-02-12 00:00:00',NULL),(2,'参加費','2026-02-12 00:00:00',NULL);
/*!40000 ALTER TABLE `operation_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-11 14:56:03
