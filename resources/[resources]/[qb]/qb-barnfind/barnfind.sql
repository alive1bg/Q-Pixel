-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for realisticlifev2
CREATE DATABASE IF NOT EXISTS `realisticlifev2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `realisticlifev2`;

-- Dumping structure for table realisticlifev2.barnfind
CREATE TABLE IF NOT EXISTS `barnfind` (
  `owner` varchar(250) DEFAULT NULL,
  `model` varchar(250) DEFAULT NULL,
  `copper` int(11) DEFAULT NULL,
  `aluminum` int(11) DEFAULT NULL,
  `steel` int(11) DEFAULT NULL,
  `plastic` int(11) DEFAULT NULL,
  `glass` int(11) DEFAULT NULL,
  `rubber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table realisticlifev2.barnfind: ~1 rows (approximately)
/*!40000 ALTER TABLE `barnfind` DISABLE KEYS */;
/*!40000 ALTER TABLE `barnfind` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
