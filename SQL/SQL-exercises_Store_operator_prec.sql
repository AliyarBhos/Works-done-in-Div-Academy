-------------------------------------------- OPERATOR PRECEDENCE (comparison operators) --------------------------------------------

/*
* DB: Store
* Table: Customers
* Question: 
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/

-- ...
-- select *
-- from customers
-- where
--     income > 50000
--     and (age < 30 or age >= 50)
--     and country in ('Japan', 'Australia');

/*
* DB: Store
* Table: Orders
* Question: 
* What was our total sales in June of 2004 for orders over 100 dollars?
*/

-- ...
-- select sum(totalamount)
-- from orders
-- where extract(year from orderdate) = 2004
-- 	and trim(to_char(orderdate, 'Month')) = 'June'
-- 	and totalamount > 100

--better 

-- select sum(totalamount)
-- from orders
-- where orderdate >= date '2004-06-01'
--   and orderdate <  date '2004-07-01'
--   and totalamount > 100;

