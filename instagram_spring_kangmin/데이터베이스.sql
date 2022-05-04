-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.7.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- instagram_kangmin 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `instagram_kangmin` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `instagram_kangmin`;

-- 테이블 instagram_kangmin.user_dtl 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_dtl` (
  `usercode` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(100) DEFAULT '',
  `website` varchar(100) DEFAULT '',
  `introduce` text DEFAULT NULL,
  `gender` int(11) DEFAULT 0,
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`usercode`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 instagram_kangmin.user_dtl:~9 rows (대략적) 내보내기
DELETE FROM `user_dtl`;
/*!40000 ALTER TABLE `user_dtl` DISABLE KEYS */;
INSERT INTO `user_dtl` (`usercode`, `img_url`, `website`, `introduce`, `gender`, `create_date`, `update_date`) VALUES
	(1, 'default.png', NULL, NULL, NULL, '2022-05-02 13:04:45', '2022-05-02 13:04:45'),
	(2, 'default.png', NULL, NULL, NULL, '2022-05-02 13:04:52', '2022-05-02 13:04:52'),
	(3, 'default.png', NULL, NULL, NULL, '2022-05-02 13:05:35', '2022-05-02 13:05:35'),
	(4, 'default.png', NULL, NULL, NULL, '2022-05-02 13:07:34', '2022-05-02 13:07:34'),
	(5, 'default.png', NULL, NULL, NULL, '2022-05-02 13:16:20', '2022-05-02 13:16:20'),
	(6, 'default.png', NULL, NULL, NULL, '2022-05-03 09:15:05', '2022-05-03 09:15:05'),
	(7, 'default.png', NULL, NULL, NULL, '2022-05-03 09:26:54', '2022-05-03 09:26:54'),
	(8, 'default.png', NULL, NULL, NULL, '2022-05-03 09:42:07', '2022-05-03 09:42:07'),
	(9, 'default.png', NULL, NULL, NULL, '2022-05-03 09:43:07', '2022-05-03 09:43:07'),
	(10, 'default.png', NULL, NULL, NULL, '2022-05-03 09:44:56', '2022-05-03 09:44:56'),
	(11, 'default.png', NULL, NULL, NULL, '2022-05-03 09:45:31', '2022-05-03 09:45:31'),
	(12, 'default.png', NULL, NULL, NULL, '2022-05-04 13:47:36', '2022-05-04 13:47:36');
/*!40000 ALTER TABLE `user_dtl` ENABLE KEYS */;

-- 테이블 instagram_kangmin.user_mst 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_mst` (
  `usercode` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`usercode`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 instagram_kangmin.user_mst:~0 rows (대략적) 내보내기
DELETE FROM `user_mst`;
/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
INSERT INTO `user_mst` (`usercode`, `phone`, `email`, `name`, `username`, `password`, `create_date`, `update_date`) VALUES
	(12, 'ddd', NULL, 'ddd', 'test', '$2a$10$PPw0/lrU74qBcJ2KxzW5dupBeaQ94zM2BDWVeTot6lAdr.mALFk8u', '2022-05-04 13:47:36', '2022-05-04 13:47:36');
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;

-- 트리거 instagram_kangmin.user_mst_after_insert 구조 내보내기
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `user_mst_after_insert` AFTER INSERT ON `user_mst` FOR EACH ROW BEGIN
	INSERT into
		user_dtl
	VALUES(
		NEW.usercode,
		'default.png',
		NULL,
		NULL,
		NULL,
		NOW(),
		NOW()
		);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
