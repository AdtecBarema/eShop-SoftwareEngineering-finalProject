-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: eshopdb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `date_published` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_approved` bit(1) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `number_of_copies` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `book_supplier_id` int(11) DEFAULT NULL,
  `fk_book` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnqqwgf4vpry5kqjgbclg52xi` (`cart_id`),
  KEY `FK2oyq1eucdrkqfxtrhkwm8wtd1` (`book_supplier_id`),
  KEY `FKtf074t7e98jf6x7e5mo1wi749` (`fk_book`),
  CONSTRAINT `FK2oyq1eucdrkqfxtrhkwm8wtd1` FOREIGN KEY (`book_supplier_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKnqqwgf4vpry5kqjgbclg52xi` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKtf074t7e98jf6x7e5mo1wi749` FOREIGN KEY (`fk_book`) REFERENCES `payment_record` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (8,'2019-08-29','                        ','https://islandpress.org/sites/default/files/400px%20x%20600px-r01BookNotPictured.jpg',NULL,'12345',45,55,'Esat Wey abeba',13,3,NULL),(9,'2019-08-18','                        ','http://www.bukovero.com/wp-content/uploads/2016/07/Harry_Potter_and_the_Cursed_Child_Special_Rehearsal_Edition_Book_Cover.jpg',NULL,'453245',3,300,'Harry Potter',24,3,NULL),(10,NULL,'                        ','https://about.canva.com/wp-content/uploads/sites/3/2015/01/art_bookcover.png',NULL,'5434567',34,23,'Anna Karenina',21,3,NULL),(11,'2019-08-22','                        ','https://9auileboys-flywheel.netdna-ssl.com/wp-content/uploads/2017/04/theshackbook2_si.jpg',NULL,'34567',32,55,'The Art of war',NULL,3,NULL),(23,'2019-06-04','                        ','https://img.huffingtonpost.com/asset/5bb62003220000ba01dcada4.jpeg?ops=scalefit_720_noupscale',NULL,'12345678911',30,12,'Harry Potter',NULL,3,NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-15 13:49:32
