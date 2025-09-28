SELECT customer_city, COUNT(DISTINCT customer_unique_id) AS Unique_Customer_Count 
FROM customer.customers GROUP BY customer_city 
HAVING COUNT(DISTINCT customer_unique_id) > ( SELECT AVG(city_counts.Count) 
FROM ( SELECT COUNT(DISTINCT customer_unique_id) AS Count FROM customer.customers GROUP BY customer_city ) AS city_counts )
 ORDER BY Unique_Customer_Count DESC;