-- select
-- 	*
-- from products


select 
	title, 
	abs(price) as abs_price,
	ceil(price) as ceil_price,
	floor(price) as floor_price,
	round(price, 0) as round_price,
	round(sqrt(price), 4) as sqrt_price,
	|/ price as sqrt_pl_price,
	round(power(price, 2), 4) as power_price,
	round(price ^ 2, 4) as power_pl_price
from products