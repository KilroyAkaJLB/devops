-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: 127.0.0.1    Database: rhlocation
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
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facture` (
  `id` int NOT NULL COMMENT 'Doit être identique à location_id',
  `date` datetime NOT NULL,
  `adresse` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facture`
--

LOCK TABLES `facture` WRITE;
/*!40000 ALTER TABLE `facture` DISABLE KEYS */;
INSERT INTO `facture` (`id`, `date`, `adresse`) VALUES (1,'2022-08-24 00:00:00','Adresse');
/*!40000 ALTER TABLE `facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idutilisateur` varchar(80) NOT NULL,
  `idhabitation` int NOT NULL,
  `datedebut` datetime NOT NULL,
  `datefin` datetime NOT NULL,
  `montanttotal` double NOT NULL DEFAULT '0',
  `montantverse` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` (`id`, `idutilisateur`, `idhabitation`, `datedebut`, `datefin`, `montanttotal`, `montantverse`) VALUES (1,'jane.doe@test.com',1,'2022-07-01 00:00:00','2022-07-04 00:00:00',710,0),(3,'testuser1@test.com',1,'2022-09-01 00:00:00','2022-09-04 00:00:00',710,0),(6,'testuser1@test.com',1,'2022-12-08 00:00:00','2022-12-14 00:00:00',670,0),(10,'jane.doe@test.com',1,'2023-01-10 00:00:00','2023-01-11 00:00:00',100,0),(11,'john.doe@test.com',9,'2023-01-10 00:00:00','2023-01-11 00:00:00',60,0),(12,'jane.doe@test.com',10,'2023-01-10 00:00:00','2023-01-11 00:00:00',50,0),(13,'jane.doe@test.com',3,'2023-04-04 00:00:00','2023-04-07 00:00:00',50,0);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminrh`@`%`*/ /*!50003 TRIGGER `check_isvalid_insert` BEFORE INSERT ON `location` FOR EACH ROW BEGIN
    call location_isvalid(
            NEW.idutilisateur,
            NEW.idhabitation,
            NEW.datedebut,
            NEW.datefin,
            @valide
        );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`adminrh`@`%`*/ /*!50003 TRIGGER `check_isvalid_update` BEFORE UPDATE ON `location` FOR EACH ROW BEGIN
    call location_isvalid(
            NEW.idutilisateur,
            NEW.idhabitation,
            NEW.datedebut,
            NEW.datefin,
            @valide
        );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `location_optionpayante`
--

DROP TABLE IF EXISTS `location_optionpayante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_optionpayante` (
  `location_id` int NOT NULL,
  `optionpayante_id` int NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`location_id`,`optionpayante_id`),
  KEY `optionpayante_id` (`optionpayante_id`),
  CONSTRAINT `location_optionpayante_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `location_optionpayante_ibfk_2` FOREIGN KEY (`optionpayante_id`) REFERENCES `optionpayante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_optionpayante`
--

LOCK TABLES `location_optionpayante` WRITE;
/*!40000 ALTER TABLE `location_optionpayante` DISABLE KEYS */;
INSERT INTO `location_optionpayante` (`location_id`, `optionpayante_id`, `prix`) VALUES (1,1,60),(1,2,30),(1,3,20),(6,1,50),(6,3,20),(10,3,20);
/*!40000 ALTER TABLE `location_optionpayante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `maji_location_optionpayante` AFTER INSERT ON `location_optionpayante` FOR EACH ROW BEGIN
    UPDATE location
    SET montanttotal = montanttotal + NEW.prix
    WHERE id = NEW.location_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `majd_location_optionpayante` AFTER DELETE ON `location_optionpayante` FOR EACH ROW BEGIN
    UPDATE location
    SET montanttotal = montanttotal - OLD.prix
    WHERE id = OLD.location_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `optionpayante`
--

DROP TABLE IF EXISTS `optionpayante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optionpayante` (
  `id` int NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionpayante`
--

LOCK TABLES `optionpayante` WRITE;
/*!40000 ALTER TABLE `optionpayante` DISABLE KEYS */;
INSERT INTO `optionpayante` (`id`, `libelle`, `description`) VALUES (1,'Ménage','A la fin du séjour'),(2,'Drap de lit','Pour l\'ensemble des lits'),(3,'Linge de maison','Linge de toilette pour la salle de bain');
/*!40000 ALTER TABLE `optionpayante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglement`
--

DROP TABLE IF EXISTS `reglement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reglement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `montant` decimal(10,0) NOT NULL,
  `dateversement` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `typereglement_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typereglement_id` (`typereglement_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `reglement_ibfk_1` FOREIGN KEY (`typereglement_id`) REFERENCES `typereglement` (`id`),
  CONSTRAINT `reglement_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglement`
--

LOCK TABLES `reglement` WRITE;
/*!40000 ALTER TABLE `reglement` DISABLE KEYS */;
INSERT INTO `reglement` (`id`, `location_id`, `montant`, `dateversement`, `typereglement_id`) VALUES (4,1,200,'2022-07-04 11:01:31',1),(5,1,200,'2022-07-04 11:01:52',1),(6,1,200,'2022-07-04 11:01:57',1);
/*!40000 ALTER TABLE `reglement` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `maj_montant_verse` AFTER INSERT ON `reglement` FOR EACH ROW BEGIN
    UPDATE location
    SET montantverse = montantverse + NEW.montant
    WHERE location.id = NEW.location_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `relance`
--

DROP TABLE IF EXISTS `relance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `motif` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `relance_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relance`
--

LOCK TABLES `relance` WRITE;
/*!40000 ALTER TABLE `relance` DISABLE KEYS */;
INSERT INTO `relance` (`id`, `location_id`, `date`, `motif`) VALUES (1,1,'2022-06-24 16:04:05','ee');
/*!40000 ALTER TABLE `relance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typereglement`
--

DROP TABLE IF EXISTS `typereglement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typereglement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typereglement`
--

LOCK TABLES `typereglement` WRITE;
/*!40000 ALTER TABLE `typereglement` DISABLE KEYS */;
INSERT INTO `typereglement` (`id`, `libelle`) VALUES (1,'Carte Bleue'),(2,'Chèque bancaire'),(3,'Chèque vacance');
/*!40000 ALTER TABLE `typereglement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-16 16:28:51
