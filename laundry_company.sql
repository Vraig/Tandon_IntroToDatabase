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


-- Insert a facility named "Laundromat_1"
INSERT INTO laundry_facility (name, address, machines) VALUES ('Laundromat_1', '123 Clean Street', 10);

-- Insert three laundry company staff with password, username, first name, last name, date of birth, phone number, and email address
INSERT INTO laundry_company_staff (password, username, first_name, last_name, date_of_birth, phone_number, email_address) VALUES 
('henrySecurePass', 'henryuser', 'Henry', 'Simon', '1990-01-01', '555-0101', 'henry.simon@laundryco.com'),
('vraigSecurePass', 'vraiguser', 'Vraig', 'DeLeon', '1992-02-02', '555-0202', 'vraig.deleon@laundryco.com'),
('danielSecurePass', 'danieluser', 'Daniel', 'Brown', '1994-03-03', '555-0303', 'daniel.brown@laundryco.com');


-- Insert at least 3 customer records with email address, password, first name, last name, address, phone number, and date of birth
INSERT INTO Customer (email_address, password, first_name, last_name, address, phone_number, date_of_birth) VALUES 
('alice.brown@email.com', 'alicePass123', 'Alice', 'Brown', '456 Oak Street', '555-0444', '1978-05-21'),
('bob.johnson@email.com', 'bobPass123', 'Bob', 'Johnson', '789 Pine Street', '555-0555', '1985-07-12'),
('carol.smith@email.com', 'carolPass123', 'Carol', 'Smith', '321 Maple Street', '555-0666', '1990-09-03');


-- Insert at least 1 delivery truck record with identification number, order capacity, manufacturing company, model number, manufacturing date, and age
INSERT INTO delivery_truck (identification_number, order_capacity, manufacturing_company, model_number, manufacturing_date, age) VALUES 
('01', '500', 'TruckCorp', 'XLT', '201901', '03');

-- Insert several routes and purchase records
INSERT INTO delivery_route (route_ID, identification_number, name) VALUES 
('R001', '01', 'North Route'),
('R002', '02', 'South Route'),
('R003', '03', 'East Route');

INSERT INTO order_table (order_ID, email_address, delivery_date_time, price, order_status, route_ID, address) VALUES 
('O001', 'alice.brown@email.com', '12 PM', 59.99, 'Pending', 'R001', '456 Oak Street'),
('O002', 'bob.johnson@email.com', '2 PM', 39.99, 'Pending', 'R002', '789 Pine Street');



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
