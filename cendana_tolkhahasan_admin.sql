-- --------------------------------------------------------
-- Host:                         139.59.226.31
-- Server version:               5.5.52-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.3.0.5120
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cendana_tolkhahasan_admin
CREATE DATABASE IF NOT EXISTS `cendana_tolkhahasan_admin` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cendana_tolkhahasan_admin`;

-- Dumping structure for table cendana_tolkhahasan_admin.dosen
CREATE TABLE IF NOT EXISTS `dosen` (
  `nip` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenkel` enum('Pria','Wanita') NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cendana_tolkhahasan_admin.dosen: ~2 rows (approximately)
DELETE FROM `dosen`;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` (`nip`, `nama`, `jenkel`, `tgl_lahir`, `alamat`) VALUES
	(1, 'Mas Yuri', 'Pria', '1989-12-13', 'Malang'),
	(2, 'Mas Toni', 'Pria', '1989-12-13', 'Malang');
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;

-- Dumping structure for table cendana_tolkhahasan_admin.grade
CREATE TABLE IF NOT EXISTS `grade` (
  `id_grade` int(10) unsigned NOT NULL,
  `grade` char(2) NOT NULL,
  `nilai` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cendana_tolkhahasan_admin.grade: ~8 rows (approximately)
DELETE FROM `grade`;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` (`id_grade`, `grade`, `nilai`) VALUES
	(1, 'A+', 9.50),
	(2, 'A', 9.00),
	(3, 'B+', 8.50),
	(4, 'B', 8.00),
	(5, 'C+', 7.50),
	(6, 'C', 7.00),
	(7, 'D', 6.00),
	(8, 'E', 5.00);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;

-- Dumping structure for table cendana_tolkhahasan_admin.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` int(10) unsigned NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenkel` enum('Pria','Wanita') NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` text,
  `jml_sks` int(5) DEFAULT NULL,
  `ipk` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cendana_tolkhahasan_admin.mahasiswa: ~9 rows (approximately)
DELETE FROM `mahasiswa`;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` (`nim`, `nama`, `jenkel`, `tgl_lahir`, `alamat`, `jml_sks`, `ipk`) VALUES
	(1, 'Mustofa', 'Pria', '1989-12-13', 'Kepanjen', 6, 4.00),
	(2, 'Tholqha', 'Pria', '1989-12-13', 'Kepanjen', 7, 4.50),
	(3, 'Wawan', 'Pria', '1989-12-13', 'Kepanjen', 6, 4.00),
	(4, 'Samsul', 'Pria', '1989-12-13', 'Kepanjen', 6, 4.00),
	(5, 'Dodi', 'Pria', '1989-12-13', 'Kepanjen', 6, 4.00),
	(6, 'Iksan', 'Pria', '1989-12-13', 'Kepanjen', 6, 4.00),
	(7, 'Aufar', 'Pria', '1989-12-13', 'Kepanjen', 6, 4.00),
	(8, 'Hafiz', 'Pria', '1989-12-13', 'Kepanjen', 7, 3.80),
	(9, 'Faiq', 'Pria', '1989-12-13', 'Kepanjen', 6, 4.00);
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;

