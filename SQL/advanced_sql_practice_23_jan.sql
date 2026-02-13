-- select prod_id, title, orderdate, extract(month from orderdate) as month_
-- 	from orderlines join products using(prod_id)
-- 	where extract(month from orderdate) = 12
-- 	limit 5;


-- select title
-- from products
-- where prod_id in (select distinct prod_id from orderlines where extract(month from orderdate) = 12)


-- with x as 
-- (select 
-- 	emp_no, 
-- 	first_name, 
-- 	last_name,
-- 	salary,
-- 	row_number() over (order by salary desc) as rn
-- from employees join salaries using (emp_no))

-- select *
-- from x
-- where rn = 2



-- select 
-- 	*,
-- 	sum(totalamount) over (order by orderdate
-- 		rows between unbounded preceding and current row)
-- 	from orders




-- select 
-- 	*, 
-- 	avg(totalamount) over (),
-- 	extract (day from orderdate) as day_
-- from orders
-- where extract (day from orderdate) = 27



-- select
-- 	*,
-- 	avg(totalamount) over (partition by orderdate rows between 1 preceding and current row)
-- from orders



with x as (select *,
	lead(totalamount) over (order by orderdate)
from orders)

select *
from x










