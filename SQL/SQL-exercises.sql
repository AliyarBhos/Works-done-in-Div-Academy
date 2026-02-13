-------------------------------------------- AGGREGATE FUNCTIONS --------------------------------------------
-- Database: World

-- Question 1: How many official languages are there?
-- Table: countrylanguage
-- Result: 238


-- ...
-- select count(*)
-- from countrylanguage
-- where isofficial = True


-- Question 2: What is the average life expectancy in the world?
-- Table: country
-- Result: 66.48603611164265

-- ...
-- select avg(lifeexpectancy)
-- from country





-- Question 3: What is the average population for cities in the netherlands?
-- Table: city
-- Result: 185001

-- ...
-- select avg(population)
-- from city
-- where countrycode = 'NLD'


-------------------------------------------- COMPARISON OPERATORS --------------------------------------------

-- How many female customers do we have from the state of Oregon (OR)?
-- Database: Store
-- Table: Customers
-- Result: 106

-- ...
-- select count(state)
-- from customers
-- where state = 'OR' and gender = 'F'


-- Who over the age of 44 has an income of 100 000 or more? (excluding 44)
-- Database: Store
-- Table: Customers
-- Result: 2497

-- ...
-- select 
-- 	count(*)
-- from customers
-- where age > 44 and income >= 100000


-- Who between the ages of 30 and 50 has an income less than 50 000? (include 30 and 50 in the results)
-- Database: Store
-- Table: Customers
-- Result: 2362

-- ...
-- select
-- 	count(*)
-- from customers
-- where age between 30 and 50 and income < 50000


-- What is the average income between the ages of 20 and 50? (Excluding 20 and 50)
-- Database: Store
-- Table: Customers
-- Result: 59409.926240780098

-- ...
-- select avg(income) from customers where age > 20 and age < 50

-------------------------------------------- IN --------------------------------------------

/*
* DB: Store
* Table: orders
* Question: How many orders were made by customer 7888, 1082, 12808, 9623
*/

-- ...
-- ...
-- select 
-- 	count(*) 
-- from orders
-- where customerid in (7888, 1082, 12808, 9623)

/*
* DB: World
* Table: city
* Question: How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
*/

-- ...

-- select 
-- count(*) 
-- from city
-- where district in ('Zuid-Holland', 'Noord-Brabant', 'Utrecht')

-------------------------------------------- BETWEEN AND --------------------------------------------

-- Who between the ages of 30 and 50 has an income less than 50 000? (include 30 and 50 in the results)
-- Database: Store
-- Table: Customers

-- ...
-- select 
-- 	firstname,
-- 	lastname
-- from customers
-- where (age between 30 and 50) and (income < 50000)



-- What is the average income between the ages of 20 and 50? (Including 20 and 50)
-- Database: Store
-- Table: Customers

-- ...
-- select 
-- 	avg(income)
-- from customers
-- where age between 20 and 50

-------------------------------------------- DISTINCT --------------------------------------------

/*
* DB: Employees
* Table: employees
* Question: How many unique birth dates are there?
*/

-- ...
-- select 
-- 	count(distinct birth_date)
-- from employees

/*
* DB: World
* Table: country
* Question: Can I get a list of distinct life expectancy ages (Make sure there are no nulls)
*/

-- ...
-- select 
-- 	distinct lifeexpectancy
-- from country
-- where lifeexpectancy is not null

-------------------------------------------- ORDER BY --------------------------------------------

/*
* DB: Employees
* Table: employees
* Question: Sort employees by first name ascending and last name descending
*/

-- ...
-- select
-- 	first_name,
-- 	last_name
-- from employees
-- order by first_name asc, last_name desc

/*
* DB: Employees
* Table: employees
* Question: Sort employees by birth_date
*/

-- ...
-- select * 
-- from employees
-- order by birth_date

/*
* DB: Employees
* Table: employees
* Question: Sort employees who's name starts with a "k" by hire_date
*/

-- ...
-- select * 
-- from employees
-- where first_name ilike 'k%'
-- order by hire_date

-------------------------------------------- LIKE --------------------------------------------

/*
* DB: Employees
* Table: employees
* Question: How many people's name start with A and end with R?
* Expected output: 1846
*/

