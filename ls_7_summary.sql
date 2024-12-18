-- Создать базу данных university
-- 1) Создать таблицу Students
-- с полями:
-- - id целое число первичный ключ автоинкремент
-- - name строка 128 не null
-- - age целое число

create database university;
use university;

create table Students(
	id integer primary key auto_increment,
	name varchar(128) not null,
	age integer
);

-- 2) Создать таблицу Teachers
-- с полями:
-- id целое число первичный ключ автоинкремент
-- name строка 128 не null
-- age целое число

create table Teachers(
	id integer primary key auto_increment,
	name varchar(128) not null,
	age integer
);

-- 3) Создать таблицу Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- title строка 128 не null

create table Competencies(
	id integer primary key auto_increment,
	title varchar(128) not null
);

-- 4) Создать таблицу Teachers2Competencies
-- с полями:
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- competencies_id целое число

create table Teachers2Competencies(
	id integer primary key auto_increment,
	teacher_id integer,
	competencies_id integer
);

-- 5) Создать таблицу Courses
-- id целое число первичный ключ автоинкремент
-- teacher_id целое число
-- title строка 128 не null
-- headman_id целое число

create table Courses(
	id integer primary key auto_increment,
	teacher_id integer,
	title varchar(128) not null,
	headman_id integer
);

-- 6)Создать таблицу Students2Courses
-- id целое число первичный ключ автоинкремент
-- student_id целое число
-- course_id целое число

create table Students2Courses(
	id integer primary key auto_increment,
	student_id integer,
	course_id integer
);

INSERT INTO Students (name, age) VALUES
	('Анатолий', 29),
	('Олег', 25),
	('Семен', 27),
	('Олеся', 28),
	('Ольга', 31),
	('Иван', 22);
    
INSERT INTO Teachers (name, age) VALUES
	('Петр', 39),
	('Максим', 35),
	('Антон', 37),
	('Всеволод', 38),
	('Егор', 41),
	('Светлана', 32);
    
INSERT INTO Competencies (title) VALUES
	('Математика'),
	('Информатика'),
	('Программирование'),
	('Графика');

INSERT INTO Teachers2Competencies (teacher_id, competencies_id) VALUES
	(1, 1),
	(2, 1),
	(2, 3),
	(3, 2),
	(4, 1),
	(5, 3);
    
INSERT INTO Courses (teacher_id, title, headman_id) VALUES
	(1, 'Алгебра логики', 2),
	(2, 'Математическая статистика', 3),
	(4, 'Высшая математика', 5),
	(5, 'Javascript', 1),
	(5, 'Базовый Python', 1);

INSERT INTO Students2Courses (student_id, course_id) VALUES
	(1, 1),
	(2, 1),
	(3, 2),
	(3, 3),
	(4, 5);


select * from Students;
select * from Teachers;
select * from Competencies;
select * from Courses;
select * from Students2Courses;
select * from Teachers2Competencies;

select name, title
from Teachers as t
join Teachers2Competencies as t2c
on t.id = t2c.teacher_id
join Competencies as c
on t2c.competencies_id = c.id;

-- Найти преподавателя(name), у которого нет компетенций
select name
from teachers as t
left join Teachers2Competencies as t2c
on t.id = t2c.teacher_id
where t2c.competencies_id is null;

select name
from teachers as t
left join Teachers2Competencies as t2c
on t.id = t2c.teacher_id
where t2c.teacher_id is null;

