# Book-Shop Management System

## Project Overview
The Book-Shop Management System is a database project developed using Oracle SQL. It manages information about authors, books, shop owners, employees, customers, and sales.

## Technologies Used
- Oracle Database 21c XE
- Oracle SQL Developer
- SQL

## Database Tables
1. **AUTHOR** – Stores author information.
2. **BOOKKS** – Stores book details and author IDs.
3. **OWNERR** – Stores shop owner information.
4. **EMPLOYEEES** – Stores employee details and owner IDs.
5. **CUSTOMERR** – Stores customer information and purchased book IDs.
6. **SALES** – Stores sales records, including employees, customers, books, dates, and amounts.

## Features
- Manage author and book records.
- Store owner and employee information.
- Maintain customer purchase records.
- Record book sales and sale amounts.
- Use primary keys and foreign keys to maintain relationships.
- Retrieve related information using SQL JOIN queries.

## How to Run
1. Install Oracle Database and Oracle SQL Developer.
2. Connect to an Oracle database.
3. Open `bookshop_management.sql` in SQL Developer.
4. Run the SQL statements in the correct order.
5. Use SELECT queries to view records and test the system.

**Note:** The SQL script should be run on a fresh schema because the tables may already exist in a previously used database.

## Project Purpose
This project was developed for learning database design, SQL queries, primary keys, foreign keys, and relationships between tables.
