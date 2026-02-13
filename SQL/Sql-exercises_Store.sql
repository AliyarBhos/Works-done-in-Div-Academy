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