-- ...
-- select
-- 	count(*)
-- from employees
-- where first_name ilike 'a%r'

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode have a 2 in it?.
* Expected output: 4211 
*/

-- ...
-- select 
-- 	count(*)
-- from customers
-- where zip::text ilike '%2%'

/*
* DB: Store
* Table: customers
* Question: How many people's zipcode start with 2 with the 3rd character being a 1.
* Expected output: 109 
*/

-- ...
-- select
-- 	count(*)
-- from customers
-- where zip::text ilike '2_1%'

-------------------------------------------- OPERATOR PRECEDENCE (comparison operators) --------------------------------------------

/*
* DB: Store
* Table: Customers
* Question: 
* Select people either under 30 or over 50 with an income above 50000
* Include people that are 50
* that are from either Japan or Australia
*/

-- ...
-- select *
-- from customers
-- where
--     income > 50000
--     and (age < 30 or age >= 50)
--     and country in ('Japan', 'Australia');

/*
* DB: Store
* Table: Orders
* Question: 
* What was our total sales in June of 2004 for orders over 100 dollars?
*/

-- ...
-- select sum(totalamount)
-- from orders
-- where extract(year from orderdate) = 2004
-- 	and trim(to_char(orderdate, 'Month')) = 'June'
-- 	and totalamount > 100

--better 

-- select sum(totalamount)
-- from orders
-- where orderdate >= date '2004-06-01'
--   and orderdate <  date '2004-07-01'
--   and totalamount > 100;

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
/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

-- ...
-- select count(*)
-- from orders
-- where orderdate >= '2004-01-01' and orderdate < '2004-02-01';

-------------------------------------------- JOINS --------------------------------------------

/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state ordered by orderid
*/

-- ...
-- select
--     *
-- from orders
-- join customers 
--     on orders.customerid = customers.customerid
-- where customers.state in ('OH', 'NY', 'OR')
-- order by orders.orderid;


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/

-- ...
-- select 
-- 	*
-- from products
-- join inventory using (prod_id);

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/

-- ...
-- with x as(
-- 	select *
-- 	from employees
-- 	join dept_emp using(emp_no)
-- )

-- select * 
-- from x
-- join departments using(dept_no);


-- select *
-- from employees
-- join dept_emp using (emp_no)
-- join departments using (dept_no);


/*
*  Show me all the employees that work in the department development and the from and to date.
*  Database: Employees
*/

-- ...
-- select 
-- 	emp_no,
-- 	dept_name,
-- 	from_date,
-- 	to_date
-- from employees
-- join dept_emp using(emp_no)
-- join departments using(dept_no)
-- where dept_name = 'Development'

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

-------------------------------------------- ROLLUP, CUBE, GROUPING SETS --------------------------------------------

/*
*  Calculate the total amount of employees per department using grouping sets
*  Database: Employees
*  Table: Employees
*/

-- ...
-- select 
--     dept_name,
--     count(emp_no) as total_employees
-- from employees
-- join dept_emp using (emp_no)
-- join departments using (dept_no)
-- group by grouping sets (
--     (dept_name),
--     ()
-- )
-- order by dept_name;

	
/*
*  Calculate the total average salary per department and the total using grouping sets
*  Database: Employees
*  Table: Employees
*/

-- ...
-- select 
--     coalesce(d.dept_name, 'TOTAL') as dept_name,
--     avg(s.salary) as avg_salary
-- from employees e
-- join dept_emp dp using (emp_no)
-- 	join salaries s using (emp_no)
-- 		join departments d using (dept_no)
-- group by grouping sets (
--     (d.dept_name),
--     ()
-- );


----- Same result can be achieved using ROLLUP(dept_name)
-- or CUBE(dept_name)

-------------------------------------------- WINDOW FUNCTIONS --------------------------------------------

-- Find the average income for each position
-- Database: Employees


-- ...
-- select 
-- 	t.title,
-- 	round(avg(s.salary), 2)
-- from employees e
-- left join salaries s using(emp_no)
-- 	join titles t using(emp_no)
-- group by t.title

-- select distinct
--     t.title,
--     round(
--         avg(s.salary) over (partition by t.title),
--         2
--     ) as avg_salary
-- from employees e
-- join salaries s using (emp_no)
-- join titles t using (emp_no);


-- Find the average price for each category and then subtract the item’s price from its category’s price 
-- Database: Store

