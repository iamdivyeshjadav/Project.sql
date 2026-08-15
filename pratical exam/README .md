<div align="center">

# -- ! E-Commerce Management System — SQL ! --
### *Database Design, Data Manipulation & Advanced SQL Query Analysis*

[![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![SQL](https://img.shields.io/badge/SQL-Queries-CC2927?style=for-the-badge&logo=database&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-E--Commerce-4CAF50?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Analytics](https://img.shields.io/badge/Analytics-Aggregation%20%26%20Windows-9C27B0?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

<br/>

> *"A well-designed database turns business data into useful information."*

</div>

---

## 📋 Table of Contents

- [📌 Overview](#-overview)
- [🎯 Problem Statement](#-problem-statement)
- [✨ Key Features](#-key-features)
- [🏗️ Database Structure](#️-database-structure)
- [🔗 Table Relationships](#-table-relationships)
- [🔄 Project Workflow](#-project-workflow)
- [📝 Part A — Database & Data Setup](#-part-a--database--data-setup)
- [✏️ Part B — Data Manipulation](#️-part-b--data-manipulation)
- [📊 Part C — SQL Clauses](#-part-c--sql-clauses)
- [⚙️ Part D — SQL Operators](#️-part-d--sql-operators)
- [📈 Part E — Sorting & Grouping](#-part-e--sorting--grouping)
- [🧮 Part F — Aggregate Functions](#-part-f--aggregate-functions)
- [🔑 Part G — Keys & Relationships](#-part-g--keys--relationships)
- [🔗 Part H — Joins](#-part-h--joins)
- [🔍 Part I — Subqueries](#-part-i--subqueries)
- [📅 Part J — Date & Time Functions](#-part-j--date--time-functions)
- [🔤 Part K — String Functions](#-part-k--string-functions)
- [🪟 Part L — Window Functions](#-part-l--window-functions)
- [🔀 Part M — CASE Expressions](#-part-m--case-expressions)
- [🛠️ Tech Stack](#️-tech-stack)
- [🚀 How to Run](#-how-to-run)
- [📈 Results & Insights](#-results--insights)
- [🏆 Advantages](#-advantages)
- [📄 License](#-license)

---

## 📌 Overview

The **E-Commerce Management System** is a MySQL database project designed to store and analyze data related to an online store.

The SQL script creates an e-commerce database containing products, categories, customers, orders, order items, payments, and shipping information. It then demonstrates practical SQL operations ranging from basic data manipulation to joins, subqueries, aggregate functions, window functions, and `CASE` expressions.

This project is designed to:

- Practice relational database design
- Understand primary and foreign key relationships
- Perform `INSERT`, `SELECT`, `UPDATE`, and `DELETE` operations
- Filter and sort business data using SQL clauses and operators
- Analyze sales and customer information
- Work with joins and subqueries
- Apply date, string, aggregate, window, and conditional functions

---

## 🎯 Problem Statement

> **Objective:** Build and analyze a relational e-commerce database using SQL.

The database must manage:

| 📂 Entity | 🔍 Purpose |
|------------|------------|
| Categories | Stores product categories |
| Products | Stores product details, prices, stock, and category references |
| Customers | Stores customer and registration information |
| Orders | Stores customer purchases and order status |
| Order Items | Connects orders with purchased products |
| Payments | Stores payment information for orders |
| Shipping | Stores shipping and delivery information |

The project demonstrates how these entities can be queried together to answer common e-commerce business questions.

---

## ✨ Key Features

| Feature | Description |
|--------|-------------|
| 🗄️ **Relational Database** | Seven connected tables for e-commerce data |
| 🔑 **Primary Keys** | Unique identification for records in every main table |
| 🔗 **Foreign Keys** | Maintains relationships between related tables |
| ✏️ **CRUD Operations** | Demonstrates insert, select, update, and delete operations |
| 🔎 **Filtering** | Uses `WHERE`, `AND`, `OR`, and `NOT` conditions |
| 📊 **Grouping** | Groups customers, products, categories, and orders |
| 🧮 **Aggregations** | Uses `SUM`, `AVG`, `MAX`, `MIN`, and `COUNT` |
| 🔗 **Joins** | Uses `INNER JOIN` and `LEFT JOIN` |
| 🔍 **Subqueries** | Retrieves data based on results of other queries |
| 📅 **Date Analysis** | Uses date calculations and formatting |
| 🔤 **String Processing** | Uses `UPPER`, `TRIM`, and `COALESCE` |
| 🪟 **Window Functions** | Performs ranking and running-total analysis |
| 🔀 **CASE Logic** | Classifies customers and products into categories |

---

## 🏗️ Database Structure

```text
📦 ecommerce_management
│
├── 📂 categories
│   ├── category_id          PK
│   └── category_name
│
├── 📂 products
│   ├── product_id           PK
│   ├── name
│   ├── category_id          FK → categories
│   ├── price
│   ├── stock_quantity
│   └── added_date
│
├── 📂 customers
│   ├── customer_id          PK
│   ├── name
│   ├── email
│   ├── phone_number
│   ├── address
│   └── registration_date
│
├── 📂 orders
│   ├── order_id             PK
│   ├── customer_id          FK → customers
│   ├── order_date
│   ├── total_amount
│   └── status
│
├── 📂 order_items
│   ├── order_item_id        PK
│   ├── order_id             FK → orders
│   ├── product_id           FK → products
│   ├── quantity
│   └── subtotal
│
├── 📂 payments
│   ├── payment_id           PK
│   ├── order_id             FK → orders
│   ├── payment_date
│   ├── payment_method
│   └── payment_status
│
└── 📂 shipping
    ├── shipping_id          PK
    ├── order_id             FK → orders
    ├── shipping_date
    ├── delivery_date
    └── shipping_status
```

---

## 🔗 Table Relationships

```text
categories
     │
     │ 1 ──── N
     ▼
products ─────────────┐
     │                │
     │ 1 ──── N       │
     ▼                │
order_items ◄─────────┘
     ▲
     │ N
     │
     │ N
orders ────────────── customers
  │
  ├──────── payments
  │
  └──────── shipping
```

### Relationship Summary

| Relationship | Type |
|--------------|------|
| Categories → Products | One-to-Many |
| Customers → Orders | One-to-Many |
| Orders → Order Items | One-to-Many |
| Products → Order Items | One-to-Many |
| Orders → Payments | One-to-Many relationship through `order_id` |
| Orders → Shipping | One-to-Many relationship through `order_id` |

---

## 🔄 Project Workflow

```text
Start
  │
  ▼
Create Database
  │
  ▼
Create Tables
  │
  ▼
Define Primary & Foreign Keys
  │
  ▼
Insert Sample Data
  │
  ▼
Perform CRUD Operations
  │
  ▼
Filter / Sort / Group Data
  │
  ▼
Use Aggregates & Joins
  │
  ▼
Apply Subqueries
  │
  ▼
Perform Date & String Analysis
  │
  ▼
Use Window Functions & CASE
  │
  ▼
Generate Business Insights
```

---

## 📝 Part A — Database & Data Setup

### 1. Database Creation

The project creates and selects the `ecommerce_management` database:

```sql
create database ecommerce_management;
use ecommerce_management;
```

### 2. Tables Created

Seven tables are created:

- `categories`
- `products`
- `customers`
- `orders`
- `order_items`
- `payments`
- `shipping`

The schema uses primary keys and foreign keys to maintain relational integrity.

### 3. Sample Data

The script inserts sample records for:

- 5 product categories
- 9 products
- 6 customers
- 12 orders
- 14 order items
- Payment records
- Shipping records

---

## ✏️ Part B — Data Manipulation

The SQL file demonstrates basic data manipulation for the main tables.

### Operations Covered

| Operation | Purpose |
|-----------|---------|
| `INSERT` | Adds a new record |
| `SELECT` | Displays table data |
| `UPDATE` | Modifies existing data |
| `DELETE` | Removes records |

Examples include adding a customer, changing product stock, updating order status, modifying payment information, and deleting temporary records.

The script also removes cancelled orders older than 30 days:

```sql
delete from orders
where status = 'Cancelled'
and order_date < date_sub(current_date(), interval 30 day);
```

---

## 📊 Part C — SQL Clauses

### 1. Recent Orders

Finds orders placed during the last six months:

```sql
select *
from orders
where order_date >= date_sub(current_date(), interval 6 month);
```

### 2. Top 5 Products

```sql
select *
from products
order by price desc
limit 5;
```

### 3. Customers With More Than 3 Orders

Uses `GROUP BY` and `HAVING` to identify frequent customers.

---

## ⚙️ Part D — SQL Operators

The project demonstrates:

- `AND`
- `OR`
- `NOT`
- Comparison operators
- `IN`
- `<>`

Examples include finding pending orders with paid payments, identifying products that are not out of stock, and finding customers who registered after 2022 or spent more than 10,000.

---

## 📈 Part E — Sorting & Grouping

### Product Sorting

Products are sorted by price in descending order using:

```sql
order by price desc;
```

### Customer Order Counts

The number of orders placed by each customer is calculated using:

```sql
count(o.order_id)
```

along with `GROUP BY`.

### Revenue by Category

Total revenue is calculated for each category using `SUM(oi.subtotal)` and grouped by category name.

---

## 🧮 Part F — Aggregate Functions

The project demonstrates the following aggregate functions:

| Function | Usage |
|----------|-------|
| `SUM()` | Total revenue and total spending |
| `AVG()` | Average order value |
| `MAX()` | Highest product price |
| `MIN()` | Lowest product price |
| `COUNT()` | Number of orders |

### Business Analysis

The queries identify:

- Total store revenue
- Most purchased product
- Average order value
- Maximum product price
- Minimum product price

Cancelled orders are excluded from the total-revenue calculation.

---

## 🔑 Part G — Keys & Relationships

### Primary Keys

Each table has a primary key such as:

```text
category_id
product_id
customer_id
order_id
order_item_id
payment_id
shipping_id
```

### Foreign Keys

Relationships are established using foreign keys:

```text
products.category_id     → categories.category_id
orders.customer_id       → customers.customer_id
order_items.order_id     → orders.order_id
order_items.product_id   → products.product_id
payments.order_id        → orders.order_id
shipping.order_id        → orders.order_id
```

These relationships allow information from multiple tables to be queried together.

---

## 🔗 Part H — Joins

The project uses joins to combine related information.

### Examples

**Products with category names**

```sql
select p.product_id, p.name, cat.category_name
from products p
inner join categories cat
on p.category_id = cat.category_id;
```

**Orders with customer details**

```sql
select o.order_id, o.order_date, o.status, c.name, c.email
from orders o
left join customers c
on o.customer_id = c.customer_id;
```

Other join queries identify:

- Orders that have not been shipped
- Customers who have never placed an order

---

## 🔍 Part I — Subqueries

The project uses subqueries for more advanced filtering and analysis.

### Examples

- Orders placed by customers registered after 2022
- Customer who has spent the most
- Products that have never been ordered

Example:

```sql
select *
from products
where product_id not in
(
    select distinct product_id
    from order_items
    where product_id is not null
);
```

---

## 📅 Part J — Date & Time Functions

The script uses MySQL date functions to analyze order and shipping data.

| Function | Purpose |
|----------|---------|
| `YEAR()` | Extracts order year |
| `MONTH()` | Extracts order month |
| `DATEDIFF()` | Calculates delivery duration |
| `DATE_FORMAT()` | Formats dates |
| `DATE_SUB()` | Calculates relative dates |

### Example

```sql
select order_id,
       shipping_date,
       delivery_date,
       datediff(delivery_date, shipping_date) as delivery_time_days
from shipping
where delivery_date is not null;
```

---

## 🔤 Part K — String Functions

The project demonstrates simple string manipulation.

### Uppercase Product Names

```sql
select product_id,
       upper(name) as product_name_upper
from products;
```

### Trim Customer Names

```sql
select customer_id,
       trim(name) as trimmed_name
from customers;
```

### Replace Missing Emails

```sql
select customer_id,
       name,
       coalesce(email, 'Not Provided') as email
from customers;
```

---

## 🪟 Part L — Window Functions

Window functions are used for advanced analysis without collapsing the result rows.

### Customer Spending Rank

```sql
rank() over (order by total_spent desc)
```

Ranks customers according to their total spending.

### Cumulative Monthly Revenue

```sql
sum(monthly_revenue)
over (order by order_year, order_month)
```

Calculates a running total of revenue month by month.

### Running Order Count

```sql
count(order_id)
over (order by order_date, order_id)
```

Calculates the cumulative number of orders placed.

---

## 🔀 Part M — CASE Expressions

`CASE` expressions classify records according to business rules.

### Customer Loyalty Status

| Total Spending | Status |
|----------------|--------|
| Above 50,000 | Gold |
| 20,000–50,000 | Silver |
| Below 20,000 | Bronze |

### Product Sales Category

| Total Units Sold | Category |
|------------------|----------|
| Above 500 | Best Seller |
| 200–500 | Popular |
| Below 200 | Regular |

Example structure:

```sql
case
    when condition_1 then 'Gold'
    when condition_2 then 'Silver'
    else 'Bronze'
end
```

---

## 🛠️ Tech Stack

| Tool | Version / Type | Purpose |
|------|----------------|---------|
| 🐬 **MySQL** | 8.0+ | Database management |
| 🗃️ **SQL** | Standard/MySQL syntax | Data definition and querying |
| 🔑 **Primary Keys** | Relational | Unique record identification |
| 🔗 **Foreign Keys** | Relational | Table relationships |
| 📊 **Aggregate Functions** | SQL | Data analysis |
| 🪟 **Window Functions** | MySQL | Ranking and cumulative analysis |
| 🔀 **CASE Expressions** | SQL | Conditional classification |

---

## 🚀 How to Run

### 1. Install MySQL

Install MySQL Server and a MySQL client such as MySQL Workbench.

### 2. Open the SQL File

Open:

```text
Exam.sql
```

### 3. Execute the Script

Run the SQL script from top to bottom.

The script will:

1. Create the database
2. Select the database
3. Create all tables
4. Insert sample data
5. Execute data manipulation queries
6. Execute analytical queries

### 4. Verify the Database

```sql
use ecommerce_management;

show tables;
```

---

## 📈 Results & Insights

The SQL queries provide several useful e-commerce insights:

- 🛒 Orders can be analyzed by customer and date
- 💰 Store revenue can be calculated
- 🏆 Best-selling products can be identified
- 👥 Customer spending can be ranked
- 📦 Product stock can be monitored
- 🚚 Delivery time can be calculated
- 💳 Payment status can be connected to orders
- 📊 Revenue can be grouped by product category
- 📈 Monthly revenue can be accumulated using window functions
- 🏅 Customers and products can be classified using `CASE`

---

## 🏆 Advantages

| Advantage | Detail |
|-----------|--------|
| 🎓 **Educational** | Covers fundamental to advanced SQL concepts |
| 🗄️ **Relational Design** | Demonstrates connected database tables |
| 🔑 **Data Integrity** | Uses primary and foreign key constraints |
| 📊 **Analytical** | Provides practical business-oriented queries |
| 🔗 **Join Practice** | Demonstrates multiple-table data retrieval |
| 🔍 **Advanced SQL** | Includes subqueries and window functions |
| 📅 **Date Analysis** | Handles order and delivery dates |
| 🔤 **Data Cleaning** | Uses `TRIM()` and `COALESCE()` |
| 🔀 **Business Logic** | Uses `CASE` for customer and product classification |
| ⚡ **Lightweight** | Runs as a single SQL script |

---

# Author
<div align="center">

## Jadav Divyesh
[![GitHub](https://img.shields.io/badge/GitHub-yourhandle-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/)

> *"Behind every transcript is a query waiting to be written."*

**🎓 Role:** SQL Learner | Data Enthusiast \
**📍 Location:** India\
**🛠️ Skills:** SQL · Joins · Aggregates · Subqueries · Window Functions · Relational Design

</div>

---
---
*Made with ❤️ and SQL — E-Commerce Management Database Project*

</div>

