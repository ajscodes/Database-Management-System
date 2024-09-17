CREATE TABLE STU_INFO (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50),
    Branch VARCHAR(10)
);

INSERT INTO STU_INFO (Rno, Name, Branch) VALUES
(101, 'Raju', 'CE'),
(102, 'Amit', 'CE'),
(103, 'Sanjay', 'ME'),
(104, 'Neha', 'EC'),
(105, 'Meera', 'EE'),
(106, 'Mahesh', 'ME');

SELECT * FROM STU_INFO;


CREATE TABLE RESULT (
    Rno INT, --Rno INT FOREIGN KEY, } GIVES ERROR
    SPI DECIMAL(3,1),
    FOREIGN KEY (Rno) REFERENCES STU_INFO(Rno)
);

INSERT INTO RESULT (Rno, SPI) VALUES
(101, 8.8),
(102, 9.2),
(103, 7.6),
(104, 8.2),
(105, 7.0);

INSERT INTO RESULT (Rno, SPI)
VALUES (107, 8.9);


SELECT * FROM RESULT;

CREATE TABLE EMPLOYEE_MASTER (
    EmployeeNo VARCHAR(10),
    Name VARCHAR(50),
    ManagerNo VARCHAR(10),
);

INSERT INTO EMPLOYEE_MASTER (EmployeeNo, Name, ManagerNo) VALUES
('E01', 'Tarun', NULL),
('E02', 'Rohan', 'E02'),
('E03', 'Priya', 'E01'),
('E04', 'Milan', 'E03'),
('E05', 'Jay', 'E01'),
('E06', 'Anjana', 'E04');

SELECT * FROM EMPLOYEE_MASTER;



--Part – A: 
--1. Combine information from student and result table using cross join or Cartesian product. 
SELECT * FROM STU_INFO,RESULT;

--2. Perform inner join on Student and Result tables. 
SELECT * 
FROM STU_INFO 
INNER JOIN RESULT 
ON STU_INFO.Rno = RESULT.Rno;

--3. Perform the left outer join on Student and Result tables. 
SELECT * 
FROM STU_INFO 
LEFT OUTER JOIN RESULT 
ON STU_INFO.Rno = RESULT.Rno;

--4. Perform the right outer join on Student and Result tables. 
SELECT * 
FROM STU_INFO 
RIGHT OUTER JOIN RESULT 
ON STU_INFO.Rno = RESULT.Rno;

--5. Perform the full outer join on Student and Result tables.  
SELECT * 
FROM STU_INFO 
FULL OUTER JOIN RESULT 
ON STU_INFO.Rno = RESULT.Rno;

--6. Display Rno, Name, Branch and SPI of all students. 
SELECT S.Rno, S.Name, S.Branch,R.SPI
FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno;

--7. Display Rno, Name, Branch and SPI of CE branch’s student only. 
SELECT S.Rno, S.Name, S.Branch, R.SPI
FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
WHERE S.Branch = 'CE';

--8. Display Rno, Name, Branch and SPI of other than EC branch’s student only. 
SELECT *
FROM STU_INFO 
FULL OUTER JOIN RESULT 
ON STU_INFO.Rno = RESULT.Rno
WHERE STU_INFO.Branch <> 'EC';

--9. Display average result of each branch. 
SELECT S.Branch, AVG(R.SPI) AS Avg_Spi
FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
GROUP BY S.Branch
 
--10. Display average result of CE and ME branch.
SELECT S.Branch, AVG(R.SPI) AS Avg_Spi
FROM STU_INFO S 
JOIN  RESULT R
ON S.Rno = R.Rno
GROUP BY S.Branch
HAVING S.Branch IN ('CE','ME');



--Part – B: 
--1. Display average result of each branch and sort them in ascending order by SPI. 
SELECT S.Branch, AVG(R.SPI) AS Avg_Spi
FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
GROUP BY S.Branch
ORDER BY Avg_Spi ASC;

--2. Display highest SPI from each branch and sort them in descending order. 
SELECT S.Branch, MAX(R.SPI) AS Max_Spi
FROM STU_INFO S
JOIN RESULT R
ON S.Rno = R.Rno
GROUP BY S.Branch
ORDER BY Max_Spi DESC;



--Part – C: 
--1. Retrieve the names of employee along with their manager’s name from the Employee table. 
SELECT E.Name AS EMPLOYEE, M.Name AS MANAGER
FROM EMPLOYEE_MASTER E 
INNER JOIN EMPLOYEE_MASTER M
ON E.ManagerNo = M.EmployeeNo;