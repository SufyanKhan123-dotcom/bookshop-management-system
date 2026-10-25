-- ==========================================
-- BOOK-SHOP MANAGEMENT SYSTEM
-- Database: Oracle SQL
-- ==========================================

-- 1. AUTHOR TABLE
CREATE TABLE author (
    author_id NUMBER PRIMARY KEY,
    author_name VARCHAR2(100) NOT NULL,
    author_gender VARCHAR2(10),
    author_language VARCHAR2(50)
);

-- 2. OWNER TABLE
CREATE TABLE ownerr (
    owner_id NUMBER PRIMARY KEY,
    owner_name VARCHAR2(100) NOT NULL,
    owner_gender VARCHAR2(10),
    owner_salary NUMBER(10,2)
);

-- 3. BOOK TABLE
CREATE TABLE bookks (
    book_id NUMBER PRIMARY KEY,
    book_name VARCHAR2(100) NOT NULL,
    publish_year NUMBER(4),
    book_language VARCHAR2(50),
    author_id NUMBER,
    CONSTRAINT fk_book_author
        FOREIGN KEY (author_id)
        REFERENCES author(author_id)
);

-- 4. EMPLOYEE TABLE
CREATE TABLE employeees (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100) NOT NULL,
    employee_salary NUMBER(10,2),
    owner_id NUMBER,
    CONSTRAINT fk_employee_owner
        FOREIGN KEY (owner_id)
        REFERENCES ownerr(owner_id)
);

-- 5. CUSTOMER TABLE
CREATE TABLE customerr (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    purchase_date DATE,
    book_id NUMBER,
    CONSTRAINT fk_customer_book
        FOREIGN KEY (book_id)
        REFERENCES bookks(book_id)
);

-- 6. SALES TABLE
CREATE TABLE sales (
    sale_id NUMBER PRIMARY KEY,
    employee_id NUMBER,
    customer_id NUMBER,
    book_id NUMBER,
    sale_date DATE,
    sale_amount NUMBER(10,2),
    CONSTRAINT fk_sales_employee
        FOREIGN KEY (employee_id)
        REFERENCES employeees(employee_id),
    CONSTRAINT fk_sales_customer
        FOREIGN KEY (customer_id)
        REFERENCES customerr(customer_id),
    CONSTRAINT fk_sales_book
        FOREIGN KEY (book_id)
        REFERENCES bookks(book_id)
);

-- AUTHOR DATA
INSERT INTO author VALUES (1, 'Ali Ahmed', 'Male', 'English');
INSERT INTO author VALUES (2, 'Sara Khan', 'Female', 'Urdu');
INSERT INTO author VALUES (3, 'Ahmed Raza', 'Male', 'English');
INSERT INTO author VALUES (4, 'Ayesha Noor', 'Female', 'Urdu');
INSERT INTO author VALUES (5, 'Usman Malik', 'Male', 'English');

-- OWNER DATA
INSERT INTO ownerr VALUES (1, 'Bilal Ahmed', 'Male', 80000);
INSERT INTO ownerr VALUES (2, 'Usman Khan', 'Male', 95000);
INSERT INTO ownerr VALUES (3, 'Ayesha Malik', 'Female', 75000);
INSERT INTO ownerr VALUES (4, 'Sara Ahmed', 'Female', 85000);
INSERT INTO ownerr VALUES (5, 'Hamza Ali', 'Male', 90000);

-- BOOK DATA
INSERT INTO bookks VALUES (101, 'Python Basics', 2023, 'English', 1);
INSERT INTO bookks VALUES (102, 'Urdu Stories', 2022, 'Urdu', 2);
INSERT INTO bookks VALUES (103, 'Database Systems', 2024, 'English', 3);
INSERT INTO bookks VALUES (104, 'Computer Science', 2023, 'English', 4);
INSERT INTO bookks VALUES (105, 'Learning SQL', 2025, 'English', 5);

-- EMPLOYEE DATA
INSERT INTO employeees VALUES (201, 'Ahmed Khan', 35000, 1);
INSERT INTO employeees VALUES (202, 'Usman Ali', 40000, 2);
INSERT INTO employeees VALUES (203, 'Sara Noor', 38000, 3);
INSERT INTO employeees VALUES (204, 'Bilal Ahmed', 32000, 1);
INSERT INTO employeees VALUES (205, 'Ayesha Khan', 42000, 4);

-- CUSTOMER DATA
INSERT INTO customerr VALUES (301, 'Ali Raza', DATE '2026-10-20', 101);
INSERT INTO customerr VALUES (302, 'Fatima Noor', DATE '2026-10-21', 102);
INSERT INTO customerr VALUES (303, 'Hassan Ahmed', DATE '2026-10-22', 103);
INSERT INTO customerr VALUES (304, 'Zara Khan', DATE '2026-10-23', 104);
INSERT INTO customerr VALUES (305, 'Usman Raza', DATE '2026-10-24', 105);

-- SALES DATA
INSERT INTO sales VALUES (401, 201, 301, 101, DATE '2026-10-20', 1500);
INSERT INTO sales VALUES (402, 202, 302, 102, DATE '2026-10-21', 1200);
INSERT INTO sales VALUES (403, 203, 303, 103, DATE '2026-10-22', 2500);
INSERT INTO sales VALUES (404, 204, 304, 104, DATE '2026-10-23', 2000);
INSERT INTO sales VALUES (405, 205, 305, 105, DATE '2026-10-24', 1800);

COMMIT;

-- 1. Display all books
SELECT * FROM bookks;

-- 2. Display all authors
SELECT * FROM author;

-- 3. Display all employees
SELECT * FROM employeees;

-- 4. Display all customers
SELECT * FROM customerr;

-- 5. Display all sales
SELECT * FROM sales;

-- 6. Display book names with author names
SELECT b.book_name, a.author_name
FROM bookks b
JOIN author a ON b.author_id = a.author_id;

-- 7. Display sales with customer, book, and employee details
SELECT s.sale_id, c.customer_name, b.book_name,
       e.employee_name, s.sale_date, s.sale_amount
FROM sales s
JOIN customerr c ON s.customer_id = c.customer_id
JOIN bookks b ON s.book_id = b.book_id
JOIN employeees e ON s.employee_id = e.employee_id;

-- 8. Calculate total sales amount
SELECT SUM(sale_amount) AS total_sales
FROM sales;