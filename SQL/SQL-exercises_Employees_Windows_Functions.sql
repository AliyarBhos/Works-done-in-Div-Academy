-------------------------------------------- WINDOW FUNCTIONS --------------------------------------------

-- Find the average income for each position
-- Database: Employees


-- ...
-- select 
-- 	t.title,
-- 	round(avg(s.salary), 2)
-- from employees e
-- left join salaries s using(emp_no)
-- 	join titles t using(emp_no)
-- group by t.title

-- select distinct
--     t.title,
--     round(
--         avg(s.salary) over (partition by t.title),
--         2
--     ) as avg_salary
-- from employees e
-- join salaries s using (emp_no)
-- join titles t using (emp_no);
