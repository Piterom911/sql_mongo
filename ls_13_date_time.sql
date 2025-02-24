create database date_time;
use date_time;

-- Работа с датой и временем

-- yyyy-mm-dd
-- yyyy-m-dd
-- yy-m-dd

-- hh:mm:ss

-- DATE: хранит даты с 1 января 1000 года до 31 деабря 9999 года (c "1000-01-01" до "9999-12-31").
-- По умолчанию для хранения используется формат yyyy-mm-dd. Занимает 3 байта.

-- TIME: хранит время от -838:59:59 до 838:59:59. По умолчанию для хранения времени применяется формат "hh:mm:ss". 
-- Занимает 3 байта.

-- DATETIME: объединяет время и дату, диапазон дат и времени - с 1 января 1000 года по 31 декабря 9999 года 
-- (с "1000-01-01 00:00:00" до "9999-12-31 23:59:59"). Для хранения по умолчанию используется формат "yyyy-mm-dd hh:mm:ss". 
-- Занимает 8 байт

-- TIMESTAMP: также хранит дату и время, но в другом диапазоне: от "1970-01-01 00:00:01" UTC до "2038-01-19 03:14:07" UTC.
--  Занимает 4 байта

-- YEAR: хранит год в виде 4 цифр. Диапазон доступных значений от 1901 до 2155. Занимает 1 байт.


-- create table test_table1(
-- id int primary key auto_increment,
--     full_name varchar(128),
--     hire_date date
-- );


-- Функции для работы с датой и временем

-- текущая дата и время
select now();
select sysdate();
select current_timestamp();

-- текущая дата
select curdate();
select current_date();

-- текущее время
select curtime();
select current_time();

-- Парсинг даты и времени

-- '2024-08-25'

select dayofmonth('2024-08-25'); -- возвращает день месяца в виде числового значения
select dayofweek('2024-08-25'); -- возвращает день недели в виде числового значения (1 - sunday)
select dayofyear('2024-08-25'); -- возвращает номер дня в году
select dayofmonth(curdate());

create database employees_wd;
use employees_wd;

CREATE TABLE employees (
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR (20) DEFAULT NULL,
	last_name VARCHAR (25) NOT NULL,
	email VARCHAR (100) NOT NULL,
	phone_number VARCHAR (20) DEFAULT NULL,
	hire_date DATE NOT NULL,
	job_id INT NOT NULL,
	salary DECIMAL (8, 2) NOT NULL,
	manager_id INT DEFAULT NULL,
	department_id INT DEFAULT NULL
);

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);



-- ----------------------------------------------------------------------------------------------------------------------------------------

-- Вывести тех сотрудников, которых приняли на работу 23 числа.
select * 
from employees
where dayofmonth(hire_date) = 23;

select first_name, last_name, hire_date, dayofmonth(hire_date)
from employees;


select month('2024-08-25'); -- возвращает месяц даты

-- Вывести сотрудников, которых приняли на работу в августе
select *
from employees
where month(hire_date) = 8;

select year('2024-08-25'); -- возвращает год из даты

-- WEEK(date [, first]) возвращает номер недели года. Необязательный параметр позволяет задать стартовый день недели. 
-- Если этот параметр равен 1, то первым днем считается понедельник, иначе воскресенье
select week('2024-05-23'); -- 20
select week('2024-05-23', 1); -- 21

select dayname('2024-08-25'); -- возвращает название дня недели

select monthname('2024-08-25'); -- возвращает название текущего месяца

-- Вывести сотрудников, которых приняли на работу в августе
select *
from employees
where monthname(hire_date) = 'August';

select hour('10:34:26'); -- возвращает час времени
select minute('10:34:26'); -- возвращает минуту времени
select second('10:34:26'); -- возвращает секунду времени

-- Функция EXTRACT извлекает из даты и времени какой-то определенный компонент.
-- extract(param from datetime/timestamp)

-- Значения param:
-- SECOND (секунды)
-- MINUTE (минуты)
-- HOUR (час)
-- DAY (день)
-- MONTH (месяц)
-- YEAR (год)
-- MINUTE_SECOND (минуты и секунды)
-- HOUR_MINUTE (часы и минуты)
-- DAY_HOUR (день и часы)
-- YEAR_MONTH (год и месяц)
-- HOUR_SECOND (часы, минуты и секунды)
-- DAY_MINUTE (день, часы и минуты)
-- DAY_SECOND (день, часы, минуты и секунды)