-- ...
-- select 
--     c.categoryname,
--     round(avg(p.price) over (partition by c.categoryname), 2) as avg_price_each_categ,
--     round(p.price - avg(p.price) over (partition by c.categoryname), 2) as price_diff_from_avg
-- from products p
-- join categories c using(category);



-- Find the percentage of the world's population that lives on each continent.
-- Database: World
-- Table: Country

-- ...

-- with x as (
-- 	select sum(c.population) from country c
-- )

-- select 
-- 	c.continent,
-- 	sum(c.population) over (partition by c.continent) as sum_of_pop_per_cont,
-- 	sum(c.population) over (partition by c.continent) * 100 / (select * from x) 
-- from country c





-- select
--     c.continent,
--     sum(c.population) as sum_of_pop_per_cont,
--     round(sum(c.population) * 100.0 / (select sum(population) from country), 2) as perc_of_world
-- from country c
-- group by c.continent;




/*
*  Show the population per continent
*  Database: World
*  Table: Country
*/

-- ...
-- select
-- 	continent,
-- 	sum(population) over (partition by continent) 
-- from country


/*
*  To the previous query add on the ability to calculate the percentage of the world population
*  What that means is that you will divide the population of that continent by the total population and multiply by 100 to get a percentage.
*  Make sure you convert the population numbers to float using `population::float` otherwise you may see zero pop up
*
*  Database: World
*  Table: Country
*/

-- select
--     continent,
--     sum(population) as sum_of_pop_per_cont,
--     sum(population)::float * 100.0 / (select sum(population) from country) as perc_of_world
-- from country
-- group by continent;

-- ...

-------------------------------------------- RANK()/ROW_NUMBER()/DENSE_RANK() --------------------------------------------

-- Find the first three hired employees for each department

-- ...


-- Find the 3 highest salaries for each position

-- ...


-- Find the most expensive product for each category

-- ...

-------------------------------------------- LEAD() LAG() FIRST_VALUE() LAST_VALUE() --------------------------------------------

-- Task: For each employee's title record, show the current title and the next title. If there is no next title, show NULL.
-- Database: Employees

-- select *,
-- 	lead(title) over (partition by emp_no order by from_date),
-- 	lag(title) over (partition by emp_no order by from_date)
-- from titles

-- ...


-- Task: For each employee's department record, show the current department,  the previous department, 
-- the next department, and  the last recorded department for that employee. show NULL.
-- Database: Employees

-- ...


--Task: For each employee, calculate the number of days between their hire date and the hire date of the previous employee based on the emp_no order. 
-- If there is no previous employee, show NULL
-- Database: Employees

-- ...


-- Task: Assign a sequential number to each employee based on their hire date within each gender.
-- Additionally, mark whether the employee is in the top half or bottom half of their gender group based on their hire date.
-- Database: Employees

-- ...

-- Task: Assign a dense rank to each employee's title based on the from_date within each employee. 
-- Additionally, mark the first title each employee received
-- Database: Employees

-- ...

-------------------------------------------- UNION --------------------------------------------

/*
*  Calculate the total average salary per department and the total
*  Database: Employees
*  Table: Employees
*/

-- ...

-------------------------------------------- CONDITIONAL STATEMENTS --------------------------------------------

/*
* Database: Store
* Table: products
* Create a case statement that's named "price class" where if a product is over 20 dollars you show 'expensive'
* if it's between 10 and 20 you show 'average' 
* and of is lower than or equal to 10 you show 'cheap'.
*/

-- ...

/*
* DB: World
* Table: Countries
* Calculate the total area of countries that have a population of over 50 million 
*/

-- ...

-------------------------------------------- VIEWS --------------------------------------------
/*
*  Create a view "90-95" that:
*  Shows me all the employees, hired between 1990 and 1995
*  Database: Employees
*/

-- ...

/*
*  Create a view "bigbucks" that:
*  Shows me all employees that have ever had a salary over 80000
*  Database: Employees
*/

-- ...


-------------------------------------------- SUBQUERIES --------------------------------------------

/* TRY TO WRITE THESE AS JOINS FIRST */
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

-- ...

/*
* DB: Employees
* Table: employees
* Question: Filter employees who have emp_no 110183 as a manager
*/

-- ...

-- Written with JOIN --

-- ...