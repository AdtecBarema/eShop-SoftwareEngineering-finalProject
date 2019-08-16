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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Addis ababa','owa','ase324','21345'),(2,'fairfield','iowa','1234','52557');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'James Brown','abebe'),(2,'Ann Mark',NULL),(3,'Jeremy Brown',NULL),(4,'Tom Anderson',NULL),(5,'Tsegaye Gebremedhin',NULL);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_info`
--

DROP TABLE IF EXISTS `billing_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_info` (
  `id` int(11) NOT NULL,
  `card_number` int(11) DEFAULT NULL,
  `expire_date` date NOT NULL,
  `holder_full_name` varchar(255) DEFAULT NULL,
  `security_digits` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `fk_customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlgo8i91eilt7am37omyr1nx3u` (`customer_id`),
  KEY `FKh7qaugg1bhlkkyerd1lno54m4` (`fk_customer`),
  CONSTRAINT `FKh7qaugg1bhlkkyerd1lno54m4` FOREIGN KEY (`fk_customer`) REFERENCES `user` (`id`),
  CONSTRAINT `FKlgo8i91eilt7am37omyr1nx3u` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_info`
--

LOCK TABLES `billing_info` WRITE;
/*!40000 ALTER TABLE `billing_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_info` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  KEY `FKbjqhp85wjv8vpr0beygh6jsgo` (`author_id`),
  KEY `FKhwgu59n9o80xv75plf9ggj7xn` (`book_id`),
  CONSTRAINT `FKbjqhp85wjv8vpr0beygh6jsgo` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  CONSTRAINT `FKhwgu59n9o80xv75plf9ggj7xn` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (8,5),(9,1),(10,2),(11,4),(23,2);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_category`
--

DROP TABLE IF EXISTS `book_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_category` (
  `book_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `FKam8llderp40mvbbwceqpu6l2s` (`category_id`),
  KEY `FKnyegcbpvce2mnmg26h0i856fd` (`book_id`),
  CONSTRAINT `FKam8llderp40mvbbwceqpu6l2s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKnyegcbpvce2mnmg26h0i856fd` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_category`
--

LOCK TABLES `book_category` WRITE;
/*!40000 ALTER TABLE `book_category` DISABLE KEYS */;
INSERT INTO `book_category` VALUES (8,2),(9,2),(10,2),(11,4),(23,4);
/*!40000 ALTER TABLE `book_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `number_of_books` int(11) NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `cart_customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ufx00i6fwfh435146maufhot` (`cart_customer_id`),
  CONSTRAINT `FK4ufx00i6fwfh435146maufhot` FOREIGN KEY (`cart_customer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (12,1,'C336C40B3BF63034039B2A4F8121B5A1',25.53,3),(13,1,'5CB974484725477522CDB0849B2EF299',61.05,3),(14,1,'5CB974484725477522CDB0849B2EF299',25.53,3),(15,1,'5562978A410FBADDC51FC9009833FBB2',25.53,3),(16,1,'5562978A410FBADDC51FC9009833FBB2',25.53,3),(17,1,'5562978A410FBADDC51FC9009833FBB2',25.53,3),(18,1,'3AE1F238A1713EDF67E729E2BFED6AA2',25.53,3),(21,1,'4F96C9359276B109A1DB63B60CF423D8',25.53,2),(24,1,'7F541951B9B33FFB6C38DA68E305E121',333,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Science'),(2,'Art'),(3,'Meditation'),(4,'Novel');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_info`
--

DROP TABLE IF EXISTS `delivery_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_info` (
  `id` int(11) NOT NULL,
  `expected_arrival` date DEFAULT NULL,
  `ordered_date` date DEFAULT NULL,
  `tracking_number` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3ofb0jcygan9fssa4074eu2cd` (`customer_id`),
  KEY `FKp1s4pum7u1kjekjy9j5vlni04` (`order_id`),
  KEY `FK7loc680eud0e4n9w8pay7830w` (`supplier_id`),
  CONSTRAINT `FK3ofb0jcygan9fssa4074eu2cd` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK7loc680eud0e4n9w8pay7830w` FOREIGN KEY (`supplier_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKp1s4pum7u1kjekjy9j5vlni04` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_info`
--

LOCK TABLES `delivery_info` WRITE;
/*!40000 ALTER TABLE `delivery_info` DISABLE KEYS */;
INSERT INTO `delivery_info` VALUES (20,'2019-08-20','2019-08-15',598693,3,19,3),(26,'2019-08-20','2019-08-15',160896,1,25,3);
/*!40000 ALTER TABLE `delivery_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (27),(27),(27),(27),(27),(27),(27),(27),(27),(27),(27);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `fk_cart` int(11) DEFAULT NULL,
  `fk_customer` int(11) DEFAULT NULL,
  `fk_shipping_address` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3amjf7l9c3gr7o8bwcux5mx1y` (`fk_cart`),
  KEY `FKptt2br28yayb7e6nhyrtd8y3o` (`fk_customer`),
  KEY `FKf20gc39cdiuyqdrpxj9y15fw8` (`fk_shipping_address`),
  CONSTRAINT `FK3amjf7l9c3gr7o8bwcux5mx1y` FOREIGN KEY (`fk_cart`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKf20gc39cdiuyqdrpxj9y15fw8` FOREIGN KEY (`fk_shipping_address`) REFERENCES `address` (`id`),
  CONSTRAINT `FKptt2br28yayb7e6nhyrtd8y3o` FOREIGN KEY (`fk_customer`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (19,25.53,'2019-08-15','ORDER935',18,3,1),(25,333,'2019-08-15','ORDER626',24,1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_record`
--

DROP TABLE IF EXISTS `payment_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_record` (
  `id` int(11) NOT NULL,
  `amount` double DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `bill_info_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqbfripxc2jt5oclwjwq7ad6f4` (`bill_info_id`),
  KEY `FK6uur252ne0klcj8sm1ocodg3y` (`customer_id`),
  KEY `FKch90e7k9959nwltj6ar0cogwq` (`order_id`),
  KEY `FK5kqgj6ffyymmrrqep0rmyi58b` (`supplier_id`),
  CONSTRAINT `FK5kqgj6ffyymmrrqep0rmyi58b` FOREIGN KEY (`supplier_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK6uur252ne0klcj8sm1ocodg3y` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKch90e7k9959nwltj6ar0cogwq` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FKqbfripxc2jt5oclwjwq7ad6f4` FOREIGN KEY (`bill_info_id`) REFERENCES `billing_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_record`
--

LOCK TABLES `payment_record` WRITE;
/*!40000 ALTER TABLE `payment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `fk_customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnj55m79pro2qanuayd9ckn3st` (`category_id`),
  KEY `FKgkhd3tp7x4udjgw6mqjuqvb4j` (`customer_id`),
  KEY `FKbi85a3sl4j8sgm22ur0avuvk0` (`fk_customer`),
  CONSTRAINT `FKbi85a3sl4j8sgm22ur0avuvk0` FOREIGN KEY (`fk_customer`) REFERENCES `user` (`id`),
  CONSTRAINT `FKgkhd3tp7x4udjgw6mqjuqvb4j` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKnj55m79pro2qanuayd9ckn3st` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `id` int(11) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `supplier_address_id` int(11) DEFAULT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  KEY `FKkf02t21a707cjnqux9ywmxv3w` (`supplier_address_id`),
  KEY `FK4wdjpiuhg2u14dx09poivlmri` (`billing_address_id`),
  KEY `FKjyl73hgoxq0hjalhx4on4cf1` (`shipping_address_id`),
  CONSTRAINT `FK4wdjpiuhg2u14dx09poivlmri` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKjyl73hgoxq0hjalhx4on4cf1` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKkf02t21a707cjnqux9ywmxv3w` FOREIGN KEY (`supplier_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('User',1,_binary '',NULL,'confirmed','sdblg@yahoo.com','User\'s FirstName','User\'s LastName','$2a$10$uWfqSyawc5gqFF4uoRNMOeZQAavB2A6V3wi34s7.nnqGrR999l1..','','CUSTOMER','user',1,1,1),('User',2,_binary '',NULL,'confirmed','sshirmen@mum.edu','aaa','Admin\'s LastName','$2a$10$sJQISkd3hVCRf3rWM/OITOpFJZY2.D07DiOBcrFnI6mcPdxm/3u8i','','ADMIN','admin',1,1,2),('User',3,_binary '',NULL,'confirmed','shirmen.sodbileg@gmail.com','Getaneh','Yima','$2a$10$8Og.ZgHU3gLhCiCCksypqe.qMDQLpHrGlgSm5x4Bgpuoj0KBYa2ie','','SUPPLIER','supplier',2,2,1),('User',4,_binary '',NULL,NULL,'shirmen.sodbileg1@gmail.com','Supplier\'s FirstName','Supplier\'s LastName','$2a$10$Xs/O0h/cgtz9fPNxqJn3jOejbnkz1Kl69SQdr7J3.CBrjnt.SoFkW','','SUPPLIER','supplier1',2,2,2),('User',5,_binary '',NULL,NULL,'shirmen.sodbileg2@gmail.com','Supplier\'s FirstName','Supplier\'s LastName','$2a$10$zRm6mvDMQd2toAcJqaJ6EewT8Rmgxd8CllvGheQrP0nxeXSViaxCy','','SUPPLIER','supplier2',2,2,1),('User',22,_binary '',NULL,'fd6db2b8-c835-4827-8d4d-a2b80d119e48','gyletike@mum.edu','Addisu','Baaj','$2a$10$dEInyxoXeRD07etWQmZWIeffS6u29Zsqx5776gh/X4clujGBcOgDS','','CUSTOMER','getaneh',NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'eshopdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-15 13:51:52
