-- CROSS JOIN returns the Cartesian product of rows from tables in the join.
-- [explicit]
SELECT *
FROM employees CROSS JOIN departments;
-- [implicit]
SELECT *
FROM employees, departments;

-- INNER JOIN can be defined as the outcome of
-- first taking the CROSS JOIN of all rows in the tables
-- and then returning all rows that satisfy "a JOIN predicate".
-- [The "explicit join notation" uses the JOIN keyword,
-- optionally preceded by the INNER keyword, to specify the table to join,
-- and the ON keyword to specify "a JOIN predicate"]
SELECT employees.last_name, employees.department_id, departments.name
FROM employees INNER JOIN departments
  ON employees.department_id = departments.id;
-- [The following example is equivalent to the previous one,
-- but this time using implicit join notation:]
SELECT employees.last_name, employees.department_id, departments.name
FROM employees, departments
WHERE employees.department_id = departments.id;

-- A LEFT OUTER JOIN returns all the values from an INNER JOIN
-- plus all values in the left table that do not match to the right table,
-- including rows with NULL (empty) values in the link column.
SELECT *
FROM employees LEFT OUTER JOIN departments
  ON employees.department_id = departments.id;

-- Conceptually, a FULL OUTER JOIN combines the effect of applying
-- both a LEFT OUTER JOIN and a RIGHT OUTER JOIN.
SELECT *
FROM employees FULL OUTER JOIN departments
  ON employees.department_id = departments.id;
-- Some database systems (such as SQLite) do not support the FULL OUTER JOIN
-- functionality directly, but they can emulate it through the use of (a) an INNER JOIN,
-- (b) UNION ALL, and (c) the EXISTS boolean operator.

-- A self-join is joining a table to itself.
-- For example, suppose we need to find all pairs of employees in the same country;
-- that can be accomplished via the following self-join:
SELECT
    e1.id AS e1_id,
    e1.last_name AS e1_last_name,
    e2.id AS e2_id,
    e2.last_name AS e2_last_name,
    e2.country
FROM employees AS e1 INNER JOIN employees as e2
  ON e1.country = e2.country
WHERE e1.id < e2.id
ORDER BY e1.id, e2.id;

-- If columns in an equi-join (= a comparator-based JOIN that uses only equality
-- operators in the JOIN predicate) have the same name,
-- SQL-92 provides an optional shorthand notation for such JOINs
-- by way of the USING construct, which is more than mere syntactic sugar:
SELECT
    e1.id AS e1_id,
    e1.last_name AS e1_last_name,
    e2.id AS e2_id,
    e2.last_name AS e2_last_name,
    e2.country
FROM employees AS e1 INNER JOIN employees as e2
  USING (country)
WHERE e1.id < e2.id
ORDER BY e1.id, e2.id;