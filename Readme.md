NodeJS with mysql

# 1. Mysql
It is software store and retrive data, query can be done to DB using sql (structure query launguage)

# 2. Tables
Rows and columns of data

# 3. Schema
Meta information about table, like structure and other objects how they relate , views also included

# 4.  Views 

Virtual table -> create when we need to hide some coloumns from actual table


# 5. Primary key
Should be uniqe
Not null
can applied to one column in table

# 6. Foreign Key 

Used to build relationship bewtween tables
Foreign key can primary key in other table
Foreign key can be null

# 7. Unique key
name itlsef suggest unique
can be null
we can have mutiple unique keys
example: email, phone number

# 8. CHAR vs VARCHAR

CHAR(5)
-------
code -> "A1   " 10 byte -> it will take full size
it is faster 


VARCHAR(10) -> max 10 char allowed

code -> "A1"+ 1byte

# 9. Indexing 

1. Indexing is used to make query db faster

![alt text](assets/Indexing.png)

2. To create index -> there will be a new `lookup table` is created which maintain index id

3. example: we know data is stored in disc (512GB) 

    Disc is devided into sectors 

    Sector A - 128
    Sector B - 128
    Sector C - 128
    Sector D - 128

    when select query performed

    select * from emplyee where full_name = "nizam";

    it search entire disc 

    by maintaining lookup table it maintanin range data for each sector, to perform search it uses B-tree which like perform search on range

    ![alt text](assets/image.png)

4. How search works if i search by name

    select * from emplyee where full_name = "nizam"; --- `index works`
    select * from emplyee where full_name = "niz%"; --- `index works` because search with prefix

    select * from emplyee where full_name = "%iz%"; --- `not index works` because iz will search in all table for matching

    select * from emplyee where full_name = "%izam"; also not works because indexing works with prefix search

6. First search is performed on lookup table then actual table

7. We have limits for indexing it depends on mysql

8. banlenced tree -> perform search based on range


# 10. Joins
  ![alt text](<assets/Screenshot 2025-12-22 at 8.23.48 PM.png>)
   1. Inner join
    matching data in both table

  ![alt text](<assets/Screenshot 2025-12-22 at 8.26.42 PM.png>)

   2. Left Join
    All data from left table and matching data form right table , it can have Null values

  ![alt text](<assets/Screenshot 2025-12-22 at 8.32.05 PM.png>)

   3. Right Join
    All data from Right table and matching data form left table , it can have Null values

  ![alt text](<assets/Screenshot 2025-12-22 at 8.33.06 PM.png>)
  
   4. Full Outer join 
    All data from Right table and all data form left table , it can have Null values

    left + union + right


  ![alt text](<assets/Screenshot 2025-12-22 at 8.33.44 PM.png>)

# 11. ACID property (acid applied  with transaction, without transaction not fully applied)

   1. Atomocity - All operations in a transaction succeed or none do.

        START TRANSACTION;
        UPDATE a SET balance = balance - 100 WHERE id = 1;
        UPDATE b SET balance = balance + 100 WHERE id = 2;
        COMMIT;

   2. Consistency - A transaction moves the database from one valid state to another. (Ensures data follows rules, constraints, and business logic.)
      Constraints: PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK

    1. rules are followed before starting transaction means check constraints
    2. rules are followed after transaction means check constracints after transaction

   3. Isolation - Transactions do not interfere with each other. (Prevents dirty reads, race conditions, and inconsistent data.)

   4. Durability - Once committed, data is permanently saved. (Protects data even after crashes or power failures.) by logs, caching etc

# 12. Dirty Reads

  Transcrtion A reads data , where other transaction B modifying that data but transaction B is not committed , it went rollback

  let check with example

  Transaction A  -> AMOUNT - 500

  TRANSACTION A
  -----------------

  START TRANSACTION;

  UPDATE ORDERS SET AMOUNT = 250 WHERE order_id = 1;  // UN COMMITTED


  TRANSACTION B
  --------------

  SELECT * FROM ORDERS WHERE order_id = 1;

  <!-- AMOUNT -> 250 -->


  TRANSACTION A
  -----------------

  ROLLBACK;

  TRANSACTION B perform dirty read , AMOUNT = 500, TRANSACTION B GOT AMOUNT = 250


  TO PREVENT
  1. Read committed
  2. serilizable
  3. repeatedly read

# 13. Race condition

  1. Using transaction

    START TRANSACTION;

     UPDATE CUSTOMER SET AMOUNT = 1000 WHERE ID = 1;

    COMMIT;

  2. Using row lock

    START TRANSACTION;

    SELECT * FROM ORDER WHERE CUSTOMER_ID = 1 FOR UPDATE;

    UPDATE CUSTOMER SET AMOUNT = 1000 WHERE ID = 1;

    COMMIT;

  3. using version LOCK

     UPDATE CUSTOMER SET AMOUNT = 1000 AND VERSION = VERSION + 1 WHERE ID = 1 AND VERSION = 2;

  4. Atomic Updates -> single query no race condtions

     UPDATE CUSTOMER SET AMOUNT = 1000 WHERE ID = 1;

  
