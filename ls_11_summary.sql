-- 1. Найдите среднюю зарплату сотрудников в каждом департаменте. Выведите название департамента и среднюю зарплату
select dep.departmentName, avg(salary) as avg_deparment_salary
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentID;

-- 2. Определите количество сотрудников в каждом департаменте. Выведите название департамента и количество сотрудников.
select dep.departmentName, count(emp.employeeID) as emp_quantity
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentID;

-- 3. Найдите минимальную и максимальную зарплаты в каждом департаменте. 
select min(emp.salary) as min_salary, max(emp.salary) as max_salary
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentID;

-- Выведите название департамента, минимальную и максимальную зарплату.
select dep.departmentName, min(emp.salary) as min_salary, max(emp.salary) as max_salary
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentID;

-- 4. Определите общую сумму зарплат в каждом департаменте. Выведите название департамента и общую сумму зарплат.
select dep.departmentName, sum(emp.salary) as sum_salary
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentID;

-- 5. Вывести ID департамента с самой высокой средней зарплатой сотрудников.
select dep.departmentID, avg(emp.salary) as avg_dep_salary
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentID
order by avg_dep_salary desc
limit 1;

-- 6. Вывести имя департамента с самой высокой средней зарплатой сотрудников.


select dep.departmentName
from departments as dep
where dep.departmentID = (select emp.departmentID
    from employees as emp
    group by emp.departmentID
    order by avg(emp.salary) desc
    limit 1);


-- 7. Выведите имя, фамилию и зарплату сотрудников, чья зарплата выше средней по их департаменту.
select emp.firstName, emp.lastName, emp.salary
from employees as emp
join (select departmentID, avg(salary) as avg_salary
    from employees
    group by departmentID) as avg_salaries
on emp.departmentID = avg_salaries.departmentID
where emp.salary > avg_salaries.avg_salary;


-- 8. Найдите проект с наибольшим количеством сотрудников, проработавших на нем больше 100 часов. Вывести ProjectName.

-- ЕЩЕ В ПРОЦЕССЕ :)
select pj.projectName 
from projects as pj
join employeeProjects as empPj
on empPj.projectID = pj.projectID
join (select projectID
	from employeeProjects
    where hoursWorked > 100) as moreThen100
on pj.projectID =  moreThen100.projectID
group by pj.projectID;

-- 9. Найдите департамент с наименьшим количеством сотрудников. Выведите название департамента и количество сотрудников.


-- 10. Определите департамент с наибольшим суммарным бюджетом проектов, на которых работают его сотрудники.


-- 10.1. Вывести ид департамента, имена и фамилии сотрудников, имена проектов и их бюджет.


-- 10.2. Вывести ид депатамента и сумма бюджета проектов по департаментам.


-- 10.3. Вывести маскимальную сумму бюджета проектов по департаментам.


-- 10.4. Вывести ид депатамента с максимальной суммой бюджета проектов по департаментам.


-- 10.5. Вывести имя депатамента с максимальной суммой бюджета проектов по департаментам.


-- 11. Найдите сотрудников, которые работают в департаменте с самой большой суммарной зарплатой среди всех департаментов.

