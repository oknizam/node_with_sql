1. Concurrency -> multiple requests/ users trying to accessing / modifying data at same time
2. let example

    user A reads balance 100
    user B reads balance 100

3. user A update 50
   user B update 80 

   here dirty read , race condition

4. To handle Race conditions

  1. row lock

    select name from users for UPDATE;

  2. version 

    update employee set name = "abc", version = version +1  where version = 1;

  3. transaction  (ACID)

    start transaction

     update employee set balance =  balance - 30 where userid=1;

     update employee set balance =  balance + 30 where userid=2;

    commit;

  4. Read serializable
  5. read committed data
  6. repeated read

  7. Queuing system
