select * from employees;

-- Вывести максимальную зарплату в компании
select salary
from employees
order by salary desc
limit 1;

select max(salary)
from employees;

-- Вывести минимальную зарплату в компании
select salary
from employees
order by salary
limit 1;

select min(salary)
from employees;

select min(salary), first_name, last_name
from employees;

-- Вывести имена и фамилии сотрудников, которые получают больше чем Adam Fripp
select first_name, last_name
from employees
where salary > (select salary from employees
				where first_name = 'Adam' and last_name = 'Fripp');

-- Вывести сотрудников, которые получают максимальну зарплату 
select first_name, last_name
from employees
where salary = (select max(salary)
				from employees);
                
-- Вывести сумму зарплат всех сотрудников 
select sum(salary)
from employees;

-- Вывести сруднюю зарплату
select avg(salary)
from employees;

-- Вывести количество строк в таблице employees
select count(*)
from employees;

-- Вывести количество сотрудников  
select count(employee_id)
from employees;

-- Вывести максимальную зарплату среди сотрудников которые платят коммиссии.
select max(salary)
from employees
where commission_pct is not null;

-- Вывести сумму зарплат сотрудников которые получают больше 10 000
select sum(salary)
from employees
where salary > 10000;

-- Вывести сотрудников у которых имя начинается на "А"
select count(employee_id) as emp_count
from employees
where first_name like 'A%';

-- Вывести среднюю зарплату сотрудников у которых номер департамента равен 100 
select round(avg(salary)) as avarage_salary
from employees
where department_id = 100;

-- Вывести сотрудников из департамента 'IT'
select first_name, last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'IT';

-- Вывести количество сотрудников из департамента IT
select count(employee_id)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'IT';

-- Вывести сумму зарплат сотрудников из департамента Sales
select round(sum(salary))
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'Sales';

-- Найти среднюю зп сотрудников из use
select * from countries;
select * from locations;
select * from departments;

-- Найти среднюю зп сотрудников из United States of America
select avg(salary)
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
join locations as loc
on loc.location_id = dep.location_id
join countries as cntr
on cntr.country_id = loc.country_id
where cntr.country_name = 'United States of America';

-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании
-- 1. Средняя зарплата 
select avg(salary)
from employees;

-- 2. Сотрудники, которые получают меньше средего
select first_name, last_name
from employees
where salary < (select avg(salary)
from employees);

-- Найти количество сотрудников у которых зп меньше средней
select count(employee_id)
from employees
where salary < (select avg(salary)
from employees);

-- Найти количество сотрудников из департамента с ID 60, которые зарабатывают больше среднего
select count(employee_id)
from employees
where department_id = 60 and salary > (select avg(salary)
from employees);

-- Найти сотрудников у которых зарплата меньше половины суммы зарплат всех сотрудников
select *
from employees 
where salary < (select sum(salary) / 2
from employees)
order by salary;

-- Вывести список сотрудников с должностью 'Programmer'(job_title),
-- чья зарплата выше средней зарплаты среди всех сотрудников с этой должностью.
select * 
from employees as e
join jobs as j
on j.job_id = e.job_id
where j.job_title = 'Programmer' and salary > (select avg(salary)
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
where jb.job_title = 'Programmer');






