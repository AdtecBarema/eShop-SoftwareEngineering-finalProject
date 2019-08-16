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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-15 13:49:33
