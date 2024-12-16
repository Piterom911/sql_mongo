use hr;

SELECT first_name, last_name, department_name 
FROM employees as emp
join departments as dep
on emp.department_id = dep.department_id;

select * from departments;
select * from employees
order by department_id;

select first_name, last_name, department_name
from employees as emp
left join departments as dep
on emp.department_id = dep.department_id;

select first_name, last_name, department_name
from departments as dep
right join employees as emp
on emp.department_id = dep.department_id;

select first_name, last_name, department_name
from employees as emp
left join departments as dep
on emp.department_id = dep.department_id
where department_name is null;

select department_name, emp.*
from departments as dep
left join employees as emp
on dep.department_id = emp.department_id
where emp.email is null;

select country_name, city 
from countries as cnt
left join locations as loc
on cnt.country_id = loc.country_id;

select country_name 
from countries as cnt
left join locations as loc
on cnt.country_id = loc.country_id
where loc.city is null;

select city 
from departments as dep
right join locations as loc
on dep.location_id = loc.location_id
where dep.department_id is null;

select cnt.country_name, loc.city
from countries as cnt
join locations as loc
on cnt.country_id = loc.country_id
left join departments as dep
on loc.location_id = dep.location_id
where dep.department_id is null;

select first_name, last_name, job_title
from employees as emp
join jobs as jb
on emp.job_id = jb.job_id
left join departments as dep
on emp.department_id = dep.department_id
where dep.department_id is null;

select * from employees;
select * from jobs;
select * from departments;







