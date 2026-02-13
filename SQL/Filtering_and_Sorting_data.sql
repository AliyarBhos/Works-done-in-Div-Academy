-- select *
-- 	from salaries
-- 	where salary > 150000;


-- select * 
-- 	from departments
-- 	where dept_name = 'Finance'

-- select first_name, last_name, gender
-- 	from employees
-- 	where gender = 'M';


-- select first_name, last_name
-- 	from employees
-- 	where first_name like 'G%';


-- select birth_date, first_name, last_name
-- 	from employees
-- 	order by birth_date desc, first_name asc



-- select birth_date, first_name
-- 	from employees
-- 	where birth_date > '1965-01-30'
-- 	order by birth_date desc;


-- select distinct on (birth_date) birth_date, first_name, last_name
-- 	from employees
-- 	where birth_date > '1965-01-30'
-- 	order by birth_date asc;



-- select * 
-- 	from employees
-- 	limit 10 offset 5;



-- select *
-- 	from employees
-- 	where first_name like 'G%'



--case insensitive

-- select *
-- 	from employees 
-- 	where first_name ilike 'g%'


-- select *
-- 	from employees 
-- 	where first_name is null


-- select *
-- 	from titles
-- 	where title is null


-- select 
-- 	*,
-- 	coalesce(gender::text, '-') as gender_clean
-- from employees;







