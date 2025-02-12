-- 1. Найдите среднюю зарплату сотрудников в каждом департаменте. Выведите название департамента и среднюю зарплату
select dep.departmentName, avg(salary) as avg_deparment_salary
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentName;

select dep.departmentName, dep_id_avg_salary.avg_salary
from departments as dep
join (select DepartmentID, avg(salary) as avg_salary
		from employees
        group by DepartmentID) as dep_id_avg_salary
on dep.departmentID = dep_id_avg_salary.DepartmentID;


-- 2. Определите количество сотрудников в каждом департаменте. Выведите название департамента и количество сотрудников.
select dep.departmentName, count(emp.employeeID) as emp_quantity
from employees as emp
join departments as dep
on dep.departmentID = emp.departmentID
group by dep.departmentName;


-- 3. Найдите минимальную и максимальную зарплаты в каждом департаменте. 
select dep.departmentName, min(emp.salary) as min_salary, max(emp.salary) as max_salary
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
group by dep.departmentName;

select dep.departmentName, emp_salary_sum.salary_sum
from departments as dep
join (select DepartmentID, sum(salary) as salary_sum
		from employees
        group by DepartmentID) as emp_salary_sum
on dep.departmentID = emp_salary_sum.DepartmentID;


-- 5. Вывести ID департамента с самой высокой средней зарплатой сотрудников.
select departmentID, avg(salary) as avg_dep_salary
from employees
group by departmentID
order by avg_dep_salary desc
limit 1;

-- 5. Вывести ID департамента с самой высокой средней зарплатой сотрудников.
select departmentID, avg(salary) as avg_salary
from employees
group by DepartmentID
order by avg_salary desc
limit 1;

-- Первый подзапрос
select departmentID, avg(salary) as avg_salary
from employees
group by DepartmentID;

-- Второй подзапрос - максимальная средняя зарплата
select max(emp_avg_salary.avg_salary)
from (select departmentID, avg(salary) as avg_salary
		from employees
		group by DepartmentID) as emp_avg_salary;

-- Решение
select departmentID, avg(salary) as avg_salary
from employees
group by DepartmentID
having avg_salary = (select max(emp_avg_salary.avg_salary)
					from (select departmentID, avg(salary) as avg_salary
							from employees
							group by DepartmentID) as emp_avg_salary);


-- 6. Вывести имя департамента с самой высокой средней зарплатой сотрудников.
select dep.departmentName
from departments as dep
where dep.departmentID = (select emp.departmentID
    from employees as emp
    group by emp.departmentID
    order by avg(emp.salary) desc
    limit 1);

select departmentName
from departments as dep
join (select departmentID, avg(salary) as avg_salary
		from employees
		group by DepartmentID
		having avg_salary = (select max(emp_avg_salary.avg_salary)
							from (select departmentID, avg(salary) as avg_salary
									from employees
									group by DepartmentID) as emp_avg_salary)) as max_avg_salary
on dep.departmentID = max_avg_salary.DepartmentID;


-- 7. Выведите имя, фамилию и зарплату сотрудников, чья зарплата выше средней по их департаменту.
select emp.firstName, emp.lastName, emp.salary
from employees as emp
join (select departmentID, avg(salary) as avg_salary
    from employees
    group by departmentID) as avg_salaries
on emp.departmentID = avg_salaries.departmentID
where emp.salary > avg_salaries.avg_salary;


-- 8. Найдите проект с наибольшим количеством сотрудников, проработавших на нем больше 100 часов. Вывести ProjectName.
select p.ProjectName
from projects as p
join employeeprojects as ej
on p.ProjectID = ej.ProjectID
where HoursWorked > 100
group by p.ProjectID
order by count(EmployeeID) desc
limit 1;

-- Ид проекта и кол/во сотрудников, которые поработали больше 100 часов.
select projectID, count(employeeID) as emp_count
from employeeprojects
where HoursWorked > 100
group by ProjectID;

-- Максимальное кол/во сотрудников, ...
select max(proj_emp_count.emp_count) as max_emp_count
from (select projectID, count(employeeID) as emp_count
		from employeeprojects
		where HoursWorked > 100
		group by ProjectID) as proj_emp_count;
        
-- Ид проекта с максимальным кол/вом сотрудников.        
select projectID, count(employeeID) as emp_count
from employeeprojects
where HoursWorked > 100
group by ProjectID
having emp_count = (select max(proj_emp_count.emp_count) as max_emp_count
					from (select projectID, count(employeeID) as emp_count
							from employeeprojects
							where HoursWorked > 100
							group by ProjectID) as proj_emp_count);


-- 9. Найдите департамент с наименьшим количеством сотрудников. Выведите название департамента и количество сотрудников.
select dep.departmentName, count(emp.employeeID) as countedEmp
from departments as dep
join employees as emp
on dep.departmentID = emp.DepartmentID
group by dep.DepartmentName
order by countedEmp asc
limit 1;

