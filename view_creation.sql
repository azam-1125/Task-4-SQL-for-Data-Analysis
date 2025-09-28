CREATE VIEW Major_Markets_View AS
SELECT customer_state, customer_city, COUNT(DISTINCT customer_unique_id) AS Unique_Customers 
FROM customer.customers
GROUP BY customer_state, customer_city
HAVING COUNT(DISTINCT customer_unique_id) > 500;