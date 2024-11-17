create database summary_2;
use summary_2;

create table staff (
id int primary key auto_increment,
firstname varchar(60) not null,
lastname varchar(100) not null,
position varchar(100),
age int check(age between 0 and 110),
has_child char(1) check(has_child in ('Y', 'N')),
username varchar(100) unique not null
);

-- INSERT INTO staff (firstname, lastname, position, age, has_child, username)
-- VALUES ("John", "Johnson", "Developer", 45, "Y", "johnny"), 
-- ("Sarah", "Connor", "Fighter", 15, "N", "sarah911");

-- INSERT INTO staff (firstname, lastname, position, age, has_child, username)
-- VALUES ("Arnold", "Schwarzneger", "Terminator", 105, "N", "t800"), 
-- ("Amerigo", "Vespucci", "Researcher", 35, "Y", "liberty");

INSERT INTO staff (firstname, lastname, position, age, has_child, username)
VALUES ('Ally' , 'Austin' , 'Junior UI Designer' , 28 , 'N' , 'ally1' );

INSERT INTO staff (firstname, lastname, position, age, has_child, username)
VALUES ('Daniel', 'Faviet', 'Senior UX Designer', 43, 'Y', 'favietD');

INSERT INTO staff (firstname, lastname, position, age, has_child, username)
VALUES ('Lily', 'Chen', 'Senior Teacher', 25, 'Y', 'lilychen');

select * from staff;

-- Доп. задания.

-- Найти ошибку в коде:
-- insert into staff (firstname, lastname, age, has_child, username)
-- values ('Dave', 'Faviet', 23, 'YY', 'favietDv');                    ===> Y

-- Создать и активировать базу данных tasks.

CREATE DATABASE tasks;
use tasks;

CREATE TABLE employees(
employee_id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(128), 
last_name VARCHAR(128), 
job VARCHAR(50) NOT NULL, 
age INT CHECK(age > 18), 
has_car CHAR(1) CHECK( has_car IN('Y', 'N')) DEFAULT 'N', 
user_name VARCHAR(128) UNIQUE NOT NULL
);

INSERT INTO employees (first_name, last_name, job, age, has_car, user_name)
VALUES ("John", "Johnson", "Mechanic", 43, 'Y', "Iron man");
INSERT INTO employees (first_name, last_name, job, age, user_name)
VALUES ("Sarah", "Willson", "Teacher", 22, "LadyKnoleg");
INSERT INTO employees (first_name, last_name, job, age, has_car, user_name)
VALUES ("Will", "Smith", "Singer", 37, 'Y', "SadMan");
INSERT INTO employees (first_name, last_name, job, age, user_name)
VALUES ("Klaudia", "Cherepicca", "Actress", 88, "SaintOldy");
INSERT INTO employees (first_name, last_name, job, age, has_car, user_name)
VALUES ("Barak", "Obama", "President", 55, 'Y', "TheFirstMan");

SELECT * FROM employees;

DROP TABLE employees;
DROP DATABASE tasks;