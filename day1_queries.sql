--This is how you comment in SQL
--"Hello World" of SQL -- SELECT all records from a table
SELECT * -- * means all columns
FROM actor; -- ; separates commands


-- Query specific columns - SELECT column_name, ... FROM table_name

SELECT first_name, last_name
FROM actor;

-- Filter Rows - use the WHERE clause - always comes after the FROM 
SELECT *
FROM actor 
WHERE first_name = 'Nick';

-- Using the LIKE operator - allows for regex like patterns
SELECT *
FROM actor 
WHERE first_name LIKE 'Nick';

-- Use wildcards with LIKE - % acts as a multi-character wildcard
-- can be any number of characters (0 - infinity) - zero or many *
SELECT *
FROM actor
WHERE last_name LIKE 'M%';

SELECT *
FROM actor 
WHERE first_name LIKE '%r%';

-- Underscore (_) represents 1 and only 1 CHARACTER 
SELECT *
FROM actor 
WHERE first_name LIKE '_i_';

-- USE in same pattern
SELECT *
FROM actor 
WHERE last_name LIKIE '_i%';

--USING AND and OR in the WHERE clause
-- OR - only one needs to be TRUE 
SELECT * 
FROM actor 
WHERE first_name LIKE 'N%' OR last_name LIKE 'W%';

-- Comparing Operators in SQL:
-- Greater Than (>) - Less than (<)
-- Greater Than or Equal (>=) -- Less Than or Equal (<=)
-- Equal (=) -- Not Equal (<>)

--Explore data of new table with SELECT
SELECT *
FROM payment;

--Query all payments greater than $4.00
SELECT customer_id, amount
FROM payment 
WHERE amount > 4;

SELECT customer_id, amount
FROM payment 
WHERE amount > '4';

SELECT customer_id, amount
FROM payment 
WHERE amount >= '2.99';

SELECT customer_id, amount
FROM payment 
WHERE amount <> 7.99;

-- Get all payments between $3 and $8 inclusive
SELECT customer_id, amount
FROM payment 
WHERE amount >= 3 AND amount <= 8;

-- BETWEEN / AND clause
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8;

--Order the rows that come back using ht eORDER BY clause - ORDER BY col-_name
SELECT *
FROM payment a
WHERE amount BETWEEN 3 AND 5
ORDER BY payment_date DESC; -- DESC will ORDER BY descending ORDER

-- order by works with strings alphabetically
SELECT *
FROM actor 
ORDER BY last_name;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- take in a column_name as an argument and returns a single value
SELECT SUM(amount)
FROM payment;

SELECT SUM(amount)
FROM payment 
WHERE amount > 5;

--Get the Average payment amount
SELECT AVG(amount)
FROM payment;

SELECT COUNT(*)
FROM payment;

SELECT COUNT(*)
FROM payment 
WHERE amount > 5;

SELECT MIN(amount) AS lowest_amount_paid
FROM payment;

SELECT MAX(amount) AS highest_amount_paid
FROM payment;

SELECT first_name AS fn
FROM actor
WHERE first_name LIKE 'J%';

SELECT payment_id, rental_id, payment_id - rental_id AS difference
FROM payment;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM actor;

SELECT COUNT (*)
FROM payment
WHERE amount = 4.99;

SELECT amount, COUNT(*)
FROM payment 
GROUP BY amount;

SELECT customer_id, SUM(amount) AS total_spent
FROM payment 
GROUP BY customer_id 
ORDER BY total_spent DESC;

-- HAVING clause 
SELECT customer_id, SUM(amount) AS total_spent
FROM payment 
GROUP BY customer_id 
HAVING COUNT(*) >= 40
ORDER BY total_spent DESC;

-- LIMIT and OFFSET clause

--LIMIT  - limit the number of rows that are returned
SELECT *
FROM film
LIMIT 10;

-- OFFSET - start your rows after a certain amount of rows using OFFSET
SELECT *
FROM film
OFFSET 10; -- SKIP OVER THE FIRST 10 ROWS

-- Put Together
SELECT *
FROM film 
OFFSET 10
LIMIT 5;

--Putting all the clauses into one query
--Display customers 11 -20 who have spent the most in under 20 payments and has a customer_id > 350
SELECT customer_id, SUM(amount) AS total_spent, COUNT(*)
FROM payment 
WHERE customer_id > 350
GROUP BY customer_id
HAVING COUNT(*) < 20
ORDER BY total_spent DESC
OFFSET 10
LIMIT 10;

-- Syntax:
--