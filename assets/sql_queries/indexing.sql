-- single index
CREATE INDEX idx_customer_email
ON ADMIN_NIZAM.customers (email);

select * from ADMIN_NIZAM.customers;

SELECT * FROM ADMIN_NIZAM.customers WHERE email = 'nizam@gmail.com';

-- composite index -> order of index matters 

create index idx_customers_fname_lname on ADMIN_NIZAM.customers(fname,lname);

-- indexing work 
SELECT * FROM ADMIN_NIZAM.customers WHERE fname = 'rahul' and lname="sharma";

-- indexing work 
SELECT * FROM ADMIN_NIZAM.customers WHERE fname = 'rahul';

-- indexing will not work ,because lname is second index
SELECT * FROM ADMIN_NIZAM.customers WHERE  lname="sharma";








