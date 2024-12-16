-- select * from employees;
-- select * from departments;
-- select * from jobs;

-- select first_name, last_name, department_name, job_title
-- from employees as emp
-- join departments as dep
-- on emp.department_id = dep.department_id
-- join jobs as jb
-- on emp.job_id = jb.job_id;

-- CREATE DATABASE store;
-- USE store;

-- -- Таблица клиентов
-- CREATE TABLE customers (
--     customer_id INT PRIMARY KEY AUTO_INCREMENT,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100)
-- );

-- -- Таблица товаров
-- CREATE TABLE products (
--     product_id INT PRIMARY KEY AUTO_INCREMENT,
--     product_name VARCHAR(100),
--     price DECIMAL(10, 2),
--     category_id INT
-- );

-- -- Таблица категорий товаров
-- CREATE TABLE categories (
--     category_id INT PRIMARY KEY AUTO_INCREMENT,
--     category_name VARCHAR(100)
-- );

-- -- Таблица заказов
-- CREATE TABLE orders (
--     order_id INT PRIMARY KEY AUTO_INCREMENT,
--     customer_id INT,
--     order_date DATE,
--     total DECIMAL(10, 2)
-- );

-- -- Таблица деталей заказа
-- CREATE TABLE order_items (
--     order_item_id INT PRIMARY KEY AUTO_INCREMENT,
--     order_id INT,
--     product_id INT,
--     quantity INT,
--     price DECIMAL(10, 2)
-- );


-- -- Заполнение таблицы клиентов
-- INSERT INTO customers (first_name, last_name, email) VALUES
-- ('John', 'Doe', 'john@example.com'),
-- ('Jane', 'Smith', 'jane@example.com'),
-- ('Alice', 'Johnson', 'alice@example.com'),
-- ('Bob', 'Brown', 'bob@example.com'),
-- ('Ben', 'King', 'ben@example.com'),
-- ('Mike', 'Cors', 'mike@example.com'),
-- ('Jack', 'Smith', 'jack@example.com'),
-- ('Emma', 'King', 'emma@example.com');

-- -- Заполнение таблицы категорий товаров
-- INSERT INTO categories (category_name) VALUES
-- ('Electronics'),
-- ('Furniture'),
-- ('Clothing'),
-- ('Toys');

-- -- Заполнение таблицы товаров
-- INSERT INTO products (product_name, price, category_id) VALUES
-- ('Laptop', 1000.00, 1),
-- ('Table', 150.00, 2),
-- ('T-shirt', 20.00, 3),
-- ('Bed', 100.00, 2),
-- ('Phone', 1520.00, 1),
-- ('Skirt', 50.00, 3);

-- -- Заполнение таблицы заказов
-- INSERT INTO orders (customer_id, order_date, total) VALUES
-- (1, '2024-09-10', 1020.00),
-- (2, '2024-09-12', 170.00),
-- (3, '2024-09-09', 70.00),
-- (4, '2024-08-09', 1520.00);

-- -- Заполнение таблицы деталей заказа
-- INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
-- (1, 1, 1, 1000.00),
-- (1, 3, 1, 20.00),
-- (2, 2, 1, 150.00),
-- (2, 3, 1, 20.00),
-- (3, 3, 1, 20.00),
-- (3, 6, 1, 50.00),
-- (4, 5, 1, 1520.00);

-- Таблица orders связана с таблицей customers через поле customer_id (один клиент может сделать несколько заказов).
-- Таблица order_items связана с таблицей orders через поле order_id (каждый заказ может содержать несколько товаров).
-- Таблица order_items также связана с таблицей products через поле product_id (каждый заказ может включать различные товары).
-- Таблица products связана с таблицей categories через поле category_id (каждый товар относится к одной категории).

-- 1. Вывести список категорий(category_name) и товаров(product_name), которые относятся к этим категориям.
select category_name, product_name
from categories as cat
join products as pro
on cat.category_id = pro.category_id;

-- 2. Получить список всех товаров(product_name), включённых в заказы, с указанием их цен(price) и категорий(category_name).
select product_name, price, category_name
from products as pro
join categories as cat
on cat.category_id = pro.category_id;

-- 3. Найти заказы, содержащие товар "Laptop". Вывести order_id, order_date, first_name, last_name.
select or2.order_id, order_date, first_name, last_name
from order_items as or1
join orders as or2
on or1.order_id = or2.order_id
join customers as cus
on or2.customer_id = cus.customer_id
join products as pro
on pro.product_id = or1.product_id
where product_name = 'Laptop';

-- 4. Вывести даты заказов(order_date) и имена клиентов(first_name, last_name), которые их сделали.
select order_date, first_name, last_name
from orders as or2
join customers as cus
on or2.customer_id = cus.customer_id;

-- 5. Вывести названия товаров(product_name), которые заказывал клиент с фамилией 'Smith'.
select product_name
from products as pro
join order_items as or1
on pro.product_id = or1.product_id
join orders as or2
on or1.order_id = or2.order_id
join customers as cus
on or2.customer_id = cus.customer_id
where last_name = 'Smith';

-- 6. Найти имена и фамилии клиентов, которые купили товары из категории "Electronics".
select first_name, last_name
from customers as cus
join orders as or2
on cus.customer_id = or2.customer_id
join order_items as or1
on or1.order_id = or2.order_id
join products as pro
on or1.product_id = pro.product_id
join categories as cat
on pro.category_id = cat.category_id
where category_name = "Electronics"; 

-- 7. Вывести названия товаров и их количество(quantity) в каждом заказе.
select product_name, quantity, order_id
from products as pro
join order_items as or1
on pro.product_id = or1.product_id;

-- 8. Получить список всех товаров(product_name), включённых в заказ клиента с email 'john@example.com'.
select product_name
from products as pro
join 

-- 9. Вывести список всех заказанных товаров с указанием клиентов, которые их заказали.
-- 10. Получить список клиентов(first_name, last_name), которые заказали "Phone".
-- 11. Получить список всех заказов и их клиентов, отсортированный по дате заказа. Вывести first_name, last_name, order_date.
-- 12. Вывести имена клиентов и даты их заказов, где общая сумма заказа(total) превышает 500. Отсортировать по имени клиента.
-- 13. Получить список товаров(product_name) из категории "Clothing", отсортированных по цене(price) по убыванию. Вывести первые 2 записи.
-- 14. Найти все заказы, содержащие товары категории "Furniture". Вывести order_id и order_date.
-- 15. Получить список всех заказов, где были куплены товары из категории "Clothing". Вывести order_id и order_date.
-- 16. Найти названия и цены товаров, включённых в заказы, стоимостью выше 100, отсортировать по цене. Вывести первые 3 результата.
-- 17. Вывести названия товаров и их количество из заказов, сделанных клиентами с фамилией 'Doe',  отсортировать по количеству.
-- 18. Получить список всех заказов, содержащих товары из категории "Electronics", с указанием имени клиента, отсортированный по имени клиента. Показать первую запись.
-- 19. Вывести клиентов, заказавших товары стоимостью более 500, с сортировкой по дате заказа по убыванию.
-- 20. Получить список товаров из категории 'Clothing', включённых в заказы, с сортировкой по дате заказа. Показать первые 4 записи.