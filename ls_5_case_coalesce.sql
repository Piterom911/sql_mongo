use gt130824;

create table phones(
	id int primary key auto_increment,
    product_name varchar(128) not null,
    product_count int, 
    product_price int
);

insert into phones(product_name, product_count, product_price)
values  ('iPhone 11', 4, 700), 
		('iPhone 11 pro', 10, 750),
        ('iPhone 11 pro max', 4, 800),
        ('iPhone 12 mini', 18, 800),
        ('iPhone 12', 10, 810),
        ('iPhone 12 pro', 0, 850),
        ('iPhone 12 pro max', 1, 900),
        ('iPhone 13', 16, 950),
        ('iPhone 13 pro', 0, 1000),
        ('iPhone 13 pro max', 1, 1100),
        ('iPhone 14', 13, 1200),
        ('iPhone 14 pro', 0, 1250),
        ('iPhone 14 pro max', 25, 1300);
        
select product_name as title, product_price as price
from phones; 

-- Вывести поле product_name как title, посчитать и вывести общую сумму заказов 
-- (product_count * product_price) как total_sum

select product_name as title, product_count * product_price as total_sum
from phones;

-- Вывести поле product_name как title, 
-- посчитать и вывести общую сумму заказов 
-- Если product_count > 0 - (product_count * product_price) как total_sum
-- Если product_count = 0 - product_price как total_sum

-- select product_name as title, product_count * product_price as total_sum
-- from phones
-- where product_count > 0;

-- select product_name as title, product_price as total_sum
-- from phones
-- where product_count = 0;

-- Условные операторы(ветвление)
-- Функция CASE проверяет истинность набора условий и в зависимости от результата проверки может возвращать тот или иной результат. Эта функция принимает следующую форму:
       
       
-- case
-- when условие1 then действие/результат
--     when условие2 then действие/результат
--     when условие3 then действие/результат
--     ...
--     else альтернативный результат
-- end

select product_name as title, 
	case
		when product_count > 0 then product_count * product_price
		when product_count = 0 then 'no such a product'
	end as total_sum
from phones;       

alter table phones
add column total_sum varchar(128);

set sql_safe_updates = 0;

update phones
set total_sum = case
					when product_count > 0 then product_count * product_price
					when product_count = 0 then 'the product is out of stock'
				end;
			
select product_name, product_count, case
										when product_count = 0 then 'The product is out of stock'
										when product_count <= 2 then 'Product is almost out of stock'
										when product_count <= 5 then 'Only few items left in stock'
										when product_count <= 10 then 'Product is in stock'
                                        else 'There is a lot of prudouct'
									end
from phones;       

alter table phones
add column count_info varchar(128);

update phones
set count_info = case
					when product_count = 0 then 'The product is out of stock'
					when product_count <= 2 then 'Product is almost out of stock'
					when product_count <= 5 then 'Only few items left in stock'
					when product_count <= 10 then 'Product is in stock'
					else 'There is a lot of prudouct'
				end;
                
alter table phones
change product_price starting_price int;

select product_name, starting_price, case
										when starting_price <= 700 then null
										when starting_price < 850 then 15
										when starting_price >= 850 then 25
									end as tax
from phones;       

alter table phones
add column tax int;

update phones
set tax = case 		
				when starting_price <= 700 then null
				when starting_price < 850 then 15
                when starting_price >= 850 then 25
			end;
            
select product_name, starting_price, tax, case 
											  when tax is null then starting_price
											  else round(starting_price + starting_price * tax / 100, 2)
										  end as final_price
from phones;
            
            
-- Функция COALESCE принимает список значений и возвращает первое из них, 
-- которое не равно NULL:                  
-- coalesce(value1, value2, value3...)

-- coalesce(null, null, 0, null, 10) -- 0 
-- coalesce(null * 10, 10 * 10, null + 20 * 10) -- 100

 select product_name, starting_price, tax, coalesce(starting_price + starting_price * tax / 100, starting_price) as final_price
 from phones;
 
 alter table phones
 add column final_price decimal;
 
 alter table phones
 modify column final_price decimal(30, 5);
 
 update phones
 set final_price = coalesce(starting_price + starting_price * tax / 100, starting_price);
 
 create table users(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    email varchar(128),
    phone varchar(128)
 );
 
 insert into users(first_name, last_name, email, phone)
 values ('Tom', 'Smith', 'toms@gmail.com', null),
		('Bob', 'Brown', null, '+12345676'),
        ('Jphn', 'Jameson', 'toms@gmail.com', '+2983475629'),
        ('Lola', 'Smith', null, null),
        ('Jane', 'Simpson', 'janes@gmail.com', null),
        ('Den', 'Brown', 'denb@gmail.com', '+9876234571');
        
select first_name, last_name, coalesce(email, phone, 'no info') as send_message 
from users;
                
                
select * from users;

       
       
       
       
       
       