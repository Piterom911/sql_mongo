-- one line comment

/* 
multiple line commetn

CRUD

CREATE - create table, create database
READ - select
UPDATE - alter table, update
DELETE - drop database, drop table, delete
*/

/*
SELECT

SELECT field1, field2 
FROM table_name; 
*/

-- get all customers
-- SELECT * FROM customers;

-- get names and lastnames of all customers
-- SELECT first_name, last_name FROM customers;

-- SELECT * FROM customers WHERE age > 20 AND country == "USA"

-- SELECT * FROM orders WHERE amount > 1000
-- SELECT customer_id, item FROM orders
-- SELECT item FROM orders WHERE amount between 400 and 1000

-- SELECT * FROM customers WHERE country in("USA", "UK")

-- SELECT * FROM customers WHERE first_name like "%oh%" or first_name like "%tt%"
-- SELECT * FROM customers WHERE age > 20 and last_name like "d%"
-- SELECT * FROM customers WHERE age between 20 and 30 or first_name like "b%" or country == "USA"

SELECT * FROM customers WHERE customer_id in(2,3) and age > 20
