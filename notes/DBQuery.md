1. Adding indexes

  Syntax: create index idx_name on users(name);

2. Avoide creating too many indexes which slow down insert and update query performence

3. Optimze queries

  select * from employee;

  optimized: get only required columns 

  select name, city , role from employee

4. Use paginations

   select name, city , role from employee limit 10 offset 10;

5. user cursor for infinte scroll

   select name, city , role from employee where id > 10 order by id ;

6. Avoide N+1 Query problem

  1. Bad implimentation

    1. First query users 
    2. Query orders for each users


  2. Good implimentation

    select u.name, u.id as user_id , o.id  as order_id, o.product_name from users u inner join orders o on u.id = o.user_id;


7. Caching 

  1. radis

8. Connection pooling

  1. Reuse db connection
  2. Avoide creating new connection
  3. How connection pool works
  4. syntax : mysql = mysql.createPool({
    host:"localhost",
    user:"root",
    password:"12345",
    database:"test",
    waitForConnections:true,
    connectionLimit:10,
    queueLimit: 0
  })
  5. If already connection is open reuse connection
  6. all connection are already getting use wait in queue for connection to get open 

9. Use proper dataTypes

  1. INT instread of VARCHAR
  2. smaller types are faster

10. partitioning and sharding

  1. split larger tables into smaller
