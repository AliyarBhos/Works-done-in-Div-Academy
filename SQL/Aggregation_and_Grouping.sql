-- select 
-- 	count(*)
-- from departments


-- select 
-- 	count(distinct gender)
-- from employees


--Just for practice
-- select 
-- 	sum(emp_no)
-- from dept_manager



--avg
--min
--max






--While SQL allows this, AVG(emp_no) usually makes no business sense, we just practice
-- select first_name, avg(emp_no)
-- from employees
-- group by first_name



-- select first_name, avg(emp_no)
-- from employees
-- where first_name like 'H%'
-- group by first_name


-- select first_name, avg(emp_no)
-- from employees
-- group by first_name
-- having avg(emp_no) > 250000;










--Advanced Grouping: Rollups and Cubes



-- select coalesce(first_name, 'Total'), count(*)
-- from employees
-- group by rollup(first_name)


-- select
-- 	coalesce(first_name, 'ALL'),
-- 	coalesce(last_name, 'ALL'),
-- 	count(*)
-- from employees
-- group by cube(first_name, last_name)




-- select 
-- 	coalesce(first_name, 'ALL') as first_name,
-- 	coalesce(last_name, 'ALL') as last_name,
-- 	count(*)
-- from employees
-- group by grouping sets (
-- 	(first_name, last_name),
-- 	(first_name),
-- 	()
-- );






