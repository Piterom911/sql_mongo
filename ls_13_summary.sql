-- https://github.com/annykh/GT130824/blob/main/shop.sql
-- https://github.com/annykh/GT130824/blob/main/%D0%A2%D0%B5%D1%85_%D0%BE%D0%BF%D0%B8%D1%81%D0%B0%D0%BD%D0%B8%D0%B5_shop.txt

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

select * from SELLERS;
select * from customers;
select * from orders;

-- 1. Определить какие из покупок были совершены марте.
select * 
from orders
where month(odate) = 03;


-- 2. Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года.
select * 
from orders
where odate between '2022-04-10' and '2022-05-10';


-- 3. Определить сколько покупок было совершено в июне.
select count(order_id)
from orders
where month(odate) = 06;


-- 4. Определить среднюю стоимость покупок в марте.
select avg(amt)
from orders
where month(odate) = 03;


-- 5. Определить какие покупки были совершены во вторник.
select *
from orders
where dayofweek(odate) = 3;


-- 6. Определить, сколько покупок было совершено в каждый месяц. Отсортировать строки в порядке возрастания количества покупок. Вывести два поля - номер месяца и количество покупок.
select count(order_id) as order_count, month(odate) as num_of_month 
from orders
group by num_of_month
order by order_count;


-- 7. Определить, в какой месяц было совершено больше всего покупок.  Вывести два поля - номер месяца и количество покупок.
select count(order_id) as order_count, month(odate) as mon
from orders
group by mon
having count(order_id) = (
    select max(order_count)
    from (
        select count(order_id) as order_count
        from orders
        group by month(odate)
    ) as subquery
);

-- 8. Определить количество заказов, совершенных в выходные дни (суббота и воскресенье).
select count(order_id)
from orders 
where dayofweek(odate) in(1,7);


-- 9. Определить, в какой день недели чаще всего совершаются покупки.
select dayofweek(odate) as weekday
from orders
group by weekday
having  count(order_id) = (
	select max(order_count) as order_count
    from (
        select count(order_id) as order_count
        from orders
        group by dayofweek(odate)
    ) as subquery
);


-- 10. Вывести количество заказов, оформленных в первый день месяца.
select count(order_id)
from orders
where dayofmonth(odate) = 1;


-- 11. Выведите минимальный рейтинг покупателя среди сделавших заказ в мае 2022 года.
-- Вывести : min_rating.
select min(rating) as min_rating
from customers as cust
join orders as ors
on cust.cust_id = ors.cust_id
where month(odate) = 5; 


-- 12. Выведите продавцов, которые оформили заказ на наибольшую сумму в период с марта по май 2022 года.
-- Вывести : sell_id, amt
select sell_id, SUM(amt) as total_amt
from orders
where odate between '2022-03-01' and '2022-05-31'
group by sell_id
having total_amt = (
    select max(total_amt)
    from (
        select sell_id, sum(amt) as total_amt
        from orders
        where odate between '2022-03-01' and '2022-05-31'
        group by sell_id
    ) as subquery
);

-- 13. Определить продавца, оформившего наибольшее количество заказов в мае 2022 года.







