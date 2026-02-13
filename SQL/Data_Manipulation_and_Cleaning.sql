-- select *,
-- 	coalesce(article, 'no❌') as article_clean
-- 	from towns


-- select name, 
-- 	case 
-- 		when id > 300 then 'far'
-- 		else 'near'
-- 	end as Distance
-- from towns;




-- select 
-- 	*,
-- 	case 
-- 		when name ilike 'A%' then 'Starts with A'
-- 		else 'Doesnot start with A'
-- 	end as Cities_start_with_A
-- from departments;




-- select *,
-- 	cast(region as int) as region_int,
-- 	region::int as region_int_by_pst_shrthnd
-- from departments









