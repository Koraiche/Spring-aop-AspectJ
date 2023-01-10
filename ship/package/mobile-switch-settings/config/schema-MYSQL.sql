-- MySQL dump 10.13  Distrib 5.6.50, for Linux (x86_64)
--
-- Host: localhost    Database: settings_db
-- ------------------------------------------------------
-- Server version	5.6.50

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

CREATE DATABASE IF NOT EXISTS settings_db;
use settings_db;
--
-- Table structure for table `center`
--

DROP TABLE IF EXISTS `center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  `cnt_email` varchar(255) DEFAULT NULL,
  `cnt_fax` varchar(255) DEFAULT NULL,
  `cnt_fname` varchar(255) DEFAULT NULL,
  `cnt_phone_number_1` varchar(255) DEFAULT NULL,
  `cnt_lname` varchar(255) DEFAULT NULL,
  `cnt_phone_number_2` varchar(255) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `end_of_day_time` time NOT NULL,
  `logo` longtext NOT NULL,
  `name` varchar(30) NOT NULL,
  `reference` varchar(6) NOT NULL,
  `reference_currency` varchar(3) NOT NULL,
  `settlement_currency` varchar(3) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK5ud80f0napdot3uqsg50rady1` (`reference`),
  UNIQUE KEY `UK12w4b5j1cmod7fftaruvrg5q5` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `center_fee_rule`
--

