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











