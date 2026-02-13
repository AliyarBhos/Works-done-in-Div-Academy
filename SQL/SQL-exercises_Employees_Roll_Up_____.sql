-------------------------------------------- ROLLUP, CUBE, GROUPING SETS --------------------------------------------

/*
*  Calculate the total amount of employees per department using grouping sets
*  Database: Employees
*  Table: Employees
*/

-- ...
-- select 
--     dept_name,
--     count(emp_no) as total_employees
-- from employees
-- join dept_emp using (emp_no)
-- join departments using (dept_no)
-- group by grouping sets (
--     (dept_name),
--     ()
-- )
-- order by dept_name;

	
/*
*  Calculate the total average salary per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/

-- ...
-- select 
--     coalesce(d.dept_name, 'TOTAL') as dept_name,
--     avg(s.salary) as avg_salary
-- from employees e
-- join dept_emp dp using (emp_no)
-- 	join salaries s using (emp_no)
-- 		join departments d using (dept_no)
-- group by grouping sets (
--     (d.dept_name),
--     ()
-- );

