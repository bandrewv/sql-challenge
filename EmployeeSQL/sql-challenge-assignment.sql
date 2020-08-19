-- Create schemas

-- Create tables in the following order:
-- 1) Departments
-- 2) Dept_Employees
-- 3) Dept_Manager
-- 4) Employees
-- 5) Salaries
-- 6) Titles

CREATE TABLE IF NOT EXISTS departments
(
    dept_no VARCHAR(4) NOT NULL UNIQUE,
    dept_name VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS dept_employees
(
    emp_no INTEGER NOT NULL,
    dept_no VARCHAR(4) NOT NULL    
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    dept_no VARCHAR(4) NOT NULL,
    emp_no INTEGER NOT NULL    
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_no INTEGER NOT NULL UNIQUE,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30),
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL    
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id VARCHAR(5) NOT NULL UNIQUE,
    title VARCHAR(30) NOT NULL,
    PRIMARY KEY(title_id)
);


-- Create FKs in the following order:
-- 1) Dept_Employees - dept_no ref. departments(dept_no)
-- 2) Dept_Manager - dept_no ref. departments(dept_no)
-- 3) Dept_Manager - emp_no ref. employees(emp_no)
-- 4) Dept_Employees - emp_no ref. employees(emp_no)
-- 5) Salaries - emp_no ref. employees(emp_no)
-- 6) Employees - emp_title_no ref. titles(title_id)
    
ALTER TABLE dept_employees
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_employees
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE salaries
    ADD    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD    FOREIGN KEY (emp_title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;
    

-- Create Indexes

