drop database  data_transformer;

create database data_transformer;

use data_transformer;

create table customers (
    customerID int primary key,
    firstName varchar(50),
    lastName varchar(50),
    email varchar(100),
    registrationDate date
);
 
insert into customers (customerID, firstName, lastName, email, registrationDate) values
(1, 'divyesh',  'jadav',   'divyesh.jadav@email.com',   '2022-03-15'),
(2, 'neev',  'shankar', 'neev.shankar@email.com', '2021-11-02'),
(3, 'tirth',  'donga', 'tirth.donga@email.com', '2023-01-10');

create table orders (
    orderID int primary key,
    customerID int,
    orderDate date,
    totalAmount decimal(10,2),
    foreign key (customerID) references customers(customerID)
);
 
insert into orders (orderID, customerID, orderDate, totalAmount) values
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-10', 1200.00),
(104, 3, '2023-08-05',  75.00);
 
 
-- q1. inner join: all orders and customer details where orders exist
select o.orderID, c.firstName, c.lastName, o.orderDate, o.totalAmount from orders o
inner join customers c on o.customerID = c.customerID;
 
-- q2. left join: all customers and their corresponding orders (if any)
select c.customerID, c.firstName, c.lastName, o.orderID, o.totalAmount from customers c
left join orders o on c.customerID = o.customerID;
 
-- q3. right join: all orders and their corresponding customers (if any)
select o.orderID, o.totalAmount, c.firstName, c.lastName from orders o
right join customers c on o.customerID = c.customerID;
 
-- q4. full outer join: all customers and all orders, regardless of matching
select c.customerID, c.firstName, c.lastName, o.orderID, o.totalAmount from customers c
left join orders o on c.customerID = o.customerID
union
select o.orderID, o.totalAmount, c.customerID, c.firstName, c.lastName from customers c
left join orders o on c.customerID = o.customerID;
 
-- q5. subquery: customers who placed orders worth more than the average amount
select distinct c.customerID, c.firstName, c.lastName
from customers c
join orders o on c.customerID = o.customerID
where o.totalAmount > (select avg(totalAmount) from orders);
 
-- q7. extract the year and month from the orderDate
select orderID, orderDate,
       extract(year from orderDate)  as orderYear,
       extract(month from orderDate) as orderMonth
from orders;
 
-- q8. difference in days between order date and current date
select orderID, orderDate,current_date - orderDate as daysSinceOrder from orders;
 
-- q9. format the orderDate to a more readable format (dd-mon-yyyy)
select orderID, date_format(orderdate, '%d-%M-%y') as formattedDate from orders;
 
-- q10. concatenate firstName and lastName to form a full name
select customerID, firstName || ' ' || lastName as fullName from customers;
 
-- q11. replace part of a string (replace 'john' with 'jonathan')
select customerID, replace(firstName, 'divyesh', 'ved') as updatedName from customers;
 
-- q12. convert firstName to uppercase and lastName to lowercase
select upper(firstName) as firstNameUpper,
       lower(lastName)  as lastNameLower
from customers;
 
-- q13. trim extra spaces from the email field
select customerID, trim(email) as cleanEmail from customers;
 
-- q14. running total of totalAmount for each order
select orderID, customerID, orderDate, totalAmount, sum(totalAmount) over (order by orderDate) as runningTotal from orders;
 
-- q15. rank orders based on totalAmount using rank()
select orderID, totalAmount,rank() over (order by totalAmount desc) as orderRank from orders;
 
-- q16. assign a discount based on totalAmount (>1000: 10%, >500: 5%, else 0%)
select orderID, totalAmount,
       case
           when totalAmount > 1000 then '10% off'
           when totalAmount > 500  then '5% off'
           else 'no discount'
       end as discountTier
from orders;

create table employees (
    employeeID int primary key,
    firstName varchar(50),
    lastName varchar(50),
    department varchar(50),
    hireDate date,
    salary decimal(10,2)
);
 
insert into employees (employeeID, firstName, lastName, department, hireDate, salary) values
(1, 'Mark',  'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee',     'HR',    '2021-03-20', 55000.00),
(3, 'Ravi',  'Patel',   'IT',    '2019-06-10', 72000.00);
 
-- q6. subquery: employees with salaries above the average salary
select employeeID, firstName, lastName, salary from employees where salary > (select avg(salary) from employees);

-- q17. categorize employees' salaries as high, medium, or low
select employeeID, firstName, lastName, salary,
       case
           when salary >= 70000 then 'high'
           when salary >= 50000 then 'medium'
           else 'low'
       end as salaryCategory
from employees;