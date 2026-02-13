/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/

-- ...
-- with x as(
-- 	select *
-- 	from employees
-- 	join dept_emp using(emp_no)
-- )

-- select * 
-- from x
-- join departments using(dept_no);


-- select *
-- from employees
-- join dept_emp using (emp_no)
-- join departments using (dept_no);


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

-- ...
-- select 
-- 	emp_no,
-- 	dept_name,
-- 	from_date,
-- 	to_date
-- from employees
-- join dept_emp using(emp_no)
-- join departments using(dept_no)
-- where dept_name = 'Development'

