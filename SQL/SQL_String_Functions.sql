--Concatenate


-- select 
-- 	firstname, 
-- 	lastname,
-- 	concat(firstname, ' ', lastname) as fullname,
-- 	firstname || ' ' || lastname as fullname_pg
-- from customers




--Uppercase


-- NOTE:
-- Password transformation is shown here purely for educational purposes.
-- In real-world systems, passwords must be securely hashed and never modified or exposed.


-- select 
-- 	firstname, 
-- 	lastname, 
-- 	upper(password) as upper_password
-- from customers
-- where password is not null



--Lowercase



-- select 
-- 	firstname, 
-- 	lastname, 
-- 	concat(lower(firstname), ' ', lower(lastname)) as fullname
-- from customers




--Trim Spaces


-- select 
-- 	firstname, 
-- 	lastname,
-- 	trim(address1) as address
-- -- Removes spaces (or other specified characters) from the edges of a string.
-- -- TRIM()       → removes spaces from both ends.
-- -- LTRIM()      → removes spaces (or specified chars) from the left/start.
-- -- RTRIM()      → removes spaces (or specified chars) from the right/end.
-- -- BTRIM()      → same as TRIM(), can remove spaces or other specified characters from both ends.
-- from customers



--Replace

-- select
-- 	firstname, 
-- 	lastname,
-- 	replace(address1, ' ', '-') as address_cleaned
-- from customers




--Length

-- select
--     firstname,
--     lastname,
--     array[length(firstname), length(lastname)] as name_lengths
-- from customers;



--Substring

-- select
-- 	firstname,
-- 	lastname,
-- 	substring(lastname from 1 for 3) as first_three_char_of_lastname
-- from customers




--Left/Right

-- select
-- 	firstname,
-- 	lastname,
-- 	left(firstname, 4) as left_4_first_name,
-- 	substr(right(lastname, 4), 4, 1) as right_4_last_name 
-- from customers











