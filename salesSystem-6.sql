-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 10, 2021 at 10:14 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salesSystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `C_id` int(100) NOT NULL,
  `C_name` varchar(100) NOT NULL,
  `C_surname` varchar(100) NOT NULL,
  `C_email` varchar(200) NOT NULL,
  `C_number` varchar(100) NOT NULL,
  `C_address` varchar(100) NOT NULL,
  `U_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`C_id`, `C_name`, `C_surname`, `C_email`, `C_number`, `C_address`, `U_id`) VALUES
(1, 'Jessica', 'Shnorhokian', 'Jessicashnorhokian@gmail.com', '71593176', 'Hankach', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `O_id` int(100) NOT NULL,
  `C_id` varchar(100) NOT NULL,
  `O_totalprice` double NOT NULL,
  `O_dateoforder` date NOT NULL,
  `U_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `inventory` (
  `P_id` int(11) NOT NULL,
  `P_name` varchar(100) NOT NULL,
  `p_quantity` int(11) NOT NULL,
  `p_costperitem` double NOT NULL,
  `p_sellingprice` double NOT NULL,
  `p_filename` varchar(200) NOT NULL,
  `U_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(14, '66', 66, 66, 66, 'WhatsApp Image 2021-11-14 at 11.49.05 AM.jpeg', '4');

-- --------------------------------------------------------

--
-- Table structure for table `orderclass`
--

CREATE TABLE `orderclass` (
  `P_id` int(100) NOT NULL,
  `P_quantity` int(11) NOT NULL,
  `P_sellingprice` double NOT NULL,
  `U_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sold_items`
--

CREATE TABLE `sold_items` (
  `P_id` int(100) NOT NULL,
  `P_quantity` double NOT NULL,
  `U_id` varchar(100) NOT NULL
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

CREATE TABLE `user` (
  `U_id` int(100) NOT NULL,
  `U_name` varchar(100) NOT NULL,
  `U_surname` varchar(100) NOT NULL,
  `U_number` varchar(100) NOT NULL,
  `U_address` varchar(100) NOT NULL,
  `U_email` varchar(100) NOT NULL,
  `U_username` varchar(100) NOT NULL,
  `U_password` varchar(100) NOT NULL,
  `U_storename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`U_id`, `U_name`, `U_surname`, `U_number`, `U_address`, `U_email`, `U_username`, `U_password`, `U_storename`) VALUES
(1, '1', '1', '1', '1', '1', '1', '$2y$10$Kz3VoQhdEqQzjuBFOa/Meez3O6QlOaffH6RIQNeE49WXJf6vjRgKi', '1'),
(2, '99', '99', '99', '99', '99', '99', '$2y$10$XnHATX5z6IkX811VjzEjne0pQVY5POmhleYp04A/jGplWNFMuH/F.', '99'),
(3, 'sabine', 'sabine', 'sabine', 'sabine', 'sabine', 'sabine', '$2y$10$Od5p7qWTl2aNlvgsh/y8p.3I4SgAWV0l3S.M.KJKB07X3TNHLPDQm', 'sabine'),
(4, 'ww', 'ww', 'ww', 'ww', 'ww', 'ww', '$2y$10$N5HRhwdICI4quxMaUk6aRe4USUmlO4uaPbycDHpEMpZ1aMC6GF.1.', 'ww');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`O_id`),
  ADD KEY `C_id` (`C_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `orderclass`
--
ALTER TABLE `orderclass`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `P_id` (`P_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `sold_items`
--
ALTER TABLE `sold_items`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `P_id` (`P_id`),
  ADD KEY `U_id` (`U_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`U_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `C_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `O_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orderclass`
--
ALTER TABLE `orderclass`
  MODIFY `P_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
