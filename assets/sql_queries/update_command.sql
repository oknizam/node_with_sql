-- update is used to update column

show tables from demo_01;

create table demo_01.products(
	id int auto_increment primary key,
    product_name varchar(50)
);

alter table demo_01.products add category_name varchar(30);

alter table demo_01.products add category_id int;
alter table demo_01.products add actual_price decimal(10,2);



insert into demo_01.products (product_name) values ("iphone 17");
insert into demo_01.products (product_name) values ("lenovo loq");
insert into demo_01.products (product_name,category_name,category_id) values ("sonata watch","fashion",2);

insert into demo_01.products (product_name) values ("football");

select * from demo_01.products;

update demo_01.products set category_name="sports", category_id=3 where id = 4;

update demo_01.products set category_name="electronics", category_id=1 where id in (1,3);

update demo_01.products set actual_price=2000 where id = 4;



-- update with transaction for maintaining consistency with ACID (using transaction)


start transaction;

update demo_01.products set actual_price = actual_price+50 where id =4;

commit;


-- update data with row lock
 

start transaction;


select * from demo_01.products where id = 4 for update;

update demo_01.products set actual_price = actual_price-50 where id =4;

commit;







