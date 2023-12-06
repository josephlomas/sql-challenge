-- Create a table schema for each of the six CSV files
CREATE TABLE departments(
	dept_no VARCHAR(5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE titles(
  title_id VARCHAR(5) PRIMARY KEY NOT NULL,
  title VARCHAR(30) NOT NULL
 );

CREATE TABLE employees(
  emp_no INTEGER PRIMARY KEY NOT NULL,
  emp_title VARCHAR(5) REFERENCES titles(title_id) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date DATE NOT NULL
); 

CREATE TABLE dept_emp(
  emp_no INTEGER REFERENCES employees(emp_no) NOT NULL,
  dept_no VARCHAR(5) REFERENCES departments(dept_no) NOT NULL,
  PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE dept_manager(
  dept_no VARCHAR(5) REFERENCES departments(dept_no) NOT NULL,
  emp_no INTEGER REFERENCES employees(emp_no) NOT NULL,
  PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries(
  emp_no INTEGER REFERENCES employees(emp_no) NOT NULL,
  salary INTEGER NOT NULL,
  PRIMARY KEY (emp_no)
);
