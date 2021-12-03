-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 03, 2021 at 07:27 PM
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
  `C_id` int(11) NOT NULL,
  `C_name` varchar(100) NOT NULL,
  `C_surname` varchar(100) NOT NULL,
  `C_email` varchar(200) NOT NULL,
  `C_number` varchar(100) NOT NULL,
  `C_address` varchar(100) NOT NULL,
  `U_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `O_id` int(11) NOT NULL,
  `C_id` varchar(100) NOT NULL,
  `O_totalprice` double NOT NULL,
  `O_dateoforder` date NOT NULL,
  `U_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `U_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`P_id`, `P_name`, `p_quantity`, `p_costperitem`, `p_sellingprice`, `U_id`) VALUES
(1, 'sunglasses', 4, 10, 20, 33),
(2, 'sundresses', 5, 20, 50, 33),
(3, 'socks', 10, 3, 8, 33),
(4, 'shoes', 5, 15, 35, 33),
(5, 'socks', 90, 80, 100, 66),
(6, 'NFT', 2, 15, 10, 33),
(7, 'masks', 10, 1000, 110, 33),
(8, '111', 111, 111, 111, 11),
(9, '999', 11, 11, 110, 11),
(10, '11', 11, 11, 11, 11),
(11, '333', 333, 3333, 333, 11),
(12, '444', 444, 44, 444, 11),
(13, '555', 555, 555, 555, 11),
(14, '1', 1, 1, 10, 12),
(15, '2', 2, 2, 2, 12),
(16, '1', 1, 1, 100, 12),
(17, '2', 22, 2, 2, 12),
(18, '2', 1, 4, 4, 12),
(19, '6', 6, 6, 6, 12),
(24, '99', 99, 99, 99, 6),
(25, '33', 33, 33, 33, 6);

-- --------------------------------------------------------

--
-- Table structure for table `orderclass`
--

CREATE TABLE `orderclass` (
  `P_id` int(11) NOT NULL,
  `P_quantity` int(11) NOT NULL,
  `P_sellingprice` double NOT NULL,
  `U_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sold_items`
--

CREATE TABLE `sold_items` (
  `P_id` varchar(100) NOT NULL,
  `P_quantity` double NOT NULL,
  `U_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `U_id` int(11) NOT NULL,
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
(3, '1', '1', '1', '1', '1', '1', '1', '1'),
(4, '11', '11', '11', '11', '11', '11', '11', '11'),
(5, '33', '33', '33', '33', '33', '33', '$2y$10$ybLMRFa7/x6nJRaT/Ql5sOjL7mpwayTQMLbQgf354D5wAlUqxNn4q', '33'),
(6, '44', '44', '44', '44', '44', '44', '$2y$10$r6zTaG4bzPpxobIdLSj9ZOpjPUgcjnUnJ0f0aeSEz2NfH5lA9oeT2', '44'),
(7, 'meghry', 'basmajian', '79164807', 'hankach', 'meghry', 'meghry', '$2y$10$UM06aujAACKw9Nd2LbXB1u.M8j7OSCQTLUDO.CuvkQFchGy5cZpg6', 'oeuvre'),
(8, '66', '66', '66', '66', '66', '66', '$2y$10$EEKGBJ7GeTZSc3N/vkoaoOej.H5RDbyLYtAw8v0dpaR3hz2OTYlmm', '66'),
(9, 'ali', 'moukallid', '81994101', 'haigazian', 'ali9999', 'ali9999', '$2y$10$6Yxh7s7jREm9CcpyTHg6vuYWMh8phq0Suo9/RBNU8EsHxg5HnR4Fu', 'Haigazian'),
(10, '77', '77', '77', '77', '77', '77', '$2y$10$e4sZMP5b/NUnp2t3MmFFIuZMkSRaZPNj5asvwYRYPtOdlOOoxSpLO', '77'),
(11, 'aaa', 'aaa', 'aa', 'aaa', 'aaa', 'aaa', '$2y$10$4bBbkdrV.9p6mkz/4JrHweC3Yr/lbYhEdRPtnweQrdzfRaMcmS.KS', 'aa'),
(12, '888', '888', '888', '888', '888', '888', '$2y$10$hEe/wdgbLwb0WHMTnbmXyewEPA7QCDMkIOoFS8FY0DngJ7w4wpmS6', '888');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`C_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`O_id`),
  ADD KEY `C_id` (`C_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`P_id`);

--
-- Indexes for table `orderclass`
--
ALTER TABLE `orderclass`
  ADD PRIMARY KEY (`P_id`),
  ADD KEY `P_id` (`P_id`);

--
-- Indexes for table `sold_items`
--
ALTER TABLE `sold_items`
  ADD KEY `P_id` (`P_id`);

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
  MODIFY `C_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `O_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `orderclass`
--
ALTER TABLE `orderclass`
  MODIFY `P_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `U_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
