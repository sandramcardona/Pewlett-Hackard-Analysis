--List 6 - Retiring Employees by Title
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	ts.title,
	ts.from_date,
	ts.to_date
INTO retiring_titles
FROM employees AS e
INNER JOIN titles AS ts
ON (ts.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no DESC;

--List 7 - Retiring Employees by Title
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no, 
	first_name, 
	last_name,
	title
INTO unique_titles
FROM retiring_emp_title
ORDER BY 
	emp_no ASC, 
	to_date DESC;

--List 8 - Count of Retiring Employees by Title
SELECT COUNT(ut.title),ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY ut.count DESC;   

--List 9 - Mentorship Eligibility list
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ts.title
INTO mentorship_eligibility2
FROM employees AS e
INNER JOIN dept_emp as de
ON (de.emp_no = e.emp_no)
INNER JOIN titles AS ts
ON (ts.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;

--List 10 - modification of List 9
SELECT DISTINCT ON (emp_no)
	emp_no, 
	first_name, 
	last_name,
	birth_date,
	from_date,
	to_date,
	title
INTO mentorship_eligibility3
FROM mentorship_eligibility2
ORDER BY emp_no ASC


--List 11 - count of retiring mentoring titles
SELECT COUNT(me3.title),me3.title
INTO count_mentorship_eligibility
FROM mentorship_eligibility3 as me3
GROUP BY me3.title
ORDER BY me3.count DESC;

SELECT * FROM count_mentorship_eligibility;

--List 12 - Count of retiring employees by Dept
SELECT COUNT (dinf.dept_name), dinf.dept_name
INTO count_dept_info2
FROM dept_info as dinf
GROUP BY dinf.dept_name
ORDER BY dinf.dept_name DESC;

--List 13 - Count of retiring employees by gender
SELECT COUNT (eir.gender), eir.gender
INTO count_retiring_gender
FROM emp_info_retiring as eir
GROUP BY eir.gender
ORDER BY eir.gender DESC;