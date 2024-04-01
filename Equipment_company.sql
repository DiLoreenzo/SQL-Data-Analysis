--TABLE: Employee
CREATE TABLE employee(
  emp_id VARCHAR(4) PRIMARY KEY,
	emp_name VARCHAR(50),
	address VARCHAR(100),
	DOB DATE,
	job VARCHAR(20),
	salary_code VARCHAR(5) REFERENCES Salarygrade(salary_code),
	dept_id VARCHAR(5) REFERENCES Department(dept_id),
	manager VARCHAR(5),
	scheme_id VARCHAR(5) REFERENCES Pensionscheme(scheme_id)
);


--TABLE: Department
CREATE TABLE Department(
   dept_id VARCHAR(5) PRIMARY KEY,
   dept_name VARCHAR(50)
);


--TABLE: SalaryGrade
CREATE TABLE Salarygrade(
   salary_code VARCHAR(5) PRIMARY KEY,
   start_salary INT,
   finish_salary INT
);


--TABLE: PensionScheme
CREATE TABLE Pensionscheme(
   Scheme_id VARCHAR(5) PRIMARY KEY,
   scheme_name VARCHAR(20),
   rate DECIMAL
);

--Data entry
INSERT INTO employee VALUES('E101', 'Keita, J', '1 high street', '06/03/76', 'Clerk', 'SI', 'D10', 'E110', 'S116')
INSERT INTO employee VALUES('E301', 'Wang,F.', '22 railway road', '11/04/80', 'Sales person', 'S2', 'D30', 'E310', 'S124')
INSERT INTO employee VALUES('E310', 'Flavel,K.', '14 crescent road', '5/11/69', 'Manager', 'S5', 'D30', NULL, 'S121')
INSERT INTO employee VALUES('E501', 'Payne, J.', '7 heap street', '09/02/72', 'Analyst', 'S5', 'D50', 'E310', 'S121')
INSERT INTO employee VALUES('E102', 'Patel,R.', '16 glade close', '3/07/74', 'Clerk', 'SI', 'D10', 'E110', 'S116')
INSERT INTO employee VALUES('E110', 'Smith,B.', '199 London road', '2/05/70', 'Manager', 'S5', 'D10', NULL, 'S121')
SELECT * FROM employee

INSERT INTO department VALUES('D10','Administration')
INSERT INTO department VALUES('D20','Finance')
INSERT INTO department VALUES('D30','Sales')
INSERT INTO department VALUES('D40','Maintenance')
INSERT INTO department VALUES('D50','IT Support')
SELECT * FROM department

INSERT INTO salarygrade VALUES('SI',17000,19000)
INSERT INTO salarygrade VALUES('S2',19001,24000)
INSERT INTO salarygrade VALUES('S3',24001,26000)
INSERT INTO salarygrade VALUES('S4',26001,30000)
INSERT INTO salarygrade VALUES('S5',30001,39000)
SELECT * FROM salarygrade


INSERT INTO pensionscheme VALUES('S110','AXA',0.5)
INSERT INTO pensionscheme VALUES('S121','Premier',0.6)
INSERT INTO pensionscheme VALUES('S124','Stakeholder',0.4)
INSERT INTO pensionscheme VALUES('S116','Standard',0.4)
SELECT * FROM pensionscheme


--The name (in ascending order), the starting salary and department id of each employee
--within a descending order of department ids.
SELECT emp_name, start_salary, dept_id FROM employee
INNER JOIN  salarygrade ON employee.salary_code = salarygrade.salary_code
ORDER BY 3 DESC, 1 ASC;


--Give the number of employees for each of the pension schemes offered by the company.
--Result listing should include the name of each scheme and its corresponding number of
--employees who join the scheme.
SELECT scheme_name, COUNT(DISTINCT(emp_name)) AS no_of_employees FROM employee
INNER JOIN pensionscheme ON employee.scheme_id = pensionscheme.scheme_id
GROUP BY scheme_name
ORDER BY COUNT(DISTINCT(emp_name)) DESC;


--Give the total number of employees who are not managers but currently receive an annual
--salary of over £35,000.
SELECT COUNT(DISTINCT(emp_name)) AS no_of_employees FROM employee
INNER JOIN salarygrade ON employee.salary_code = salarygrade.salary_code
WHERE finish_salary > 35000 AND job != 'Manager';


--List the id and name of each employee along with his/her manager’s name.
SELECT  emp.emp_id, emp.emp_name, man.emp_name AS managers_name FROM employee AS emp
JOIN employee AS man ON emp.emp_id = man.manager


