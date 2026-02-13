-- select emp_no, first_name, last_name, salary
-- 	from employees left join salaries using(emp_no)
-- 	order by salary desc
-- 	limit 1;

-- select emp_no, first_name, last_name, salary
-- 	from employees left join salaries using(emp_no)
-- 	where salary = (select min(salary) from salaries);

-- select emp_no, first_name, last_name, salary
-- 	from employees left join salaries using(emp_no)
-- 	where salary >= 2 * (select avg(salary) from salaries);



-- select emp_no, first_name, last_name, salary, avg(salary)
-- 	from employees left join salaries using(emp_no)
-- 	where first_name ilike 'al%'



-- select *
-- from salaries 
-- where emp_no in (select emp_no from employees where first_name ilike 'al%')



-- with x as (
-- select
-- 	*,
-- 	lead(hire_date) over (order by hire_date) as next_hire
-- from employees
-- )

-- select emp_no, hire_date, next_hire, next_hire - hire_date
-- from x


select *,
	count(*) over (partition by gender)
from employees
limit 5;







