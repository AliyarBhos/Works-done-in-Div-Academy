-- Find the average price for each category and then subtract the item’s price from its category’s price 
-- Database: Store

-- ...
-- select 
--     c.categoryname,
--     round(avg(p.price) over (partition by c.categoryname), 2) as avg_price_each_categ,
--     round(p.price - avg(p.price) over (partition by c.categoryname), 2) as price_diff_from_avg
-- from products p
-- join categories c using(category);