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
  `email1` varchar(45) DEFAULT NULL,
  `email2` varchar(45) DEFAULT NULL,
  `created` datetime NOT NULL,
  `withdrawal` datetime DEFAULT NULL,
  `member_type_id` int NOT NULL,
  `last_stuff_log_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`),
  UNIQUE KEY `member_code_UNIQUE` (`member_code`),
  KEY `fk_members_member_types_idx` (`member_type_id`),
  KEY `fk_members_logs1_idx` (`last_stuff_log_id`),
  CONSTRAINT `fk_members_logs1` FOREIGN KEY (`last_stuff_log_id`) REFERENCES `logs` (`log_id`),
  CONSTRAINT `fk_members_member_types` FOREIGN KEY (`member_type_id`) REFERENCES `member_types` (`member_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'s001','aaa','$2a$10$qP461Da3axtUxqzePyJ3P.5mIxpKjAdyDXGd9JfR1QbdKg2YPobAm',NULL,NULL,'2026-02-12 00:00:00',NULL,1,NULL),(2,'2222','あああ',NULL,'abc@gmail.com','xyz@gmail.com','2026-02-12 00:00:00',NULL,2,NULL),(3,'333','いいいいい',NULL,'efg@gmail.com',NULL,'2026-02-17 00:00:00',NULL,3,NULL),(4,'s002','sss',NULL,'sss@gmail.com',NULL,'2026-02-18 00:00:00',NULL,1,NULL),(5,'u111','111',NULL,'uuu@gmail.com',NULL,'2026-02-18 00:00:00',NULL,2,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-25  9:39:43
