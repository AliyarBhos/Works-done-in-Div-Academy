--Scalar Subquery Example

-- select emp_no, first_name
-- from employees
-- where emp_no > (
-- 	select avg(emp_no) from employees
-- )


--Multi-row Subquery Example

-- select first_name
-- from employees
-- where emp_no in (select emp_no from salaries)

--Correlated Subquery Example

-- SELECT employee_name, salary, department_id
-- FROM employees e1
-- WHERE salary > (
--     SELECT AVG(salary)
--     FROM employees e2
--     WHERE e2.department_id = e1.department_id
-- );



-- Common Table Expressions (CTEs) with WITH


-- with x as (
-- 	select birth_date
-- 	from employees
-- 	group by birth_date
-- )

-- select *
-- from x



