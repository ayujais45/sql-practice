CREATE DATABASE ecommerse;
USE ecommerse;
-- Department TABLE
CREATE TABLE departments(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(150)
);
-- Employees TABLE
CREATE TABLE employees(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(150),
dept_id INT,
salary DECIMAL(10,2),
joining_date DATE,
city  VARCHAR(150),
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id)
);
INSERT INTO departments
(dept_id, dept_name)
VALUES(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations'),
(6, 'Sales');
SELECT * FROM departments;

INSERT INTO employees
(emp_id, emp_name, dept_id, salary, joining_date, city)
VALUES
(101, 'Amit', 1, 85000, '2025-01-10', 'Bangalore'),
(102, 'Priya', 1, 75000, '2025-03-15', 'Bangalore'),
(103, 'Rahul', 1, 95000, '2026-02-20', 'Mumbai'),
(104, 'Sneha', 2, 55000, '2024-06-10', 'Delhi'),
(105, 'Arjun', 2, 60000, '2026-01-05', 'Bangalore'),
(106, 'Neha', 3, 90000, '2025-08-12', 'Mumbai'),
(107, 'Kiran', 3, 70000, '2026-03-18', 'Delhi'),
(108, 'Ravi', 3, 65000, '2025-11-25', 'Bangalore'),
(109, 'Pooja', 4, 72000, '2026-04-10', 'Chennai'),
(110, 'Anil', 4, 68000, '2024-09-01', 'Chennai'),
(111, 'Meena', 5, 50000, '2025-05-15', 'Bangalore'),
(112, 'Vikram', 5, 58000, '2026-05-20', 'Mumbai'),
(113, 'Rohit', 1, 85000, '2025-12-01', 'Bangalore'),
(114, 'Asha', 2, 62000, '2026-06-10', 'Delhi'),
(115, 'Amit', 3, 78000, '2025-07-19', 'Mumbai');

SELECT * FROM employees;

-- Projects TABLE
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT,
    project_cost DECIMAL(12,2),
    start_date DATE,
    FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id)
);

INSERT INTO projects
(project_id, project_name, emp_id, project_cost, start_date)
VALUES
(201, 'Cloud Migration', 101, 400000, '2025-01-15'),
(202, 'Security Audit', 101, 300000, '2025-03-01'),
(203, 'Data Pipeline', 101, 350000, '2025-06-10'),

(204, 'Website Upgrade', 102, 250000, '2025-04-10'),
(205, 'Mobile App', 102, 200000, '2025-08-01'),

(206, 'Cyber Security', 103, 600000, '2026-03-01'),
(207, 'Network Upgrade', 103, 500000, '2026-04-15'),

(208, 'Recruitment System', 104, 150000, '2024-07-01'),

(209, 'Payroll System', 106, 450000, '2025-09-01'),
(210, 'Financial Dashboard', 106, 550000, '2026-01-15'),
(211, 'Audit Automation', 106, 300000, '2026-03-20'),

(212, 'Marketing Analytics', 109, 200000, '2026-04-20'),
(213, 'Operations System', 111, 180000, '2025-06-01'),
(214, 'Sales Dashboard', 112, 220000, '2026-06-01');

-- Customers TABLE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

INSERT INTO customers
(customer_id, customer_name, city)
VALUES
(1, 'Customer A', 'Bangalore'),
(2, 'Customer B', 'Mumbai'),
(3, 'Customer C', 'Delhi'),
(4, 'Customer D', 'Chennai'),
(5, 'Customer E', 'Bangalore'),
(6, 'Customer F', 'Pune'),
(7, 'Customer G', 'Hyderabad');

