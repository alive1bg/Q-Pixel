-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for nextgenrp
CREATE DATABASE IF NOT EXISTS `nextgenrp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nextgenrp`;

-- Dumping structure for table nextgenrp.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.bongs
CREATE TABLE IF NOT EXISTS `bongs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `tolerance` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `high` tinyint(11) NOT NULL,
  `time` int(64) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNIQUE KEY` (`citizenid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.cameras
CREATE TABLE IF NOT EXISTS `cameras` (
  `cid` varchar(50) DEFAULT NULL,
  `cameradata` longtext DEFAULT NULL,
  `camID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  `mailbox` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.oilrig_blender
CREATE TABLE IF NOT EXISTS `oilrig_blender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.oilrig_cdu
CREATE TABLE IF NOT EXISTS `oilrig_cdu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.oilrig_position
CREATE TABLE IF NOT EXISTS `oilrig_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `oilrig_hash` varchar(50) DEFAULT NULL,
  `position` text NOT NULL DEFAULT '0',
  `metadata` text NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.oilrig_storage
CREATE TABLE IF NOT EXISTS `oilrig_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `metadata` text NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.paychecks
CREATE TABLE IF NOT EXISTS `paychecks` (
  `citizenid` varchar(250) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `collectamount` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_masked` tinyint(1) DEFAULT 0,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_debt
CREATE TABLE IF NOT EXISTS `phone_debt` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_note
CREATE TABLE IF NOT EXISTS `phone_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` text DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tattoos` longtext DEFAULT NULL,
  `firstname` longtext DEFAULT NULL,
  `lastname` longtext DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.player_boats
CREATE TABLE IF NOT EXISTS `player_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.player_pets
CREATE TABLE IF NOT EXISTS `player_pets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `vinnumber` varchar(50) DEFAULT NULL,
  `vinscratch` int(2) DEFAULT 0,
  `wheelfit` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.scenes
CREATE TABLE IF NOT EXISTS `scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `text` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `color` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `viewdistance` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `fontsize` decimal(10,1) DEFAULT NULL,
  `fontstyle` int(11) DEFAULT NULL,
  `coords` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_deletion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.shared_vehicles
CREATE TABLE IF NOT EXISTS `shared_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) NOT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT 'None',
  `hash` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` varchar(50) DEFAULT 'Stored',
  `faction` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `mods` longtext DEFAULT NULL,
  `noslevel` int(10) DEFAULT 0,
  `hasnitro` tinyint(4) DEFAULT 0,
  `wheelfit` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `category` (`category`),
  KEY `garage` (`garage`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.transaction_history
CREATE TABLE IF NOT EXISTS `transaction_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` text NOT NULL,
  `trans_id` int(11) NOT NULL,
  `account` text NOT NULL,
  `amount` int(11) NOT NULL,
  `trans_type` text NOT NULL,
  `receiver` text NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_current
CREATE TABLE IF NOT EXISTS `users_current` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `model` longtext NOT NULL,
  `drawables` longtext NOT NULL,
  `props` longtext NOT NULL,
  `drawtextures` longtext NOT NULL,
  `proptextures` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_face
CREATE TABLE IF NOT EXISTS `users_face` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `hairColor` longtext NOT NULL,
  `headBlend` longtext NOT NULL,
  `headOverlay` longtext NOT NULL,
  `headStructure` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_hospital_patients
CREATE TABLE IF NOT EXISTS `users_hospital_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `illness` varchar(50) NOT NULL DEFAULT 'none',
  `level` int(11) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_housing
CREATE TABLE IF NOT EXISTS `users_housing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `housing_id` int(11) NOT NULL,
  `Street` text NOT NULL,
  `assigned` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_housing_keys
CREATE TABLE IF NOT EXISTS `users_housing_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `housing_id` int(11) NOT NULL,
  `giver` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_motel
CREATE TABLE IF NOT EXISTS `users_motel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `building_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_outfits
CREATE TABLE IF NOT EXISTS `users_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL,
  `model` longtext NOT NULL,
  `name` longtext NOT NULL,
  `slot` longtext NOT NULL,
  `drawables` longtext NOT NULL,
  `props` longtext NOT NULL,
  `drawtextures` longtext NOT NULL,
  `proptextures` longtext NOT NULL,
  `hairColor` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.users_tattoos
CREATE TABLE IF NOT EXISTS `users_tattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `tattoos` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.vaults
CREATE TABLE IF NOT EXISTS `vaults` (
  `citizenid` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `storagename` varchar(255) NOT NULL,
  `storage_size` int(11) DEFAULT 400000,
  `holders` text DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `storage_location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.warns
CREATE TABLE IF NOT EXISTS `warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `license` varchar(50) NOT NULL,
  `reason` text NOT NULL,
  `warnedby` varchar(50) NOT NULL,
  `warnedtime` bigint(20) NOT NULL DEFAULT unix_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table nextgenrp.weed_plants
CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage` varchar(50) COLLATE utf8mb4_bin DEFAULT 'stage-a',
  `sort` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text COLLATE utf8mb4_bin DEFAULT NULL,
  `isDead` int(11) DEFAULT 0,
  `isFinished` int(11) DEFAULT 0,
  `finished_time` bigint(20) DEFAULT NULL,
  `owner` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AVG_ROW_LENGTH=273;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
