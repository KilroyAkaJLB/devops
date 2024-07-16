-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: 127.0.0.1    Database: rhhabitation
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
-- Table structure for table `habitation`
--

DROP TABLE IF EXISTS `habitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typehabitat_id` int NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `adresse` varchar(100) NOT NULL,
  `codepostal` varchar(10) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `id_ville` int NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `habitantsmax` int NOT NULL,
  `chambres` int NOT NULL,
  `lits` int NOT NULL,
  `sdb` int NOT NULL,
  `superficie` int NOT NULL,
  `prixnuit` decimal(10,0) NOT NULL,
  `etat` enum('disponible','attente_suppression','supprimer') DEFAULT NULL COMMENT 'Statut habitation',
  `idproprietaire` varchar(80) DEFAULT NULL,
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
INSERT INTO `habitation` (`id`, `typehabitat_id`, `libelle`, `description`, `adresse`, `codepostal`, `latitude`, `longitude`, `id_ville`, `image`, `habitantsmax`, `chambres`, `lits`, `sdb`, `superficie`, `prixnuit`, `etat`, `idproprietaire`) VALUES (1,1,'Maison provençale','Une description','12 Rue du Coq qui chante','34000',43.6103,3.8763,56,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',8,3,3,1,92,60,'disponible','proprio2@test.com'),(2,2,'Appartement centre ville','bla bla','Rue du centre','34000',43.6101,3.8762,99,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',4,1,2,1,50,56,'disponible','proprio1@test.com'),(3,1,'Maison 3','Desc Maison 3','Rue 3','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50,'disponible','proprio1@test.com'),(4,1,'Maison 4','Desc Maison 4','Rue 4','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50,'disponible','proprio2@test.com'),(5,1,'Maison 5','Desc Maison 5','Rue 5','34000',43.6103,3.8764,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',6,3,4,1,120,60,'disponible','proprio3@test.com'),(6,1,'Maison 6','Desc Maison 6','Rue 6','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50,'disponible','proprio2@test.com'),(7,1,'Maison 7','Desc Maison 7','Rue 7','34000',43.6103,3.8764,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',6,3,4,2,120,60,'disponible','proprio3@test.com'),(8,1,'Maison 8','Desc Maison 8','Rue 8','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50,'disponible','proprio2@test.com'),(9,1,'Maison 9','Desc Maison 9','Rue 9','34000',43.6103,3.8764,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',6,3,4,1,120,60,'disponible','proprio3@test.com'),(10,1,'Maison 10','Desc Maison 10','Rue 10','34000',43.6102,3.8763,4,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png',5,2,3,1,100,50,'disponible','proprio1@test.com'),(11,2,'Appartement 4','Desc Appartement 4','Rue 4','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35,'disponible','proprio3@test.com'),(12,2,'Appartement 5','Desc Appartement 5','Rue 5','34000',43.6103,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',6,3,3,1,80,40,'disponible','proprio3@test.com'),(13,2,'Appartement 6','Desc Appartement 6','Rue 6','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35,'disponible','proprio2@test.com'),(14,2,'Appartement 7','Desc Appartement 7','Rue 7','34000',43.6103,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',6,3,3,1,80,40,'disponible','proprio1@test.com'),(15,2,'Appartement 8','Desc Appartement 8','Rue 8','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35,'disponible','proprio3@test.com'),(16,2,'Appartement 9','Desc Appartement 9','Rue 9','34000',43.6103,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',6,3,3,1,80,40,'disponible','proprio2@test.com'),(17,2,'Appartement 10','Desc Appartement 10','Rue 10','34000',43.6102,3.8763,3,'http://static.habitations.montpellier2.epsi.fr:17029/appartement.png',5,2,3,1,70,35,'disponible','proprio1@test.com');
/*!40000 ALTER TABLE `habitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitation_image`
--

DROP TABLE IF EXISTS `habitation_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitation_image` (
  `habitation_id` int NOT NULL,
  `ordre` int NOT NULL,
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
INSERT INTO `habitation_image` (`habitation_id`, `ordre`, `url`) VALUES (3,1,'http://static.habitations.montpellier2.epsi.fr:17029/maison.png'),(3,2,'http://static.habitations.montpellier2.epsi.fr:17029/house.jpeg');
/*!40000 ALTER TABLE `habitation_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitation_item`
--

DROP TABLE IF EXISTS `habitation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitation_item` (
  `habitation_id` int NOT NULL,
  `item_id` int NOT NULL,
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
INSERT INTO `habitation_item` (`habitation_id`, `item_id`) VALUES (1,1),(2,1),(1,2),(4,3),(7,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3),(16,3),(17,3);
/*!40000 ALTER TABLE `habitation_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `habitation_itemscount_optionpayantecount`
--

DROP TABLE IF EXISTS `habitation_itemscount_optionpayantecount`;
/*!50001 DROP VIEW IF EXISTS `habitation_itemscount_optionpayantecount`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `habitation_itemscount_optionpayantecount` AS SELECT 
 1 AS `id`,
 1 AS `typehabitat_id`,
 1 AS `libelle`,
 1 AS `description`,
 1 AS `adresse`,
 1 AS `codepostal`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `id_ville`,
 1 AS `image`,
 1 AS `habitantsmax`,
 1 AS `chambres`,
 1 AS `lits`,
 1 AS `sdb`,
 1 AS `superficie`,
 1 AS `prixnuit`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `habitation_optionpayante`
--

DROP TABLE IF EXISTS `habitation_optionpayante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitation_optionpayante` (
  `habitation_id` int NOT NULL,
  `optionpayante_id` int NOT NULL,
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
INSERT INTO `habitation_optionpayante` (`habitation_id`, `optionpayante_id`, `prix`) VALUES (1,1,60),(1,2,30),(1,3,20),(2,1,40),(5,1,50),(5,2,40),(11,1,40),(12,1,50),(12,2,20),(13,1,40),(13,2,30),(14,1,50),(14,2,20),(15,1,40),(15,2,30),(16,1,50),(16,2,20),(17,1,40),(17,2,30);
/*!40000 ALTER TABLE `habitation_optionpayante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `item` (`id`, `libelle`, `description`) VALUES (1,'Internet','Wifi et Fibre'),(2,'Lac','Base de loisirs à 2 km'),(3,'Climatisation','Climatisation réversible');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationro`
--

DROP TABLE IF EXISTS `locationro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locationro` (
  `id` int NOT NULL,
  `idutilisateur` varchar(80) DEFAULT NULL,
  `habitation_id` int NOT NULL,
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
/*!40000 ALTER TABLE `locationro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optionpayante`
--

DROP TABLE IF EXISTS `optionpayante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optionpayante` (
  `id` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `optionpayante` (`id`, `libelle`, `description`) VALUES (1,'Ménage','A la fin du séjour'),(2,'Drap de lit','Pour l ensemble des lits'),(3,'Linge de maison','Linge de toilette pour la salle de bain');

    /*!40000 ALTER TABLE `optionpayante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typehabitat`
--

DROP TABLE IF EXISTS `typehabitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typehabitat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typehabitat`
--

LOCK TABLES `typehabitat` WRITE;
/*!40000 ALTER TABLE `typehabitat` DISABLE KEYS */;
INSERT INTO `typehabitat` (`id`, `libelle`) VALUES (1,'Maison'),(2,'Appartement');
/*!40000 ALTER TABLE `typehabitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `habitation_itemscount_optionpayantecount`
--
DROP VIEW IF EXISTS `habitation_itemscount_optionpayantecount`;
CREATE VIEW `habitation_itemscount_optionpayantecount` AS select `habitation`.`id` AS `id`,`habitation`.`typehabitat_id` AS `typehabitat_id`,`habitation`.`libelle` AS `libelle`,`habitation`.`description` AS `description`,`habitation`.`adresse` AS `adresse`,`habitation`.`codepostal` AS `codepostal`,`habitation`.`latitude` AS `latitude`,`habitation`.`longitude` AS `longitude`,`habitation`.`id_ville` AS `id_ville`,`habitation`.`image` AS `image`,`habitation`.`habitantsmax` AS `habitantsmax`,`habitation`.`chambres` AS `chambres`,`habitation`.`lits` AS `lits`,`habitation`.`sdb` AS `sdb`,`habitation`.`superficie` AS `superficie`,`habitation`.`prixnuit` AS `prixnuit` from ((`habitation` left join (select `habitation`.`id` AS `itemhabitationid`,count(`habitation_item`.`item_id`) AS `ItemsCount` from (`habitation` join `habitation_item`) where (`habitation`.`id` = `habitation_item`.`habitation_id`) group by `habitation`.`id`) `itemsCount` on((`habitation`.`id` = `itemscount`.`itemhabitationid`))) left join (select `habitation`.`id` AS `optionhabitationid`,count(`habitation_optionpayante`.`optionpayante_id`) AS `OptionsPayantesCount` from (`habitation` join `habitation_optionpayante`) where (`habitation`.`id` = `habitation_optionpayante`.`habitation_id`) group by `habitation`.`id`) `optionsPayantesCount` on((`habitation`.`id` = `optionspayantescount`.`optionhabitationid`))) order by `itemscount`.`ItemsCount` desc,`optionspayantescount`.`OptionsPayantesCount` desc limit 0,10 */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-16 16:21:15
