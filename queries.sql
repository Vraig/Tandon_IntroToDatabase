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
