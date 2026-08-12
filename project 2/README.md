<div align="center">

# -- ! Data Transformer — SQL Joins, Functions & Window Queries ! --
### *A Practical SQL Playground for Joins, Subqueries, String/Date Functions & Analytics*

[![SQL](https://img.shields.io/badge/SQL-Structured%20Query%20Language-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Joins](https://img.shields.io/badge/Joins-Inner%2FLeft%2FRight%2FFull-FF6F00?style=for-the-badge&logo=databricks&logoColor=white)](https://www.mysql.com/)
[![Window Functions](https://img.shields.io/badge/Window%20Functions-RANK%2FSUM%20OVER-4CAF50?style=for-the-badge&logo=databricks&logoColor=white)](https://www.mysql.com/)
[![Database](https://img.shields.io/badge/Database-data__transformer-9C27B0?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

<br/>

> *"A well-joined table tells a better story than any single one alone."*

</div>

---

## 📋 Table of Contents

- [📌 Overview](#-overview)
- [🎯 Problem Statement](#-problem-statement)
- [✨ Key Features](#-key-features)
- [🏗️ Project Structure](#️-project-structure)
- [🔄 Project Workflow](#-project-workflow)
- [🗄️ Part A — Schema & Sample Data](#️-part-a--schema--sample-data)
- [🔗 Part B — Joins & Subqueries](#-part-b--joins--subqueries)
- [🧮 Part C — Date & String Functions](#-part-c--date--string-functions)
- [📊 Part D — Window Functions & Case Logic](#-part-d--window-functions--case-logic)
- [🛠️ Tech Stack](#️-tech-stack)
- [📈 Results & Insights](#-results--insights)
- [🏆 Advantages](#-advantages)
- [📄 License](#-license)
- [👤 Author](#-author)
- [🙏 Acknowledgements](#-acknowledgements)

---

## 📌 Overview

The **Data Transformer** project is a self-contained SQL script that builds a small relational database — `data_transformer` — and walks through the core query patterns every SQL learner needs: **joins**, **subqueries**, **date/string transformations**, and **window functions**. It's designed as a single runnable `.sql` file (`PR_2.sql`) that sets up its own schema, seeds sample data, and then demonstrates 17 numbered query exercises (q1–q17) against that data.

This project is designed to:
- Strengthen understanding of `INNER`, `LEFT`, `RIGHT`, and `FULL OUTER` joins
- Practice correlated and scalar subqueries against aggregate values
- Apply date extraction, formatting, and interval arithmetic
- Use string functions for cleaning and transforming text fields
- Build window-function analytics like running totals and ranks
- Apply `CASE` logic for tiered business rules (discounts, salary bands)

---

## 🎯 Problem Statement

> **Objective:** Build a small e-commerce style database and demonstrate the full range of standard SQL query techniques against it.

You are given two related business entities — **customers** who place **orders**, and a separate **employees** table — and asked to answer a series of analytical questions: which customers spend above average, how orders trend over time, how to reformat and clean text/date fields, and how to rank and bucket records using window functions and conditional logic.

| 📂 Feature | 📄 Type | 🔍 Description |
|------------|---------|----------------|
| Schema Setup | DDL | Creates `customers`, `orders`, and `employees` tables |
| Sample Data | DML | Seeds 3 customers, 4 orders, 3 employees |
| Join Queries | DQL | Inner, left, right, and full outer join variants |
| Subqueries | DQL | Above-average order and salary filtering |
| Date/String Functions | DQL | Extraction, formatting, trimming, case conversion |
| Window Functions | DQL | Running totals and rankings |
| CASE Logic | DQL | Discount tiers and salary categories |

The goal is to demonstrate **fundamental to intermediate SQL skills** through one continuous, well-commented script.

---

## ✨ Key Features

| Feature | Description |
|--------|-------------|
| 🗄️ **Self-Contained Setup** | Drops and recreates the `data_transformer` database from scratch |
| 🔗 **4 Join Types** | Inner, left, right, and a `UNION`-based full outer join |
| 🔍 **Aggregate Subqueries** | Filters rows against `AVG()` of orders and salaries |
| 📅 **Date Handling** | `EXTRACT`, date subtraction, and custom date formatting |
| ✂️ **String Handling** | Concatenation, `REPLACE`, `UPPER`/`LOWER`, and `TRIM` |
| 📊 **Window Functions** | Running total with `SUM() OVER` and ranking with `RANK() OVER` |
| 🏷️ **CASE-Based Tiers** | Discount tiers by order amount and salary bands by pay |
| 🔢 **17 Numbered Queries** | Each query labeled q1–q17 with an explanatory comment |

---

## 🏗️ Project Structure

```
📦 data-transformer/
│
├── 📄 PR_2.sql              ← Main SQL script (schema + data + all queries)
│
└── 📄 README.md             ← Project documentation
```

---

## 🔄 Project Workflow

```
Script Start
      │
      ▼
┌─────────────────────────────┐
│  DROP & CREATE DATABASE     │  ← data_transformer
└────────────┬────────────────┘
             │
             ▼
┌─────────────────────────────┐
│  CREATE TABLES               │  ← customers, orders, employees
│  INSERT SAMPLE DATA          │
└────────────┬────────────────┘
             │
     ┌───────┼────────────────┬──────────────────┐
     ▼                        ▼                   ▼
┌─────────────┐      ┌──────────────────┐  ┌──────────────────┐
│  Joins &    │      │  Date & String    │  │  Window Funcs &  │
│  Subqueries │      │  Functions        │  │  CASE Logic      │
│  (q1–q6)    │      │  (q7–q13)         │  │  (q14–q17)       │
└──────┬──────┘      └────────┬──────────┘  └────────┬─────────┘
       │                      │                       │
       ▼                      ▼                       ▼
┌─────────────────────────────────────────────────────────────┐
│                 Query Results Returned to Console            │
└─────────────────────────────────────────────────────────────┘
```

---

## 🗄️ Part A — Schema & Sample Data

### 📝 1. Tables

| Table | Key Columns | Purpose |
|-------|-------------|---------|
| `customers` | `customerID` (PK), `firstName`, `lastName`, `email`, `registrationDate` | Stores customer profile data |
| `orders` | `orderID` (PK), `customerID` (FK), `orderDate`, `totalAmount` | Stores order transactions linked to customers |
| `employees` | `employeeID` (PK), `firstName`, `lastName`, `department`, `hireDate`, `salary` | Stores staff records used in the salary subquery/case exercises |

### 🌱 2. Sample Data

- **3 customers**: divyesh jadav, neev shankar, tirth donga
- **4 orders**: ranging from ₹75.00 to ₹1200.00, dated July–August 2023
- **3 employees**: across Sales, HR, and IT departments

---

## 🔗 Part B — Joins & Subqueries

> Queries **q1–q6** cover the four standard join types plus two aggregate subqueries.

| Query | Type | Description |
|-------|------|--------------|
| **q1** | Inner Join | Returns only orders that have a matching customer |
| **q2** | Left Join | Returns all customers, with order details where they exist |
| **q3** | Right Join | Returns all customers via orders, preserving unmatched customers |
| **q4** | Full Outer (via `UNION`) | Combines customers and orders regardless of match, since this dialect lacks native `FULL OUTER JOIN` |
| **q5** | Subquery | Customers whose orders exceed the average order amount |
| **q6** | Subquery | Employees earning above the average salary |

**Logic (q5 excerpt):**
```sql
select distinct c.customerID, c.firstName, c.lastName
from customers c
join orders o on c.customerID = o.customerID
where o.totalAmount > (select avg(totalAmount) from orders);
```

---

## 🧮 Part C — Date & String Functions

> Queries **q7–q13** transform date and text fields into more usable forms.

| Query | Function Used | Description |
|-------|----------------|--------------|
| **q7** | `EXTRACT(YEAR/MONTH FROM ...)` | Pulls the year and month out of `orderDate` |
| **q8** | `CURRENT_DATE - orderDate` | Computes days elapsed since each order |
| **q9** | `DATE_FORMAT(...)` | Reformats `orderDate` into `dd-Month-yy` style |
| **q10** | `\|\|` concatenation | Joins `firstName` and `lastName` into `fullName` |
| **q11** | `REPLACE(...)` | Swaps one first name for another |
| **q12** | `UPPER()` / `LOWER()` | Normalizes name casing |
| **q13** | `TRIM(...)` | Strips stray whitespace from the `email` field |

---

## 📊 Part D — Window Functions & Case Logic

> Queries **q14–q17** cover analytics-style SQL: running totals, ranks, and tiered classification.

### 📈 Running Total & Ranking

```sql
-- q14: running total of totalAmount ordered by date
select orderID, customerID, orderDate, totalAmount,
       sum(totalAmount) over (order by orderDate) as runningTotal
from orders;

-- q15: rank orders by totalAmount, highest first
select orderID, totalAmount,
       rank() over (order by totalAmount desc) as orderRank
from orders;
```

### 🏷️ Tiered Classification

| Query | Rule | Buckets |
|-------|------|---------|
| **q16** | Order discount tier | `>1000` → 10% off · `>500` → 5% off · else → no discount |
| **q17** | Salary category | `>=70000` → high · `>=50000` → medium · else → low |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| 🗄️ **SQL (MySQL-style dialect)** | Core language for schema, data, and queries |
| 🔗 **Joins** | `INNER`, `LEFT`, `RIGHT`, and `UNION`-based full outer |
| 🔍 **Subqueries** | Scalar aggregate filtering (`AVG`) |
| 📅 **Date Functions** | `EXTRACT`, `CURRENT_DATE`, `DATE_FORMAT` |
| ✂️ **String Functions** | `REPLACE`, `UPPER`, `LOWER`, `TRIM`, concatenation |
| 📊 **Window Functions** | `SUM() OVER`, `RANK() OVER` |
| 🏷️ **CASE Expressions** | Tiered conditional labeling |

---

## 📈 Results & Insights

Running the script produces:

- ✅ **A fully seeded database** — 3 customers, 4 orders, 3 employees
- 🔗 **17 distinct result sets** — one per numbered query (q1–q17)
- 💰 **Above-average spenders identified** — via the q5/q6 subqueries
- 📅 **Cleaned & reformatted dates** — human-readable order dates
- 📊 **Running totals & ranks** — order-level analytics via window functions
- 🏷️ **Business-rule tiers** — discount and salary bands applied via `CASE`

---

## 🏆 Advantages

| Advantage | Detail |
|-----------|--------|
| 🎓 **Beginner-to-Intermediate Friendly** | Covers joins, subqueries, and window functions in one file |
| 🔄 **Self-Resetting** | `DROP`/`CREATE DATABASE` makes the script safely re-runnable |
| 📚 **Well-Commented** | Every query is labeled and explained inline |
| 🖥️ **No External Dependencies** | Runs on any standard SQL engine supporting the dialect used |
| ⚡ **Single-File Script** | Easy to run end-to-end in one execution |
| 🧪 **Extensible** | New tables or queries can be appended following the same pattern |
| 📖 **Readable Structure** | Queries are grouped logically by topic (joins → functions → analytics) |

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for full details.

```
MIT License — Free to use, modify, and distribute with attribution.
```

---

## 👤 Author

<div align="center">

### Divyesh jadav


[![GitHub](https://img.shields.io/badge/GitHub-yourhandle-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/)

> *"Every dataset tells a story — SQL just helps you ask it the right questions."*

**🎓 Role:** SQL Learner | Data Enthusiast \
**📍 Location:** India\
**🛠️ Skills:** SQL · Joins · Subqueries · Window Functions · Data Modeling

</div>



---

*Made with ❤️ and lots of `SELECT` statements — Last updated: 12 August, 2026*

</div>
