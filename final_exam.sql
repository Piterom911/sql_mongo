-- 1. Что такое MySQL?
-- b) Это реляционная система управления базами данных (СУБД) 

-- 2. Какой оператор MySQL используется для выбора данных из базы данных?
-- c) SELECT 

-- 3. Какой оператор MySQL используется для обновления данных в базе данных?
-- b) UPDATE 
-- d) SET

-- 4. Какой оператор MySQL используется для удаления данных из базы данных?
-- b) DELETE 

-- 5. Какой оператор MySQL используется для вставки новых данных в базу данных?
-- a) INSERT INTO 

-- 6. Как в MySQL выбрать все столбцы из таблицы с именем "Persons"?
-- a) SELECT * FROM Persons; 

-- 7. Какой оператор MySQL используется для возврата только разных значений?
-- a) DISTINCT 

-- 8. Оператор OR отображает запись, если выполняются КАКИЕ-ЛИБО из перечисленных условий. Оператор AND отображает запись, если выполняются ВСЕ перечисленные условия
-- a) True

-- 9. Какие функции позволяют получить одновременно текущие дату/время?
-- c) NOW()

-- 10. Какой SQL-оператор создаёт базу данных в MySQL?
-- d) CREATE DATABASE dbname;

-- 11. Что значат цифры в описании типа данных колонки DECIMAL(5,2)
-- a) Всего 5 числовых знаков, из них 2 на дробную часть

-- 12. Какие математические функции в MySQL округляют числовые значения?
-- b) ROUND()

-- 13. Какая строковая функция отвечает за склейку строк?
-- a) CONCAT()

-- 14. Как можно вернуть количество записей в таблице ''Persons'' с помощью MySQL?
-- c) SELECT COUNT(*) FROM Persons

-- 15. С помощью MySQL, как можно вставить ''Olsen'' в качестве ''LastName'' в таблицу ''Persons''?
-- b) INSERT INTO Persons (LastName) VALUES ('Olsen')

-- 16. Создать и активировать базу данных tasks. 
CREATE DATABASE tasks;
use tasks;

-- 17. Создать таблицу store с полями:  
--     • id — целое число, первичный ключ, автоинкремент.  
--     • title — строка (128 символов), не NULL.  
--     • price — целое число.  
--     • quantity — целое число.
create table store(
	id integer primary key auto_increment,
    title varchar(128) not null,
    price integer,
    quantity integer
);

-- 18. Добавить в таблицу store записи:  
--     • title — 'Skirt', price — 120, quantity — 10.  
--     • title — 'Shirt', price — 55, quantity — 4.  
--     • title — 'Jeanse', price — 135, quantity — 15.  
insert into store (title, price, quantity) values ('Skirt', 120, 10);
insert into store (title, price, quantity) values ('Skirt', 55, 4);
insert into store (title, price, quantity) values ('Jeanse', 135, 15);

-- 19. Из таблицы store вывести те товары, цена которых больше 100.  
select * 
from store
where price > 100;

-- 20. Из таблицы store вывести те товары, название которых начинается на букву 'S'. 
select * 
from store 
where title like('S%'); 

-- 21. Увеличить количество товара с названием 'Jeanse' на 5.  
set SQL_SAFE_UPDATES = 0;

update store
set quantity = 5
where title = 'Jeanse';

-- 22. Добавить новое поле quality — целое число.  
alter table store
add column quality integer;

-- 23. Заполнить поле quality:  
--     • Если цена товара больше 100, установить значение 5.  
--     • Если цена товара меньше или равна 100, установить значение 4.  
update store
set quality = 
		case
			when price > 100 then 5
            when price <= 100 then 4
		end;
        
-- 24. Удалить из таблицы store товары, где количество меньше 10.  
delete from store
where quantity < 10;

-- 25. Удалить таблицу store.  
drop table store;

-- 26. Удалить базу данных tasks.
drop database tasks;  

-- 27. Создать базу данных shop и заполнить её, используя скрипт:  
--     https://github.com/annykh/GT130824/blob/main/shop.sql
drop database shop;
CREATE DATABASE shop;

USE shop;

CREATE TABLE SELLERS(
       SELL_ID    INTEGER, 
       SNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       COMM    NUMERIC(2, 2),
             BOSS_ID  INTEGER
);
                                            
CREATE TABLE CUSTOMERS(
       CUST_ID    INTEGER, 
       CNAME   VARCHAR(20), 
       CITY    VARCHAR(20), 
       RATING  INTEGER
);

CREATE TABLE ORDERS(
       ORDER_ID  INTEGER, 
       AMT     NUMERIC(7,2), 
       ODATE   DATE, 
       CUST_ID    INTEGER,
       SELL_ID    INTEGER 
);

