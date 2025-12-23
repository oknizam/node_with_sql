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


  












