-- create user

create user "nizam_supervisor"@"localhost" identified by "12345";


-- check mysql user alter

select user,host from mysql.user;


-- grant access (to)

grant select, insert, update on demo_01.* to "nizam_supervisor"@"localhost";


select * from demo_01.products;

delete from demo_01.products where id =4;


--  *************

create user "dummy_user"@"localhost" identified by "12345";

grant all privileges on demo_01.* to "dummy_user"@"localhost";

drop user "dummy_user"@"localhost";



-- revoke permissions (from)

create user "dummy_user1"@"localhost" identified by "1234";


grant select , insert on demo_01.* to "dummy_user1"@"localhost";

revoke insert on demo_01.* from "dummy_user1"@"localhost";

 



