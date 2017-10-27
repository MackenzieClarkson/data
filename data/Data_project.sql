CREATE DATABASE  IF NOT EXISTS `hospital_project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital_project`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_project
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assigned`
--

DROP TABLE IF EXISTS `assigned`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assigned` (
  `Rno` int(11) NOT NULL,
  `PHcn` int(11) NOT NULL,
  `Checkin` datetime NOT NULL,
  PRIMARY KEY (`PHcn`,`Checkin`),
  KEY `fk_Assigned_2_idx` (`PHcn`),
  KEY `fk_Assigned_1` (`Rno`),
  CONSTRAINT `fk_Assigned_1` FOREIGN KEY (`Rno`) REFERENCES `rooms` (`Rno`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Assigned_2` FOREIGN KEY (`PHcn`) REFERENCES `patient` (`Hcn`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned`
--

LOCK TABLES `assigned` WRITE;
/*!40000 ALTER TABLE `assigned` DISABLE KEYS */;
/*!40000 ALTER TABLE `assigned` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caresfor`
--

DROP TABLE IF EXISTS `caresfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caresfor` (
  `DSsn` int(11) NOT NULL,
  `PHcn` int(11) NOT NULL,
  `Start` datetime NOT NULL,
  `End` datetime DEFAULT NULL,
  PRIMARY KEY (`DSsn`,`PHcn`),
  KEY `fk_CaresFor_2_idx` (`PHcn`),
  CONSTRAINT `fk_CaresFor_1` FOREIGN KEY (`DSsn`) REFERENCES `doctors` (`Ssn`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_CaresFor_2` FOREIGN KEY (`PHcn`) REFERENCES `patient` (`Hcn`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caresfor`
--

LOCK TABLES `caresfor` WRITE;
/*!40000 ALTER TABLE `caresfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `caresfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Dno` int(11) NOT NULL,
  `DName` varchar(45) NOT NULL,
  `Hno` int(11) NOT NULL,
  PRIMARY KEY (`Dno`,`Hno`),
  KEY `fk_Department_1_idx` (`Hno`),
  CONSTRAINT `fk_Department_1` FOREIGN KEY (`Hno`) REFERENCES `hospital` (`Hno`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `Ssn` int(11) NOT NULL,
  `DoctorName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_Doctors_1_idx` (`Dno`),
  CONSTRAINT `fk_Doctors_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `Hno` int(11) NOT NULL,
  `HName` varchar(255) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Hno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `Hcn` int(11) NOT NULL,
  `PName` varchar(45) NOT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Hcn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientrecords`
--

DROP TABLE IF EXISTS `patientrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientrecords` (
  `PHcn` int(11) NOT NULL,
  `Illness` varchar(45) NOT NULL,
  `Start` datetime DEFAULT NULL,
  `End` datetime DEFAULT NULL,
  `Medication` varchar(45) DEFAULT NULL,
  `Physician` varchar(45) DEFAULT NULL,
  `Symptoms` varchar(45) DEFAULT NULL,
  `CaseN` int(11) NOT NULL,
  PRIMARY KEY (`CaseN`),
  KEY `fk_PatientRecords_1` (`PHcn`),
  CONSTRAINT `fk_PatientRecords_1` FOREIGN KEY (`PHcn`) REFERENCES `patient` (`Hcn`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientrecords`
--

LOCK TABLES `patientrecords` WRITE;
/*!40000 ALTER TABLE `patientrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `patientrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `Rno` int(11) NOT NULL,
  `RName` varchar(45) NOT NULL,
  `Dno` int(11) DEFAULT NULL,
  `Status` varchar(45) DEFAULT 'Availible',
  PRIMARY KEY (`Rno`),
  KEY `fk_Rooms_1_idx` (`Dno`),
  CONSTRAINT `fk_Rooms_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Ssn` int(11) NOT NULL,
  `SName` varchar(45) DEFAULT NULL,
  `Address` varchar(45) DEFAULT NULL,
  `Telephone` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `BirthDate` datetime DEFAULT NULL,
  `Dno` int(11) DEFAULT NULL,
  `Position` varchar(45) NOT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_Staff_1_idx` (`Dno`),
  CONSTRAINT `fk_Staff_1` FOREIGN KEY (`Dno`) REFERENCES `department` (`Dno`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-27 12:06:15
