# 🛒 National Online Marketplace System
### Database Design & SQL Querying — SQL Server Assignment

![SQL Server](https://img.shields.io/badge/Microsoft_SQL_Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)
![Database](https://img.shields.io/badge/Database-Relational-0D2B55?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-28a745?style=for-the-badge)

---

## Overview

This project involves the design and implementation of a relational database for a **National Online Marketplace** — a platform where customers can browse products listed by sellers across multiple categories and place orders. The database was built using **Microsoft SQL Server** and covers full schema design, data population, and advanced query writing.

The assignment is structured in two parts: building the schema with integrity constraints, and writing analytical SQL queries using joins, aggregation, subqueries, and built-in functions.

---

## Database Schema

The system is built around five core tables that model the real-world relationships of a marketplace:

- **Customers** — stores registered users with their contact details and registration date
- **Sellers** — stores vendor accounts with unique email enforcement
- **Categories** — a lookup table for product classification
- **Products** — the marketplace catalogue, linked to both a seller and a category via foreign keys
- **Orders** — records of customer purchases, referencing the Customers table

Referential integrity is maintained throughout using foreign key constraints, ensuring no orphaned products or orders exist in the system.

---

## Part A — Schema Design & Data Population

The schema is created under a dedicated database `National_Online_Marketplace_System`. Each table is defined with appropriate data types, primary keys, and constraints. Two sample records are seeded into each table to support query testing in Part B.

Notable design decisions include the use of `MONEY` as the data type for product pricing, `UNIQUE` enforcement on seller emails, and `DATE` columns for time-tracking on both customer registrations and orders.

---

## Part B — Query Highlights

Four analytical queries are written to extract business insights from the populated database:

**Active Customer Analysis** — Identifies customers who have placed more than two orders using a JOIN between Customers and Orders, grouped and filtered with `HAVING`.

**Prolific Seller Identification** — Finds sellers who have listed more than three products by joining Sellers and Products, demonstrating multi-column `GROUP BY` with aggregate filtering.

**Category Product Count with UNION** — Counts products per category across two combined result sets using `UNION`, with results sorted in descending order by category name. This demonstrates set operations and deduplication behavior.

**Above-Average Product Listing** — Retrieves products priced above the marketplace average using a scalar subquery with `AVG()`. Output columns are transformed using `UPPER()` for names and `ROUND()` for prices.

---

## Concepts Demonstrated

- Relational schema design with normalization principles
- Primary and foreign key constraint enforcement
- Aggregate functions: `COUNT()`, `AVG()`
- Grouping and filtering: `GROUP BY`, `HAVING`
- Multi-table joins: `INNER JOIN`
- Set operations: `UNION`
- Scalar subqueries in `WHERE` clauses
- Built-in string and math functions: `UPPER()`, `ROUND()`

---

## Files

| File | Description |
|------|-------------|
| `OEL-1.sql` | Full SQL script — DDL, DML, and all Part B queries |
| `Database_Assignment_Question.pdf` | Assignment question sheet with schema specs and query tasks |
| `README.md` | This file |

---

## Author

**Muhammad Abdullah**
BS Computer Science — Karachi, Pakistan
[GitHub](https://github.com/muhammad-abdullaahh) • [LinkedIn](https://linkedin.com/in/muhammad-abdullaahh)
