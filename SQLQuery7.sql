CREATE TABLE EMP(
	EID INT,
	ENAME VARCHAR(50),
	DEPARTMENT VARCHAR(50),
	SALARY INT,
	JOININGDATE DATETIME,
	CITY VARCHAR(25)
);

INSERT INTO EMP VALUES 
	(101, 'Rahul', 'Admin', 56000, '1-Jan-90', 'Rajkot'), 
	(102, 'Hardik', 'IT', 18000, '25-Sep-90', 'Ahmedabad'), 
	(103, 'Bhavin', 'HR', 25000, '14-May-91', 'Baroda'), 
	(104, 'Bhoomi', 'Admin', 39000, '8-Feb-91', 'Rajkot'), 
	(105, 'Rohit', 'IT', 17000, '23-Jul-90', 'Jamnagar'), 
	(106, 'Priya', 'IT', 9000, '18-Oct-90', 'Ahmedabad'), 
	(107, 'Bhoomi', 'HR', 34000, '25-Dec-91', 'Rajkot')

SELECT * FROM EMP;

--PART-A:
--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 
SELECT MAX(SALARY) AS MAXIMUM, MIN(SALARY) AS MINIMUM FROM EMP;

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, 
--respectively. 
SELECT SUM(SALARY) AS TOTAL_SAL, AVG(SALARY) AS AVERAGE_SAL FROM EMP;

--3. Find total number of employees of EMPLOYEE table. 
SELECT COUNT(EID) FROM EMP;

--4. Find highest salary from Rajkot city. 
SELECT MAX(SALARY) FROM EMP WHERE CITY='RAJKOT';

--5. Give maximum salary from IT department. 
SELECT MAX(SALARY) FROM EMP WHERE DEPARTMENT = 'IT';

--6. Count employee whose joining date is after 8-feb-91. 
SELECT COUNT(EID) FROM EMP WHERE JOININGDATE > '1991-02-08';

--7. Display average salary of Admin department. 
SELECT AVG(SALARY) FROM EMP WHERE DEPARTMENT = 'ADMIN';

--8. Display total salary of HR department. 
SELECT SUM(SALARY) FROM EMP WHERE DEPARTMENT = 'HR';

--9. Count total number of cities of employee without duplication. 
SELECT COUNT(DISTINCT CITY) FROM EMP; --ANS: 5
--SELECT COUNT(CITY) FROM EMP; ANS: 7

--10. Count unique departments. 
SELECT COUNT(DISTINCT DEPARTMENT) FROM EMP;

--11. Give minimum salary of employee who belongs to Ahmedabad. 
SELECT MIN(SALARY) FROM EMP WHERE CITY = 'AHMEDABAD';

--12. Find city wise highest salary. 
SELECT MAX(SALARY) AS HIGHEST_SALARY, CITY FROM EMP GROUP BY CITY;

--13. Find department wise lowest salary. 
SELECT DEPARTMENT, MIN(SALARY) FROM EMP GROUP BY DEPARTMENT;

--14. Display city with the total number of employees belonging to each city. 
SELECT CITY, COUNT(EID) FROM EMP GROUP BY CITY;

--15. Give total salary of each department of EMP table. 
SELECT DEPARTMENT, SUM(SALARY) FROM EMP GROUP BY DEPARTMENT;

--16. Give average salary of each department of EMP table without displaying the respective department 
--name.
SELECT DEPARTMENT, AVG(SALARY) FROM EMP GROUP BY DEPARTMENT;



--Part – B: 
--1. Count the number of employees living in Rajkot. 
SELECT CITY, COUNT(EID) AS TOTAL FROM EMP GROUP BY CITY HAVING CITY = 'RAJKOT';

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE. 
SELECT (MAX(SALARY) - MIN(SALARY)) AS DIFFERENCE FROM EMP;


--3. Display the total number of employees hired before 1st January, 1991. 
SELECT COUNT(EID) AS TOTAL_EMP FROM EMP WHERE JOININGDATE < '1991-01-01';



--Part – C: 
--1. Count the number of employees living in Rajkot or Baroda. 
SELECT COUNT(EID) AS TOTAL_EMP FROM EMP WHERE CITY IN ('RAJKOT','BARODA');

--2. Display the total number of employees hired before 1st January, 1991 in IT department. 
SELECT COUNT(EID) AS TOTAL_EMP FROM EMP WHERE JOININGDATE < '1991-01-01' AND DEPARTMENT = 'IT';

--3. Find the Joining Date wise Total Salaries. 
SELECT JOININGDATE, SUM(SALARY) AS TOTAL_SALARY FROM EMP GROUP BY JOININGDATE;

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
SELECT DEPARTMENT, CITY, MAX(SALARY) AS MAXIMUM FROM EMP GROUP BY DEPARTMENT, CITY HAVING CITY LIKE 'R%'; 