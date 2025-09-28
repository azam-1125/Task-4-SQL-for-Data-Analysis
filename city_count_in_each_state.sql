select customer_state, count(*) as unq_city_count
from (select distinct customer_city, customer_state from customer.customers) a
group by customer_state
order by count(*) desc