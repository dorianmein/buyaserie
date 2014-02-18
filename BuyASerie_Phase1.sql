-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 18 Février 2014 à 15:41
-- Version du serveur: 5.5.9
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `buyaserie`
--

-- --------------------------------------------------------

--
-- Structure de la table `T_CHAINE`
--

DROP TABLE IF EXISTS `T_CHAINE`;
CREATE TABLE IF NOT EXISTS `T_CHAINE` (
  `CHA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CHA_NOM` varchar(100) NOT NULL,
  PRIMARY KEY (`CHA_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Table contenant les Chaine' AUTO_INCREMENT=4 ;

--
-- Contenu de la table `T_CHAINE`
--

INSERT INTO `T_CHAINE` VALUES(1, 'HBO');
INSERT INTO `T_CHAINE` VALUES(2, 'CBS');
INSERT INTO `T_CHAINE` VALUES(3, 'ABC');

-- --------------------------------------------------------

--
-- Structure de la table `T_GENRE`
--

DROP TABLE IF EXISTS `T_GENRE`;
CREATE TABLE IF NOT EXISTS `T_GENRE` (
  `GEN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `GEN_NOM` varchar(100) NOT NULL,
  PRIMARY KEY (`GEN_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `T_GENRE`
--

INSERT INTO `T_GENRE` VALUES(1, 'Comedie');
INSERT INTO `T_GENRE` VALUES(2, 'Drame');
INSERT INTO `T_GENRE` VALUES(3, 'Fantastique');
INSERT INTO `T_GENRE` VALUES(4, 'Medical');

-- --------------------------------------------------------

--
-- Structure de la table `T_SERIE`
--

DROP TABLE IF EXISTS `T_SERIE`;
CREATE TABLE IF NOT EXISTS `T_SERIE` (
  `SER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SER_TITRE` varchar(100) NOT NULL,
  `SER_DATE` date NOT NULL,
  `SER_PRIX` int(11) NOT NULL,
  `SER_IMAGE` varchar(50) NOT NULL,
  `GEN_ID` int(11) NOT NULL,
  `CHA_ID` int(11) NOT NULL,
  UNIQUE KEY `PRIMARY_CHA` (`SER_ID`),
  KEY `fk_gen_id` (`GEN_ID`),
  KEY `fk_cha_id` (`CHA_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Table contenant les series vendues' AUTO_INCREMENT=7 ;

--
-- Contenu de la table `T_SERIE`
--

INSERT INTO `T_SERIE` VALUES(1, 'How I Met Your Mother', '2005-09-19', 127, 'HIMYM.JPG', 1, 2);
INSERT INTO `T_SERIE` VALUES(2, 'Game of Thrones', '2011-04-17', 156, 'GOT.JPG', 3, 1);
INSERT INTO `T_SERIE` VALUES(4, 'Once Upon a Time', '2011-10-23', 89, 'OUAT.JPG', 3, 3);
INSERT INTO `T_SERIE` VALUES(5, 'Scrubs', '2001-10-02', 77, 'SCRUBS.JPG', 4, 3);
INSERT INTO `T_SERIE` VALUES(6, 'Broadwalk Empire', '2010-12-19', 112, 'BE.JPG', 2, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `T_SERIE`
--
ALTER TABLE `T_SERIE`
  ADD CONSTRAINT `fk_cha_id` FOREIGN KEY (`CHA_ID`) REFERENCES `T_CHAINE` (`CHA_ID`),
  ADD CONSTRAINT `fk_gen_id` FOREIGN KEY (`GEN_ID`) REFERENCES `T_GENRE` (`GEN_ID`);
