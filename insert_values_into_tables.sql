--inserting values into customer_dim
INSERT INTO customer_dim (customer_id, name, address, phone_number, email, registration_date)
VALUES
  (1, 'John Smith', '123 Main St, Anytown USA', '555-1234', 'john.smith@example.com', '2022-01-01'),
  (2, 'Jane Doe', '456 Maple Ave, Anytown USA', '555-5678', 'jane.doe@example.com', '2022-01-02'),
  (3, 'Robert Johnson', '789 Oak St, Anytown USA', '555-9012', 'robert.johnson@example.com', '2022-01-03'),
  (4, 'Lisa Anderson', '234 Elm St, Anytown USA', '555-3456', 'lisa.anderson@example.com', '2022-01-04'),
  (5, 'Michael Brown', '567 Walnut Ave, Anytown USA', '555-7890', 'michael.brown@example.com', '2022-01-05'),
  (6, 'Emily Davis', '890 Pine St, Anytown USA', '555-1234', 'emily.davis@example.com', '2022-01-06'),
  (7, 'David Martinez', '123 Cedar Ave, Anytown USA', '555-5678', 'david.martinez@example.com', '2022-01-07'),
  (8, 'Sarah Jackson', '456 Birch St, Anytown USA', '555-9012', 'sarah.jackson@example.com', '2022-01-08'),
  (9, 'Jessica Lee', '789 Spruce Ave, Anytown USA', '555-3456', 'jessica.lee@example.com', '2022-01-09'),
  (10, 'Steven Garcia', '234 Oak St, Anytown USA', '555-7890', 'steven.garcia@example.com', '2022-01-10'),
  (11, 'Stephanie Taylor', '567 Maple Ave, Anytown USA', '555-1234', 'stephanie.taylor@example.com', '2022-01-11'),
  (12, 'Richard Rodriguez', '890 Elm St, Anytown USA', '555-5678', 'richard.rodriguez@example.com', '2022-01-12'),
  (13, 'Jennifer Hernandez', '123 Pine St, Anytown USA', '555-9012', 'jennifer.hernandez@example.com', '2022-01-13'),
  (14, 'Christopher Wilson', '456 Cedar Ave, Anytown USA', '555-3456', 'christopher.wilson@example.com', '2022-01-14'),
  (15, 'Elizabeth Thomas', '789 Birch St, Anytown USA', '555-7890', 'elizabeth.thomas@example.com', '2022-01-15'),
  (16, 'Matthew Martin', '234 Spruce Ave, Anytown USA', '555-1234', 'matthew.martin@example.com', '2022-01-16'),
  (17, 'Laura Garcia', '567 Oak St, Anytown USA', '555-5678', 'laura.garcia@example.com', '2022-01-17'),
  (18, 'Kevin Lee', '890 Maple Ave, Anytown USA', '555-9012', 'kevin.lee@example.com', '2022-01-18');
 
--
INSERT INTO credit_rating_dim (credit_rating_id, rating, rating_date)
VALUES
  (1, 1, '2022-01-01'),
  (2, 2, '2022-01-02'),
  (3, 3, '2022-01-03'),
  (4, 4, '2022-01-04'),
  (5, 5, '2022-01-05'),
  (6, 1, '2022-01-06'),
  (7, 2, '2022-01-07'),
  (8, 3, '2022-01-08'),
  (9, 4, '2022-01-09'),
  (10, 5, '2022-01-10'),
  (11, 1, '2022-01-11'),
  (12, 2, '2022-01-12'),
  (13, 3, '2022-01-13'),
  (14, 4, '2022-01-14'),
  (15, 5, '2022-01-15'),
  (16, 1, '2022-01-16'),
  (17, 2, '2022-01-17'),
  (18, 3, '2022-01-18'),
  (19, 4, '2022-01-19'),
  (20, 5, '2022-01-20'),
  (21, 1, '2022-01-21'),
  (22, 2, '2022-01-22'),
  (23, 3, '2022-01-23'),
  (24, 4, '2022-01-24'),
  (25, 5, '2022-01-25'),
  (26, 1, '2022-01-26'),
  (27, 2, '2022-01-27'),
  (28, 3, '2022-01-28'),
  (29, 4, '2022-01-29'),
  (30, 5, '2022-01-30');
--
INSERT INTO credit_limit_dim (credit_limit_id, limits)
VALUES
  (1, 5000.00),
  (2, 10000.00),
  (3, 15000.00),
  (4, 20000.00),
  (5, 25000.00),
  (6, 30000.00),
  (7, 35000.00),
  (8, 40000.00),
  (9, 45000.00),
  (10, 50000.00),
  (11, 55000.00),
  (12, 60000.00),
  (13, 65000.00),
  (14, 70000.00),
  (15, 75000.00),
  (16, 80000.00),
  (17, 85000.00),
  (18, 90000.00),
  (19, 95000.00),
  (20, 100000.00);
  