# 14. Relational database

  1. Store and mange data using tabels
  2. table has rows(records) and columns (fields)
  3. tables are connected to each other by keys (Foreign keys)
  4. relational databases , Mysql, psql, sql lite, oracle
  5. Fixed schema 
  6. uses sql to query database
  7. fixed schema means structure is predefined and strict, we can add new field to table , new type of value to existing field
  8. Create table user (
    id number,
    name varchar(50),
    age number
  );

  9. insert into user(id,name, age, gender)
      values (1, "Nizam",27,"male"); this is nit allowed because table is created with diffrent schema


# 15. why we use Relational database
  1. structured data
  2. strong data consistency (ACID propoties)
  3. easy to query with sql


# 16. when we need relational database

  1. structred data
  2. data consistency (ACID)
  3. relationshipl between tables
  4. e-commerce applications 
    1. payments table
    2. orders table
    3. users table
    4. products table
  5. banking systems
  6. ticketing systems

# 17. when we need no sql 

  1. Data structure change
  2. Huge scale and high write traffic
  3. easy to horizontal scaling
  4. fatsre development
  5. majorely used 
    1. message application
    2. Analytics
    3. notifications
    4. acticity logs

# 18. Horizontal scaling in relational Database is painful

  1. horizontal scling means adding new machines and splitting data betweeen doffrent machines, where as vertical scaling updating existing machine
  2. why horizontal scaling is painful because relational DB will 
    1. maintain consistency in data (ACID)
    2. relation bewteen tables
    3. transactions
  it is difficult to maintain consistency , relations of do horizontal sclaing

  3. we can do Horizontal scaling
    1. creating replicas
      1. primary -> write allways on primary
      2. relicas -> read from replicas

    2. write still goes to one
    3. read lag (consistency)
  
  4. sharding
    
    shard1 -> 1 - 1m
    shard2 -> 1m - 2m
    shard3 -> 2m - 3m

    1. each shard seperate database
    2. read and write speed
    3. joins difficult


# 19. Transaction
    Group of database operations

    Begin;
    INSERT INTO orders (id, user_id, amount) VALUES (1, 10, 500);
    INSERT INTO payments (order_id, status) VALUES (1, 'SUCCESS');
    commit;


# 20. Diffrence between Psql vs mysql

1. Both are open source 
2. uses standard sql
3. Mysql speed and fast comapre to psql, great for read heavy web apps, fast for simple reads
4. pql is more advanced used for complex queries
5. Project is simple and performence-focused choose mysql, project is scalable, complex and advanced choose psql
6. Mysql is simple and light weight, faster for heavy-read applications and psql complex queries
7. mysql we can scale horizontal using replicas
8. psql vertically scales well
9. psql easy to perform search on json data means column which stores json data and it suuports JSONB
10. psql supports indexing json also
11. mysql json indexing is limited
12. Psql supports two json data types JSON and JSONB
13. JSON (Text storage)
    1. stored exactly as text
    2. every time query json data -> psql parses it
    3. key order preserved
    

14. JSONB (stored in binary format)
    1. stored as binary data
    2. parsed only at insert
    3. faster query
    4. support indexing
    5. key order not preserved


# 21. Bearer token vs cookies vs basic

  1. Bearer token
    1. access token used in api
    2. sent in http header (Authorization: Bearer <token>)
    3. session less used with jwt

  2. Cookies
    1. small piece of data stored by browser
    2. autometically sent with every request with same domain
    3. used for session and authentication

  3. Basic

    1. used when ur authenticating to application 
    2. basically passing username and password in encryption using base64 algo
  
  Both are used for 
  1. Authentication -> who you are -> authenticate application
  2. authorization -> you have access to following -> permissions

  what ever stored in cookies for that domain sent autometically to each n/w request
   works
  FE domain => app.example.com
  BE domain =>  app.example.com


 # 22. Commonly used API status codes

  1. 2XX -> success
    1. 200 -> GET, PUT, PATCH
    2. 201 -> Create new resource -> POST 
    3. 204 -> success no response , DELETE

  2. 4xx -> client error
    1. 400 -> missing fields -> bad request
    2. 401 -> Unauthorized ->not authenticated
    3. 403 -> Forbidden -> not allowed , no permission
    4. 404 -> Resource not found -> wrong id
    5. 409 -> conflict in data -> duplicate entry
    6. 429 -> too many request , rate limiter


  3. 5xx -> server errors

    1. 500 -> server crash
    2. 502 -> bad gateway -> service failure -> microservice failure
    3. 503 -> service unreachable -> load 
    4. 504 -> gate way timeout -> not responding


# 23. Inner join and cross join

  1. Inner Join
     Return matching rows based on condtions

  2. Cross join
     Return all possible combinations of rows

     tables:
     A -> 3 rows
     B -> 4 rows
     Cross join return A * B => 3 * 4 => 12 rows

     every row of A displyed with every row B

  3. Outer join 

    returns all rows in table A and table B

    tables:
     A -> 3 rows
     B -> 4 rows
    Cross join return A + B => 3 + 4 => 7 rows



