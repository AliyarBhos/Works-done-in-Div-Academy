--Extract Part


-- select 
-- 	first_name, 
-- 	last_name,
-- 	extract(year from birth_date) as birth_year,
-- 	extract(month from birth_date) as birth_month,
-- 	to_char(birth_date, 'FMMonth') as birth_month_str,
-- 	-- to_char(date, 'Month') converts month number to month name
-- 	-- Use FMMonth to avoid trailing spaces
-- 	extract(day from birth_date) as birth_day
-- from employees



--Date Trunc

-- select
-- 	first_name,
-- 	last_name,
-- 	birth_date,
-- 	date_trunc('month', birth_date) as month_birth_year
-- from employees




--Difference


-- select 
-- 	first_name, 
-- 	last_name,
-- 	(hire_date - birth_date) / 360 as hire_age_manual,
-- 	age(hire_date, birth_date) as hire_age_func
-- from employees



--Current Date

-- select current_date;


--Current Timestamp

-- select now(), current_timestamp, clock_timestamp(); --same things



--Add/Sub

-- select 
-- 	first_name,  
-- 	birth_date, 
-- 	birth_date + interval '1 day' as onePlusDate1,
-- 	birth_date + make_interval(days=>1) as onePlusDate2
-- from employees



