
-- employee with department  inner join

select e.emp_name , d.dept_name from ADMIN_NIZAM.employees  e join ADMIN_NIZAM.departments  d on e.dept_id = d.dept_id;

-- customers with orders inner join

select c.customer_name, o.order_id, o.amount from ADMIN_NIZAM.customers  c join ADMIN_NIZAM.orders  o on c.customer_id = o.customer_id;

-- customers with no orders

select * from ADMIN_NIZAM.orders;

-- why we are using is null it will return true, because = null will return uknown so result will not come 

select c.customer_name, o.order_id, o.amount from ADMIN_NIZAM.customers as c left join ADMIN_NIZAM.orders as o on c.customer_id = o.customer_id where o.order_id is null;


-- inner join -> matching rows

select e.emp_name, d.dept_name from ADMIN_NIZAM.employees e join ADMIN_NIZAM.departments d on e.dept_id = d.dept_id;


-- cross join

select * from ADMIN_NIZAM.employees e cross join ADMIN_NIZAM.departments;

-- left outer join


select e.*, d.* from ADMIN_NIZAM.employees e left join ADMIN_NIZAM.departments d on e.dept_id = d.dept_id;

-- right outer join

select e.*, d.* from ADMIN_NIZAM.employees e right join ADMIN_NIZAM.departments d on e.dept_id = d.dept_id;

-- full outer join  return all rows in table A and table begin\

 select e.*, d.* from ADMIN_NIZAM.employees e left join ADMIN_NIZAM.departments d on e.dept_id = d.dept_id union select e.*, d.* from ADMIN_NIZAM.employees e right join ADMIN_NIZAM.departments d on e.dept_id = d.dept_id;







