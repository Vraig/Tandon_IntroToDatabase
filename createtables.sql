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
  `password` varchar(20) DEFAULT NULL,
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
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_ID` varchar(8) NOT NULL,
  `email_address` varchar(63) DEFAULT NULL,
  `delivery_date_time` varchar(6) DEFAULT NULL,
  `price` decimal(3,2) DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `pickup_date_time` varchar(6) DEFAULT NULL,
  `address` varchar(6) DEFAULT NULL,
  `route_ID` varchar(8) DEFAULT NULL,
  `instructions` varchar(20) DEFAULT NULL,
  `weight` decimal(3,1) DEFAULT NULL,
  `purchase_date_time` varchar(6) DEFAULT NULL,
  `purchase_status` varchar(20) DEFAULT NULL
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
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_ID`),
  ADD KEY `route_ID` (`route_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`route_ID`) REFERENCES `delivery_route` (`route_ID`);

--Part 2.3 - SQL Data Insertion

-- Insert a facility named "Laundromat_1"
INSERT INTO `laundry_facility` (`name`, `address`, `machines`) VALUES ('Laundromat_1', '123 Clean Street', 10);

-- Insert three laundry company staff with password, username, first name, last name, date of birth, phone number, and email address
INSERT INTO `laundry_company_staff` (`password`, `username`, `first_name`, `last_name`, `date_of_birth`, `phone_number`, `email_address`) VALUES 
('henrySecurePass', 'henryuser', 'Henry', 'Simon', '1990-01-01', '555-0101', 'henry.simon@laundryco.com'),
('vraigSecurePass', 'vraiguser', 'Vraig', 'DeLeon', '1992-02-02', '555-0202', 'vraig.deleon@laundryco.com'),
('danielSecurePass', 'danieluser', 'Daniel', 'Brown', '1994-03-03', '555-0303', 'daniel.brown@laundryco.com');

-- Insert at least 3 customer records with email address, password, first name, last name, address, phone number, and date of birth
INSERT INTO `customer` (`email_address`, `password`, `first_name`, `last_name`, `address`, `phone_number`, `date_of_birth`) VALUES 
('alice.brown@email.com', 'alicePass123', 'Alice', 'Brown', '456 Oak Street', '555-0444', '1978-05-21'),
('bob.johnson@email.com', 'bobPass123', 'Bob', 'Johnson', '789 Pine Street', '555-0555', '1985-07-12'),
('carol.smith@email.com', 'carolPass123', 'Carol', 'Smith', '321 Maple Street', '555-0666', '1990-09-03');

-- Insert at least 1 delivery truck record with identification number, order capacity, manufacturing company, model number, manufacturing date, and age
INSERT INTO `delivery_truck` (`identification_number`, `order_capacity`, `manufacturing_company`, `model_number`, `manufacturing_date`, `age`) VALUES 
('01', '500', 'TruckCorp', 'XLT', '201901', '03'),
('02', '750', 'TruckCorp', 'XLT', '201902', '02'),
('03', '1000', 'TruckCorp', 'XLT', '201903', '01');

-- Insert several routes and purchase records
INSERT INTO `delivery_route` (`route_ID`, `identification_number`, `name`) VALUES 
('R001', '01', 'North Route'),
('R002', '02', 'South Route'),
('R003', '03', 'East Route');

-- Insert orders along with purchase records into the 'order' table
INSERT INTO `order` (`order_ID`, `email_address`, `delivery_date_time`, `price`, `order_status`, `pickup_date_time`, `address`, `route_ID`, `instructions`, `weight`, `purchase_date_time`, `purchase_status`) VALUES
('ORD001', 'alice.brown@email.com', '2024-04-10 10:00', 19.99, 'Out for Delivery', '2024-04-09 09:00', '456 Oak Street', 'R001', 'Leave at front door', 15.5, '2024-04-09 08:00', 'Completed'),
('ORD002', 'bob.johnson@email.com', '2024-04-11 14:00', 29.99, 'Awaiting Pickup', '2024-04-10 13:00', '789 Pine Street', 'R002', 'Ring upon arrival', 10.0, '2024-04-10 12:00', 'Pending'),
('ORD003', 'carol.smith@email.com', '2024-04-12 16:00', 39.99, 'Delivered', '2024-04-11 15:00', '321 Maple Street', 'R003', 'No signature required', 20.0, '2024-04-11 14:00', 'Completed');

COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--Part 2.4 - SQL Queries

--a. show all the orders out for  delivery in the system
SELECT * 
FROM `order` 
WHERE order_status = 'Out for Delivery';
--a.results
order_ID	email_address	delivery_date_time	price	order_status	pickup_date_time	address	route_ID	instructions	weight	purchase_date_time	purchase_status
ORD001	alice.brown@email.com	2024-0	9.99	Out for Delivery	2024-0	456 Oa	R001	Leave at front door	15.5	2024-0	Completed	

--b. Show all of the customers currently awaiting the orders out for delivery in the system. 
SELECT c.first_name, c.last_name
FROM `customer` c
JOIN `order` o ON c.email_address = o.email_address
WHERE o.order_status = 'Out for Delivery';
--b.results
first_name	last_name
Alice	Brown	

--c. Show the addresses of customers who bought the orders. 
SELECT  c.address
FROM `customer` c
JOIN `order` o ON c.email_address = o.email_address
WHERE o.purchase_status = 'Completed';
--c.results
address	
456 Oak Street	
321 Maple Street	

--d. show the orders that have a weight greater than or equal to 15.
SELECT * FROM `order` WHERE weight >= 15;
--d.results
order_ID	email_address	delivery_date_time	price	order_status	pickup_date_time	address	route_ID	instructions	weight	purchase_date_time	purchase_status	
ORD001	alice.brown@email.com	2024-0	9.99	Out for Delivery	2024-0	456 Oa	R001	Leave at front door	15.5	2024-0	Completed	
ORD003	carol.smith@email.com	2024-0	9.99	Delivered	2024-0	321 Ma	R003	No signature require	20.0	2024-0	Completed	
