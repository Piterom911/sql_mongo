-- DDL data definition language CREATE, DROP, ALTER, TRUNCATE
-- DML data manupulation language SELECT, INSERT, UPDATE, DELETE

create database students;
use students;

create table people (
	name varchar(128),
    age integer
);

insert into people (name, age) values ("Alex", 25), ("Oleg", 30),("Max", 55);

SELECT * FROM people;

SET SQL_SAFE_UPDATES = 0;

UPDATE people
SET age = 35
WHERE name = "Oleg"; 

UPDATE people
SET age = age + 5; 

TRUNCATE TABLE people; -- reset all data
DELETE FROM people;    -- can be restored 

ALTER TABLE people
RENAME TO people_two;

SELECT * FROM people_two;

ALTER TABLE people_two
RENAME TO people;

SELECT * FROM people;

ALTER TABLE people
ADD COLUMN rate INTEGER DEFAULT 0;

ALTER TABLE people
MODIFY COLUMN age INTEGER NOT NULL;

UPDATE people 
SET rate  = 0 
WHERE rate IS NULL;

insert into people (name) values ('Egor');

SET SQL_SAFE_UPDATE = 1;








