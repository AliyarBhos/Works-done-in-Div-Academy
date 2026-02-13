select 
	emp_no,
	from_date, 
	to_date,
	sum(salary) over (partition by emp_no) as emp_no_total
from salaries