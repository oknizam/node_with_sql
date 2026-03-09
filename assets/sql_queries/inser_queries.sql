INSERT INTO ADMIN_NIZAM.departments VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Marketing');

INSERT INTO ADMIN_NIZAM.employees VALUES
(1, 'Nizam', 90000, 1, NULL, '2021-01-10'),
(2, 'Rahul', 60000, 1, 1, '2022-03-15'),
(3, 'Sneha', 75000, 2, 1, '2020-07-20'),
(4, 'Amit', 50000, 3, 1, '2023-02-10'),
(5, 'Priya', 85000, 1, 1, '2019-11-05'),
(6, 'Kiran', 45000, 3, 4, '2022-08-18');



INSERT INTO ADMIN_NIZAM.customers VALUES
(1, 'Arjun', 'Bangalore'),
(2, 'Meera', 'Mumbai'),
(3, 'Ravi', 'Delhi'),
(4, 'Anjali', 'Chennai');


INSERT INTO ADMIN_NIZAM.orders VALUES
(101, 1, '2024-01-10', 5000),
(102, 2, '2024-02-12', 7000),
(103, 1, '2024-03-15', 3000),
(104, 3, '2024-04-01', 10000),
(105, 2, '2024-04-05', 2000);


select * from ADMIN_NIZAM.customers;

INSERT INTO ADMIN_NIZAM.customers VALUES
(5, 'Nizam','Davanagere', 'nizam@gmail.com', '9876543210',  NOW()),
(6, 'Rahul', 'Bangalore', 'rahul@gmail.com', '9876543211', NOW()),
(7, 'Amit',  'Mumbai', 'amit@gmail.com', '9876543212',NOW());
