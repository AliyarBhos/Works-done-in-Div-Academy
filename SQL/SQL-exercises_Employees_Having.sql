-------------------------------------------- HAVING --------------------------------------------

/*
*  Show me all the employees, hired after 1991, that have had more than 2 titles
*  Database: Employees
*/

-- ...
-- select
--     e.emp_no,
--     e.first_name,
--     e.last_name,
--     count(t.title) as title_count
-- from employees e
-- join titles t using (emp_no)
-- where e.hire_date >= date '1991-01-01'
-- group by e.emp_no, e.first_name, e.last_name
-- having count(t.title) > 2;


/*
*  Show me all the employees that have had more than 15 salary changes that work in the department development
*  Database: Employees
*/

-- ...
-- select 
-- 	e.emp_no,
-- 	e.first_name,
-- 	e.last_name,
-- 	count(s.salary) as salary_count
-- from employees e
-- join salaries s using(emp_no)
-- group by e.emp_no, e.first_name, e.last_name
-- having count(s.salary) > 15
-- order by count(s.salary) asc


/*
*  Show me all the employees that have worked for multiple departments
*  Database: Employees
*/

-- ...
-- select 
-- 	e.emp_no,
-- 	e.first_name,
-- 	e.last_name,
-- 	count(dept_no) as dept_count
-- from employees e
-- join dept_emp d using(emp_no)
-- group by e.emp_no, e.first_name, e.last_name
-- having count(dept_no) > 1
-- order by count(dept_no) desc
