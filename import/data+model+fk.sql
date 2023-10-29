/*
 Navicat MySQL Data Transfer

 Source Server         : Localhost Docker
 Source Server Type    : MariaDB
 Source Server Version : 110102
 Source Host           : localhost:3307
 Source Schema         : fwpnosql

 Target Server Type    : MariaDB
 Target Server Version : 110102
 File Encoding         : 65001

 Date: 29/10/2023 22:37:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Angebot
-- ----------------------------
DROP TABLE IF EXISTS `Angebot`;
CREATE TABLE `Angebot` (
  `AngNr` int(11) NOT NULL,
  `KursNr` varchar(3) NOT NULL,
  `Datum` datetime DEFAULT NULL,
  `Ort` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`AngNr`,`KursNr`),
  KEY `AngNr` (`AngNr`),
  KEY `KursNr` (`KursNr`),
  CONSTRAINT `Angebot_ibfk_1` FOREIGN KEY (`KursNr`) REFERENCES `Kurs` (`KursNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Angebot
-- ----------------------------
BEGIN;
INSERT INTO `Angebot` VALUES (1, 'G08', '2023-10-13 00:00:00', 'Wedel');
INSERT INTO `Angebot` VALUES (1, 'G10', '2023-12-01 00:00:00', 'Augsburg');
INSERT INTO `Angebot` VALUES (1, 'I09', '2023-03-27 00:00:00', 'Mindelheim');
INSERT INTO `Angebot` VALUES (1, 'P13', '2023-05-28 00:00:00', 'Augsburg');
INSERT INTO `Angebot` VALUES (2, 'G08', '2023-11-24 00:00:00', 'Ulm');
INSERT INTO `Angebot` VALUES (2, 'G10', '2023-02-15 00:00:00', 'Muenchen');
INSERT INTO `Angebot` VALUES (2, 'I09', '2023-04-23 00:00:00', 'Muenchen');
INSERT INTO `Angebot` VALUES (2, 'P13', '2023-07-01 00:00:00', 'Augsburg');
INSERT INTO `Angebot` VALUES (3, 'I09', '2023-05-29 00:00:00', 'Ulm');
COMMIT;

-- ----------------------------
-- Table structure for Fuehrt_durch
-- ----------------------------
DROP TABLE IF EXISTS `Fuehrt_durch`;
CREATE TABLE `Fuehrt_durch` (
  `AngNr` int(11) NOT NULL,
  `KursNr` varchar(3) NOT NULL,
  `PersNr` int(11) DEFAULT NULL,
  PRIMARY KEY (`AngNr`,`KursNr`),
  KEY `KursNr` (`KursNr`),
  KEY `PersNr` (`PersNr`),
  CONSTRAINT `Fuehrt_durch_ibfk_1` FOREIGN KEY (`KursNr`) REFERENCES `Kurs` (`KursNr`),
  CONSTRAINT `Fuehrt_durch_ibfk_2` FOREIGN KEY (`PersNr`) REFERENCES `Kursleiter` (`PersNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Fuehrt_durch
-- ----------------------------
BEGIN;
INSERT INTO `Fuehrt_durch` VALUES (1, 'P13', 27183);
INSERT INTO `Fuehrt_durch` VALUES (2, 'P13', 27183);
INSERT INTO `Fuehrt_durch` VALUES (1, 'I09', 29594);
INSERT INTO `Fuehrt_durch` VALUES (2, 'G10', 29594);
INSERT INTO `Fuehrt_durch` VALUES (2, 'I09', 29594);
INSERT INTO `Fuehrt_durch` VALUES (3, 'I09', 29594);
INSERT INTO `Fuehrt_durch` VALUES (1, 'G08', 38197);
INSERT INTO `Fuehrt_durch` VALUES (2, 'G08', 38197);
INSERT INTO `Fuehrt_durch` VALUES (1, 'G10', 43325);
COMMIT;

-- ----------------------------
-- Table structure for Gebuehren
-- ----------------------------
DROP TABLE IF EXISTS `Gebuehren`;
CREATE TABLE `Gebuehren` (
  `AngNr` int(11) NOT NULL,
  `KursNr` varchar(3) NOT NULL,
  `TnNr` int(11) NOT NULL,
  `Gebuehr` double DEFAULT NULL,
  PRIMARY KEY (`AngNr`,`KursNr`,`TnNr`),
  KEY `KursNr` (`KursNr`),
  KEY `TnNr` (`TnNr`),
  CONSTRAINT `Gebuehren_ibfk_1` FOREIGN KEY (`AngNr`) REFERENCES `Angebot` (`AngNr`),
  CONSTRAINT `Gebuehren_ibfk_2` FOREIGN KEY (`KursNr`) REFERENCES `Kurs` (`KursNr`),
  CONSTRAINT `Gebuehren_ibfk_3` FOREIGN KEY (`TnNr`) REFERENCES `Teilnehmer` (`TnNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Gebuehren
-- ----------------------------
BEGIN;
INSERT INTO `Gebuehren` VALUES (1, 'G08', 145, NULL);
INSERT INTO `Gebuehren` VALUES (1, 'I09', 146, NULL);
INSERT INTO `Gebuehren` VALUES (1, 'I09', 155, NULL);
INSERT INTO `Gebuehren` VALUES (1, 'I09', 171, NULL);
INSERT INTO `Gebuehren` VALUES (1, 'I09', 173, 400);
INSERT INTO `Gebuehren` VALUES (1, 'I09', 185, 450);
INSERT INTO `Gebuehren` VALUES (1, 'P13', 146, 300);
INSERT INTO `Gebuehren` VALUES (1, 'P13', 194, NULL);
INSERT INTO `Gebuehren` VALUES (2, 'G08', 143, 500);
INSERT INTO `Gebuehren` VALUES (2, 'I09', 187, NULL);
INSERT INTO `Gebuehren` VALUES (2, 'P13', 143, 400);
INSERT INTO `Gebuehren` VALUES (2, 'P13', 149, 350);
INSERT INTO `Gebuehren` VALUES (2, 'P13', 177, NULL);
COMMIT;

-- ----------------------------
-- Table structure for Kurs
-- ----------------------------
DROP TABLE IF EXISTS `Kurs`;
CREATE TABLE `Kurs` (
  `KursNr` varchar(3) NOT NULL,
  `Titel` varchar(20) DEFAULT NULL,
  KEY `KursNr` (`KursNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Kurs
-- ----------------------------
BEGIN;
INSERT INTO `Kurs` VALUES ('G08', 'Grundlagen I');
INSERT INTO `Kurs` VALUES ('G10', 'Grundlagen II');
INSERT INTO `Kurs` VALUES ('P13', 'C-Programmierung');
INSERT INTO `Kurs` VALUES ('I09', 'Datenbanken');
COMMIT;

-- ----------------------------
-- Table structure for KursLit
-- ----------------------------
DROP TABLE IF EXISTS `KursLit`;
CREATE TABLE `KursLit` (
  `KursNr` varchar(3) NOT NULL,
  `Bestand` int(11) DEFAULT NULL,
  `Bedarf` int(11) DEFAULT NULL,
  `Preis` double DEFAULT NULL,
  PRIMARY KEY (`KursNr`),
  CONSTRAINT `KursLit_ibfk_1` FOREIGN KEY (`KursNr`) REFERENCES `Kurs` (`KursNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of KursLit
-- ----------------------------
BEGIN;
INSERT INTO `KursLit` VALUES ('G08', 4, 2, 10.5);
INSERT INTO `KursLit` VALUES ('I09', 2, 6, 8);
INSERT INTO `KursLit` VALUES ('P13', 3, 5, 15.2);
COMMIT;

-- ----------------------------
-- Table structure for Kursleiter
-- ----------------------------
DROP TABLE IF EXISTS `Kursleiter`;
CREATE TABLE `Kursleiter` (
  `PersNr` int(11) NOT NULL,
  `Name` varchar(12) DEFAULT NULL,
  `Gehalt` double DEFAULT NULL,
  PRIMARY KEY (`PersNr`),
  KEY `PersNr` (`PersNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Kursleiter
-- ----------------------------
BEGIN;
INSERT INTO `Kursleiter` VALUES (27183, 'Meier, I.', 4300.5);
INSERT INTO `Kursleiter` VALUES (29594, 'Schulze, H.', 3890.2);
INSERT INTO `Kursleiter` VALUES (38197, 'Huber, L.', 4200.1);
INSERT INTO `Kursleiter` VALUES (43325, 'Mueller, K.', 3400.8);
COMMIT;

-- ----------------------------
-- Table structure for Nimmt_teil
-- ----------------------------
DROP TABLE IF EXISTS `Nimmt_teil`;
CREATE TABLE `Nimmt_teil` (
  `AngNr` int(11) NOT NULL,
  `KursNr` varchar(3) NOT NULL,
  `TnNr` int(11) NOT NULL,
  PRIMARY KEY (`AngNr`,`KursNr`,`TnNr`),
  KEY `KursNr` (`KursNr`),
  KEY `TnNr` (`TnNr`),
  CONSTRAINT `Nimmt_teil_ibfk_1` FOREIGN KEY (`AngNr`) REFERENCES `Angebot` (`AngNr`),
  CONSTRAINT `Nimmt_teil_ibfk_2` FOREIGN KEY (`KursNr`) REFERENCES `Kurs` (`KursNr`),
  CONSTRAINT `Nimmt_teil_ibfk_3` FOREIGN KEY (`TnNr`) REFERENCES `Teilnehmer` (`TnNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Nimmt_teil
-- ----------------------------
BEGIN;
INSERT INTO `Nimmt_teil` VALUES (2, 'G08', 143);
INSERT INTO `Nimmt_teil` VALUES (2, 'P13', 143);
INSERT INTO `Nimmt_teil` VALUES (1, 'G08', 145);
INSERT INTO `Nimmt_teil` VALUES (1, 'I09', 146);
INSERT INTO `Nimmt_teil` VALUES (1, 'P13', 146);
INSERT INTO `Nimmt_teil` VALUES (2, 'P13', 149);
INSERT INTO `Nimmt_teil` VALUES (1, 'I09', 155);
INSERT INTO `Nimmt_teil` VALUES (1, 'I09', 171);
INSERT INTO `Nimmt_teil` VALUES (1, 'I09', 173);
INSERT INTO `Nimmt_teil` VALUES (2, 'P13', 177);
INSERT INTO `Nimmt_teil` VALUES (1, 'I09', 185);
INSERT INTO `Nimmt_teil` VALUES (2, 'I09', 187);
INSERT INTO `Nimmt_teil` VALUES (1, 'P13', 194);
COMMIT;

-- ----------------------------
-- Table structure for Teilnehmer
-- ----------------------------
DROP TABLE IF EXISTS `Teilnehmer`;
CREATE TABLE `Teilnehmer` (
  `TnNr` int(11) NOT NULL,
  `Name` varchar(12) DEFAULT NULL,
  `Ort` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`TnNr`),
  KEY `TnNr` (`TnNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Teilnehmer
-- ----------------------------
BEGIN;
INSERT INTO `Teilnehmer` VALUES (143, 'Schmidt, M.', 'Wedel');
INSERT INTO `Teilnehmer` VALUES (145, 'Huber, Chr.', 'Augsburg');
INSERT INTO `Teilnehmer` VALUES (146, 'Abele, I.', 'Ulm');
INSERT INTO `Teilnehmer` VALUES (149, 'Kircher, B.', 'Augsburg');
INSERT INTO `Teilnehmer` VALUES (155, 'Meier, W.', 'Muenchen');
INSERT INTO `Teilnehmer` VALUES (171, 'Moeller, H.', 'Neusaess');
INSERT INTO `Teilnehmer` VALUES (173, 'Schulze, B.', 'Krumbach');
INSERT INTO `Teilnehmer` VALUES (177, 'Mons, F.', 'Donauwoerth');
INSERT INTO `Teilnehmer` VALUES (185, 'Meier, K.', 'Landsberg');
INSERT INTO `Teilnehmer` VALUES (187, 'Karstens, L.', 'Augsburg');
INSERT INTO `Teilnehmer` VALUES (194, 'Gerstner, M.', 'Mindelheim');
COMMIT;

-- ----------------------------
-- Table structure for Vorauss
-- ----------------------------
DROP TABLE IF EXISTS `Vorauss`;
CREATE TABLE `Vorauss` (
  `VorNr` varchar(3) NOT NULL,
  `KursNr` varchar(3) NOT NULL,
  PRIMARY KEY (`VorNr`,`KursNr`),
  KEY `KursNr` (`KursNr`),
  CONSTRAINT `Vorauss_ibfk_1` FOREIGN KEY (`KursNr`) REFERENCES `Kurs` (`KursNr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Vorauss
-- ----------------------------
BEGIN;
INSERT INTO `Vorauss` VALUES ('G08', 'I09');
INSERT INTO `Vorauss` VALUES ('G10', 'I09');
INSERT INTO `Vorauss` VALUES ('P13', 'I09');
INSERT INTO `Vorauss` VALUES ('G08', 'P13');
INSERT INTO `Vorauss` VALUES ('G10', 'P13');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
