-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rhhabitation
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB-1:10.7.3+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `habitation`
--

DROP TABLE IF EXISTS `habitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typehabitat_id` int(11) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `adresse` varchar(100) NOT NULL,
  `codepostal` varchar(10) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `id_ville` int(11) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `habitantsmax` int(11) NOT NULL,
  `chambres` int(11) NOT NULL,
  `lits` int(11) NOT NULL,
  `sdb` int(11) NOT NULL,
  `superficie` int(11) NOT NULL,
  `prixnuit` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_typehabitat` (`typehabitat_id`),
  CONSTRAINT `habitation_ibfk_1` FOREIGN KEY (`typehabitat_id`) REFERENCES `typehabitat` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitation`
--

LOCK TABLES `habitation` WRITE;
/*!40000 ALTER TABLE `habitation` DISABLE KEYS */;
INSERT INTO `habitation` VALUES
(1,1,'Maison provençale','Une description','12 Rue du Coq qui chante','34000',43.6103,3.8763,56,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',8,3,3,1,92,60),
(2,2,'Appartement centre ville','bla bla','Rue du centre','34000',43.6101,3.8762,99,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',4,1,2,1,50,56),
(3,1,'Maison 3','Desc Maison 3','Rue 3','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50),
(4,1,'Maison 4','Desc Maison 4','Rue 4','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50),
(5,1,'Maison 5','Desc Maison 5','Rue 5','34000',43.6103,3.8764,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',6,3,4,1,120,60),
(6,1,'Maison 6','Desc Maison 6','Rue 6','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50),
(7,1,'Maison 7','Desc Maison 7','Rue 7','34000',43.6103,3.8764,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',6,3,4,2,120,60),
(8,1,'Maison 8','Desc Maison 8','Rue 8','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50),
(9,1,'Maison 9','Desc Maison 9','Rue 9','34000',43.6103,3.8764,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',6,3,4,1,120,60),
(10,1,'Maison 10','Desc Maison 10','Rue 10','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50),
(11,2,'Appartement 4','Desc Appartement 4','Rue 4','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35),
(12,2,'Appartement 5','Desc Appartement 5','Rue 5','34000',43.6103,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',6,3,3,1,80,40),
(13,2,'Appartement 6','Desc Appartement 6','Rue 6','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35),
(14,2,'Appartement 7','Desc Appartement 7','Rue 7','34000',43.6103,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',6,3,3,1,80,40),
(15,2,'Appartement 8','Desc Appartement 8','Rue 8','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35),
(16,2,'Appartement 9','Desc Appartement 9','Rue 9','34000',43.6103,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',6,3,3,1,80,40),
(17,2,'Appartement 10','Desc Appartement 10','Rue 10','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35);
/*!40000 ALTER TABLE `habitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitation_image`
--

DROP TABLE IF EXISTS `habitation_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitation_image` (
  `habitation_id` int(11) NOT NULL,
  `ordre` int(11) NOT NULL,
  `url` varchar(120) NOT NULL,
  PRIMARY KEY (`habitation_id`,`ordre`),
  KEY `ordre` (`ordre`),
  CONSTRAINT `habitation_image_ibfk_1` FOREIGN KEY (`habitation_id`) REFERENCES `habitation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitation_image`
--

LOCK TABLES `habitation_image` WRITE;
/*!40000 ALTER TABLE `habitation_image` DISABLE KEYS */;
INSERT INTO `habitation_image` VALUES
(3,1,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png'),
(3,2,'http://static.habitations.montpellier2.epsi.fr:17029/house.jpeg');
/*!40000 ALTER TABLE `habitation_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitation_item`
--

DROP TABLE IF EXISTS `habitation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitation_item` (
  `habitation_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`habitation_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `habitation_item_ibfk_1` FOREIGN KEY (`habitation_id`) REFERENCES `habitation` (`id`),
  CONSTRAINT `habitation_item_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitation_item`
--

LOCK TABLES `habitation_item` WRITE;
/*!40000 ALTER TABLE `habitation_item` DISABLE KEYS */;
INSERT INTO `habitation_item` VALUES
(1,1),
(1,2),
(2,1),
(4,3),
(7,3),
(10,3),
(11,3),
(12,3),
(13,3),
(14,3),
(15,3),
(16,3),
(17,3);
/*!40000 ALTER TABLE `habitation_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `habitation_itemscount_optionpayantecount`
--

DROP TABLE IF EXISTS `habitation_itemscount_optionpayantecount`;
/*!50001 DROP VIEW IF EXISTS `habitation_itemscount_optionpayantecount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `habitation_itemscount_optionpayantecount` (
  `id` tinyint NOT NULL,
  `typehabitat_id` tinyint NOT NULL,
  `libelle` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `adresse` tinyint NOT NULL,
  `codepostal` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL,
  `id_ville` tinyint NOT NULL,
  `image` tinyint NOT NULL,
  `habitantsmax` tinyint NOT NULL,
  `chambres` tinyint NOT NULL,
  `lits` tinyint NOT NULL,
  `sdb` tinyint NOT NULL,
  `superficie` tinyint NOT NULL,
  `prixnuit` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `habitation_optionpayante`
--

DROP TABLE IF EXISTS `habitation_optionpayante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitation_optionpayante` (
  `habitation_id` int(11) NOT NULL,
  `optionpayante_id` int(11) NOT NULL,
  `prix` double NOT NULL,
  PRIMARY KEY (`habitation_id`,`optionpayante_id`),
  KEY `optionpayante_id` (`optionpayante_id`),
  CONSTRAINT `habitation_optionpayante_ibfk_1` FOREIGN KEY (`habitation_id`) REFERENCES `habitation` (`id`),
  CONSTRAINT `habitation_optionpayante_ibfk_2` FOREIGN KEY (`optionpayante_id`) REFERENCES `optionpayante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitation_optionpayante`
--

LOCK TABLES `habitation_optionpayante` WRITE;
/*!40000 ALTER TABLE `habitation_optionpayante` DISABLE KEYS */;
INSERT INTO `habitation_optionpayante` VALUES
(1,1,60),
(1,2,30),
(1,3,20),
(2,1,40),
(5,1,50),
(5,2,40),
(11,1,40),
(12,1,50),
(12,2,20),
(13,1,40),
(13,2,30),
(14,1,50),
(14,2,20),
(15,1,40),
(15,2,30),
(16,1,50),
(16,2,20),
(17,1,40),
(17,2,30);
/*!40000 ALTER TABLE `habitation_optionpayante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES
(1,'Internet','Wifi et Fibre'),
(2,'Lac','Base de loisirs à 2 km'),
(3,'Climatisation','Climatisation réversible');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationro`
--

DROP TABLE IF EXISTS `locationro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationro` (
  `id` int(11) NOT NULL,
  `idutilisateur` int(11) NOT NULL,
  `habitation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `habitation_id` (`habitation_id`),
  CONSTRAINT `locationro_ibfk_1` FOREIGN KEY (`habitation_id`) REFERENCES `habitation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationro`
--

LOCK TABLES `locationro` WRITE;
/*!40000 ALTER TABLE `locationro` DISABLE KEYS */;
INSERT INTO `locationro` VALUES
(1,5,1),
(2,6,2);
/*!40000 ALTER TABLE `locationro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optionpayante`
--

DROP TABLE IF EXISTS `optionpayante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `optionpayante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionpayante`
--

LOCK TABLES `optionpayante` WRITE;
/*!40000 ALTER TABLE `optionpayante` DISABLE KEYS */;
INSERT INTO `optionpayante` VALUES
(1,'Ménage','A la fin du séjour'),
(2,'Drap de lit','Pour l\'ensemble des lits'),
(3,'Linge de maison','Linge de toilette pour la salle de bain');
/*!40000 ALTER TABLE `optionpayante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typehabitat`
--

DROP TABLE IF EXISTS `typehabitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typehabitat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typehabitat`
--

LOCK TABLES `typehabitat` WRITE;
/*!40000 ALTER TABLE `typehabitat` DISABLE KEYS */;
INSERT INTO `typehabitat` VALUES
(1,'Maison'),
(2,'Appartement');
/*!40000 ALTER TABLE `typehabitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `habitation_itemscount_optionpayantecount`
--

/*!50001 DROP TABLE IF EXISTS `habitation_itemscount_optionpayantecount`*/;
/*!50001 DROP VIEW IF EXISTS `habitation_itemscount_optionpayantecount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
CREATE VIEW `habitation_itemscount_optionpayantecount` AS select rhhabitation.habitation.* from ((`rhhabitation`.`habitation` left join (select `rhhabitation`.`habitation`.`id` AS `itemhabitationid`,count(`rhhabitation`.`habitation_item`.`item_id`) AS `ItemsCount` from (`rhhabitation`.`habitation` join `rhhabitation`.`habitation_item`) where `rhhabitation`.`habitation`.`id` = `rhhabitation`.`habitation_item`.`habitation_id` group by `rhhabitation`.`habitation`.`id`) `itemsDBCount` on(`rhhabitation`.`habitation`.`id` = `itemsDBCount`.`itemhabitationid`)) left join (select `rhhabitation`.`habitation`.`id` AS `optionhabitationid`,count(`rhhabitation`.`habitation_optionpayante`.`optionpayante_id`) AS `OptionsPayantesCount` from (`rhhabitation`.`habitation` join `rhhabitation`.`habitation_optionpayante`) where `rhhabitation`.`habitation`.`id` = `rhhabitation`.`habitation_optionpayante`.`habitation_id` group by `rhhabitation`.`habitation`.`id`) `optionsDBPayantesCount` on(`rhhabitation`.`habitation`.`id` = `optionsDBPayantesCount`.`optionhabitationid`)) order by `itemsDBCount`.`ItemsCount` desc,`optionsDBPayantesCount`.`OptionsPayantesCount` desc limit 0,10;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 10:18:48
