-- Find the average price for each category and then subtract the item’s price from its category’s price 
-- Database: Store

-- select 
-- 	category, 
-- 	avg(price)
-- from products
-- group by category

select
	prod_id,
	category,
	price,
	avg(price) over(partition by category) as avg_category,
	abs(price - avg(price) over(partition by category)) as diff_price_product
from products








