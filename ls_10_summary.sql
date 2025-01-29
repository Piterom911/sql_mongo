-- Из департаментов 10, 30, 50 и 100 вывести те, в которых кол/во сотрудников больше 5.
select department_id, count(employee_id) as employee_count
from employees
where department_id in (10, 30, 50, 100)
group by department_id
having employee_count > 5;

-- 2. Посчитать кол/во департаментов в каждом городе(locations.city).
-- Вывести города и кол/во департаментов.
select loc.city, count(dep.department_id) as dep_count
from locations as loc
join departments as dep
on dep.location_id = loc.location_id
group by loc.city;

select * from locations;
select * from countries;
select * from departments;

-- 3. Найти города, в которых кол/во сотрудников больше 5.
-- Вывести города и кол/во сотрудников.
select loc.city, count(emp.employee_id) as emp_count
from locations as loc
join departments as dep
on dep.location_id = loc.location_id
join employees as emp
on dep.department_id = emp.department_id
group by loc.city
having emp_count > 5;

-- Найти города, в которых максимальная зарплата сотрудника по городам больше 10000.
-- Вывести только города.
select loc.city
from locations loc
join departments dep 
on loc.location_id = dep.location_id
join employees emp 
on dep.department_id = emp.department_id
group by loc.city
having MAX(emp.salary) > 10000;

select loc.city
from locations as loc
join (select loc.city, max(emp.salary) as max_salary
		from locations as loc
		join departments as dep
		on loc.location_id = dep.location_id
		join employees as emp
		on dep.department_id = emp.department_id
		group by loc.city
		having max_salary > 10000) as city_max_salary
on loc.city = city_max_salary.city;

select con.country_name
from countries as con
join (select con.country_name, min(emp.salary) as min_salary
		from countries as con
        join locations as loc
        on con.country_id = loc.country_id
		join departments as dep
		on loc.location_id = dep.location_id
		join employees as emp
		on dep.department_id = emp.department_id
		group by con.country_name
		having min_salary > 5000) as contry_min_salary
on con.country_name = contry_min_salary.country_name;
