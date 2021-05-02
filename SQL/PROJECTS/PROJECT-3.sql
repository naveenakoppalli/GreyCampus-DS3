-----1-----
SELECT first_name AS "First Name",last_name AS "Last Name" FROM employees;
----2----
SELECT DISTINCT department_id FROM employees;
----3---
SELECT * FROM employees 
ORDER BY first_name DESC ;
----4---
SELECT first_name ,last_name,salary,
salary*0.15 AS PF FROM employees;---SINCE 15%=0.15--
----5----
SELECT employee_id,first_name ,last_name,salary FROM employees
ORDER BY salary ASC;
----6---
SELECT employee_id,SUM(salary)
FROM employees 
GROUP BY employee_id ;
----7----
SELECT MIN(salary),MAX(salary) FROM employees;
----8---
SELECT AVG(salary),COUNT(*) AS total_employees
FROM employees ;
----9----
SELECT COUNT(*)  AS NO_OF_EMPLOYEES
FROM employees;
----10---
SELECT  COUNT(DISTINCT job_id) FROM employees;
----11---
SELECT UPPER(first_name) AS FirstName  FROM employees;
----12----
SELECT  BTRIM(first_name) FROM employees;
----13----
SELECT LENGTH(first_name),LENGTH(last_name) AS length_of_name
FROM employees ;
---or---
SELECT LENGTH(first_name||last_name) AS length_of_name
FROM employees ;
-----14----
SELECT first_name,last_name,salary 
FROM employees 
WHERE salary NOT BETWEEN 10000 AND 15000;
-----15-----
SELECT first_name,last_name,salary,department_id
FROM employees 
WHERE salary NOT BETWEEN 10000 AND 15000
AND department_id IN(30,100);


