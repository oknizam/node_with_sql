-- find name starts with

select * from ADMIN_NIZAM.customers where fname like "a%"; 

-- find name ending with 

select * from ADMIN_NIZAM.customers where fname like "%a"; 

-- find name contains n

select * from ADMIN_NIZAM.customers where fname like "%n%";

-- find name with exact 5 charectors
 
select * from ADMIN_NIZAM.customers where fname like "_____";
