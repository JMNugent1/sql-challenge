--DROP TABLE IF EXISTS 
	--titles,
  --employees,
  --departments,
  --dept_emp,
  --dept_manager,
  --salaries;

CREATE TABLE titles (
  title_id VARCHAR PRIMARY KEY NOT NULL,
  title VARCHAR NOT NULL
 );
 
CREATE TABLE employees (
  emp_no INTEGER PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR REFERENCES titles(title_id) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date DATE NOT NULL
); 

CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY NOT NULL,
  dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
  emp_no INTEGER REFERENCES employees(emp_no) NOT NULL,
  dept_no VARCHAR REFERENCES departments(dept_no) NOT NULL,
  PRIMARY KEY(emp_no, dept_no));
   
CREATE TABLE dept_manager (
  dept_no VARCHAR REFERENCES departments(dept_no) NOT NULL,
  emp_no INTEGER REFERENCES employees(emp_no) NOT NULL,
  PRIMARY KEY (dept_no, emp_no));

CREATE TABLE salaries (
  emp_no INTEGER REFERENCES employees(emp_no) NOT NULL,
  salary INTEGER NOT NULL,
  PRIMARY KEY (emp_no));