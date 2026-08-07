<div align="center">

# -- ! Data Digger ! --
### *Practical SQL Project for E-Commerce Database Management*

[![MySQL](https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![SQL](https://img.shields.io/badge/SQL-CRUD%20Operations-FF6F00?style=for-the-badge&logo=databricks&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-Relational-4CAF50?style=for-the-badge&logo=sqlite&logoColor=white)](https://www.mysql.com/)
[![Aggregate](https://img.shields.io/badge/Functions-Aggregate%20%26%20Joins-9C27B0?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

<br/>

> *"Data is only as useful as the queries that dig it out."*

</div>

---

## 📋 Table of Contents

- [📌 Overview](#-overview)
- [🎯 Objective](#-objective)
- [✨ Key Features](#-key-features)
- [🏗️ Project Structure](#️-project-structure)
- [🔄 Project Workflow](#-project-workflow)
- [1️⃣ Customers Table](#1️⃣-customers-table)
- [2️⃣ Orders Table](#2️⃣-orders-table)
- [3️⃣ Products Table](#3️⃣-products-table)
- [4️⃣ OrderDetails Table](#4️⃣-orderdetails-table)
- [🛠️ Tech Stack](#️-tech-stack)
- [📈 Results & Insights](#-results--insights)
- [🏆 Advantages](#-advantages)
- [📄 License](#-license)
- [👤 Author](#-author)
- [🙏 Acknowledgements](#-acknowledgements)

---

## 📌 Overview

**Data Digger** is a practical, beginner-to-intermediate MySQL project that provides hands-on experience in managing a relational database for an **E-Commerce Store**. The project demonstrates **CRUD operations**, **clauses**, **operators**, **aggregate functions**, **primary keys**, and **foreign keys** across four interconnected tables.

This project is designed to:
- Strengthen understanding of relational database design with primary and foreign keys
- Practice CRUD operations (Create, Read, Update, Delete) in a realistic scenario
- Apply SQL clauses and operators such as `WHERE`, `LIKE`, `BETWEEN`, and `ORDER BY`
- Use aggregate functions (`SUM`, `COUNT`, `MAX`, `MIN`, `AVG`) to analyze business data
- Combine tables using `JOIN` to extract meaningful, cross-table insights

---

## 🎯 Objective

> **Objective:** Design and manipulate a structured relational database for an E-Commerce Store to gain deeper insights into SQL query execution.

Students/learners work through four relational tables — **Customers**, **Orders**, **Products**, and **OrderDetails** — performing inserts, updates, deletes, filtered retrievals, and aggregate analysis on each.

| 📂 Table | 📄 Type | 🔍 Description |
|----------|---------|----------------|
| Customers | Core Entity | Stores customer identity and contact details |
| Orders | Transaction | Records what each customer ordered and when |
| Products | Catalog | Store inventory with pricing and stock levels |
| OrderDetails | Junction | Links Orders and Products with quantity and subtotal |

---

## ✨ Key Features

| Feature | Description |
|--------|-------------|
| 🔑 **Primary & Foreign Keys** | Enforced relational integrity across all four tables |
| ➕ **CRUD Operations** | Insert, Select, Update, and Delete implemented for every table |
| 🔍 **Pattern Matching** | `LIKE` operator used to filter customers by name |
| 📅 **Date Filtering** | Retrieves orders placed within the last 30 days |
| 💰 **Range Filtering** | `BETWEEN` operator used to filter products by price range |
| 📊 **Aggregate Functions** | `SUM`, `COUNT`, `MAX`, `MIN`, `AVG` applied across tables |
| 🔗 **JOIN Queries** | Combines OrderDetails with Products for readable output |
| 🏆 **Top-N Analysis** | Retrieves top 3 most-ordered products using `GROUP BY` |

---

## 🏗️ Project Structure

```
📦 data-digger/
│
├── 📄 data_digger.sql       ← Full SQL script (schema + data + queries)
│
└── 📄 README.md             ← Project documentation
```

---

## 🔄 Project Workflow

```
Program Start
      │
      ▼
┌─────────────────────────────┐
│   Create Database & Tables  │  ← Customers, Orders, Products, OrderDetails
└────────────┬────────────────┘
             │
             ▼
┌─────────────────────────────┐
│   Insert Sample Records     │  ← 5+ rows per table
└────────────┬────────────────┘
             │
     ┌───────┴────────┐
     ▼                ▼
┌─────────────┐   ┌──────────────────┐
│  CRUD Ops   │   │  Aggregate & Join │
│ (Insert/    │   │  (SUM, COUNT,     │
│  Update/    │   │   MAX, MIN, AVG)  │
│  Delete)    │   │                  │
└──────┬──────┘   └────────┬─────────┘
       │                   │
       ▼                   ▼
┌─────────────────────────────┐
│   Retrieve & Analyze Data   │
└────────────┬────────────────┘
             │
             ▼
      Business Insights ✅
```

---

## 1️⃣ Customers Table

### 📝 Fields

| Field | Type | Description |
|-------|------|--------------|
| CustomerID | INT (PK, Auto Increment) | Unique identifier for each customer |
| Name | VARCHAR(100) | Customer's full name |
| Email | VARCHAR(100), Unique | Customer's email address |
| Address | VARCHAR(255) | Customer's mailing address |

### 🔍 Queries Performed

- Insert at least 5 sample customers into the Customers table
- Retrieve all customer details
- Update a customer's address
- Delete a customer using their CustomerID
- Display all customers whose name matches a given pattern using `LIKE`

**Logic:**
```sql
SELECT * FROM Customers
WHERE Name LIKE 'Divyesh%';
```

---

## 2️⃣ Orders Table

### 📝 Fields

| Field | Type | Description |
|-------|------|--------------|
| OrderID | INT (PK, Auto Increment) | Unique identifier for each order |
| CustomerID | INT (FK → Customers) | Links order to a specific customer |
| OrderDate | DATE | Date the order was placed |
| TotalAmount | DECIMAL(10,2) | Total value of the order |

### 🔍 Queries Performed

- Insert at least 5 sample orders into the Orders table
- Retrieve all orders made by a specific customer
- Update an order's total amount
- Delete an order using its OrderID
- Retrieve orders placed in the last 30 days
- Retrieve the highest, lowest, and average order amount using aggregate functions

**Logic:**
```sql
SELECT
    MAX(TotalAmount) AS HighestOrder,
    MIN(TotalAmount) AS LowestOrder,
    AVG(TotalAmount) AS AverageOrder
FROM Orders;
```

---

## 3️⃣ Products Table

### 📝 Fields

| Field | Type | Description |
|-------|------|--------------|
| ProductID | INT (PK, Auto Increment) | Unique identifier for each product |
| ProductName | VARCHAR(100) | Name of the product |
| Price | DECIMAL(10,2) | Price of the product |
| Stock | INT | Quantity available in stock |

### 🔍 Queries Performed

- Insert at least 5 sample products into the Products table
- Retrieve all products sorted by price in descending order
- Update the price of a specific product
- Delete a product if it's out of stock
- Retrieve products whose price is between ₹500 and ₹2000
- Retrieve the most expensive and cheapest product using `MAX()` and `MIN()`

**Logic:**
```sql
SELECT * FROM Products
WHERE Price BETWEEN 500 AND 2000;
```

---

## 4️⃣ OrderDetails Table

### 📝 Fields

| Field | Type | Description |
|-------|------|--------------|
| OrderDetailID | INT (PK, Auto Increment) | Unique identifier for each order line item |
| OrderID | INT (FK → Orders) | Links the detail to a specific order |
| ProductID | INT (FK → Products) | Links the detail to a specific product |
| Quantity | INT | Number of units ordered |
| SubTotal | DECIMAL(10,2) | Line item total (Price × Quantity) |

### 🔍 Queries Performed

- Insert at least 5 sample records into the OrderDetails table
- Retrieve all order details for a specific order
- Calculate the total revenue generated from all orders using `SUM()`
- Retrieve the top 3 most ordered products
- Count how many times a specific product has been sold using `COUNT()`

**Logic:**
```sql
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalQuantityOrdered DESC
LIMIT 3;
```

---

## 🛠️ Tech Stack

| Tool | Version | Purpose |
|------|---------|---------|
| 🐬 **MySQL** | 8.0+ | Relational database management system |
| 🔑 **Primary/Foreign Keys** | Built-in | Relational integrity across tables |
| 🔍 **WHERE / LIKE / BETWEEN** | Built-in | Filtering and pattern matching |
| 📊 **Aggregate Functions** | Built-in | SUM, COUNT, MAX, MIN, AVG |
| 🔗 **JOIN** | Built-in | Combining data across related tables |
| 📐 **GROUP BY / ORDER BY** | Built-in | Grouping and sorting query results |

---

## 📈 Results & Insights

After running the script, the following outputs are produced:

- ✅ **4 Relational Tables** — Customers, Orders, Products, and OrderDetails, fully linked via keys
- 🔢 **25+ Sample Records** — Realistic seed data across all tables
- 💰 **Revenue Analysis** — Total revenue calculated using `SUM()`
- 🏆 **Top Products** — Top 3 most-ordered products identified via `GROUP BY`
- 📊 **Price & Order Insights** — Highest, lowest, and average values surfaced via aggregate functions
- 🔗 **Joined Views** — Order details displayed with readable product names instead of raw IDs

---

## 🏆 Advantages

| Advantage | Detail |
|-----------|--------|
| 🎓 **Beginner Friendly** | Covers CRUD, clauses, operators, and aggregates in one project |
| 🔗 **Relational Design** | Demonstrates real-world use of primary and foreign keys |
| 📚 **Educational** | Each query reinforces a distinct SQL concept |
| 🖥️ **No Dependencies** | Runs on any standard MySQL server — no extra tools needed |
| ⚡ **Lightweight** | Single-file script, runnable end-to-end in seconds |
| 🧪 **Extensible** | Easy to add new tables (e.g., Suppliers, Reviews, Payments) |
| 📖 **Readable Queries** | Clear, well-commented SQL structure for easy learning |
| 🛡️ **Data Integrity** | Foreign keys with `ON DELETE CASCADE` keep data consistent |

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for full details.

```
MIT License — Free to use, modify, and distribute with attribution.
```

---

## 👤 Author

<div align="center">

### Divyesh Jadav

> *"Every insight starts with a single query — just like every database starts with a single table."*

**🎓 Role:** SQL Learner | Database Enthusiast \
**📍 Location:** India \
**🛠️ Skills:** MySQL · Relational Database Design · CRUD Operations · Aggregate Functions · Joins

</div>

---

## 🙏 Acknowledgements

Special thanks to the following resources and communities that made this project possible:

- 📚 [MySQL Official Docs](https://dev.mysql.com/doc/) — Official MySQL reference documentation
- 🔁 [W3Schools SQL](https://www.w3schools.com/sql/) — Beginner-friendly SQL reference
- 📐 [GeeksForGeeks — SQL](https://www.geeksforgeeks.org/sql-tutorial/) — SQL concepts and examples
- 💬 [Stack Overflow Community](https://stackoverflow.com/) — Problem-solving support


---
video link : https://drive.google.com/file/d/1XAS-vK61KTJXrZ9ca71_ndJPGrETPD8C/view?usp=sharing
<div align="center">

---

*Made with ❤️ and SQL — Last updated: 02 August, 2026*

</div>
