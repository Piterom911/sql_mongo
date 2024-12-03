 -- 1 TASK ---------------------------
 create database new_tasks;
 use new_tasks;


 -- 2 TASK ---------------------------
 create table workers (
   id int auto_increment primary key,
   first_name varchar (128),
   last_name varchar (128),
   department varchar (128) not null,
   age int check (age > 18),
   username varchar (128) unique
 );

 -- 3 TASK ------------------------------------------------------
 insert into workers (first_name, last_name, department, age, username)
 values
 ('John', 'Doe', 'HR', 39, 'jdoe'),
 ('Jane', 'Smith', 'IT', 25, 'jsmith'),
 ('Michael', 'Johnson', 'Finance', 22, 'mjohnson'),
 ('Emily', 'Brown', 'Marketing', 29, 'ebrown'),
 ('Daniel', 'White', 'Sales', 34, 'dwhite');

 -- 4 TASK ------------------------------------------------------
 INSERT INTO workers (first_name, last_name, department, age, username)
 VALUES 
    ('Sophia', 'Taylor', 'HR', 28, 'staylor'),
    ('Liam', 'Williams', 'IT', 30, 'lwilliams'),
    ('Olivia', 'Martinez', 'Finance', 26, 'omartinez'),
    ('Noah', 'Brown', 'Markketing', 32, 'nbrown'),
    ('Emma', 'Davis', 'Sales', 35, 'edavis'),
    ('James', 'Garcia', 'HR', 40, 'jgarcia'),
    ('Isabella', 'Hernandez', 'IT', 27, 'ihernandez'),
    ('Lucas', 'Lopez', 'Finance', 31, 'llopez'),
    ('Amelia', 'Wilson', 'Markketing', 29, 'awilson'),
    ('Mason', 'Moore', 'Sales', 33, 'mmoore'),
    ('Harper', 'Taylor', 'HR', 24, 'htaylor'),
    ('Ethan', 'Anderson', 'IT', 28, 'eanderson'),
    ('Mia', 'Thomas', 'Finance', 25, 'mthomas'),
    ('Alexander', 'Jackson', 'Marketing', 34, 'ajackson'),
    ('Charlotte', 'White', 'Sales', 36, 'cwhite'),
    ('Benjamin', 'Harris', 'HR', 29, 'bharris'),
    ('Evelyn', 'Martin', 'IT', 23, 'emartin'),
    ('Elijah', 'Clark', 'Finance', 32, 'eclark'),
    ('Avery', 'Rodriguez', 'Markketing', 28, 'arodriguez'),
    ('Scarlett', 'Lewis', 'Sales', 30, 'slewis');
    
    -- 5 TASK ------------------------------------------------------
    
    select * from workers
    where last_name like 'T%';
    
    -- 6 TASK ------------------------------------------------------
    select * from workers
    where age between 25 and 35;
    
     -- 7 TASK ------------------------------------------------------
     select * from workers
     where department in ('HR', 'IT', 'Finance');
     
     -- 8 TASK ------------------------------------------------------
     select * from workers
     order by first_name desc;
     
     -- 9 TASK ------------------------------------------------------
     
     select * from workers
     order by age asc
     limit 5;
     
     -- 10 TASK ------------------------------------------------------
     
     select concat (first_name, ' ', last_name) as fullname
     from workers
     where department = 'Finance';
     
	 -- 11 TASK ------------------------------------------------------
       
       alter table workers add salary decimal;
       
	 -- 12 TASK ------------------------------------------------------
     
     alter table workers modify salary int;
     
     -- 13 TASK ------------------------------------------------------
     alter table workers drop column salary;
     
     -- 14 TASK ------------------------------------------------------
     set sql_safe_updates = 0;
     
     update workers
     set age = age + 1;
     
     -- 15 TASK ------------------------------------------------------ 
     update workers
     set department = 'Marketing'
     where department = 'Markketing';
     
      -- 16 TASK ------------------------------------------------------ 
      update workers
      set first_name = upper (first_name)
      where id = 1;
      
     -- 17 TASK ------------------------------------------------------ 
     delete from workers
     where age < 25;
    
    -- 18 TASK ------------------------------------------------------ 
    delete from workers
    where department = 'Marketing';
    
    -- 19 TASK ------------------------------------------------------ 
    drop table workers;
    
    -- 20 TASK ------------------------------------------------------ 
    drop database new_tasks;