create database gt130824;
use gt130824;
create table students(
id int primary key auto_increment, 
firstname varchar(60) not null,
lastname varchar(100) not null,
class int check(class between 1 and 10),
subject_name varchar(60) not null,
mark int check(mark between 0 and 5),
school_no int default 0,
checked char(1) check(checked in ('Y', 'N'))
);

INSERT INTO students (firstname, lastname, class, subject_name, mark, school_no, checked)
VALUES ("John", "Johnson", 3, "SQL", 5, 130824, "Y"), 
("Sarah", "Connor", 5, "AI", 4, 130824, "N");

INSERT INTO students (firstname, lastname, class, subject_name, mark, school_no, checked)
VALUES ("Arnold", "Schwarzneger", 8, "T-800", 2, 130824, "N"), 
("Amerigo", "Vespucci", 9, "Earth", 3, 130824, "Y");

SELECT * FROM students;