INSERT INTO SELLERS VALUES(201,'Олег','Москва',0.12,202);
INSERT INTO SELLERS VALUES(202,'Лев','Сочи',0.13,204);
INSERT INTO SELLERS VALUES(203,'Арсений','Владимир',0.10,204);
INSERT INTO SELLERS VALUES(204,'Екатерина','Москва',0.11,205);
INSERT INTO SELLERS VALUES(205,'Леонид ','Казань',0.15,NULL);


INSERT INTO CUSTOMERS VALUES(301,'Андрей','Москва',100);
INSERT INTO CUSTOMERS VALUES(302,'Михаил','Тула',200);
INSERT INTO CUSTOMERS VALUES(303,'Иван','Сочи',200);
INSERT INTO CUSTOMERS VALUES(304,'Дмитрий','Ярославль',300);
INSERT INTO CUSTOMERS VALUES(305,'Руслан','Москва',100);
INSERT INTO CUSTOMERS VALUES(306,'Артём','Тула',100);
INSERT INTO CUSTOMERS VALUES(307,'Юлия','Сочи',300);


INSERT INTO ORDERS VALUES(101,18.69,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(102,5900.1,'2022-03-10',307,204);
INSERT INTO ORDERS VALUES(103,767.19,'2022-03-10',301,201);
INSERT INTO ORDERS VALUES(104,5160.45,'2022-03-10',303,202);
INSERT INTO ORDERS VALUES(105,1098.16,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(106,75.75,'2022-04-10',304,202); 
INSERT INTO ORDERS VALUES(107,4723,'2022-05-10',306,201);
INSERT INTO ORDERS VALUES(108,1713.23,'2022-04-10',302,203);
INSERT INTO ORDERS VALUES(109,1309.95,'2022-06-10',304,203);
INSERT INTO ORDERS VALUES(110,9891.88,'2022-06-10',306,201);

--     Техническое описание этой базы данных доступно по следующей ссылке -  
--     https://github.com/annykh/GT130824/blob/main/%D0%A2%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5_shop.txt

-- 28. Вывести всех продавцов, чьи имена начинаются на букву 'Л'.  
select *
from sellers
where sname like 'Л%';

-- 29. Вывести всех клиентов из города Тула с рейтингом больше 100. 
select *
from customers
where city = 'Тула' and rating > 100;

-- 30. Вывести всех продавцов, чьи комиссии между 0.10 и 0.15 (включительно).  
select *
from sellers
where comm between 0.10 and 0.15;

-- 31. Вывести заказы, сумма которых меньше 1000 и дата которых после 1 апреля 2022 года.  
select *
from orders
where amt < 1000 and  odate > '2022-04-01';

-- 32. Вывести пары покупателей и обслуживших их продавцов из одного города. 
select * 
from customers cust
join orders ords
on cust.cust_id = ords.cust_id
join sellers sell
on sell.sell_id = ords.sell_id
where sell.city = cust.city;

-- 33. Вывести имена продавцов, у которых нет заказов.  
select sname
from sellers sell
left join orders ords
on sell.sell_id = ords.sell_id
where ords.sell_id is null;

-- 34. Вывести имена всех продавцов, которые продают товары клиентам из Тулы. 
select sname
from sellers sell
join orders ords
on sell.sell_id = ords.sell_id
join customers cust
on cust.cust_id = ords.cust_id
where cust.city = 'Тула'; 

-- 35. Вывести имена всех клиентов и продавцов, которые сделали заказ в июне 2022 года.
select cust.cname, sell.sname 
from customers cust
join orders ords
on cust.cust_id = ords.cust_id
join sellers sell
on sell.sell_id = ords.sell_id
where year(ords.odate) = 2022 and month(ords.odate) = 6;

-- 36. Найти среднюю сумму заказа для каждого клиента.  
select avg(amt)
from orders
group by cust_id;

select cust.cust_id, cust.cname, avg(ords.amt) avgamt
from customers cust
join orders ords
on cust.cust_id = ords.cust_id
group by cust.cust_id, cust.cname;

-- 37. Найти общее количество клиентов в каждом городе.
select count(cust_id)
from customers
group by city;

-- 38. Вывести города, в которых средняя сумма заказа превышает 2000.
select city
from customers cust
join orders ords
on cust.cust_id = ords.cust_id
group by city
having avg(ords.amt) > 2000;

-- 39. Вывести продавцов, у которых количество заказов больше 2.
select sname
from sellers sell
join orders ords
on sell.sell_id = ords.sell_id 
group by sell.sname
having count(ords.order_id) > 2;

-- 40. Определить количество заказов, сделанных клиентами из Тулы.
select count(ords.order_id)
from orders ords
join customers cust
on ords.cust_id = cust.cust_id
where cust.city = 'Тула';