# 24. Indexing 

  1. Without index full table scan
  2. with index , dirctly jump to matching rows

  3. Single index
   syntax:
   create index idx_name on customers(customer_name);

   -> Instead of scanning entire table, directly jump to specifcic index

  4. composite index
   sytanx: 

   create index idx_customer_name_city on customers(customer_name, city);

    1. where customer_name = "nizam"; idenxing works
    2. where customer_name = "nizam" and city="davanagere"; idenxing works
    3. where city="davanagere"; idenxing not works, because order matters in composite index
  
  5. indexing in like clause

    1. prefix works fname LIKE "n%" starts with
    2. fname LIKE "%n" end with index not works
    3. fname LIKE "%na%" contains not work

  

# 25. Docker
  docker package ur application with all configuration

  provide one enviornament where it conatins app, witk all configuration to run that app, those configurations will not change for one machine to another, so that we can't say project is running on my machine but not on urs

  it conatins
  1. Image -> blue print of project, configs everything like class, read only
  2. container -> blue print + running state, instnce of image

# 26. Kubarnetes

  developed by google
  container orchastration platform

  1. docker = create containers
  2. Kubarnetes = manages containers

  3. auto scaling
  4. load balance
  5. auto healing (restart crashed containers)
  6. deployment managemet


# 27. Deployment

  1. Initially before aws  project was created locallly and developed
  2. to deploye we have to setup our own server, dump application there -> that machine will have one static ip, internet will be availbale, and also machine should active 24*7 
  3. purchase one domain like https://abc.com -> route this domain to static ip
  4. After aws - it provides cloud access
  5. where employees instead of having own server or renting others server simply they can create account
  6. create vmachine in aws cloud deploy projects their

  7. Cloud Native 
    1. Deploy in single machine
    2. we can use redis
    3. cloud front cdn
    4. redis
    5. load balancing 
    6. revere proxy
    7. everything is available just we need to do configuration

  8. Still we have problem here , works on my machine
    1. need to configure evrything in aws as well , what we have in local
    2. local is running windows
    3. where aws running linux  
    4. Virtualisation -> run windows, linux but these are very hevy because entire OS included in this
    5. Containeraisation (Docker) -> kind of Virtualisation but light weight
    6. google using containers from begining
    7. managing containers is difficult

  9. Containers
    1. Currently we have two containers
    2. if traffic increases , need to scale containers by adding new 
    3. if traffic is decreasing we have to remove additional containers   
    4. container crashes -> restart
    5. containers monitor
    6. idea is hire developer who is activeling looking on containers we call it as containers orchestration
    7. Google created in house soltion to automate containers orchestration by introducing google BORG 
    8. Rewrite BORG make open source and named KUBARNETES
    9. Donated KUBARNETES to CNCF
    10. word taken Helsman who manges ship 
    11. k8s

  10. AWS ECS (Elastic container service)
    1. same as Kubarnetes
    2. vendor lock In
    3. configured as per AWS
    4. if i want to shift other Cloud service , again need to write everything

  11. Kubarnetes are generic we can easily shift from one clusde to another clude service


# 28. How KUBARNETES works

  1. Physical machine (local machine, aws virtal machine, microsft azure machine)
  2. Control plane , intsall below
    1. API server -> expose , configuration passes to controller , user are talking
    2. Controller -> run
    3. Scheduler
    4. etcd  -> database to store data (key,value)
    5. worker node another physical machine -> actual application (container) run
    6. minimum 2 worker node
    7. API sever -> controller -> etcd -> repeat  
    
  3. worker node
    1. kubelet which connected to api server of control plane
    2. kublet manage pods or contaners
    3. kube proxy redirect users request to worker nodes

  4. please run two contaners for ngnix
    1. send request to API server of control plane
    2. authentication check
    3. API server send request to controller need two containers
    4. COntroller create two pods 
    5. pods mean contaners


  5. scheduler assign pods to worker node or assign worker nodes
  6. Cloud controll mangers ()
    1. load balancer 
    2. CCM dynamic component to create load balancer (aws, GCP, microsoft)

# 29 Github Actions

1. github is hosted version control system

2. without git hub project will copied to server where code is actully get deployed 

3. git hub provide features

4. we give some instrcution to github
  1. whenever we push our code to develop or main  branch
  2. server ssh connect to server where we deploy
  3. cd home/app
  4. take latest pull
  5. all these we write in yml

5. Deploying node steps

  1. Create simple node server
  2. DockerFile
    1. we use alpine image because they are light weight
    2. why we use alpine is they are light weight, basically when we create container we take ngnix, node, python , ubuntu images
    3. but alpine are light weight compare to these useful in CI/CD pipeline

  3. docker-compose.yml
    1. to run multiple containers
    2. exmple if we have 
      1. frontend
      2. backend
      3. database
      Instead of running eaxh seperately we can run in one command




# 30. KAFKA

Check kafak readme

# 31. REDIS

# 32. API gateway vs load balancer vs reverse proxy

# 33. LOAD balancer

# 34. Unit testing

# 35. Cors

# 36. XSS

# 37. Improve performece images FE

# 38. SSL

# 39. CAPTCHA

# 40. Notification system - system design

