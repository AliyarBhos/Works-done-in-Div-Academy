-------------------------------------------- DISTINCT --------------------------------------------

/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/

-- select 
-- 	count(distinct birth_date)
-- from employees


-------------------------------------------- LIKE --------------------------------------------

/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/

-- select
-- 	count(*)
-- from employees
-- where first_name ilike 'a%r'