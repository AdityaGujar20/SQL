-- use is used to connect to the database
use employees;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- Select the specific columns from the table
SELECT 
    first_name, last_name
FROM
    employees;

-- Select all columns from the table. * means all columns
SELECT 
    *
FROM
    employees;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- The WHERE clause in SQL is used to filter records in a database query based on specified conditions. 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- Logical operators

-- 1. The AND operator in SQL is used to combine multiple conditions in a WHERE clause. 
-- 	  All conditions combined with AND must be true for a row to be included in the result set.
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

-- 2. The OR operator in SQL is used to combine multiple conditions in a WHERE clause. 
--    At least one of the conditions combined with OR must be true for a row to be included in the result set.
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';

-- The AND operator has higher precedence than the OR operator. 
-- To ensure conditions are evaluated in the desired order, you can use parentheses to group conditions.
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' OR gender = 'F');

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- Comparison operators
-- 1. IN: Checks if a value matches any value in a specified list.
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

-- 2. NOT IN: Checks if a value does not match any value in a specified list.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

-- 3. LIKE: Searches for a specified pattern in a column.
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');
 
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');

-- 4. NOT LIKE: Searches for a column that does not match a specified pattern.
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%ar');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('Mar_');

-- 5. BETWEEN ... AND ...: Checks if a value is within a specified range.
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';

-- 6. NOT BETWEEN ... AND ...: to filter values that are outside a specified range.
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

-- 7. IS NULL: Checks if a value is null.
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

-- 8. IS NOT NULL: Checks if a value is not null.
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;

-- 9. !=: Checks if two values are not equal.
SELECT 
    *
FROM
    employees
WHERE
    first_name != 'Mark';

-- More compaison operators: =, !=, <, >, <=, >=

SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';

--
SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- SELECT DISTINCT statement in SQL is used to return only distinct (different) values from a column in a table. 
-- It eliminates duplicate rows in the result set.
SELECT DISTINCT
    gender
FROM
    employees;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- COUNT function in SQL is used to count the number of rows in a table or the number of non-NULL values in a specified column.
SELECT 
    COUNT(emp_no)
FROM
    employees;

-- Query will return the count of records where the first_name column contains NULL values in the employees table.
SELECT 
    COUNT(emp_no)
FROM
    employees
WHERE
    first_name IS NULL;

-- Query will return the count of unique (distinct) values in the first_name column of the employees table.
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- ORDER BY clause in SQL is used to sort the result set of a query in ascending or descending order based on one or more columns.
-- Ascending
SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

-- Descending
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

-- Query will give you a list of distinct first_name values along with the count of occurrences for each, 
-- sorted alphabetically in descending order by first_name.
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- Rename columns: Alias is used to rename the selections of the table, here the first_name and count(first_name) are 2 selections
-- This is will rename the count(first_name) column name to names_count
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- HAVING clause in SQL is used in conjunction with the GROUP BY clause to filter the rows returned by GROUP BY based on specified conditions.
-- WHERE is used to filter rows before grouping and aggregation.
-- HAVING is used to filter groups after grouping and aggregation, based on aggregated values.
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING names_count > 250
ORDER BY first_name;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING names_count < 200
ORDER BY first_name DESC;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------

-- LIMIT clause in SQL is used to specify the maximum number of rows returned by a query. 
-- It is particularly useful when you want to retrieve only a specified number of records from the result set.
-- List down top 10 higest paid employees.
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

-- -------------------------------------------------------------------------------------------------------------------------------------------------------