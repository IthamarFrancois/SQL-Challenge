-- Reference to refer to column names/variables
SELECT * FROM Titles;
SELECT * FROM Employees;
SELECT * FROM Salaries;
SELECT * FROM Departments;
SELECT * FROM Dept_Manager;
SELECT * FROM Dept_Emp;


------------------------------------------------------------------------------------------------------------------------------------------------


-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
  -- Employees.emp_no  Salaries.emp_no  |  Employees.emp_no   Employees.last_name  Employees.first_name  Employees.sex  Salaries.salary
 
SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Employees.sex, Salaries.salary
FROM Employees
INNER JOIN Salaries ON Employees.emp_no = Salaries.emp_no;


------------------------------------------------------------------------------------------------------------------------------------------------


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
  -- Employees.first_name, Employees.last_name, Employees.hire_date == 1986

SELECT first_name, last_name, hire_date
FROM Employees WHERE hire_date >= '01-01-1986' AND hire_date <= '12-31-1986';


------------------------------------------------------------------------------------------------------------------------------------------------


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
  -- Departments   Dept_Manager  Employees  |  Dept_Manager.dept_no,  Departments.dept_name,  Dept_Manager.emp_no,  Employees.last_name,  Employees.first_name, 

SELECT Departments.dept_no, Departments.dept_name, Dept_Manager.emp_no, Employees.last_name, Employees.first_name
FROM Departments
INNER JOIN Dept_Manager ON Departments.dept_no = Dept_Manager.dept_no
INNER JOIN Employees ON Dept_Manager.emp_no = Employees.emp_no;


------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
  -- Employees  Dept_Emp  Departments.dept_no  | Employees.emp_no,  Employees.last_name,  Employees.first_name, Departments.dept_name

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no;


------------------------------------------------------------------------------------------------------------------------------------------------


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
  -- Employees | first_name,  last_name,  sex | first_name = 'Hercules' LIKE last_name = 'B%'

SELECT first_name, last_name, sex FROM Employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


------------------------------------------------------------------------------------------------------------------------------------------------


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
  -- Employees  Dept_Emp  Departments | Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';


------------------------------------------------------------------------------------------------------------------------------------------------

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
  -- Employees   Dept_Emp   Departments.dept_no  |  Employees.emp_no,  Employees.last_name,  Employees.first_name, Departments.dept_name

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees
INNER JOIN Dept_Emp ON Employees.emp_no = Dept_Emp.emp_no
INNER JOIN Departments ON Dept_Emp.dept_no = Departments.dept_no
WHERE dept_name = 'Sales' OR  dept_name = 'Development';

------------------------------------------------------------------------------------------------------------------------------------------------


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
  -- Employees  |  last_name,  DESC, COUNT, "LastNameCount"

SELECT last_name,
COUNT(last_name) AS "LastNameCount" 
FROM Employees
GROUP BY last_name
ORDER BY "LastNameCount" DESC;

------------------------------------------------------------------------------------------------------------------------------------------------

-- Bonus
-- Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, your boss thanks you for your work. 
-- On your way out of the office, you hear the words, "Search your ID number." You look down at your badge to see that your employee ID number is 499942.

SELECT * FROM Employees WHERE emp_no = '499942';

------------------------------------------------------------- Ithamar Francois ---------------------------------------------------------------------------
