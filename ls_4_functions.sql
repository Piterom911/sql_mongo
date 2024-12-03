-- alter table table_name
-- add column column_name column_type [constraint],
-- drop column column_name,
-- modify column column_name new_data_type,
-- change column column_name new_column_name data_type;


-- set sql_safe_updates = 0;

-- update table_name
-- set column = new_value
-- where ...;

-- delete from table_name
-- where ...;


-- set sql_safe_updates = 1;

use gt130824;
drop table employees;

 create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
 
 select first_name, last_name 
 from employees
 order by first_name;
 
 select * from employees
 order by salary desc;
 
 select * from employees
 where first_name like "k%"
 order by last_name;
 
 select first_name, last_name, salary
 from employees
 where salary > 5000
 order by salary asc;
 
 select * from employees 
 limit 3;
 
 select * from employees 
 limit 3, 5;
 
 select * from employees 
 where department = 'IT'
 limit 3;
 
 select * from employees 
 where department = 'IT'
 order by salary desc
 limit 4;
 
 select * from employees 
 order by salary asc
 limit 1;
 
 select * 
 from employees 
 where first_name like 'A%'
 order by salary
 limit 3;
 
 select first_name as name, last_name as surname
 from employees;
 
 select salary, salary - (salary * .1) as new_salary
 from employees;
 
 select 5 as some_number, "Hello" as some_text;
 
 -- Math
 
 select round(12.35);
 select round(12.5);
 select round(12.3456785, 2);
 
 select ceiling(12.35);
 
 select floor(12.9);
 
 select round(salary - .123) as new_salary_data from employees;
 
 select abs(-12);
 
 select power(5, 2);
 select power(5, 3);
 
 select sqrt(225);
 
 select round(rand() * 10);
 
 
 -- Strings
 select concat('John', ' ', 'Smith');
 
 select concat(first_name, ' ', last_name) as full_name
 from employees;
 
 select concat(first_name, ' ', last_name) as full_name
 from employees;
 
 select length('John Smith');
 
 select trim('  John Smith   ');
 
 select left('telephone', 4);
 select right('telephone', 4); -- not often
 
 select substring('Some text should be here to be able to read substring form this', 17);
 select substring('Some text should be here to be able to read substring form this', 10, 15);
 
 select substring_index('Some text should be here to be able to read substring form this', ' ', 2);
 select substring_index('Some text should be here to be able to read substring form this', ' ', -2);
 
  select replace(upper('Some text should be here to be able to read substring form this'), 'SOME', 'THIS');
  select replace(department, 'Human Resources', 'HR') as department
  from employees;
  
  select reverse(lower('JOHN'));
  
  alter table employees
  add column full_name varchar(100);
  
  set sql_safe_updates = 0;
  
  update employees
  set full_name = concat(first_name, ' ', last_name);
  
  alter table employees
  add column new_department varchar(128);
  
  update employees
  set new_department = CASE 
    WHEN department = 'Human Resources' THEN 'HR'
    WHEN department = 'IT' THEN 'Internet Technologies'
    ELSE department
END;

select lower(left(email, 4)) from employees;
  
  select * from employees;
  
  
 
