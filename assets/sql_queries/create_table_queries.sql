CREATE TABLE ADMIN_NIZAM.departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE ADMIN_NIZAM.employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE ADMIN_NIZAM.customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE ADMIN_NIZAM.orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


ALTER TABLE ADMIN_NIZAM.customers
ADD COLUMN email VARCHAR(100),
ADD COLUMN phone VARCHAR(15),
ADD COLUMN created_at TIMESTAMP;

ALTER TABLE ADMIN_NIZAM.customers
ADD COLUMN fname VARCHAR(50),
ADD COLUMN lname VARCHAR(50);
