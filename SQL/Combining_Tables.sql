-- select 
-- 	*
-- from employees

-- select *
-- from salaries



-- select 
-- 	e.first_name, 
-- 	e.last_name, 
-- 	s.salary
-- from employees e
-- left join salaries s on e.emp_no = s.emp_no;



--Self Join

--Self-join = relating rows inside the same table



-- Cross Join

-- Dangerous: pairs every row from the first table with every row from the second.
-- Even with LIMIT, the database must generate the join first.
-- On large tables this can be extremely slow or impossible to finish.


-- select e.first_name, s.salary
-- from employees e
-- cross join salaries s;



--Using


-- select 
-- 	*
-- from employees left join salaries using(emp_no);






--SET OPERATIONS

--	Combines results and removes duplicates.
-- select 
-- 	salary::text
-- from salaries
-- union   
-- select
-- 	first_name
-- from employees;

--Combines results and keeps all duplicates (faster).
-- select 
-- 	salary::text
-- from salaries
-- union all
-- select
-- 	first_name
-- from employees;


--Returns only rows that appear in both results.

-- select 
-- 	salary::text
-- from salaries
-- intersect
-- select
-- 	first_name
-- from employees;


--Returns rows in the first result but not the second.

-- select 
-- 	salary::text
-- from salaries
-- except
-- select
-- 	first_name
-- from employees;