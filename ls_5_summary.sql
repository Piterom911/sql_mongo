
-- 1. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    alter table staff
    add column experience_level varchar(128);
    
    set sql_safe_updates = 0;
    
    update staff
    set experience_level = case
							   when age < 25 then 'Junior'
							   when age < 35 then 'Middle'
							   when age >= 35 then 'Senior'
						   end;
            

-- 2. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    alter table staff
    add column family_status varchar(128);
        
    update staff
    set family_status = case
							 when has_child = 'Y' then 'Has children'
							 when has_child = 'N' then 'No children'
						 end;
    

-- 3. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select upper(lastname)
from staff;


-- 4. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select lower(firstname)
from staff;


-- 5. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alter table staff
add column fullname varchar(128);

update staff
set fullname = concat(firstname, ' ', lastname);


-- 6. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select length(firstname) as firstname_length
from staff;


-- 7. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select * 
from staff
where length(lastname) > 6;


-- 8. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alter table staff
add child_bonus int;

update staff
set child_bonus = case
					  when has_child = 'Y' then 500
					  when has_child = 'N' then 0
				  end;
                  

-- 9. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select age + 5 from staff;


-- 10. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alter table staff
add column salary_category varchar(128);

update staff
set salary_category = case
						  when age > 30 and has_child = 'Y' then 'High'
                          when age > 30 and has_child = 'N' then 'Medium'
                          else 'Low'
					  end;


-- 11. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select * from staff
where lastname like '%s%';


-- 12. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alter table staff
add position_rank varchar(128);

update staff
set position_rank = case
						when position like '%Teacher%' then 'Teacher'
                        when position like '%Designer%' then 'Designer'
                        else 'Other'
					end;
    

-- 13. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select * from staff 
where firstname like '%y';


-- 14. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
select * from staff
where lastname like 'A%' or lastname like 'L%';


-- 15. +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
alter table staff 
add column username_default varchar(128);

update staff
set username_default = case
						   when username is not null then username
                           else 'unknown'
					   end;
                       
set sql_safe_updates = 1;
