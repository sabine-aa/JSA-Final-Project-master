-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2021 at 12:34 PM
-- Server version: 5.7.31
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salessystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `C_id` int(100) NOT NULL AUTO_INCREMENT,
  `C_name` varchar(100) NOT NULL,
  `C_surname` varchar(100) NOT NULL,
  `C_email` varchar(200) NOT NULL,
  `C_number` varchar(100) NOT NULL,
  `C_address` varchar(100) NOT NULL,
  `U_id` varchar(100) NOT NULL,
  PRIMARY KEY (`C_id`),
  KEY `U_id` (`U_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_id`, `C_name`, `C_surname`, `C_email`, `C_number`, `C_address`, `U_id`) VALUES
(1, 'Jessica', 'Shnorhokian', 'Jessicashnorhokian@gmail.com', '71593176', 'Hankach', '1'),
(3, 'walid ', 'walid ', 'walid', '7', '7', '13'),
(5, 'sara', 'sara', 'sara', '2', '2', '13'),
(6, 'avedis', 'avedis', 'avedis', '11111', '11111', '13'),
(7, 'meghry', 'meghry', 'meghry', '171717', '171717', '13');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE IF NOT EXISTS `customer_order` (
  `O_id` int(100) NOT NULL AUTO_INCREMENT,
  `C_id` varchar(100) NOT NULL,
  `O_totalprice` double NOT NULL,
  `O_dateoforder` date NOT NULL,
  `U_id` varchar(100) NOT NULL,
  PRIMARY KEY (`O_id`),
  KEY `C_id` (`C_id`),
  KEY `U_id` (`U_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`O_id`, `C_id`, `O_totalprice`, `O_dateoforder`, `U_id`) VALUES
(1, '1', 100, '2021-12-20', '1'),
(2, '1', 200, '2021-12-14', '1');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `P_id` int(11) NOT NULL AUTO_INCREMENT,
  `P_name` varchar(100) NOT NULL,
  `p_quantity` int(11) NOT NULL,
  `p_costperitem` double NOT NULL,
  `p_sellingprice` double NOT NULL,
  `p_filename` varchar(200) NOT NULL,
  `U_id` varchar(100) NOT NULL,
  PRIMARY KEY (`P_id`),
  KEY `U_id` (`U_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`P_id`, `P_name`, `p_quantity`, `p_costperitem`, `p_sellingprice`, `p_filename`, `U_id`) VALUES
(1, '1', 1, 15, 100, '', '1'),
(2, '2', 2, 2, 2, '', '1'),
(3, '3', 3, 3, 3, '', '1'),
(4, '4', 4, 4, 4, '', '1'),
(5, '5', 5, 5, 5, '', '1'),
(6, '6', 6, 6, 6, '', '1'),
(7, '11', 11, 11, 110, '', '99'),
(8, '22', 22, 22, 22, '', '99'),
(9, '33', 33, 33, 33, '', '99'),
(10, '44', 44, 44, 44, '', '99'),
(11, '55', 55, 55, 55, '', '99'),
(12, '1', 1, 1, 1, 'delete.png', '4'),
(13, '2', 2, 2, 2, 'edit.png', '4'),
(14, '66', 66, 66, 66, 'WhatsApp Image 2021-11-14 at 11.49.05 AM.jpeg', '4'),
(15, '44', 44, 44, 44, 'product.jpg', '13');

-- --------------------------------------------------------

--
-- Table structure for table `orderclass`
--

DROP TABLE IF EXISTS `orderclass`;
CREATE TABLE IF NOT EXISTS `orderclass` (
  `P_id` int(11) NOT NULL,
  `P_quantity` int(11) NOT NULL,
  `P_sellingprice` double NOT NULL,
  `U_id` varchar(100) NOT NULL,
  `O_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`O_id`),
  KEY `U_id` (`U_id`),
  KEY `product` (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sold_items`
--

DROP TABLE IF EXISTS `sold_items`;
CREATE TABLE IF NOT EXISTS `sold_items` (
  `P_id` int(100) NOT NULL,
  `P_quantity` double NOT NULL,
  `U_id` varchar(100) NOT NULL,
  PRIMARY KEY (`P_id`),
  KEY `P_id` (`P_id`),
  KEY `U_id` (`U_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sold_items`
--

INSERT INTO `sold_items` (`P_id`, `P_quantity`, `U_id`) VALUES
(1, 2, '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `U_id` int(100) NOT NULL AUTO_INCREMENT,
  `U_name` varchar(100) NOT NULL,
  `U_surname` varchar(100) NOT NULL,
  `U_number` varchar(100) NOT NULL,
  `U_address` varchar(100) NOT NULL,
  `U_email` varchar(100) NOT NULL,
  `U_username` varchar(100) NOT NULL,
  `U_password` varchar(100) NOT NULL,
  `U_storename` varchar(100) NOT NULL,
  PRIMARY KEY (`U_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_id`, `U_name`, `U_surname`, `U_number`, `U_address`, `U_email`, `U_username`, `U_password`, `U_storename`) VALUES
(1, '1', '1', '1', '1', '1', '1', '$2y$10$Kz3VoQhdEqQzjuBFOa/Meez3O6QlOaffH6RIQNeE49WXJf6vjRgKi', '1'),
(2, '99', '99', '99', '99', '99', '99', '$2y$10$XnHATX5z6IkX811VjzEjne0pQVY5POmhleYp04A/jGplWNFMuH/F.', '99'),
(3, 'sabine', 'sabine', 'sabine', 'sabine', 'sabine', 'sabine', '$2y$10$Od5p7qWTl2aNlvgsh/y8p.3I4SgAWV0l3S.M.KJKB07X3TNHLPDQm', 'sabine'),
(4, 'ww', 'ww', 'ww', 'ww', 'ww', 'ww', '$2y$10$N5HRhwdICI4quxMaUk6aRe4USUmlO4uaPbycDHpEMpZ1aMC6GF.1.', 'ww');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
