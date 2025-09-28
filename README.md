# 💾 Data Analyst Internship: Task 4 - SQL for Data Analysis

## Project Overview

This repository contains the deliverables for **Task 4: SQL for Data Analysis**. My objective was to demonstrate my ability to extract, analyze, and manipulate structured data efficiently using advanced SQL techniques, as required by the internship program.

I successfully executed queries that cover all foundational and advanced SQL requirements using the geographic and customer data from the provided file.

## 🛠️ Tools and Database

* **Tool:** MySQL (Used to execute queries and manage indexing).
* **Dataset:** `customers.csv` (Accessed as table `customer.customers`).

## 🔍 SQL Deliverables: Exact Snippets Used

The following are the **exact SQL statements** I used:

### 1. Basic Selection

```sql
-- Initial Selection (SELECT *)
SELECT * FROM customer.customers;
```
### 2. Count Unique Customers per State (COUNT, GROUP BY, ORDER BY)
```sql
SELECT customer_state, COUNT(DISTINCT customer_unique_id) AS Unique_Customers
FROM customer.customers 
GROUP BY customer_state
ORDER BY Unique_Customers DESC;
```
### 3. Count Unique Cities per State (Subquery in FROM for DISTINCT cities per state)
```sql
select customer_state, count(*) as unq_city_count
from (select distinct customer_city, customer_state from customer.customers) a
group by customer_state
order by count(*) desc;
```
### 4. Identify cities with above-average Unique Customer Count (Subquery in HAVING)
```sql
SELECT customer_city, COUNT(DISTINCT customer_unique_id) AS Unique_Customer_Count 
FROM customer.customers 
GROUP BY customer_city 
HAVING COUNT(DISTINCT customer_unique_id) > ( 
    SELECT AVG(city_counts.Count) 
    FROM ( 
        SELECT COUNT(DISTINCT customer_unique_id) AS Count 
        FROM customer.customers 
        GROUP BY customer_city 
    ) AS city_counts 
)
ORDER BY Unique_Customer_Count DESC;
```
### 5. Create View for Major Markets (CREATE VIEW)
```sql
CREATE VIEW Major_Markets_View AS
SELECT customer_state, customer_city, COUNT(DISTINCT customer_unique_id) AS Unique_Customers 
FROM customer.customers
GROUP BY customer_state, customer_city
HAVING COUNT(DISTINCT customer_unique_id) > 500;
```
### 6. Query the View (Demonstrates easy reporting)
```sql
SELECT customer_city, Unique_Customers
FROM Major_Markets_View 
ORDER BY Unique_Customers
DESC LIMIT 10;
```
### 7. Optimize queries with Index (CREATE INDEX with length specification for MySQL 1170 error)
```sql
CREATE INDEX idx_customer_state 
ON customer.customers (customer_state(10));
```
