-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: 127.0.0.1    Database: rhlocuser
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateur` (
  `mail` varchar(80) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(30) DEFAULT NULL,
  `roles` varchar(100) DEFAULT 'ROLE_USER',
  `ville_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `etat` enum('valide','attente_suppression_location_habitation','attente_suppression_location','attente_suppression_habitation') NOT NULL DEFAULT 'valide' COMMENT 'Statut utilisateur',
  PRIMARY KEY (`mail`),
  KEY `ville_id` (`ville_id`),
  CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` (`mail`, `password`, `nom`, `prenom`, `roles`, `ville_id`, `etat`) VALUES ('charlie.watts@test.com','$2a$10$v/vFR1uePB300Cs1UPNjA.wXeuNumqpcZ9nLdDd.kk1SKLy69cg2m','WATTS','charlie','ROLE_ADMIN','34172','valide'),('jane.doe@test.com','$2a$10$jqS0htFx8/PIpyH2xhGlRutvijt.iOxr.MEKhoFWQKsR3BKN60SUy','DOE','Jane','ROLE_USER','34172','valide'),('proprio1@test.com','$2a$10$mWpwl5nUy1pRXofdSJ5s9eE0otFJO0yPQUYtbvakL2o5l54SNTYJ.','NTEST','ptest','ROLE_USER','34172','valide'),('proprio2@test.com','$2a$10$mWpwl5nUy1pRXofdSJ5s9eE0otFJO0yPQUYtbvakL2o5l54SNTYJ.','NTEST','ptest','ROLE_USER','34172','valide'),('proprio3@test.com','$2a$10$mWpwl5nUy1pRXofdSJ5s9eE0otFJO0yPQUYtbvakL2o5l54SNTYJ.','NTEST','ptest','ROLE_USER','34172','valide'),('test1@test.com','aaa','aaa','aaa','ROLE_USER',NULL,'valide'),('test@test.com','abcd4ABCD',NULL,NULL,'ROLE_USER','34172','valide'),('testPM1@test.com','bcf1640e8518625151211f41c2af0066ced666ec',NULL,NULL,'ROLE_USER','34172','valide'),('testPMNew10@test.com','$2a$10$mWpwl5nUy1pRXofdSJ5s9eE0otFJO0yPQUYtbvakL2o5l54SNTYJ.','NTEST','ptest','ROLE_USER','34172','valide'),('testPMNew1@test.com','$2a$10$mWpwl5nUy1pRXofdSJ5s9eE0otFJO0yPQUYtbvakL2o5l54SNTYJ.','NTEST','ptest','ROLE_USER','34172','valide');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ville` (
  `id` varchar(20) NOT NULL,
  `codepostal` varchar(20) NOT NULL,
  `nom` varchar(60) NOT NULL,
  `longitude` float NOT NULL,
  `latitude` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville`
--

LOCK TABLES `ville` WRITE;
/*!40000 ALTER TABLE `ville` DISABLE KEYS */;
INSERT INTO `ville` (`id`, `codepostal`, `nom`, `longitude`, `latitude`) VALUES ('34172','34000','Montpellier',3.87048,43.6105);
/*!40000 ALTER TABLE `ville` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-16 16:29:16
