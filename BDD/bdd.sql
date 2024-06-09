-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdd
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admins` (
  `idAdmin` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`idAdmin`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'sofchel2002@gmail.com','12345678');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add admin',7,'add_admin'),(26,'Can change admin',7,'change_admin'),(27,'Can delete admin',7,'delete_admin'),(28,'Can view admin',7,'view_admin'),(29,'Can add division',8,'add_division'),(30,'Can change division',8,'change_division'),(31,'Can delete division',8,'delete_division'),(32,'Can view division',8,'view_division'),(33,'Can add enseignant',9,'add_enseignant'),(34,'Can change enseignant',9,'change_enseignant'),(35,'Can delete enseignant',9,'delete_enseignant'),(36,'Can view enseignant',9,'view_enseignant'),(37,'Can add horaire',10,'add_horaire'),(38,'Can change horaire',10,'change_horaire'),(39,'Can delete horaire',10,'delete_horaire'),(40,'Can view horaire',10,'view_horaire'),(41,'Can add module',11,'add_module'),(42,'Can change module',11,'change_module'),(43,'Can delete module',11,'delete_module'),(44,'Can view module',11,'view_module'),(45,'Can add salle',12,'add_salle'),(46,'Can change salle',12,'change_salle'),(47,'Can delete salle',12,'delete_salle'),(48,'Can view salle',12,'view_salle'),(49,'Can add etudiant',13,'add_etudiant'),(50,'Can change etudiant',13,'change_etudiant'),(51,'Can delete etudiant',13,'delete_etudiant'),(52,'Can view etudiant',13,'view_etudiant'),(53,'Can add indispo enseignant',14,'add_indispoenseignant'),(54,'Can change indispo enseignant',14,'change_indispoenseignant'),(55,'Can delete indispo enseignant',14,'delete_indispoenseignant'),(56,'Can view indispo enseignant',14,'view_indispoenseignant'),(57,'Can add etudier module',15,'add_etudiermodule'),(58,'Can change etudier module',15,'change_etudiermodule'),(59,'Can delete etudier module',15,'delete_etudiermodule'),(60,'Can view etudier module',15,'view_etudiermodule'),(61,'Can add enseigner module',16,'add_enseignermodule'),(62,'Can change enseigner module',16,'change_enseignermodule'),(63,'Can delete enseigner module',16,'delete_enseignermodule'),(64,'Can view enseigner module',16,'view_enseignermodule'),(65,'Can add programme',17,'add_programme'),(66,'Can change programme',17,'change_programme'),(67,'Can delete programme',17,'delete_programme'),(68,'Can view programme',17,'view_programme');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `idDivision` int NOT NULL AUTO_INCREMENT,
  `typeDivision` varchar(10) NOT NULL,
  `libele` varchar(45) NOT NULL,
  `nbrEtudiant` int DEFAULT NULL,
  `surDivision_id` int DEFAULT NULL,
  PRIMARY KEY (`idDivision`),
  KEY `divisions_surDivision_id_ecffdc28_fk_divisions_idDivision` (`surDivision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (3,'Niveau','Master 1',700,NULL),(4,'Specialite','GL',111,3),(6,'Section','A',111,4),(7,'Groupe','G1',22,6),(8,'Groupe','G2',23,6),(9,'Groupe','G3',22,6),(10,'Groupe','G4',23,6),(11,'Groupe','G5',21,6);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'etudiant','admin'),(8,'etudiant','division'),(9,'etudiant','enseignant'),(16,'etudiant','enseignermodule'),(13,'etudiant','etudiant'),(15,'etudiant','etudiermodule'),(10,'etudiant','horaire'),(14,'etudiant','indispoenseignant'),(11,'etudiant','module'),(17,'etudiant','programme'),(12,'etudiant','salle'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-06-08 11:02:13.955539'),(2,'auth','0001_initial','2024-06-08 11:02:14.357691'),(3,'admin','0001_initial','2024-06-08 11:02:14.462211'),(4,'admin','0002_logentry_remove_auto_add','2024-06-08 11:02:14.470191'),(5,'admin','0003_logentry_add_action_flag_choices','2024-06-08 11:02:14.476681'),(6,'contenttypes','0002_remove_content_type_name','2024-06-08 11:02:14.555095'),(7,'auth','0002_alter_permission_name_max_length','2024-06-08 11:02:14.629681'),(8,'auth','0003_alter_user_email_max_length','2024-06-08 11:02:14.653669'),(9,'auth','0004_alter_user_username_opts','2024-06-08 11:02:14.660257'),(10,'auth','0005_alter_user_last_login_null','2024-06-08 11:02:14.724298'),(11,'auth','0006_require_contenttypes_0002','2024-06-08 11:02:14.725295'),(12,'auth','0007_alter_validators_add_error_messages','2024-06-08 11:02:14.732275'),(13,'auth','0008_alter_user_username_max_length','2024-06-08 11:02:14.775677'),(14,'auth','0009_alter_user_last_name_max_length','2024-06-08 11:02:14.836515'),(15,'auth','0010_alter_group_name_max_length','2024-06-08 11:02:14.851472'),(16,'auth','0011_update_proxy_permissions','2024-06-08 11:02:14.860617'),(17,'auth','0012_alter_user_first_name_max_length','2024-06-08 11:02:14.919164'),(18,'etudiant','0001_initial','2024-06-08 11:02:15.559814'),(19,'etudiant','0002_indispoenseignant_start_lt_end','2024-06-08 11:02:15.604951'),(20,'etudiant','0003_division_surdivision','2024-06-08 11:02:15.665218'),(21,'sessions','0001_initial','2024-06-08 11:02:15.690637');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enseignants`
--

DROP TABLE IF EXISTS `enseignants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enseignants` (
  `idEnseignant` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `grade` varchar(3) DEFAULT NULL,
  `mail` varchar(90) DEFAULT NULL,
  `mdp` varchar(45) DEFAULT NULL,
  `heureMax` time(6) NOT NULL,
  PRIMARY KEY (`idEnseignant`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseignants`
--

LOCK TABLES `enseignants` WRITE;
/*!40000 ALTER TABLE `enseignants` DISABLE KEYS */;
INSERT INTO `enseignants` VALUES (1,'bennai','yani','MAB','bennai.yani@gmail.com','yani2024','06:00:00.000000'),(2,'farah','zoubeyr','MCA','farah.zoubeyr@gmail.com','farah2024','06:00:00.000000'),(3,'Kerkar','Moussa','pr','Kerkar.Moussa@gmail.com','kerkar2024','06:00:00.000000'),(4,'Goudjil','Slimane','pr','Goudjil.slimane@gmail.com','goudjil2024','06:00:00.000000'),(5,'Achroufene','Achor','MCA','Achroufene.Achor@gmail.com','achor2024','06:00:00.000000'),(6,'Boussoufa','jm','Vac','Boussoufa@gmail.com','bouss2024','06:00:00.000000'),(7,'Gasmi','Badrina','MCB','Gasmi@gmail.com','gasmi2024','06:00:00.000000'),(8,'Kichou','jm','Vac','kichou@gmail.com','kichou32024','06:00:00.000000'),(9,'El Bouhissi','Houda','MCA','Elbouhissi.houda@gmail.com','houda2024','06:00:00.000000'),(10,'Hamma','jm','Vac','hamma@gmail.com','hamma2024','06:00:00.000000'),(11,'Rahmani','Lamia','Vac','Rahmani@gmail.com','rahmani2024','06:00:00.000000'),(12,'Soufit','Massinissa','MCB','soufit.massinissa@gmail.com','soufit2024','06:00:00.000000'),(13,'Amokrane','jm','Vac','amokrane@gmail.com','amokrane2024','06:00:00.000000'),(14,'Ouazar','jm','Vac','Ouazar@gmail.com','ouazar2024','06:00:00.000000'),(15,'Bachi','Katia','MCB','Bachi@gmail.com','bachi2024','06:00:00.000000'),(16,'Haddad','jm','Vac','Haddad@gmail.com','Haddad2024','06:00:00.000000');
/*!40000 ALTER TABLE `enseignants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enseignermodules`
--

DROP TABLE IF EXISTS `enseignermodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enseignermodules` (
  `idEnseignerModule` int NOT NULL AUTO_INCREMENT,
  `typeEnseignement` varchar(5) NOT NULL,
  `idEnseignant_id` int NOT NULL,
  `idModule_id` int NOT NULL,
  PRIMARY KEY (`idEnseignerModule`),
  KEY `enseignermodules_idEnseignant_id_e49a2317_fk_enseignan` (`idEnseignant_id`),
  KEY `enseignermodules_idModule_id_cdbed45e_fk_modules_idModule` (`idModule_id`),
  CONSTRAINT `enseignermodules_idEnseignant_id_e49a2317_fk_enseignan` FOREIGN KEY (`idEnseignant_id`) REFERENCES `enseignants` (`idEnseignant`),
  CONSTRAINT `enseignermodules_idModule_id_cdbed45e_fk_modules_idModule` FOREIGN KEY (`idModule_id`) REFERENCES `modules` (`idModule`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enseignermodules`
--

LOCK TABLES `enseignermodules` WRITE;
/*!40000 ALTER TABLE `enseignermodules` DISABLE KEYS */;
INSERT INTO `enseignermodules` VALUES (1,'COURS',12,2),(2,'TD',12,2),(3,'COURS',9,3),(4,'TP',11,3),(5,'TD',10,3),(6,'COURS',7,5),(7,'TP',8,5),(8,'TD',7,5),(9,'COURS',5,4),(10,'TP',6,4),(11,'TD',5,4),(12,'TD',4,6),(13,'TD',3,7),(14,'TD',2,1),(15,'TP',16,1),(16,'TD',14,3);
/*!40000 ALTER TABLE `enseignermodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiants` (
  `idEtudiant` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `mail` varchar(254) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `idDivision_id` int DEFAULT NULL,
  PRIMARY KEY (`idEtudiant`),
  UNIQUE KEY `mail` (`mail`),
  KEY `etudiants_idDivision_id_05757c42_fk_divisions_idDivision` (`idDivision_id`),
  CONSTRAINT `etudiants_idDivision_id_05757c42_fk_divisions_idDivision` FOREIGN KEY (`idDivision_id`) REFERENCES `divisions` (`idDivision`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (3,'ABBAS','KAIMA','kaima.abbas@se.univ-bejaia.dz','12345678',7),(4,'ABBOU','Liticia','liticia.abbou@se.univ-bejaia.dz','12345678',7),(5,'ABDERRAHMANE','CYLIA','cylia.abderrahman@se.univ-bejaia.dz','12345678',7),(6,'ADJTOUTAH','SARA','sara.adjtoutah@se.univ-bejaia.dz','12345678',7),(7,'ADRAR','Ryma','ryma.adrar@se.univ-bejaia.dz','12345678',7),(8,'AICHE','Youva','youva.aiche@se.univ-bejaia.dz','12345678',7),(9,'AISSOU','AHLEM','ahlem.aissou@se.univ-bejaia.dz','12345678',7),(10,'AIT ABDESLAM','Lamia','lamia.aitabdeslam@se.univ-bejaia.dz','12345678',7),(11,'AIT AHMED','MERIEM','meriem.aitahmed@se.univ-bejaia.dz','12345678',7),(12,'AITMOUHOUB','KATIA','katia.aitmouhoub@se.univ-bejaia.dz','12345678',7),(13,'ALLAOUA','YACINE','yacine.allaoua@se.univ-bejaia.dz','12345678',7),(14,'AMAOUCHE','SAMY','samy.amaouche@se.univ-bejaia.dz','12345678',7),(15,'AMROUCHE','Melissa','melissa.amrouche@se.univ-bejaia.dz','12345678',7),(16,'AMROUD','FARES','fares.amroud@se.univ-bejaia.dz','12345678',7),(17,'AMROUN','Ikram','ikram.amroun@se.univ-bejaia.dz','12345678',7),(18,'AOURTILANE','SOFIA','sofia.aourtilane@se.univ-bejaia.dz','12345678',7),(19,'ARKOUB','FAIZA','faiza.arkoub@se.univ-bejaia.dz','12345678',7),(20,'ASBAI','AICHA','aicha.asbai@se.univ-bejaia.dz','12345678',7),(21,'ASSAM','Sofiane','sofiane.assam@se.univ-bejaia.dz','12345678',7),(22,'AZAG','CELIA','celia.azag@se.univ-bejaia.dz','12345678',7),(23,'BAZIZ','ILHEM','ilhem.baziz@se.univ-bejaia.dz','12345678',7),(24,'BAZIZ ','SAMRA ','samra.baziz@se.univ-bejaia.dz','12345678',7),(25,'BEDREDDINE','TASSADIT','tassadit.bedreddine@se.univ-bejaia.dz','12345678',8),(26,'BEKHOUS','ANAIS','anais.bekhous@se.univ-bejaia.dz','12345678',8),(27,'BELAID','Nora','nora.belaid@se.univ-bejaia.dz','12345678',8),(28,'BELAID','SIHAM','siham.belaid@se.univ-bejaia.dz','12345678',8),(29,'BELHADDAD','HADJILA','hadjila.belhaddad@se.univ-bejaia.dz','12345678',8),(30,'BENABDERRAHMANE','Selma','selma.benabderrahmane@se.univ-bejaia.dz','12345678',8),(31,'BENADJAOUD','LYDIA','lydia.benadjaoud@se.univ-bejaia.dz','12345678',8),(32,'BENAISSA','Meriem','meriem.benaissa@se.univ-bejaia.dz','12345678',8),(33,'BENAMOURA','Nadira','nadia.benamoura@se.univ-bejaia.dz','12345678',8),(34,'BENIKEN','YANIS','yanis.beniken@se.univ-bejaia.dz','12345678',8),(35,'BENNACER','IMENE','imene.bennacer@se.univ-bejaia.dz','12345678',8),(36,'BENSEKHRIA','Asma','asma.bensekhria@se.univ-bejaia.dz','12345678',8),(37,'BERBER','SOFIANE','sofiane.berber@se.univ-bejaia.dz','12345678',8),(38,'BEZOUH','HANIFA','hanifa.bezouh@se.univ-bejaia.dz','12345678',8),(39,'BOUAKACHE','Thiziri','thiziri.bouakache@se.univ-bejaia.dz','12345678',8),(40,'BOUAZOUNI','RAMY','ramy.bouazouni@se.univ-bejaia.dz','12345678',8),(41,'BOUAZZA','Cylia','cylia.bouazza@se.univ-bejaia.dz','12345678',8),(42,'BOUCHOUCHA','Samy elias','samyelias.bouchoucha@se.univ-bejaia.dz','12345678',8),(43,'BOUDRA','RANIA','rania.boudra@se.univ-bejaia.dz','12345678',8),(44,'BOUGHERIOU','ABDERRAHMANE','abderrahmane.bougheriou@se.univ-bejaia.dz','12345678',8),(45,'BOUHAFNA','MONCEF','moncef.bouhafna@se.univ-bejaia.dz','12345678',8),(46,'BOUKAMOUM','SARAH','sarah.boukamoum@se.univ-bejaia.dz','12345678',8),(47,'BOUKIDER','Nessrine','nessrine.boukider@se.univ-bejaia.dz','12345678',8),(48,'BOULANOUAR','THAWANZA','thawanza.boulanouar@se.univ-bejaia.dz','12345678',9),(49,'BOUMOULA','YASMINE','yasmine.boumoula@se.univ-bejaia.dz','12345678',9),(50,'BOUSBA','BACHIR','bachir.bousba@se.univ-bejaia.dz','12345678',9),(51,'BOUSSAD','MOHAND SAID RAMY','mohandsaidramy.boussad@se.univ-bejaia.dz','12345678',9),(52,'CHAFFI','Aicha manel','aichamanel.chaffi@se.univ-bejaia.dz','12345678',9),(53,'CHAIB','DYHIA','dyhia.chaib@se.univ-bejaia.dz','12345678',9),(54,'CHALAL','Massissilia','massissilia.chalal@se.univ-bejaia.dz','12345678',9),(55,'CHELGHOUM','SOFIANE','sofiane.chelghoum@se.univ-bejaia.dz','12345678',9),(56,'CHERIGUI','Rabia','rabia.cherigui@se.univ-bejaia.dz','12345678',9),(57,'CHIKBOUNI','Sofiane','sofiane.chikbouni@se.univ-bejaia.dz','12345678',9),(58,'CHOUF','Dihya','dihya.chouf@se.univ-bejaia.dz','12345678',9),(59,'DJAFRI','Halim','halim.djafri@se.univ-bejaia.dz','12345678',9),(60,'DJEBARA','LIZA','liza.djebara@se.univ-bejaia.dz','12345678',9),(61,'DJEBBARI','TINHINANE','tinhinane.djebbari@se.univ-bejaia.dz','12345678',9),(62,'DJERMOUNE','CELINA','celina.djermoune@se.univ-bejaia.dz','12345678',9),(63,'DJERROUD','SABRINA','sabrina.djerroud@se.univ-bejaia.dz','12345678',9),(64,'DJOUDAD','LOUIZA','louiza.djoudad@se.univ-bejaia.dz','12345678',9),(65,'DJOUDER','MASSIL','massil.djouder@se.univ-bejaia.dz','12345678',9),(66,'DJOUHRI','AMIR','amir.djouhri@se.univ-bejaia.dz','12345678',9),(67,'GOUDJIL','ALI','ali.goudjil@se.univ-bejaia.dz','12345678',9),(68,'HADDADOU','FATIMA','fatima.haddadou@se.univ-bejaia.dz','12345678',9),(69,'HAI','SABRINA','sabrina.hai@se.univ-bejaia.dz','12345678',9),(70,'HAMDAOUI','KHALED','khaled.hamdaoui@se.univ-bejaia.dz','12345678',10),(71,'HAMENNI','RAYAN','rayan.hamenni@se.univ-bejaia.dz','12345678',10),(72,'HAMITI','WALID','walid.hamiti@se.univ-bejaia.dz','12345678',10),(73,'HAMITOUCHE','LYNDA','lynda.hamitouche@se.univ-bejaia.dz','12345678',10),(74,'HARRA','MARIYA','mariya.harra@se.univ-bejaia.dz','12345678',10),(75,'IDIR','Aomar','aomar.idir@se.univ-bejaia.dz','12345678',10),(76,'IDIRI','Thinhinane','thinhinane.idiri@se.univ-bejaia.dz','12345678',10),(77,'IFTISSEN','Tinhinane','tinhinane.iftissen@se.univ-bejaia.dz','12345678',10),(78,'IHADDADEN','KENZA','kenza.ihaddaden@se.univ-bejaia.dz','12345678',10),(79,'KACHBI','YOUBA','youba.kachbi@se.univ-bejaia.dz','12345678',10),(80,'KARBACHE','ABDELKADER AMINE','abdelkaderamine.karbache@se.univ-bejaia.dz','12345678',10),(81,'KHELOUFI','MOUNIR','mounir.kheloufi@se.univ-bejaia.dz','12345678',10),(82,'KHERAZ','ADLAL','adlal.kheraz@se.univ-bejaia.dz','12345678',10),(83,'KHOUALDI','LYAZID','lyazid.khoualdi@se.univ-bejaia.dz','12345678',10),(84,'LACHI','NOUR EL HOUDA','nourelhouda.lachi@se.univ-bejaia.dz','12345678',10),(85,'LEBRACHE','MERIEM','meriem.lebrache@se.univ-bejaia.dz','12345678',10),(86,'LOULOU','MALIKA','malika.loulou@se.univ-bejaia.dz','12345678',10),(87,'MAAFA','SARA','sara.maafa@se.univ-bejaia.dz','12345678',10),(88,'MAIOU','FADILA','fadila.maiou@se.univ-bejaia.dz','12345678',10),(89,'MASSIOUN','Celia','celia.massioun@se.univ-bejaia.dz','12345678',10),(90,'MEHIDI','MERIEM','meriem.mehidi@se.univ-bejaia.dz','12345678',10),(91,'MERZOUGUI','Melissa','mellisa.merzougui@se.univ-bejaia.dz','12345678',10),(92,'MESSAOUDENE','Amel','amel.messaoudene@se.univ-bejaia.dz','12345678',10),(93,'MEZIANE','YASMINE','yasmine.meziane@se.univ-bejaia.dz','12345678',11),(94,'MEZNAD','IMENE','imene.meznad@se.univ-bejaia.dz','12345678',11),(95,'NAIT ATMANE','Kenza','kenza.naitatman@se.univ-bejaia.dz','12345678',11),(96,'OULMI','MALIKA','malika.oulmi@se.univ-bejaia.dz','12345678',11),(97,'RABHI','LYES','lyes.rabhi@se.univ-bejaia.dz','12345678',11),(98,'RAMDANI','Assia','assia.ramdani@se.univ-bejaia.dz','12345678',11),(99,'SADI','AKSIL','aksil.sadi@se.univ-bejaia.dz','12345678',11),(100,'SADI','MASSIN','massin.sadi@se.univ-bejaia.dz','12345678',11),(101,'SAIDJ','HOUDA','houda.saidj@se.univ-bejaia.dz','12345678',11),(102,'SEBAIHI','KAHINA','kahina.sebaihi@se.univ-bejaia.dz','12345678',11),(103,'SELLAMI','ABDERRAHIM','abderrahim.sellami@se.univ-bejaia.dz','12345678',11),(104,'TERFA','KHEIR EDDINE','kheireddin.tefra@se.univ-bejaia.dz','12345678',11),(105,'TIAB','MELISSA SMICHA','melissasmicha.tiab@se.univ-bejaia.dz','12345678',11),(106,'TIGRINE','MARYS','marys.tigrine@se.univ-bejaia.dz','12345678',11),(107,'TIKHERBATINE','KENZA','kenza.tikherbatine@se.univ-bejaia.dz','12345678',11),(108,'TOUAZI','SIREM','sirem.touazi@se.univ-bejaia.dz','12345678',11),(109,'YAFA','SABRINA','sabrina.yafa@se.univ-bejaia.dz','12345678',11),(110,'ZAID','YOUCEF','youcef.zaid@se.univ-bejaia.dz','12345678',11),(111,'ZENATI','JUBA','juba.zenati@se.univ-bejaia.dz','12345678',11),(112,'ZENATI','LINA','lina.zenati@se.univ-bejaia.dz','12345678',11),(113,'ZIANE','Thinhinane','thinhinane.ziane@se.univ-bejaia.dz','12345678',11);
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiermodules`
--

DROP TABLE IF EXISTS `etudiermodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etudiermodules` (
  `idEtudierModule` int NOT NULL AUTO_INCREMENT,
  `typeEtude` varchar(5) NOT NULL,
  `idDivision_id` int NOT NULL,
  `idModule_id` int NOT NULL,
  PRIMARY KEY (`idEtudierModule`),
  KEY `etudiermodules_idDivision_id_6aaf0f4e_fk_divisions_idDivision` (`idDivision_id`),
  KEY `etudiermodules_idModule_id_4a4ee492_fk_modules_idModule` (`idModule_id`),
  CONSTRAINT `etudiermodules_idDivision_id_6aaf0f4e_fk_divisions_idDivision` FOREIGN KEY (`idDivision_id`) REFERENCES `divisions` (`idDivision`),
  CONSTRAINT `etudiermodules_idModule_id_4a4ee492_fk_modules_idModule` FOREIGN KEY (`idModule_id`) REFERENCES `modules` (`idModule`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etudiermodules`
--

LOCK TABLES `etudiermodules` WRITE;
/*!40000 ALTER TABLE `etudiermodules` DISABLE KEYS */;
INSERT INTO `etudiermodules` VALUES (1,'COURS',6,2),(2,'COURS',6,3),(3,'COURS',6,4),(4,'COURS',6,5),(5,'TD',6,7),(6,'TD',7,3),(7,'TD',8,3),(8,'TD',9,3),(9,'TD',10,3),(10,'TD',11,3),(11,'TP',7,3),(12,'TP',8,3),(13,'TP',9,3),(14,'TP',10,3),(15,'TP',11,3),(16,'TD',7,4),(17,'TD',8,4),(18,'TD',9,4),(19,'TD',10,4),(20,'TD',11,4),(21,'TP',7,4),(22,'TP',8,4),(23,'TP',9,4),(24,'TP',10,4),(25,'TP',11,4),(26,'TD',7,5),(27,'TD',8,5),(28,'TD',9,5),(29,'TD',10,5),(30,'TD',11,5),(31,'TP',7,5),(32,'TP',8,5),(33,'TP',9,5),(34,'TP',10,5),(35,'TP',11,5),(36,'TD',7,2),(37,'TD',8,2),(38,'TD',9,2),(39,'TD',10,2),(40,'TD',11,2),(41,'TD',7,6),(42,'TD',8,6),(43,'TD',9,6),(44,'TD',10,6),(45,'TD',11,6),(46,'TD',7,1),(47,'TD',8,1),(48,'TD',9,1),(49,'TD',10,1),(50,'TD',11,1),(51,'TP',7,1),(52,'TP',8,1),(53,'TP',9,1),(54,'TP',10,1),(55,'TP',11,1);
/*!40000 ALTER TABLE `etudiermodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horaires`
--

DROP TABLE IF EXISTS `horaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horaires` (
  `idHoraire` int NOT NULL AUTO_INCREMENT,
  `jour` varchar(3) DEFAULT NULL,
  `heureD` varchar(5) DEFAULT NULL,
  `heureF` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idHoraire`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horaires`
--

LOCK TABLES `horaires` WRITE;
/*!40000 ALTER TABLE `horaires` DISABLE KEYS */;
INSERT INTO `horaires` VALUES (1,'Dim','08h00','9h30'),(2,'Dim','9h40','11h10'),(3,'Dim','11h20','12h50'),(4,'Dim','13h00','14h30'),(5,'Dim','14h40','16h10'),(6,'Dim','16h20','17h50'),(7,'Lun','08h00','9h30'),(8,'Lun','9h40','11h10'),(9,'Lun','11h20','12h50'),(10,'Lun','13h00','14h30'),(11,'Lun','14h40','16h10'),(12,'Lun','16h20','17h50'),(13,'Mar','08h00','9h30'),(14,'Mar','9h40','11h10'),(15,'Mar','11h20','12h50'),(16,'Mar','13h00','14h30'),(17,'Mar','14h40','16h10'),(18,'Mar','16h20','17h50'),(19,'Mer','08h00','9h30'),(20,'Mer','9h40','11h10'),(21,'Mer','11h20','12h50'),(22,'Mer','13h00','14h30'),(23,'Mer','14h40','16h10'),(24,'Mer','16h20','17h50'),(25,'Jeu','08h00','9h30'),(26,'Jeu','9h40','11h10'),(27,'Jeu','11h20','12h50'),(28,'Jeu','13h00','14h30'),(29,'Jeu','14h40','16h10'),(30,'Jeu','16h20','17h50');
/*!40000 ALTER TABLE `horaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indispoenseignant`
--

DROP TABLE IF EXISTS `indispoenseignant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indispoenseignant` (
  `idIndspo` int NOT NULL AUTO_INCREMENT,
  `jour` varchar(3) DEFAULT NULL,
  `start` time(6) NOT NULL,
  `end` time(6) NOT NULL,
  `idEnseignant_id` int NOT NULL,
  PRIMARY KEY (`idIndspo`),
  KEY `indispoenseignant_idEnseignant_id_1a8df4b0_fk_enseignan` (`idEnseignant_id`),
  CONSTRAINT `indispoenseignant_idEnseignant_id_1a8df4b0_fk_enseignan` FOREIGN KEY (`idEnseignant_id`) REFERENCES `enseignants` (`idEnseignant`),
  CONSTRAINT `start_lt_end` CHECK ((`start` < `end`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indispoenseignant`
--

LOCK TABLES `indispoenseignant` WRITE;
/*!40000 ALTER TABLE `indispoenseignant` DISABLE KEYS */;
/*!40000 ALTER TABLE `indispoenseignant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `idModule` int NOT NULL AUTO_INCREMENT,
  `libélé` varchar(90) NOT NULL,
  PRIMARY KEY (`idModule`),
  UNIQUE KEY `libélé` (`libélé`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'AIE'),(7,'Anglais'),(6,'IMP'),(4,'MC'),(5,'PS'),(3,'RC'),(2,'TOP');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programme`
--

DROP TABLE IF EXISTS `programme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programme` (
  `idProgramme` int NOT NULL AUTO_INCREMENT,
  `enseignant_id` int NOT NULL,
  `horaire_id` int NOT NULL,
  `seance_id` int NOT NULL,
  `salle_id` int NOT NULL,
  PRIMARY KEY (`idProgramme`),
  KEY `programme_enseignant_id_ad4d466a_fk_enseignants_idEnseignant` (`enseignant_id`),
  KEY `programme_horaire_id_c9776fe6_fk_horaires_idHoraire` (`horaire_id`),
  KEY `programme_seance_id_c7c5ae6a_fk_etudiermodules_idEtudierModule` (`seance_id`),
  KEY `programme_salle_id_9fd579b9_fk_salles_idSalles` (`salle_id`),
  CONSTRAINT `programme_enseignant_id_ad4d466a_fk_enseignants_idEnseignant` FOREIGN KEY (`enseignant_id`) REFERENCES `enseignants` (`idEnseignant`),
  CONSTRAINT `programme_horaire_id_c9776fe6_fk_horaires_idHoraire` FOREIGN KEY (`horaire_id`) REFERENCES `horaires` (`idHoraire`),
  CONSTRAINT `programme_salle_id_9fd579b9_fk_salles_idSalles` FOREIGN KEY (`salle_id`) REFERENCES `salles` (`idSalles`),
  CONSTRAINT `programme_seance_id_c7c5ae6a_fk_etudiermodules_idEtudierModule` FOREIGN KEY (`seance_id`) REFERENCES `etudiermodules` (`idEtudierModule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programme`
--

LOCK TABLES `programme` WRITE;
/*!40000 ALTER TABLE `programme` DISABLE KEYS */;
/*!40000 ALTER TABLE `programme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salles`
--

DROP TABLE IF EXISTS `salles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salles` (
  `idSalles` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  `capacite` int NOT NULL,
  `tp` tinyint(1) NOT NULL,
  PRIMARY KEY (`idSalles`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salles`
--

LOCK TABLES `salles` WRITE;
/*!40000 ALTER TABLE `salles` DISABLE KEYS */;
INSERT INTO `salles` VALUES (2,'A16',150,0),(3,'B1S17',35,1),(4,'B1S03',35,0),(5,'B8S01',35,0),(6,'B5S120',35,0),(7,'B1S05',35,1),(8,'B8S03',35,0),(9,'B8S04',35,0),(10,'B8S14',25,0),(11,'B8S05',35,0),(12,'B5S113',35,0),(13,'B5S111',35,0),(14,'A14',150,0),(15,'B8S11',35,0),(16,'B5S110',35,0),(17,'B8S02',35,0),(18,'B1S14',35,1),(31,'B1S16',35,1),(32,'B1S01',35,1),(33,'B5S112',35,0);
/*!40000 ALTER TABLE `salles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-09 19:49:25