DROP TABLE IF EXISTS `center_fee_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_fee_rule` (
  `id` bigint(20) NOT NULL,
  `fee_max_amount` decimal(19,2) NOT NULL,
  `fee_min_amount` decimal(19,2) NOT NULL,
  `fixe` decimal(19,2) NOT NULL,
  `percentage` float NOT NULL,
  `tr_max_amount` decimal(19,2) NOT NULL,
  `tr_min_amount` decimal(19,2) NOT NULL,
  `service_fees_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlvimpipicnpfog0k1qvbky9dl` (`service_fees_id`),
  CONSTRAINT `FKlvimpipicnpfog0k1qvbky9dl` FOREIGN KEY (`service_fees_id`) REFERENCES `center_service_fee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `center_fee_rule_seq`
--

DROP TABLE IF EXISTS `center_fee_rule_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_fee_rule_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `center_fee_seq`
--

DROP TABLE IF EXISTS `center_fee_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_fee_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `center_fee_template`
--

DROP TABLE IF EXISTS `center_fee_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_fee_template` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `reference` varchar(6) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `center_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK15mw8elqv0fye335eu247p728` (`center_id`),
  CONSTRAINT `FK15mw8elqv0fye335eu247p728` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `center_seq`
--

DROP TABLE IF EXISTS `center_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `center_service_fee`
--

DROP TABLE IF EXISTS `center_service_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `center_service_fee` (
  `id` bigint(20) NOT NULL,
  `service` int(11) NOT NULL,
  `fee_template_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKm12mtcihven5d645jvt2ywdbu` (`fee_template_id`),
  CONSTRAINT `FKm12mtcihven5d645jvt2ywdbu` FOREIGN KEY (`fee_template_id`) REFERENCES `center_fee_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` bigint(20) NOT NULL,
  `fraction_digits` int(11) NOT NULL,
  `iso_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `numeric_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `currency_seq`
--

DROP TABLE IF EXISTS `currency_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  `acquirer_id` varchar(6) DEFAULT NULL,
  `cnt_email` varchar(255) DEFAULT NULL,
  `cnt_fax` varchar(255) DEFAULT NULL,
  `cnt_fname` varchar(255) DEFAULT NULL,
  `cnt_phone_number_1` varchar(255) DEFAULT NULL,
  `cnt_lname` varchar(255) DEFAULT NULL,
  `cnt_phone_number_2` varchar(255) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `credit_endpoint` varchar(255) NOT NULL,
  `debit_endpoint` varchar(255) NOT NULL,
  `initial` varchar(10) NOT NULL,
  `logo` longtext NOT NULL,
  `manage_notification` bit(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `notify_endpoint` varchar(255) NOT NULL,
  `reference` varchar(6) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `center_id` bigint(20) DEFAULT NULL,
  `notification_configuration_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKq5f8y8p4uuvfg5afjim7r5htw` (`reference`),
  UNIQUE KEY `UKtr592c69igygahy57ba6x82gr` (`name`),
  UNIQUE KEY `UK1pp6aq0scfuq9t3fwphe0tqhx` (`initial`),
  UNIQUE KEY `UKrf1wmcepmpe4sga4269cxnpco` (`acquirer_id`),
  KEY `FKi8enkccy2y3cu5keg17754nmw` (`center_id`),
  CONSTRAINT `FKi8enkccy2y3cu5keg17754nmw` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `institution_seq`
--

DROP TABLE IF EXISTS `institution_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `institution_services`
--

DROP TABLE IF EXISTS `institution_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institution_services` (
  `institution_id` bigint(20) NOT NULL,
  `services` varchar(255) DEFAULT NULL,
  KEY `FKl6uq39il06dq6la5ulbxvud9a` (`institution_id`),
  CONSTRAINT `FKl6uq39il06dq6la5ulbxvud9a` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `inter_fee_institution`
--

DROP TABLE IF EXISTS `inter_fee_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inter_fee_institution` (
  `interchange_fee_template_id` bigint(20) NOT NULL,
  `institutions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`interchange_fee_template_id`,`institutions_id`),
  KEY `FKepfhh54pj7h89wlxhi5vhb41f` (`institutions_id`),
  CONSTRAINT `FK60txv6v3a3y13tgv4upu62iyd` FOREIGN KEY (`interchange_fee_template_id`) REFERENCES `interchange_fee_template` (`id`),
  CONSTRAINT `FKepfhh54pj7h89wlxhi5vhb41f` FOREIGN KEY (`institutions_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `inter_fee_rule_seq`
--

DROP TABLE IF EXISTS `inter_fee_rule_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inter_fee_rule_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `inter_fee_seq_name`
--

DROP TABLE IF EXISTS `inter_fee_seq_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inter_fee_seq_name` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `inter_service_fees_seq`
--

DROP TABLE IF EXISTS `inter_service_fees_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inter_service_fees_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `interchange_fee_rule`
--

DROP TABLE IF EXISTS `interchange_fee_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interchange_fee_rule` (
  `id` bigint(20) NOT NULL,
  `fee_max_amount` decimal(19,2) NOT NULL,
  `fee_min_amount` decimal(19,2) NOT NULL,
  `fixe` decimal(19,2) NOT NULL,
  `percentage` float NOT NULL,
  `sense` varchar(255) DEFAULT NULL,
  `tr_max_amount` decimal(19,2) NOT NULL,
  `tr_min_amount` decimal(19,2) NOT NULL,
  `inter_service_fees_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKri1yjo5jsgya3mmp8jlnye2ln` (`inter_service_fees_id`),
  CONSTRAINT `FKri1yjo5jsgya3mmp8jlnye2ln` FOREIGN KEY (`inter_service_fees_id`) REFERENCES `interchange_service_fee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `interchange_fee_template`
--

DROP TABLE IF EXISTS `interchange_fee_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interchange_fee_template` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `reference` varchar(6) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `center_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK93fagmsut8eee1li3nicd574d` (`center_id`),
  CONSTRAINT `FK93fagmsut8eee1li3nicd574d` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `interchange_service_fee`
--

DROP TABLE IF EXISTS `interchange_service_fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interchange_service_fee` (
  `id` bigint(20) NOT NULL,
  `service` int(11) NOT NULL,
  `inter_fee_template_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKarkam5sibn8knjru11kd4kuhd` (`inter_fee_template_id`),
  CONSTRAINT `FKarkam5sibn8knjru11kd4kuhd` FOREIGN KEY (`inter_fee_template_id`) REFERENCES `interchange_fee_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `key_generation`
--

DROP TABLE IF EXISTS `key_generation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `key_generation` (
  `id` bigint(20) NOT NULL,
  `alias` varchar(30) NOT NULL,
  `environment` int(11) DEFAULT NULL,
  `exp_date` datetime DEFAULT NULL,
  `gen_date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `institution_id` bigint(20) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7e7s3d1xqdb4n164ss6yuubwa` (`institution_id`),
  CONSTRAINT `FK7e7s3d1xqdb4n164ss6yuubwa` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `keys_seq`
--

DROP TABLE IF EXISTS `keys_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keys_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `service_fee_rule`
--

DROP TABLE IF EXISTS `service_fee_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_fee_rule` (
  `id` bigint(20) NOT NULL,
  `fee_date_application` datetime DEFAULT NULL,
  `fee_amount` decimal(19,2) DEFAULT NULL,
  `fee_name` varchar(255) DEFAULT NULL,
  `periodicity` varchar(255) DEFAULT NULL,
  `service_fees_id` bigint(20) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfkjytnosw9dvfe4729djtdr0w` (`service_fees_id`),
  CONSTRAINT `FKfkjytnosw9dvfe4729djtdr0w` FOREIGN KEY (`service_fees_id`) REFERENCES `service_fee_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `service_fee_rule_seq`
--

DROP TABLE IF EXISTS `service_fee_rule_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_fee_rule_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `service_fee_seq`
--

DROP TABLE IF EXISTS `service_fee_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_fee_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `service_fee_template`
--

DROP TABLE IF EXISTS `service_fee_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_fee_template` (
  `id` bigint(20) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `ts_create` datetime DEFAULT NULL,
  `updated_by` varchar(50) DEFAULT NULL,
  `ts_update` datetime DEFAULT NULL,
  `owner_ref` varchar(255) DEFAULT NULL,
  `description` varchar(100) NOT NULL,
  `name` varchar(30) NOT NULL,
  `notif_unit_price` float DEFAULT NULL,
  `reference` varchar(6) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `center_id` bigint(20) DEFAULT NULL,
  `institution_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lc97s723hf4m1nnhd609ei28c` (`name`),
  UNIQUE KEY `UK_e6lwxa0en1apj6mdpijcn5llm` (`reference`),
  UNIQUE KEY `UKcjb4sr436wgjknfbr110iju63` (`reference`),
  UNIQUE KEY `UKcjm68st3wngmx6n81yfppy6gv` (`name`),
  KEY `FKg26haitv5w0utpyt9aechrlp8` (`center_id`),
  KEY `FKfmpwnbmqkx3jip6xnjxj1t0u1` (`institution_id`),
  CONSTRAINT `FKfmpwnbmqkx3jip6xnjxj1t0u1` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`),
  CONSTRAINT `FKg26haitv5w0utpyt9aechrlp8` FOREIGN KEY (`center_id`) REFERENCES `center` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `service_fees_seq`
--

DROP TABLE IF EXISTS `service_fees_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_fees_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-06  9:40:47
