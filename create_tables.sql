--Customer Dimension Table:
--This table would store information about individual customers or entities, such as their name, address, and contact information.

CREATE TABLE customer_dim (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20),
  email VARCHAR(50),
  registration_date DATE NOT NULL
);

--Credit Rating Dimension Table:
--This table would store information about the credit risk rating assigned to each customer.
CREATE TABLE credit_rating_dim (
  credit_rating_id INT PRIMARY KEY,
  rating INT NOT NULL,
  rating_date DATE NOT NULL
);
--Credit Limit Dimension Table:
--This table would store information about the credit limit assigned to each customer.
CREATE TABLE credit_limit_dim (
  credit_limit_id INT PRIMARY KEY,
  limits DECIMAL(10,2) NOT NULL
);
--Collateral Dimension Table:not updated values 
--This table would store information about any collateral pledged by the customer to secure their credit.
CREATE TABLE collateral_dim (
  collateral_id INT PRIMARY KEY,
  collateral_type VARCHAR(50) NOT NULL,
  collateral_value DECIMAL(10,2) NOT NULL
);
--Credit Transaction Fact Table:
--This table would store information about credit transactions made by each customer, including the amount and date of the transaction.
CREATE TABLE credit_transaction_fact (
  transaction_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  credit_rating_id INT NOT NULL,
  credit_limit_id INT NOT NULL,
  collateral_id INT,
  transaction_date DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer_dim(customer_id),
  FOREIGN KEY (credit_rating_id) REFERENCES credit_rating_dim(credit_rating_id),
  FOREIGN KEY (credit_limit_id) REFERENCES credit_limit_dim(credit_limit_id),
  FOREIGN KEY (collateral_id) REFERENCES collateral_dim(collateral_id)
);
--Payment History Fact Table:
--This table would store information about each customer's payment history, including the date and amount of each payment.
CREATE TABLE payment_history_fact (
  payment_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  payment_date DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer_dim(customer_id)
);

