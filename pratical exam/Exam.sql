create database ecommerce_management;

use ecommerce_management;

create table categories (
    category_id int primary key,
    category_name varchar(50)
);

create table products (
    product_id int primary key,
    name varchar(100),
    category_id int,
    price decimal(10,2),
    stock_quantity int,
    added_date date,
    foreign key (category_id) references categories(category_id)
);

create table customers (
    customer_id int primary key,
    name varchar(100),
    email varchar(100),
    phone_number varchar(20),
    address varchar(150),
    registration_date date
);

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    status varchar(20), 
    foreign key (customer_id) references customers(customer_id)
);

create table order_items (
    order_item_id int primary key,
    order_id int,
    product_id int,
    quantity int,
    subtotal decimal(10,2),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

create table payments (
    payment_id int primary key,
    order_id int,
    payment_date date,
    payment_method varchar(20), 
    payment_status varchar(20), 
    foreign key (order_id) references orders(order_id)
);

create table shipping (
    shipping_id int primary key,
    order_id int,
    shipping_date date,
    delivery_date date,
    shipping_status varchar(20), 
    foreign key (order_id) references orders(order_id)
);

insert into categories (category_id, category_name) values
(1, 'electronics'),
(2, 'clothing'),
(3, 'books'),
(4, 'home & kitchen'),
(5, 'toys');

insert into products (product_id, name, category_id, price, stock_quantity, added_date) values
(1, 'wireless mouse', 1, 599.00, 150, '2024-01-10'),
(2, 'bluetooth headphones', 1, 1999.00, 80, '2024-02-15'),
(3, 'laptop stand', 1, 1299.00, 200, '2024-03-05'),
(4, 'cotton t-shirt', 2, 499.00, 300, '2024-01-20'),
(5, 'denim jeans', 2, 1499.00, 120, '2024-02-10'),
(6, 'fiction novel', 3, 349.00, 250, '2024-01-15'),
(7, 'non-stick pan', 4, 899.00, 100, '2024-03-10'),
(8, 'building blocks', 5, 799.00, 180, '2024-05-01'),
(9, 'out of stock gadget', 1, 1099.00, 0, '2024-06-01');

insert into customers (customer_id, name, email, phone_number, address, registration_date) values
(1, 'Rahul Sharma', 'rahul.sharma@email.com', '9876543210', 'Mumbai', '2021-05-10'),
(2, 'Priya Patel', 'priya.patel@email.com', '9876543211', 'Ahmedabad', '2022-08-15'),
(3, 'Amit Verma', 'amit.verma@email.com', '9876543212', 'Delhi', '2023-01-20'),
(4, 'Sneha Iyer', 'sneha.iyer@email.com', '9876543213', 'Chennai', '2023-06-12'),
(5, 'Karan Mehta', 'karan.mehta@email.com', '9876543214', 'Pune', '2022-11-03'),
(6, 'Neha Gupta', null, '9876543215', 'Bangalore', '2024-02-18');

insert into orders (order_id, customer_id, order_date, total_amount, status) values
(1, 1, '2025-06-15', 1547.00, 'Delivered'),
(2, 1, '2025-09-20', 1999.00, 'Delivered'),
(3, 1, '2026-01-10', 799.00, 'Delivered'),
(4, 1, '2026-05-05', 1299.00, 'Shipped'),
(5, 1, '2026-07-20', 599.00, 'Pending'),
(6, 2, '2025-03-12', 2497.00, 'Delivered'),
(7, 2, '2026-06-01', 899.00, 'Delivered'),
(8, 3, '2025-01-05', 1499.00, 'Cancelled'),
(9, 3, '2026-02-14', 599.00, 'Delivered'),
(10, 4, '2025-07-30', 799.00, 'Delivered'),
(11, 5, '2026-04-10', 1299.00, 'Delivered'),
(12, 6, '2026-07-01', 349.00, 'Pending');

insert into order_items (order_item_id, order_id, product_id, quantity, subtotal) values
(1, 1, 1, 2, 1198.00),
(2, 1, 6, 1, 349.00),
(3, 2, 2, 1, 1999.00),
(4, 3, 8, 1, 799.00),
(5, 4, 3, 1, 1299.00),
(6, 5, 1, 1, 599.00),
(7, 6, 5, 1, 1499.00),
(8, 6, 4, 2, 998.00),
(9, 7, 7, 1, 899.00),
(10, 8, 5, 1, 1499.00),
(11, 9, 1, 1, 599.00),
(12, 10, 8, 1, 799.00),
(13, 11, 3, 1, 1299.00),
(14, 12, 6, 1, 349.00);

insert into payments (payment_id, order_id, payment_date, payment_method, payment_status) values
(1, 1, '2025-06-16', 'Credit Card', 'Paid'),
(2, 2, '2025-09-21', 'PayPal', 'Paid'),
(3, 3, '2026-01-11', 'UPI', 'Paid'),
(4, 4, '2026-05-06', 'Credit Card', 'Paid'),
(5, 5, '2026-07-21', 'UPI', 'Paid'),
(6, 6, '2025-03-13', 'Credit Card', 'Paid'),
(7, 7, '2026-06-02', 'UPI', 'Paid'),
(8, 8, '2025-01-06', 'PayPal', 'Failed'),
(9, 9, '2026-02-15', 'UPI', 'Paid'),
(10, 10, '2025-07-31', 'PayPal', 'Paid'),
(11, 11, '2026-04-11', 'Credit Card', 'Paid'),
(12, 12, '2026-07-02', 'UPI', 'Pending');

insert into shipping (shipping_id, order_id, shipping_date, delivery_date, shipping_status) values
(1, 1, '2025-06-17', '2025-06-20', 'Delivered'),
(2, 2, '2025-09-22', '2025-09-25', 'Delivered'),
(3, 3, '2026-01-12', '2026-01-15', 'Delivered'),
(4, 4, '2026-05-07', null, 'In Transit'),
(5, 6, '2025-03-14', '2025-03-18', 'Delivered'),
(6, 7, '2026-06-03', '2026-06-07', 'Delivered'),
(7, 9, '2026-02-16', '2026-02-19', 'Delivered'),
(8, 10, '2025-08-01', '2025-08-05', 'Delivered'),
(9, 11, '2026-04-12', '2026-04-16', 'Delivered');

-- 1. CRUD OPERATIONS

-- categories table
insert into categories (category_id, category_name) values (6, 'sports');
select * from categories;
update categories set category_name = 'sports & fitness' where category_id = 6;
delete from categories where category_id = 6;

-- products table
insert into products (product_id, name, category_id, price, stock_quantity, added_date)
values (10, 'yoga mat', 1, 799.00, 50, '2026-08-01');
select * from products;
update products set stock_quantity = 45 where product_id = 10;
delete from products where product_id = 10;

-- customers table
insert into customers (customer_id, name, email, phone_number, address, registration_date)
values (7, 'Rohan Das', 'rohan.das@email.com', '9876543218', 'Kolkata', '2026-08-01');
select * from customers;
update customers set address = 'Kolkata, WB' where customer_id = 7;
delete from customers where customer_id = 7;

-- orders table
insert into orders (order_id, customer_id, order_date, total_amount, status)
values (13, 1, '2026-08-01', 599.00, 'Pending');
select * from orders;
update products set stock_quantity = stock_quantity - 1 where product_id = 1;
update orders set status = 'Shipped' where order_id = 13;
delete from orders where order_id = 13;

-- order_items table
insert into order_items (order_item_id, order_id, product_id, quantity, subtotal)
values (15, 1, 4, 1, 499.00);
select * from order_items;
update order_items set quantity = 2, subtotal = 998.00 where order_item_id = 15;
delete from order_items where order_item_id = 15;

-- payments table
insert into payments (payment_id, order_id, payment_date, payment_method, payment_status)
values (13, 5, '2026-07-22', 'Credit Card', 'Paid');
select * from payments;
update payments set payment_status = 'Paid' where payment_id = 13;
delete from payments where payment_id = 13;

-- shipping table
insert into shipping (shipping_id, order_id, shipping_date, delivery_date, shipping_status)
values (10, 5, '2026-08-02', null, 'Dispatched');
select * from shipping;
update shipping set shipping_status = 'In Transit' where shipping_id = 10;
delete from shipping where shipping_id = 10;

-- delete orders cancelled more than 30 days ago 

delete p from payments p join orders o on p.order_id = o.order_id where o.status = 'Cancelled' and o.order_date < date_sub(current_date(), interval 30 day);

delete s from shipping s join orders o on s.order_id = o.order_id where o.status = 'Cancelled' and o.order_date < date_sub(current_date(), interval 30 day);

delete from orders where status = 'Cancelled' and order_date < date_sub(current_date(), interval 30 day);

-- 2. SQL CLAUSES 

-- Find all orders placed in the last 6 months
select * from orders where order_date >= date_sub(current_date(), interval 6 month);

-- Get the top 5 highest-priced products
select * from products order by price desc limit 5;

-- Find customers who have placed more than 3 orders
select o.customer_id, c.name, count(o.order_id) as total_orders from orders o join customers c on o.customer_id = c.customer_id group by o.customer_id, c.name having count(o.order_id) > 3;

-- 3. SQL OPERATORS 

-- Orders where status = 'Pending' AND payment_status = 'Paid'
select o.order_id, o.status, p.payment_status from orders o join payments p on o.order_id = p.order_id where o.status = 'Pending' and p.payment_status = 'Paid';

-- Products that are NOT out of stock
select * from products where not stock_quantity = 0;

-- Customers who registered after 2022 OR have made purchases above 10000

select distinct c.customer_id, c.name, c.registration_date from customers c where c.registration_date > '2022-12-31' or c.customer_id in ( select customer_id from orders group by customer_id having sum(total_amount) > 10000 );

-- 4. SORTING & GROUPING DATA 

-- List all products sorted by price in descending order
select * from products order by price desc;

-- Display the number of orders placed by each customer
select c.customer_id, c.name, count(o.order_id) as order_count from customers c left join orders o on c.customer_id = o.customer_id group by c.customer_id, c.name order by order_count desc;

-- Show total revenue generated per category
select cat.category_name, sum(oi.subtotal) as total_revenue from order_items oi join products p on oi.product_id = p.product_id join categories cat on p.category_id = cat.category_id group by cat.category_name order by total_revenue desc;

-- 5. AGGREGATE FUNCTIONS 

-- Total revenue generated by the store
select sum(total_amount) as total_revenue from orders where status <> 'Cancelled';

-- Most purchased product 
select p.product_id, p.name, sum(oi.quantity) as total_sold from order_items oi join products p on oi.product_id = p.product_id group by p.product_id, p.name order by total_sold desc limit 1;

-- Average order value
select avg(total_amount) as average_order_value from orders;

-- Max & min product price
select max(price) as max_price, min(price) as min_price from products;

-- 6. PRIMARY & FOREIGN KEY RELATIONSHIPS

-- Ensure orders are linked to customers and products
select o.order_id, c.name as customer_name, p.name as product_name, oi.quantity, oi.subtotal from orders o join customers c on o.customer_id = c.customer_id join order_items oi on o.order_id = oi.order_id join products p on oi.product_id = p.product_id order by o.order_id;

-- Establish relationships between payments and orders
select p.payment_id, o.order_id, o.customer_id, o.total_amount, p.payment_method, p.payment_status from payments p join orders o on p.order_id = o.order_id order by p.payment_id;

-- 7. JOINS

-- List of products along with their category names 
select p.product_id, p.name, cat.category_name from products p inner join categories cat on p.category_id = cat.category_id;

-- All orders with customer details 
select o.order_id, o.order_date, o.status, c.name, c.email from orders o left join customers c on o.customer_id = c.customer_id;

-- Orders that haven't been shipped 
select o.order_id, o.status, s.shipping_status from orders o left join shipping s on s.order_id = o.order_id where s.shipping_id is null;

-- Customers who have never placed an order 
select c.customer_id, c.name from customers c left join orders o on c.customer_id = o.customer_id where o.order_id is null;

-- 8. SUBQUERIES

-- Orders placed by customers who registered after 2022
select * from orders where customer_id in (select customer_id from customers where registration_date > '2022-12-31');

-- Customer who has spent the most
select customer_id, name from customers
where customer_id = (select customer_id from orders where status <> 'Cancelled' group by customer_id order by sum(total_amount) desc limit 1);

-- Products that have never been ordered
select * from products where product_id not in (select distinct product_id from order_items where product_id is not null);

-- 9. DATE & TIME FUNCTIONS

-- Extract the month from order_date to count orders per month
select year(order_date) as order_year, month(order_date) as order_month, count(*) as total_orders from orders group by year(order_date), month(order_date) order by order_year, order_month;

-- Calculate delivery time
select order_id, shipping_date, delivery_date, datediff(delivery_date, shipping_date) as delivery_time_days from shipping where delivery_date is not null;

-- Format order_date as DD-MM-YYYY
select order_id, date_format(order_date, '%d-%m-%Y') as formatted_order_date from orders;

-- 10. STRING MANIPULATION FUNCTIONS

-- Convert all product names to uppercase
select product_id, upper(name) as product_name_upper from products;

-- Trim whitespace from customer names
select customer_id, trim(name) as trimmed_name from customers;

-- Replace missing email values with "Not Provided"
select customer_id, name, coalesce(email, 'Not Provided') as email from customers;

-- 11. WINDOW FUNCTIONS

-- Rank customers based on total spending
select customer_id, total_spent, rank() over (order by total_spent desc) as spending_rank
from ( select customer_id, sum(total_amount) as total_spent  from orders  where status <> 'Cancelled' group by customer_id) as customer_totals;

-- Cumulative (running) total revenue per month
-- FIXED: added missing space between "orders" and "where"
select order_year, order_month, monthly_revenue, sum(monthly_revenue) over (order by order_year, order_month) as cumulative_revenue
from ( select year(order_date) as order_year, month(order_date) as order_month, sum(total_amount) as monthly_revenue from orders where status <> 'Cancelled' group by year(order_date), month(order_date)) as monthly_totals order by order_year, order_month;

-- Running total of orders placed
select order_id, order_date, count(order_id) over (order by order_date, order_id) as running_total_orders from orders;

-- 12. SQL CASE EXPRESSIONS

-- Assign a Loyalty_Status to customers based on total spending
select c.customer_id, c.name, coalesce(sum(o.total_amount), 0) as total_spent,
    case
        when coalesce(sum(o.total_amount), 0) > 50000 then 'Gold'
        when coalesce(sum(o.total_amount), 0) between 20000 and 50000 then 'Silver'
        else 'Bronze'
    end as loyalty_status
from customers c left join orders o on c.customer_id = o.customer_id and o.status <> 'Cancelled' group by c.customer_id, c.name;

-- Categorize products based on total units sold
select p.product_id, p.name, coalesce(sum(oi.quantity), 0) as total_sold,
    case
        when coalesce(sum(oi.quantity), 0) > 500 then 'Best Seller'
        when coalesce(sum(oi.quantity), 0) between 200 and 500 then 'Popular'
        else 'Regular'
    end as product_category from products p left join order_items oi on p.product_id = oi.product_id group by p.product_id, p.name;