-- Transactions TABLE

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(12,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO transactions
(transaction_id, customer_id, transaction_date, transaction_type, amount)
VALUES
(301, 1, '2026-01-05', 'CREDIT', 50000),
(302, 1, '2026-01-15', 'DEBIT', 10000),
(303, 1, '2026-02-10', 'CREDIT', 75000),
(304, 1, '2026-03-12', 'CREDIT', 90000),

(305, 2, '2026-01-20', 'CREDIT', 120000),
(306, 2, '2026-02-18', 'DEBIT', 30000),

(307, 3, '2026-01-25', 'CREDIT', 80000),
(308, 3, '2026-02-25', 'CREDIT', 90000),
(309, 3, '2026-03-05', 'CREDIT', 60000),

(310, 4, '2026-03-15', 'DEBIT', 20000),

(311, 5, '2026-04-10', 'CREDIT', 150000),
(312, 5, '2026-04-20', 'CREDIT', 100000),

(313, 6, '2026-05-10', 'DEBIT', 25000);

-- Employees History TABLE

CREATE TABLE employee_history (
    emp_id INT,
    salary DECIMAL(10,2),
    effective_date DATE
);

INSERT INTO employee_history
(emp_id, salary, effective_date)
VALUES
(101, 70000, '2024-01-01'),
(101, 78000, '2025-01-01'),
(101, 85000, '2026-01-01'),

(102, 60000, '2024-01-01'),
(102, 68000, '2025-01-01'),
(102, 75000, '2026-01-01'),

(103, 80000, '2025-01-01'),
(103, 90000, '2026-01-01');

-- Q1 
SELECT dept_id, COUNT(*) AS employee_count, AVG(salary) AS average_salary FROM 
employees GROUP BY dept_id; 

-- Q2
SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 70000;

-- Q3
SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id;

-- Q4
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- Q5
SELECT emp_id
FROM projects
GROUP BY emp_id
HAVING COUNT(*) > 2;

-- Q6
SELECT
    emp_id,
    SUM(project_cost) AS total_cost
FROM projects
GROUP BY emp_id;

-- Q7
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;

-- Q8
SELECT MAX(salary)
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- Q9
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- Q10
SELECT dept_id
FROM employees
GROUP BY dept_id
HAVING COUNT(*) >= 5;

-- Q11
SELECT emp_name
FROM employees
GROUP BY emp_name
HAVING COUNT(*) > 1;

-- Q12
SELECT city
FROM employees
GROUP BY city
HAVING COUNT(*) > 10;

-- Q13
SELECT emp_id
FROM projects
GROUP BY emp_id
HAVING SUM(project_cost) > 1000000;

-- Q14
SELECT
    e.emp_id,
    e.emp_name,
    SUM(p.project_cost) AS total_cost
FROM employees e
JOIN projects p
    ON e.emp_id = p.emp_id
GROUP BY
    e.emp_id,
    e.emp_name;

-- Q15
SELECT customer_id
FROM transactions
GROUP BY customer_id
HAVING SUM(amount) > 200000;

-- Q16
SELECT
    YEAR(transaction_date),
    MONTH(transaction_date),
    SUM(amount)
FROM transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date);
    
-- Q17
SELECT
    customer_id,
    SUM(amount)
FROM transactions
WHERE transaction_type = 'CREDIT'
GROUP BY customer_id;

-- Q18
SELECT customer_id
FROM transactions
GROUP BY customer_id
HAVING COUNT(*) > 5;

-- Q19
SELECT
    c.customer_name,
    t.amount
FROM customers c
JOIN transactions t
    ON c.customer_id = t.customer_id;
    
-- Q20
SELECT c.customer_id
FROM customers c
LEFT JOIN transactions t
    ON c.customer_id = t.customer_id
WHERE t.customer_id IS NULL;

-- Q21
SELECT
    dept_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id
ORDER BY avg_salary DESC
LIMIT 1;

-- Q22
SELECT
    dept_id,
    MIN(salary) AS minimum_salary
FROM employees
GROUP BY dept_id
HAVING MIN(salary) > 40000;

-- Q23
SELECT *
FROM employees
WHERE joining_date >= '2026-01-01'
  AND joining_date < '2027-01-01';
  
-- Q24
SELECT *
FROM employees
ORDER BY joining_date DESC
LIMIT 1;

-- Q25
SELECT
    emp_id
FROM projects
GROUP BY emp_id
HAVING COUNT(DISTINCT project_id) >= 3;

-- Q26
SELECT
    e.emp_id
