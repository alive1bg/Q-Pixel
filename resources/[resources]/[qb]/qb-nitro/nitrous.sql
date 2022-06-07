ALTER TABLE `player_vehicles`
ADD COLUMN `noslevel` INT(10) NULL DEFAULT 0 AFTER `drivingdistance`,
ADD COLUMN `hasnitro` TINYINT(0) NULL DEFAULT 0 AFTER `noslevel`;