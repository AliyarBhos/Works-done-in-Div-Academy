-- select * 
-- 	from salaries

-- select emp_no, salary
-- 	from salaries


/* Aliases (AS)*/
-- select emp_no as emp_id, salary as emp_salary
-- 	from salaries
-- 	limit 5;



/*Distinct -> ALL listed columns must be unique together*/

-- select distinct emp_no, salary
-- 	from salaries

/*Uniqueness is checked ONLY on the column(s) inside the parentheses.*/

-- SELECT DISTINCT ON (emp_no)
--        emp_no, salary, from_date
-- FROM salaries
-- ORDER BY emp_no, from_date DESC;
