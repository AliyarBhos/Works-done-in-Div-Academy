-------------------------------------------- GROUP BY --------------------------------------------

/*
*  How many people were hired on did we hire on any given hire date?
*  Database: Employees
*  Table: Employees
*/

-- ...
-- select 
--     hire_date,
--     count(*) as hires_on_that_date
-- from employees
-- group by hire_date
-- order by hire_date;


/*
*  Show me all the employees, hired after 1991 and count the amount of positions they've had
*  Database: Employees
*/

-- ...
-- select 
--     e.emp_no,
--     e.first_name,
--     e.last_name,
--     e.hire_date,
--     count(t.title) as position_count
-- from employees e
-- join titles t
--   on e.emp_no = t.emp_no
-- where e.hire_date >= date '1991-01-01'
-- group by 
--     e.emp_no,
--     e.first_name,
--     e.last_name,
--     e.hire_date
-- order by e.hire_date;


/*
-- How many employees were hired in each year?
-- Database: Employees
-- Table: Employees
*/

-- ...
-- select
--     extract(year from hire_date) as hire_year,
--     count(*) as employees_hired
-- from employees
-- group by extract(year from hire_date)
-- order by hire_year;


-- Find the employee numbers and names of employees who work in the 'Sales' department.
-- Database: Employees
-- Table: Employees, Dept_emp, Departments

-- ...
-- select 
-- 	emp_no,
-- 	first_name,
-- 	last_name
-- from employees
-- join dept_emp using(emp_no)
-- join departments using(dept_no)
-- where dept_name = 'Sales'

/*
-- Count the number of employees who were hired each month.
-- Database: Employees
-- Table: Employees
*/

-- ...
-- select
--     extract(month from hire_date) as hire_month,
--     count(*) as employees_hired
-- from employees
-- group by extract(month from hire_date)
-- order by hire_month;

