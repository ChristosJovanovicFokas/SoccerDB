CREATE DATABASE  IF NOT EXISTS `soccerdatabase2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `soccerdatabase2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: soccerdatabase2
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS club;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE club (
  club_id int NOT NULL,
  club_name varchar(50) NOT NULL,
  PRIMARY KEY (club_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES club WRITE;
/*!40000 ALTER TABLE club DISABLE KEYS */;
INSERT INTO club VALUES (1,'FC Legends');
/*!40000 ALTER TABLE club ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubplayers`
--

DROP TABLE IF EXISTS clubplayers;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clubplayers (
  club_id int NOT NULL,
  player_id int NOT NULL,
  PRIMARY KEY (club_id,player_id),
  KEY player_id (player_id),
  CONSTRAINT clubplayers_ibfk_1 FOREIGN KEY (club_id) REFERENCES club (club_id),
  CONSTRAINT clubplayers_ibfk_2 FOREIGN KEY (player_id) REFERENCES soccerplayer (player_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubplayers`
--

LOCK TABLES clubplayers WRITE;
/*!40000 ALTER TABLE clubplayers DISABLE KEYS */;
INSERT INTO clubplayers VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11);
/*!40000 ALTER TABLE clubplayers ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubstadium`
--

DROP TABLE IF EXISTS clubstadium;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clubstadium (
  club_id int NOT NULL,
  stadium_id int NOT NULL,
  PRIMARY KEY (club_id,stadium_id),
  KEY stadium_id (stadium_id),
  CONSTRAINT clubstadium_ibfk_1 FOREIGN KEY (club_id) REFERENCES club (club_id),
  CONSTRAINT clubstadium_ibfk_2 FOREIGN KEY (stadium_id) REFERENCES stadium (stadium_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubstadium`
--

LOCK TABLES clubstadium WRITE;
/*!40000 ALTER TABLE clubstadium DISABLE KEYS */;
INSERT INTO clubstadium VALUES (1,1);
/*!40000 ALTER TABLE clubstadium ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clubstatistics`
--

DROP TABLE IF EXISTS clubstatistics;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE clubstatistics (
  club_id int NOT NULL,
  wins int DEFAULT '10',
  losses int DEFAULT '1',
  PRIMARY KEY (club_id),
  CONSTRAINT clubstatistics_ibfk_1 FOREIGN KEY (club_id) REFERENCES club (club_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clubstatistics`
--

LOCK TABLES clubstatistics WRITE;
/*!40000 ALTER TABLE clubstatistics DISABLE KEYS */;
INSERT INTO clubstatistics VALUES (1,10,1);
/*!40000 ALTER TABLE clubstatistics ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerawards`
--

DROP TABLE IF EXISTS playerawards;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE playerawards (
  award_id int NOT NULL,
  player_id int DEFAULT NULL,
  award_name varchar(50) NOT NULL,
  award_year int NOT NULL,
  PRIMARY KEY (award_id),
  KEY player_id (player_id),
  CONSTRAINT playerawards_ibfk_1 FOREIGN KEY (player_id) REFERENCES soccerplayer (player_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerawards`
--

LOCK TABLES playerawards WRITE;
/*!40000 ALTER TABLE playerawards DISABLE KEYS */;
INSERT INTO playerawards VALUES (1,1,'Golden Boot',2023),(2,2,'MVP',2023),(3,3,'Best Player of the Season',2023),(4,4,'Most Assists',2023);
/*!40000 ALTER TABLE playerawards ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soccerplayer`
--

DROP TABLE IF EXISTS soccerplayer;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE soccerplayer (
  player_id int NOT NULL,
  player_name varchar(50) NOT NULL,
  nationality varchar(50) NOT NULL,
  jersey_number int NOT NULL,
  goals_scored int DEFAULT '0',
  assists int DEFAULT '0',
  PRIMARY KEY (player_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soccerplayer`
--

LOCK TABLES soccerplayer WRITE;
/*!40000 ALTER TABLE soccerplayer DISABLE KEYS */;
INSERT INTO soccerplayer VALUES (1,'Lionel Messi','Argentina',10,45,20),(2,'Cristiano Ronaldo','Portugal',7,40,15),(3,'Neymar Jr.','Brazil',11,25,30),(4,'Kevin De Bruyne','Belgium',17,10,25),(5,'Mohamed Salah','Egypt',11,30,15),(6,'Robert Lewandowski','Poland',9,35,10),(7,'Kylian Mbappé','France',7,20,25),(8,'Sadio Mané','Senegal',10,15,20),(9,'Harry Kane','England',9,25,20),(10,'Luka Modrić','Croatia',10,5,30),(11,'Sergio Ramos','Spain',4,10,5);
/*!40000 ALTER TABLE soccerplayer ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS stadium;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE stadium (
  stadium_id int NOT NULL,
  stadium_name varchar(50) NOT NULL,
  PRIMARY KEY (stadium_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES stadium WRITE;
/*!40000 ALTER TABLE stadium DISABLE KEYS */;
INSERT INTO stadium VALUES (1,'Santiago Bernabeu');
/*!40000 ALTER TABLE stadium ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'soccerdatabase2'
--

--
-- Dumping routines for database 'soccerdatabase2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-25 22:32:14
