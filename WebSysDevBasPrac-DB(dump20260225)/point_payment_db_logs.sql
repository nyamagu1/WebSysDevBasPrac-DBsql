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
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `operation_types_operation_type_id` int NOT NULL,
  `members_stuff_member_id` int NOT NULL,
  `members_target_member_id` int NOT NULL,
  `class_item_id` int NOT NULL,
  `charge` int DEFAULT NULL,
  `used` int DEFAULT NULL,
  `remaining` int NOT NULL,
  PRIMARY KEY (`log_id`,`members_stuff_member_id`,`members_target_member_id`),
  UNIQUE KEY `log_id_UNIQUE` (`log_id`),
  KEY `fk_logs_members1_idx` (`members_stuff_member_id`),
  KEY `fk_logs_members2_idx` (`members_target_member_id`),
  KEY `fk_logs_operation_types1_idx` (`operation_types_operation_type_id`),
  CONSTRAINT `fk_logs_members1` FOREIGN KEY (`members_stuff_member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `fk_logs_members2` FOREIGN KEY (`members_target_member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `fk_logs_operation_types1` FOREIGN KEY (`operation_types_operation_type_id`) REFERENCES `operation_types` (`operation_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (2,'2026-02-12 00:00:00',1,1,2,1,5000,NULL,5000),(3,'2026-02-12 00:00:00',2,1,2,3,NULL,550,4450);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-25  9:39:44
