CREATE TABLE department(
    DepartmentID INT PRIMARY KEY NOT NULL,
    DepartmentName VARCHAR(20)
);

CREATE TABLE employee (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    LastName VARCHAR(20),
    country VARCHAR(20),
    DepartmentID INT REFERENCES department(DepartmentID)
);

INSERT INTO department
VALUES (31, 'Sales'),
       (33, 'Engineering'),
       (34, 'Clerical'),
       (35, 'Marketing');

INSERT INTO employee (LastName, country, DepartmentID)
VALUES ('Rafferty', 'Australia', 31),
       ('Jones', 'Australia', 33),
       ('Heisenberg', 'Australia', 33),
       ('Robinson', 'United States', 34),
       ('Smith', 'Germany', 34),
       ('Williams', 'Germany', NULL);
