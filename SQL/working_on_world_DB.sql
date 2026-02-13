-- Find the percentage of the world's population that lives on each continent.
-- Database: World
-- Table: Country


-- select continent, avg(population)
-- from country
-- group by continent

-- with x as(select 
-- 	code, 
-- 	continent, 
-- 	population,
-- 	sum(population) over (partition by continent) as pop_cont
-- from country)

-- select 
-- 	*, 
-- 	round(100 * population::numeric / nullif(pop_cont, 0)::numeric, 2)
-- from x



-- *  Show the population per continent
-- *  Database: World
-- *  Table: Country

select continent, population,
	sum(population) over(partition by continent) as by_continents
from country
limit 10;




