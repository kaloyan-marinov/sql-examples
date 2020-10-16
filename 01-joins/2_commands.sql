-- CROSS JOIN returns the Cartesian product of rows from tables in the join.
-- [explicit]
SELECT *
FROM employee CROSS JOIN department;
-- [implicit]
SELECT *
FROM employee, department;

-- INNER JOIN can be defined as the outcome of
-- first taking the CROSS JOIN of all rows in the tables
-- and then returning all rows that satisfy "a JOIN predicate".
-- [The "explicit join notation" uses the JOIN keyword,
-- optionally preceded by the INNER keyword, to specify the table to join,
-- and the ON keyword to specify "a JOIN predicate"]
SELECT employee.LastName, employee.DepartmentID, department.DepartmentName
FROM employee INNER JOIN department
  ON employee.DepartmentID = department.DepartmentID;
-- [The following example is equivalent to the previous one,
-- but this time using implicit join notation:]
SELECT employee.LastName, employee.DepartmentID, department.DepartmentName
FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID;

-- If columns in an equi-join (= a comparator-based JOIN that uses only equality
-- operators in the JOIN predicate) have the same name,
-- SQL-92 provides an optional shorthand notation for such JOINs
-- by way of the USING construct, which is more than mere syntactic sugar:
SELECT *
FROM employee INNER JOIN department
USING (DepartmentId);

-- A LEFT OUTER JOIN returns all the values from an INNER JOIN
-- plus all values in the left table that do not match to the right table,
-- including rows with NULL (empty) values in the link column.
SELECT *
FROM employee LEFT OUTER JOIN department
  ON employee.DepartmentID = department.DepartmentID;

-- Conceptually, a FULL OUTER JOIN combines the effect of applying
-- both a LEFT OUTER JOIN and a RIGHT OUTER JOIN.
SELECT *
FROM employee FULL OUTER JOIN department
  ON employee.DepartmentID = department.DepartmentID;
-- Some database systems (such as SQLite) do not support the FULL OUTER JOIN
-- functionality directly, but they can emulate it through the use of (a) an INNER JOIN,
-- (b) UNION ALL, and (c) the EXISTS boolean operator.