-- Dumping structure for table cendana_tolkhahasan_admin.matkul
CREATE TABLE IF NOT EXISTS `matkul` (
  `id_matkul` int(10) unsigned NOT NULL,
  `matkul` varchar(50) NOT NULL,
  `kelas` varchar(50) NOT NULL,
  `ruang` varchar(50) NOT NULL,
  `sks` int(1) NOT NULL,
  `nip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cendana_tolkhahasan_admin.matkul: ~4 rows (approximately)
DELETE FROM `matkul`;
/*!40000 ALTER TABLE `matkul` DISABLE KEYS */;
INSERT INTO `matkul` (`id_matkul`, `matkul`, `kelas`, `ruang`, `sks`, `nip`) VALUES
	(1, 'Backend', 'B1', 'Harvard 1', 3, 2),
	(2, 'Frontend', 'F1', 'Harvard 2', 3, 1),
	(3, 'PHP', 'P1', 'Dortmund', 4, 2),
	(4, 'JavaScript', 'J1', 'Turin', 4, 1);
/*!40000 ALTER TABLE `matkul` ENABLE KEYS */;

-- Dumping structure for table cendana_tolkhahasan_admin.nilai
CREATE TABLE IF NOT EXISTS `nilai` (
  `id_nilai` int(10) unsigned NOT NULL,
  `id_grade` int(11) NOT NULL DEFAULT '8',
  `id_matkul` int(11) NOT NULL,
  `nim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cendana_tolkhahasan_admin.nilai: ~30 rows (approximately)
DELETE FROM `nilai`;
/*!40000 ALTER TABLE `nilai` DISABLE KEYS */;
INSERT INTO `nilai` (`id_nilai`, `id_grade`, `id_matkul`, `nim`) VALUES
	(1, 1, 1, 1),
	(2, 3, 1, 2),
	(3, 1, 1, 3),
	(4, 1, 1, 4),
	(5, 1, 1, 5),
	(6, 1, 1, 6),
	(7, 1, 1, 7),
	(8, 1, 1, 8),
	(9, 1, 1, 9),
	(10, 1, 1, 10),
	(11, 1, 1, 11),
	(12, 1, 1, 12),
	(13, 1, 2, 1),
	(14, 1, 2, 2),
	(15, 1, 2, 3),
	(16, 1, 2, 4),
	(17, 1, 2, 5),
	(18, 1, 2, 6),
	(19, 1, 2, 7),
	(20, 1, 2, 8),
	(21, 1, 2, 9),
	(22, 1, 2, 10),
	(23, 1, 2, 11),
	(24, 1, 2, 12),
	(25, 2, 3, 1),
	(26, 2, 4, 1),
	(27, 1, 1, 16),
	(28, 2, 2, 16),
	(29, 3, 3, 16),
	(30, 4, 4, 16);
/*!40000 ALTER TABLE `nilai` ENABLE KEYS */;

-- Dumping structure for view cendana_tolkhahasan_admin.show_matkul
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `show_matkul` (
	`id_matkul` INT(10) UNSIGNED NOT NULL,
	`matkul` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`ruang` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(1) NOT NULL,
	`nip` INT(11) NOT NULL,
	`nama` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view cendana_tolkhahasan_admin.show_nilai
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `show_nilai` (
	`id_matkul` INT(10) UNSIGNED NOT NULL,
	`matkul` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`kelas` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`ruang` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`sks` INT(1) NOT NULL,
	`nip` INT(11) NOT NULL,
	`nama` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for table cendana_tolkhahasan_admin.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cendana_tolkhahasan_admin.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `nama_user`) VALUES
	(1, 'admin', 'admin', 'Tolkha'),
	(0, 'Tolkha Hasan', 'admin', 'Tolkha Hasan');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for view cendana_tolkhahasan_admin.show_matkul
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `show_matkul`;
CREATE ALGORITHM=UNDEFINED DEFINER=`cendana`@`%` SQL SECURITY DEFINER VIEW `show_matkul` AS select `matkul`.`id_matkul` AS `id_matkul`,`matkul`.`matkul` AS `matkul`,`matkul`.`kelas` AS `kelas`,`matkul`.`ruang` AS `ruang`,`matkul`.`sks` AS `sks`,`matkul`.`nip` AS `nip`,`dosen`.`nama` AS `nama` from (`matkul` join `dosen`) where (`matkul`.`nip` = `dosen`.`nip`);

-- Dumping structure for view cendana_tolkhahasan_admin.show_nilai
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `show_nilai`;
CREATE ALGORITHM=UNDEFINED DEFINER=`cendana`@`%` SQL SECURITY DEFINER VIEW `show_nilai` AS select `matkul`.`id_matkul` AS `id_matkul`,`matkul`.`matkul` AS `matkul`,`matkul`.`kelas` AS `kelas`,`matkul`.`ruang` AS `ruang`,`matkul`.`sks` AS `sks`,`matkul`.`nip` AS `nip`,`dosen`.`nama` AS `nama` from (`matkul` join `dosen`) where (`matkul`.`nip` = `dosen`.`nip`);

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