-- second versoin
select dep.departmentName, count(emp.employeeID) as countedEmp
from departments as dep
left join employees as emp on dep.departmentID = emp.departmentID
group by dep.departmentID, dep.departmentName
having count(emp.employeeID) = (
    select min(emp_count)
    from (
        select count(employeeID) as emp_count
        from employees
        group by departmentID) as subquery);
        
-- third versoin
select departmentName
from departments as dep
join (select departmentID, count(employeeID) as emp_count_by_dep_id
		from employees
		group by DepartmentID
		having emp_count_by_dep_id = (select min(dep_emp_count.emp_count) as min_emp_count
										from (select departmentID, count(employeeID) as emp_count
												from employees
												group by DepartmentID) as dep_emp_count)) as emp_count_dep_if_table
on dep.departmentID = emp_count_dep_if_table.departmentID;


-- 10. Определите департамент с наибольшим суммарным бюджетом проектов, на которых работают его сотрудники.
-- 10.1. Вывести ид департамента, имена и фамилии сотрудников, имена проектов и их бюджет.
select emp.departmentID, emp.firstname, emp.lastname, proj.projectName, proj.budget
from employees as emp
join employeeprojects as emp_proj
on emp.EmployeeID = emp_proj.EmployeeID
join projects as proj
on emp_proj.ProjectID = proj.ProjectID;


-- 10.2. Вывести ид депатамента и сумма бюджета проектов по департаментам.
select emp.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
from employees as emp
join (select emp.departmentID, proj.projectName, proj.budget
		from employees as emp
		join employeeprojects as emp_proj
		on emp.EmployeeID = emp_proj.EmployeeID
		join projects as proj
		on emp_proj.ProjectID = proj.ProjectID
		group by emp.departmentID, proj.projectName, proj.budget) as dep_proj_budget
on emp.DepartmentID = dep_proj_budget.DepartmentID
group by emp.DepartmentID;

-- 10.3. Вывести маскимальную сумму бюджета проектов по департаментам.
select max(sum_budget_by_dep.dep_sum_budget) as max_dep_sum_budget
from (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
		from (select emp.departmentID, proj.projectName, proj.budget
				from employees as emp
				join employeeprojects as emp_proj
				on emp.EmployeeID = emp_proj.EmployeeID
				join projects as proj
				on emp_proj.ProjectID = proj.ProjectID
				group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
		group by dep_proj_budget.DepartmentID) as sum_budget_by_dep;

-- 10.4. Вывести ид депатамента с максимальной суммой бюджета проектов по департаментам.
select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
from (select emp.departmentID, proj.projectName, proj.budget
		from employees as emp
		join employeeprojects as emp_proj
		on emp.EmployeeID = emp_proj.EmployeeID
		join projects as proj
		on emp_proj.ProjectID = proj.ProjectID
		group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
group by dep_proj_budget.DepartmentID
having dep_sum_budget = (select max(sum_budget_by_dep.dep_sum_budget) as max_dep_sum_budget
						from (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
								from (select emp.departmentID, proj.projectName, proj.budget
										from employees as emp
										join employeeprojects as emp_proj
										on emp.EmployeeID = emp_proj.EmployeeID
										join projects as proj
										on emp_proj.ProjectID = proj.ProjectID
										group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
								group by dep_proj_budget.DepartmentID) as sum_budget_by_dep);
                                

-- 10.5. Вывести имя депатамента с максимальной суммой бюджета проектов по департаментам.
select departmentname
from departments as dep
join (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
		from (select emp.departmentID, proj.projectName, proj.budget
				from employees as emp
				join employeeprojects as emp_proj
				on emp.EmployeeID = emp_proj.EmployeeID
				join projects as proj
				on emp_proj.ProjectID = proj.ProjectID
				group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
		group by dep_proj_budget.DepartmentID
        having dep_sum_budget = (select max(sum_budget_by_dep.dep_sum_budget) as max_dep_sum_budget
								from (select dep_proj_budget.DepartmentID, sum(dep_proj_budget.budget) as dep_sum_budget
										from (select emp.departmentID, proj.projectName, proj.budget
												from employees as emp
												join employeeprojects as emp_proj
												on emp.EmployeeID = emp_proj.EmployeeID
												join projects as proj
												on emp_proj.ProjectID = proj.ProjectID
												group by proj.ProjectName, emp.DepartmentID, proj.budget) as dep_proj_budget
										group by dep_proj_budget.DepartmentID) as sum_budget_by_dep)) as table2
on dep.departmentid = table2.DepartmentID;


-- 11. Найдите сотрудников, которые работают в департаменте с самой большой суммарной зарплатой среди всех департаментов.
select firstname, lastname
from employees as table1
join (select DepartmentID, sum(salary) as dep_total_salary 
		from employees
		group by DepartmentID
		having dep_total_salary = (select max(total_salary_by_dep.dep_total_salary) as max_dep_total_salary
									from (select DepartmentID, sum(salary) as dep_total_salary 
											from employees
											group by DepartmentID) total_salary_by_dep)) as table2
on table1.DepartmentID = table2.DepartmentID;
