SELECT customer_state, COUNT(DISTINCT customer_unique_id) AS Unique_Customers
 FROM customer.customers 
 GROUP BY customer_state
 ORDER BY Unique_Customers DESC;