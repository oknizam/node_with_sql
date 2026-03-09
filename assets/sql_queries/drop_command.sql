-- drop command is used to drop table, database, drop index on table, and column with alter command

-- drop database

create database demo_01; 

show databases;

drop database demo_01;


-- drop column with alter command

create database demo_01; 

create table demo_01.demo_users_01(
	id int auto_increment primary key,
    name varchar(50)
);
 
  alter table demo_01.demo_users_01 add temp_name varchar(10);
 
 alter table demo_01.demo_users_01 drop temp_name;
 
 
 --  drop table 
 
 drop table demo_01.demo_users_01;
 
 show tables from demo_01;