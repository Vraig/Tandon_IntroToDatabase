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

