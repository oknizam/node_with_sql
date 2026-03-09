
# max salary
select max(salary) from ADMIN_NIZAM.employees ;

# select employee details whose salary is max
select * from ADMIN_NIZAM.employees where salary = (select max(salary) from ADMIN_NIZAM.employees);

# select employee whose salary is second heighest , in belwo query subquery runs first example -> where salary < 9000

select max(salary) from ADMIN_NIZAM.employees where salary < (select max(salary) from ADMIN_NIZAM.employees);

-- third hieghest salary
-- what this query will do is DISTINCT keyword remove duplicate salary , ordere salary by highest first descending , limit 1 means only one record and offset 2 will skip 2 indexes

select distinct salary from ADMIN_NIZAM.employees order by salary desc limit 1 offset 2; 

-- average salary
select avg(salary) from ADMIN_NIZAM.employees;

-- salary greater than  avg salary

select * from ADMIN_NIZAM.employees where salary > (select avg(salary) from ADMIN_NIZAM.employees);

-- count employee per department

select dept_id, count(*) as total_emp from ADMIN_NIZAM.employees group by dept_id;


-- give me department which contains morethan one employee

select  dept_id from ADMIN_NIZAM.employees group by dept_id having count(*)>1;


-- sub query employee with highest salary in each dept
-- this query will run number of employees 

select * from ADMIN_NIZAM.employees e  where salary=( select max(salary) from ADMIN_NIZAM.employees where dept_id = e.dept_id);

-- optimized query

select e.* from ADMIN_NIZAM.employees e join (select dept_id, max(salary) as max_salary from ADMIN_NIZAM.employees group by dept_id) m on e.dept_id = m.dept_id and e.salary = m.max_salary;
 
-- rank employee by slary 
SELECT emp_name, salary FROM ADMIN_NIZAM.employees order by salary desc;

SELECT emp_name, salary ,rank() over (order by salary desc) as salary_rank FROM ADMIN_NIZAM.employees ;









