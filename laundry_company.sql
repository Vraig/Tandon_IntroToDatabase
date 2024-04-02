-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 02, 2024 at 10:10 PM
-- Server version: 5.7.39
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry company`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `email_address` varchar(63) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `date_of_birth` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_route`
--

CREATE TABLE `delivery_route` (
  `route_ID` varchar(8) NOT NULL,
  `identification_number` varchar(2) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_truck`
--

CREATE TABLE `delivery_truck` (
  `identification_number` varchar(2) DEFAULT NULL,
  `order_capacity` varchar(3) DEFAULT NULL,
  `manufacturing_company` varchar(20) DEFAULT NULL,
  `model_number` varchar(20) DEFAULT NULL,
  `manufacturing_date` varchar(6) DEFAULT NULL,
  `age` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `laundry_company_staff`
--

CREATE TABLE `laundry_company_staff` (
  `password` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `date_of_birth` varchar(6) DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `email_address` varchar(63) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `laundry_facility`
--

CREATE TABLE `laundry_facility` (
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `machines` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_ID` varchar(8) NOT NULL,
  `email_address` varchar(63) DEFAULT NULL,
  `delivery_date_time` varchar(6) DEFAULT NULL,
  `price` decimal(3,2) DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `pickup_date_time` varchar(6) DEFAULT NULL,
  `address` varchar(6) DEFAULT NULL,
  `route_ID` varchar(8) DEFAULT NULL,
  `instructions` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`email_address`);

--
-- Indexes for table `delivery_route`
--
ALTER TABLE `delivery_route`
  ADD PRIMARY KEY (`route_ID`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_ID`),
  ADD KEY `route_ID` (`route_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_table`
--
ALTER TABLE `order_table`
  ADD CONSTRAINT `order_table_ibfk_1` FOREIGN KEY (`route_ID`) REFERENCES `delivery_route` (`route_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
