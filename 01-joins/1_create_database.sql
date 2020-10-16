CREATE TABLE departments (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(20)
);

CREATE TABLE employees (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    last_name VARCHAR(20),
    country VARCHAR(20),
    department_id INT REFERENCES department(id)
);

INSERT INTO departments
VALUES (31, 'Sales'),
       (33, 'Engineering'),
       (34, 'Clerical'),
       (35, 'Marketing');

INSERT INTO employees (last_name, country, department_id)
VALUES ('Rafferty', 'Australia', 31),
       ('Jones', 'Australia', 33),
       ('Heisenberg', 'Australia', 33),
       ('Robinson', 'United States', 34),
       ('Smith', 'Germany', 34),
       ('Williams', 'Germany', NULL);
