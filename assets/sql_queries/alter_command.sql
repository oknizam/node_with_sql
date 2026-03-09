Create table ADMIN_NIZAM.users(
	id int auto_increment primary key,
    f_name varchar(30),
    l_name varchar(30),
    phone varchar(20) unique,
    email varchar(30) unique,
    gender char(10),
	city varchar(20)
);

-- alter table is used to add new coloumn, change column name, and modify column data type

ALTER table ADMIN_NIZAM.users add role varchar(10);

-- change column name 
ALTER table ADMIN_NIZAM.users change phone phone_number varchar(15);

-- change type of city

alter table ADMIN_NIZAM.users modify city char(10);


create table ADMIN_NIZAM.demo_table (
id int auto_increment primary key,
name varchar(50)
);

alter table ADMIN_NIZAM.demo_table change id id int auto_increment;

select * from ADMIN_NIZAM.demo_table;

insert into ADMIN_NIZAM.demo_table (name) values("mobile");

-- alter with drop command for dropping column 

alter table ADMIN_NIZAM.demo_table drop name;

alter table ADMIN_NIZAM.demo_table add name varchar(50); 








