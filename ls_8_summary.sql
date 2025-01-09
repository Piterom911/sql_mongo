select * from employees;

select emp.first_name as emp_name, emp.last_name as emp_surname, mng.first_name as manager_name, mng.last_name as manager_surname
from employees as emp
join employees as mng
on emp.manager_id = mng.employee_id;

select concat(emp.first_name, " ", emp.last_name)  as employee_name, emp.salary as employee_salary,
	   concat(mng.first_name, " ", mng.last_name) as manager_name, mng.salary as manager_salary
from employees as emp
join employees as mng
on emp.manager_id = mng.employee_id
where emp.salary < mng.salary;

select concat(emp.first_name, " ", emp.last_name)  as employee_name,
	   concat(mng.first_name, " ", mng.last_name) as manager_name
from employees as emp
join employees as mng
on emp.manager_id = mng.employee_id
where mng.first_name = "Nancy" and mng.last_name = "Greenberg";

select concat(emp.first_name, " ", emp.last_name)  as employee_name
from employees as emp
left join employees as mng
on emp.manager_id = mng.employee_id
where emp.manager_id is null;

select concat(emp.first_name, " ", emp.last_name)  as employee_name, emp.salary, adam.salary, adam.first_name
from employees as emp
join employees as adam
on adam.first_name = "Adam" and adam.last_name = "Fripp" and emp.employee_id != adam.employee_id
where adam.salary > emp.salary
order by emp.salary desc
limit 3;

select first_name, last_name, salary
from employees
where salary < (select salary
				from employees
				where first_name = 'Adam' and last_name = 'Fripp')
order by salary desc
limit 3;




