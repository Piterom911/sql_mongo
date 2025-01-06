-- Вывести имена и фамилии сотрудников и название их департаментов.
select first_name, last_name, department_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id;

-- Вывести имя и фамилию сотрудников из департамента "Sales", которые зарабатывают больше 8000.
select first_name, last_name
from employees as emp
join departments as dep
on emp.department_id = dep.department_id
where dep.department_name = 'Sales' and emp.salary > 8000;

select department_name
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
where emp.employee_id is null;

-- self join
select emp.first_name, emp.last_name, emp.salary
from employees as emp
join employees as emp2
on emp.employee_id != emp2.employee_id
where emp.salary > emp2.salary and emp2.first_name = 'David' and emp2.last_name = 'Austin';


select first_name, last_name
from employees
where salary > (select salary
from employees
where first_name = 'David' and last_name = 'Austin');
                

select emp1.first_name, emp1.last_name
from employees as emp1
join employees as emp2
on emp2.first_name = 'Alexis' and emp2.last_name = 'Bull' and emp1.employee_id != emp2.employee_id
where emp1.department_id = emp2.department_id;

-- Вывести департаменты, в которых никто не работает
select department_name
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
where emp.employee_id is null;
 
-- SELF JOIN
select * from employees;

-- Вывести сотрудников которые получают больше чем David Austin.
select all_emp.first_name, all_emp.last_name
from employees as all_emp
join employees as emp_copy
on emp_copy.first_name = 'David' and emp_copy.last_name = 'Austin' and all_emp.employee_id != emp_copy.employee_id
where all_emp.salary > emp_copy.salary;
 
-- Подзапросы SUBSELECT
select salary
from employees
where first_name = 'David' and last_name = 'Austin';

select first_name, last_name
from employees 
where salary > (select salary
				from employees
				where first_name = 'David' and last_name = 'Austin');
 
-- Вывести всех сотрудников, которые работают в том же департаменте, что 'Alexis' 'Bull'.
-- Self Join
select all_emp.first_name, all_emp.last_name
from employees as all_emp
join employees as emp_copy
on emp_copy.first_name = 'Alexis' and emp_copy.last_name = 'Bull' and all_emp.employee_id != emp_copy.employee_id
where all_emp.department_id = emp_copy.department_id;

-- Subselect
select first_name, last_name
from employees
where department_id = (select department_id
						from employees 
						where first_name = 'Alexis' and last_name = 'Bull') and first_name != 'Alexis' and last_name != 'Bull';