--
INSERT INTO collateral_dim (collateral_id, collateral_type, collateral_value)
VALUES
(1, 'Real Estate', 250000.00),
(2, 'Investment Portfolio', 50000.00),
(3, 'Business Equipment', 15000.00),
(4, 'Automobile', 10000.00),
(5, 'Jewelry', 7500.00),
(6, 'Artwork', 20000.00),
(7, 'Collectibles', 5000.00),
(8, 'Intellectual Property', 100000.00),
(9, 'Boat', 35000.00),
(10, 'Aircraft', 200000.00),
(11, 'Antiques', 10000.00),
(12, 'Cash', 5000.00),
(13, 'Precious Metals', 15000.00),
(14, 'Furniture', 5000.00),
(15, 'Electronics', 2500.00),
(16, 'Livestock', 20000.00),
(17, 'Machinery', 30000.00),
(18, 'Raw Materials', 10000.00),
(19, 'Real Estate Investment Trusts', 50000.00),
(20, 'Cryptocurrencies', 100000.00);
  
--
INSERT INTO credit_transaction_fact (transaction_id, customer_id, credit_rating_id, credit_limit_id, collateral_id, transaction_date, amount)
VALUES
  (1, 1, 1, 1, NULL, '2022-01-01', 1000.00),
  (2, 2, 2, 2, NULL, '2022-01-02', 1500.00),
  (3, 3, 3, 3, NULL, '2022-01-03', 2000.00),
  (4, 4, 4, 4, NULL, '2022-01-04', 2500.00),
  (5, 5, 5, 5, NULL, '2022-01-05', 3000.00),
  (6, 6, 1, 6, NULL, '2022-01-06', 3500.00),
  (7, 7, 2, 7, NULL, '2022-01-07', 4000.00),
  (8, 8, 3, 8, NULL, '2022-01-08', 4500.00),
  (9, 9, 4, 9, NULL, '2022-01-09', 5000.00),
  (10, 10, 5, 10, NULL, '2022-01-10', 5500.00),
  (11, 1, 1, 11, NULL, '2022-01-11', 6000.00),
  (12, 2, 2, 12, NULL, '2022-01-12', 6500.00),
  (13, 3, 3, 13, NULL, '2022-01-13', 7000.00),
  (14, 4, 4, 14, NULL, '2022-01-14', 7500.00),
  (15, 5, 5, 15, NULL, '2022-01-15', 8000.00),
  (16, 6, 1, 16, NULL, '2022-01-16', 8500.00),
  (17, 7, 2, 17, NULL, '2022-01-17', 9000.00),
  (18, 8, 3, 18, NULL, '2022-01-18', 9500.00),
  (19, 9, 4, 19, NULL, '2022-01-19', 10000.00),
  (20, 10, 5, 20, NULL, '2022-01-20', 10500.00);
--updating collateral_id from null 
UPDATE credit_transaction_fact
SET collateral_id = CASE
  WHEN transaction_id = 2 THEN 1
  WHEN transaction_id = 3 THEN 2
  WHEN transaction_id = 4 THEN 3
  WHEN transaction_id = 5 THEN 4
  WHEN transaction_id = 6 THEN 5
  WHEN transaction_id = 7 THEN 6
  WHEN transaction_id = 8 THEN 7
  WHEN transaction_id = 9 THEN 8
  WHEN transaction_id = 10 THEN 9
  WHEN transaction_id = 11 THEN 10
  WHEN transaction_id = 12 THEN 11
  WHEN transaction_id = 13 THEN 12
  WHEN transaction_id = 14 THEN 13
  WHEN transaction_id = 15 THEN 14
  WHEN transaction_id = 16 THEN 15
  WHEN transaction_id = 17 THEN 16
  WHEN transaction_id = 18 THEN 17
  WHEN transaction_id = 19 THEN 18
  WHEN transaction_id = 20 THEN 19
  WHEN transaction_id = 1 THEN 20
END
WHERE collateral_id IS NULL;
--  
INSERT INTO payment_history_fact (payment_id, customer_id, payment_date, amount)
VALUES
  (1, 1, '2022-01-01', 1000.00),
  (2, 2, '2022-01-02', 1500.00),
  (3, 3, '2022-01-03', 2000.00),
  (4, 4, '2022-01-04', 2500.00),
  (5, 5, '2022-01-05', 3000.00),
  (6, 6, '2022-01-06', 3500.00),
  (7, 7, '2022-01-07', 4000.00),
  (8, 8, '2022-01-08', 4500.00),
  (9, 9, '2022-01-09', 5000.00),
  (10, 10, '2022-01-10', 5500.00),
  (11, 1, '2022-01-11', 6000.00),
  (12, 2, '2022-01-12', 6500.00),
  (13, 3, '2022-01-13', 7000.00),
  (14, 4, '2022-01-14', 7500.00),
  (15, 5, '2022-01-15', 8000.00),
  (16, 6, '2022-01-16', 8500.00),
  (17, 7, '2022-01-17', 9000.00),
  (18, 8, '2022-01-18', 9500.00),
  (19, 9, '2022-01-19', 10000.00),
  (20, 10, '2022-01-20', 10500.00);