select extract(day from '2024-05-25 10:54:20'); -- 25
select extract(day_hour from '2024-05-25 10:54:20'); -- 2510

select concat(left(extract(day_hour from '2024-05-25 10:54:20'), 2), ' ', right(extract(day_hour from '2024-05-25 10:54:20'), 2));

-- Вывести из даты день, месяц и год в формате 'dd mm yyyy'
select concat_ws(' ', extract(day from '2024-05-25 10:54:20'), extract(month from '2024-05-25 10:54:20'), extract(year from '2024-05-25 10:54:20'));

-- Форматирование дат и времени

-- date_format(date/datetime, format) -- возвращает объект DATE или DATETIME, отформатированный с помощью шаблона format
-- time_format(time/datetime, format) -- возвращает объект TIME или DATETIME, отформатированный с помощью шаблона format

-- Значеиня format:
	-- %m: месяц 01-12
	-- %c: месяц 1-12
    -- %M: название месяца(January...December)
    -- %b: аббревиатура месяца (Jan..Dec)
    
    -- %d: день месяца 01..31
    -- %e: день месяца 1...31
    -- %D: номер дня месаца (1st, 2nd, 3rd...)
    
    -- %y: год в виде двух цифр yy
    -- %Y: год в виде четырех цифр yyyy
    
    -- %W: название дня недели(Sunday...Saturday)
    -- %a: аббревиатура дня недели(Sun..Sat)
    
    -- %H: час 00..23
	-- %k: час 0..23
    -- %h: час 01..12
    -- %l: час  1..12
    -- %p: AM/PM

	-- %i: минуты 00..59
    -- %S: секунды 00..59
    
    -- %r: время в 12-ти часавом формате (hh:mm:ss AM/PM)
    -- %T: время в 12-ти часавом формате (hh:mm:ss)
    
    select first_name, last_name
    from employees
    where extract(YEAR_MONTH from hire_date) = '199804';
    
select first_name, last_name, hire_date
from employees
order by hire_date;


select extract(YEAR_MONTH from hire_date) from employees;
-- yyyy-mm-dd -> dd mm yy    
select date_format('2024-05-25', '%d %m %y');

-- yyyy-mm-dd -> Day - dd, Month - mm, Year - yyyy
select date_format('2024-05-25', 'Day - %d, Month - %m, Year - %Y');

-- Вывести имена и фамилии фотрудников, даты когда приняли на работу в формате 'dd - mm - yyyy'
select first_name, last_name, date_format(hire_date, '%d - %m - %Y') as hire_date
from employees;


-- hh:mm:ss -> h-mm-ss
select time_format('09:28:30', '%k-%i-%S');

-- hh:mm:ss - > hh:mm:ss AM/PM
select time_format('09:28:30', '%r');

-- str_to_date(string, format) - из сторки возвращает дату в формате yyyy-mm-dd
-- string - Строка, которая будет отформатирована до даты
-- format - Может быть одно или комбинация значений из списка данных format, которые соответствуют строке.

select str_to_date('February 20 2025', '%M %d %Y'); -- 2025-02-20
select str_to_date('2nd-Jan-2024', '%D-%b-%Y'); -- 2024-01-02

-- '1998 Nov 5' -> 5/11/98
select date_format(str_to_date('1998 Nov 5', '%Y %b %e'), '%e/%m/%y');
select date_format(str_to_date('23 August 99','%e %M %y'), '%e %m %Y');

-- Вывести имена и фамилии сотрудников, которых приняли на работу в апреле 1998 года.
select first_name, last_name
from employees
where month(hire_date) = 4 and year(hire_date) = 1998;

select first_name, last_name, extract(year_month from hire_date)
from employees
where extract(year_month from hire_date) = 199804;

select first_name, last_name
from employees
where date_format(hire_date, '%c %Y') = '4 1998';

-- Вывести сотрудников, которых приняли на работу в интервале от 1 марта 1998 до 10 апреля 2001.
select first_name, last_name, hire_date
from employees
where hire_date between '1998-03-01' and '2001-04-10';

-- Вывести кол/во сотурников, которых приняли на работу 1997.
select count(employee_id)
from employees
where year(hire_date) = 1997;

-- Определить сколько сотрудников приняли на работу в каждый месяц 1998 года. Вывести название месяца и кол/во сотрудников.
select monthname(hire_date), count(employee_id)
from employees
where year(hire_date) = 1998
group by monthname(hire_date);






