-- Find the first three hired employees for each department


-- select first_name,
-- from employees


-- select *
-- from dept_emp join employees using(emp_no)


-- with x as(select emp_no, dept_no, from_date, to_date, 
-- 	count(*) over (partition by dept_no),
-- 	row_number() over (partition by dept_no order by from_date) as ordered_emps
-- from employees join dept_emp using(emp_no))

-- select 
-- 	*
-- from x
-- where ordered_emps <= 3


-- Find the 3 highest salaries for each position

-- with x as (select 
-- 	title, 
-- 	salary,
-- 	row_number() over(partition by title order by salary desc)
-- from salaries join titles using(emp_no))

-- select * from x
-- where row_number <= 3





