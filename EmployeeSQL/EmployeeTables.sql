-- CREATE DATABASE
Drop DATABASE SQL-Challenge;
Create DATABASE SQL-Challenge;


-- DROP TABLES to start in case there are any
DROP TABLE Titles;
DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Departments;
DROP TABLE Dept_Manager;
DROP TABLE Dept_Emp;


---------- CREATE TABLES ----------


-- Create tables for Titles from .csv (title_id, title)
CREATE TABLE Titles(
 title_id VARCHAR(5) NOT NULL PRIMARY KEY,
 title VARCHAR(30) NOT NULL
);


-- Create tables for Employees from .csv 
-- (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
CREATE TABLE Employees(
 emp_no INTEGER NOT NULL PRIMARY KEY,
 emp_title_id VARCHAR(6) NOT NULL,
 birth_date DATE NOT NULL,
 first_name VARCHAR(30) NOT NULL,
 last_name VARCHAR(30) NOT NULL,
 sex VARCHAR(2) NOT NULL,
 hire_date DATE NOT NULL,
 FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

-- FOREIGN KEYS (The 3 main/unique Primary Keys to reference)
-- FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
-- FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
-- FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)



-- Create tables for Salaries from .csv (emp_no, salary)
CREATE TABLE Salaries(
 emp_no INTEGER NOT NULL PRIMARY KEY,
 salary FLOAT(6) NOT NULL,
 FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);


-- Create tables for Departments from .csv (dept_no, dept_name)
CREATE TABLE Departments(
 dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
 dept_name VARCHAR(30) NOT NULL
);


-- Create Composite Keys for table: 'Primary Key (Col1,Col2)'

-- Create tables for Departments_Manager from .csv (dept_no, emp_no)
CREATE TABLE Dept_Manager(
 dept_no VARCHAR(5) NOT NULL,
 emp_no INTEGER NOT NULL,
 PRIMARY KEY (dept_no,emp_no),
 
 FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
 FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
 );



-- Create tables for Departments_Employee from .csv (emp_no, dept_no)
CREATE TABLE Dept_Emp(
 emp_no INTEGER NOT NULL,
 dept_no VARCHAR(5) NOT NULL,
 PRIMARY KEY (emp_no,dept_no),

 FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
 FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);



---------- IMPORT CSV(s) ----------
-- Import the cooresponding 6 .csv in 'data' folder into the matching tables in the order of table creations above
-- w/Header and comma DELIMITER 



---------- CHECK TABLES ----------
SELECT * FROM Titles;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Departments;
SELECT * FROM Dept_Manager;
SELECT * FROM Dept_Emp;
