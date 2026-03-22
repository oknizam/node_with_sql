1. Indexing is a B-tree Data stucture (Balanced tree)
2.        [50]
        /      \
    [10,30]   [70,90]

3. select name, email from users where email = "abc@mail.com";

  1. If indexing is not their full table scan
  2. If we use indexing data will be sorted order
  3. idexed data and row pointer
  4. abc@mail.com -> has one row pointer


4. When we create index for table

  1. B-tree data structure is created with data of column which is index and row pointer
  2. Table data is not sorted 
  3. B-tree data is sorted 
  4. row pointer is unique value
  5. when search has made
    1. select name , email from users where email ="a@mail.com";
    2. Check email column has indexing applied
    3. If indexing is their go to sorted B-tree
    4. We have below data in table
       a@mail.com
       b@mail.com
       c@mail.com
       d@mail.com

    5.   b@mail.com
       /           \
      a@mail.com      c@mail.com, d@mail.com

    6. we are searching for  a@mail.com  a < b go to left tree

    7. we are searching for  c@mail.com  c > b go to right tree
    8. when it finds it will take row pointer
    9. row pointer primary key 
    10. index actully stores 

      email        → primary key
      a@mail.com   → 1
      b@mail.com   → 2
    11. performence will be decreased to O(logn) 
    12. For without index O(n)
