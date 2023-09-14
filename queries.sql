--Query 1 This query selects the name, credit rating, credit limit, and transaction amount of customers with a credit rating of 1 and a credit limit of at least 10000.

SELECT c.name, cr.rating, cl.limits, ct.amount
FROM customer_dim c
INNER JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id
INNER JOIN credit_rating_dim cr ON ct.credit_rating_id = cr.credit_rating_id
INNER JOIN credit_limit_dim cl ON ct.credit_limit_id = cl.credit_limit_id
WHERE cr.rating = 1 AND cl.limits>= 10000;

--Query 2 This query groups the transactions by customer and calculates the total amount spent by each customer.
SELECT c.name, SUM(ct.amount) as total_spent
FROM customer_dim c
INNER JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id
GROUP BY c.name;

--Query 3 This query orders the transactions by amount in descending order.
SELECT c.name, cr.rating, cl.limits, ct.amount
FROM customer_dim c
INNER JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id
INNER JOIN credit_rating_dim cr ON ct.credit_rating_id = cr.credit_rating_id
INNER JOIN credit_limit_dim cl ON ct.credit_limit_id = cl.credit_limit_id
ORDER BY ct.amount DESC;

--Query 4 This query selects the name and amount of the customer who made the largest transaction.
SELECT c.name, ct.amount
FROM customer_dim c
INNER JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id
WHERE ct.amount = (SELECT MAX(amount) FROM credit_transaction_fact);
--Query 5 This query uses a CTE to calculate the average transaction amount for each customer with a credit rating of 3 or higher.
WITH cte AS (
  SELECT c.name, cr.rating, cl.limits, ct.amount
  FROM customer_dim c
  INNER JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id
  INNER JOIN credit_rating_dim cr ON ct.credit_rating_id = cr.credit_rating_id
  INNER JOIN credit_limit_dim cl ON ct.credit_limit_id = cl.credit_limit_id
)
SELECT name, AVG(amount) as avg_transaction
FROM cte
WHERE rating >= 3
GROUP BY name;
--Query 6 This query combines the transaction and payment data into a single result set, with a new column indicating the type of data and the date of the transaction or payment. The result set is ordered by date.
SELECT  'transaction' as type, transaction_date as date
FROM credit_transaction_fact
UNION
SELECT  'payment' as type, payment_date as date
FROM payment_history_fact
ORDER BY  date;
--Query 7 This query selects the name, address, and phone number of customers whose phone number contains the digits 555.
SELECT name, address, phone_number
FROM customer_dim
WHERE phone_number LIKE '%555%';
--Query 8 This query groups the credit ratings by their assigned rating and counts the number of customers with each rating.
SELECT rating, COUNT(*) as count
FROM credit_rating_dim
GROUP BY rating;
--Query 9  calculate the total amount of credit used by each customer:
SELECT c.name, SUM(ct.amount) AS total_credit_used 
FROM customer_dim c 
JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id 
GROUP BY c.name; 
--Query 10 to calculate the number of customers with each credit rating:
SELECT cr.rating, COUNT(*) AS customer_count 
FROM credit_rating_dim cr JOIN credit_transaction_fact ct ON cr.credit_rating_id = ct.credit_rating_id 
GROUP BY cr.rating; 
--Query 11 find customers who have exceeded their credit limit:
SELECT c.name, cl.limits, SUM(ct.amount) AS total_credit_used 
FROM customer_dim c 
JOIN credit_transaction_fact ct 
ON c.customer_id = ct.customer_id 
JOIN credit_limit_dim cl 
ON ct.credit_limit_id = cl.credit_limit_id 
GROUP BY c.name, cl.limits HAVING SUM(ct.amount) > cl.limits; 
--Query 12 find the customers who have made at least one payment but no transactions
SELECT c.name 
FROM customer_dim c 
JOIN payment_history_fact ph ON c.customer_id = ph.customer_id 
LEFT JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id 
WHERE ct.transaction_id IS NULL; 
--Query 13 find the customers who have made transactions but have never exceeded their credit limit:
SELECT c.name,cl.limits,ct.amount
FROM customer_dim c 
JOIN credit_transaction_fact ct ON c.customer_id = ct.customer_id 
JOIN credit_limit_dim cl ON ct.credit_limit_id = cl.credit_limit_id 
GROUP BY c.name,cl.limits,ct.amount 
HAVING MAX(ct.amount) <= cl.limits;
-- creating views 
--view that shows the total number of transactions for each customer:
CREATE VIEW customer_transaction_count_view AS
SELECT c.customer_id, COUNT(ctf.transaction_id) AS transaction_count
FROM customer_dim c
LEFT JOIN credit_transaction_fact ctf ON c.customer_id = ctf.customer_id
GROUP BY c.customer_id;
--view that shows the top 10 customers with the highest total transaction amount:
CREATE VIEW top_10_customers_view AS
SELECT c.customer_id, c.name, SUM(ctf.amount) AS total_transaction_amount
FROM customer_dim c
LEFT JOIN credit_transaction_fact ctf ON c.customer_id = ctf.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_transaction_amount DESC
LIMIT 10;
