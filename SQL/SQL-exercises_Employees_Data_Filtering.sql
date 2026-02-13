-------------------------------------------- DATA FILTERING --------------------------------------------

/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

-- ...
-- select *
-- from employees
-- where age(current_date, birth_date) > interval '60 years';



/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

-- ...
-- select count(*)
-- from employees 
-- where extract(month from hire_date) = 2

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

-- ...
-- select count(*)
-- from employees
-- where extract(month from birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: What is the age of the oldest employee?
*/


-- select max(age(current_date, birth_date))
-- from employees

-- ...
