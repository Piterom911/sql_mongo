select emp.first_name, emp.last_name, dep.department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where emp.salary > (select max(emp.salary)
				from employees as emp
				join departments as dep
				on emp.department_id = dep.department_id
				where dep.department_name = 'Shipping');
                
                
-- Найти сотрудников, которые зарабатывают больше максимальной зарплаты сорудников департамента Shipping.
-- Вывести имена и фамилии сотрудников, а также название департаментов.
select emp.first_name, emp.last_name, dep.department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where emp.salary > (select max(emp.salary)
				from employees as emp
				join departments as dep
				on emp.department_id = dep.department_id
				where dep.department_name = 'Shipping');
                
                
-- Вывести имя и фамилию сотрудника с минимальной зарплатой, который работает в городе(city) Seattle.
select emp.first_name, emp.last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id
where loc.city = 'Seattle' and 
emp.salary = (select min(emp.salary) 
			  from employees as emp
              join departments as dep
              on emp.department_id = dep.department_id
              join locations as loc
              on dep.location_id = loc.location_id
              where loc.city = 'Seattle');
              
              
-- Найти количество сотрудников из департамента IT, которые зарабатывают больше средней зарплаты по компании.
select count(emp.employee_id)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'IT' and 
emp.salary > (select avg(salary) 
			  from employees);



select count(emp.employee_id)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'Shipping' and 
emp.salary < (select avg(emp.salary) 
			  from employees as emp
              join departments as dep
			  on emp.department_id = dep.department_id
			  where dep.department_name = 'Shipping');


-- Вывести список городов, в которых есть сотрудники 
-- с зарплатой ниже средней зарплаты сотрудников в городе Оксфорд.

select distinct loc.city
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on dep.location_id = loc.location_id
where emp.salary < (select avg(emp.salary) 
			  from employees as emp
              join departments as dep
              on emp.department_id = dep.department_id
              join locations as loc
              on dep.location_id = loc.location_id
              where loc.city = 'Oxford');