FROM employees e
LEFT JOIN projects p
    ON e.emp_id = p.emp_id
WHERE p.project_id IS NULL;

-- Q27
SELECT *
FROM projects
ORDER BY project_cost DESC
LIMIT 1;

-- Q28
SELECT
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY
    d.dept_id,
    d.dept_name;
    
-- Q29
SELECT
    dept_id,
    MAX(salary) - MIN(salary) AS salary_range
FROM employees
GROUP BY dept_id;

-- Q30
SELECT
    dept_id
FROM employees
GROUP BY dept_id
HAVING COUNT(*) >= 5
   AND AVG(salary) > 60000;
   
-- Q31
SELECT
    emp_id,
    emp_name,
    dept_id,
    salary,
    RANK() OVER (
        PARTITION BY dept_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM employees;

-- Q32
SELECT *
FROM (
    SELECT
        e.*,
        DENSE_RANK() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS salary_rank
    FROM employees e
) x
WHERE salary_rank <= 3;

-- Q33
SELECT
    emp_id,
    emp_name,
    salary,
    SUM(salary) OVER (
        ORDER BY emp_id
    ) AS running_total
FROM employees;

-- Q34
SELECT
    emp_id,
    emp_name,
    dept_id,
    salary,
    AVG(salary) OVER (
        PARTITION BY dept_id
    ) AS department_avg
FROM employees;

-- Q35
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);

-- Q36
SELECT *
FROM (
    SELECT
        h.*,
        ROW_NUMBER() OVER (
            PARTITION BY emp_id
            ORDER BY effective_date DESC
        ) AS rn
    FROM employee_history h
) x
WHERE rn = 1;

-- Q37
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 80000
)
SELECT *
FROM high_salary;

-- Q38
SELECT
    dept_id,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id
ORDER BY avg_salary DESC
LIMIT 1;

-- Q39
SELECT
    emp_id,
    joining_date
FROM employees
GROUP BY
    emp_id,
    joining_date
HAVING COUNT(*) > 1;

-- 40
SELECT
    emp_id,
    emp_name,
    joining_date,
    ROW_NUMBER() OVER (
        PARTITION BY emp_id
        ORDER BY joining_date
    ) AS row_num
FROM employees;

-- Q41
SELECT
    customer_id,
    MAX(amount) AS highest_transaction
FROM transactions
GROUP BY customer_id;

-- Q42
SELECT *
FROM (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY amount DESC
        ) AS rn
    FROM transactions t
) x
WHERE rn = 1;

-- Q43
SELECT
    YEAR(transaction_date) AS yr,
    MONTH(transaction_date) AS mon,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date);
    
-- Q44
SELECT
    YEAR(transaction_date) AS yr,
    MONTH(transaction_date) AS mon,
    customer_id,
    SUM(amount) AS total_amount,
    RANK() OVER (
        PARTITION BY
            YEAR(transaction_date),
            MONTH(transaction_date)
        ORDER BY SUM(amount) DESC
    ) AS rnk
FROM transactions
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date),
    customer_id;
    
-- Q45
SELECT
    customer_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY transaction_date
    ) AS running_total
FROM transactions;

-- Q46
SELECT
    project_id,
    start_date,
    project_cost,
    SUM(project_cost) OVER (
        ORDER BY start_date
    ) AS cumulative_cost
FROM projects;

-- Q47
SELECT
    customer_id,
    transaction_date,
    amount,
    LAG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY transaction_date
    ) AS previous_amount
FROM transactions;

-- Q48
SELECT
    customer_id,
    transaction_date,
    amount,
    LEAD(amount) OVER (
        PARTITION BY customer_id
        ORDER BY transaction_date
    ) AS next_amount
FROM transactions;

-- Q49
SELECT *
FROM transactions
WHERE amount IS NULL
   OR customer_id IS NULL
   OR amount < 0;
   
-- Q50
SELECT *
FROM (
    SELECT
        e.*,
        DENSE_RANK() OVER (
            PARTITION BY dept_id
            ORDER BY salary DESC
        ) AS rnk
    FROM employees e
) x
WHERE rnk <= 2;