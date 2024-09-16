--SET OPERATORS:
--PART-A:

CREATE TABLE COMPUTER(
	ROLLNO INT,
	NAME VARCHAR(50)
);

INSERT INTO COMPUTER (ROLLNO,NAME) VALUES 
	(101,'AJAY'),
	(109,'HARESH'),
	(115,'MANISH');

SELECT * FROM COMPUTER;

CREATE TABLE ELECTRICAL(
	ROLLNO INT,
	NAME VARCHAR(15)
);

INSERT INTO ELECTRICAL (ROLLNO,NAME) VALUES 
	(105,'AJAY'),
	(107,'MAHESH'),
	(115,'MANISH')

SELECT * FROM ELECTRICAL;

--1. Display name of students who is either in Computer or in Electrical. 
SELECT NAME FROM COMPUTER
UNION
SELECT NAME FROM ELECTRICAL

--2. Display name of students who is either in Computer or in Electrical including duplicate data. 
SELECT NAME FROM COMPUTER
UNION ALL
SELECT NAME FROM ELECTRICAL

--3. Display name of students who is in both Computer and Electrical. 
SELECT NAME FROM COMPUTER
INTERSECT 
SELECT NAME FROM ELECTRICAL

--4. Display name of students who are in Computer but not in Electrical. 
SELECT NAME FROM COMPUTER
EXCEPT 
SELECT NAME FROM ELECTRICAL

--5. Display name of students who are in Electrical but not in Computer. 
SELECT NAME FROM ELECTRICAL
EXCEPT
SELECT NAME FROM COMPUTER

--6. Display all the details of students who are either in Computer or in Electrical. 
SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL

--7. Display all the details of students who are in both Computer and Electrical.
SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL


--PART-B:
CREATE TABLE EMP_DATA(
	EID INT,
	NAME VARCHAR(15)
);

INSERT INTO EMP_DATA(EID,NAME) VALUES 
	(1,'AJAY'),
	(9,'HARESH'),
	(5,'MANISH');

SELECT * FROM EMP_DATA;

CREATE TABLE CUSTOMER(
	CID INT,
	NAME VARCHAR(15)
);

INSERT INTO CUSTOMER(CID,NAME) VALUES 
	(5,'AJAY'),
	(7,'MAHESH'),
	(5,'MANISH');

SELECT * FROM CUSTOMER;

--1. Display name of persons who is either Employee or Customer. 
SELECT NAME FROM EMP_DATA
UNION
SELECT NAME FROM CUSTOMER

--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT NAME FROM EMP_DATA
UNION ALL
SELECT NAME FROM CUSTOMER

--3. Display name of persons who is both Employee as well as Customer. 
SELECT NAME FROM EMP_DATA
INTERSECT
SELECT NAME FROM CUSTOMER

--4. Display name of persons who are Employee but not Customer. 
SELECT NAME FROM EMP_DATA
EXCEPT
SELECT NAME FROM CUSTOMER

--5. Display name of persons who are Customer but not Employee.
SELECT NAME FROM CUSTOMER
UNION
SELECT NAME FROM EMP_DATA


--PART-C:
--1. Display name of persons who is either Employee or Customer. 
SELECT * FROM EMP_DATA
UNION
SELECT * FROM CUSTOMER

--2. Display name of persons who is either Employee or Customer including duplicate data. 
SELECT * FROM EMP_DATA
UNION ALL
SELECT * FROM CUSTOMER

--3. Display name of persons who is both Employee as well as Customer. 
SELECT * FROM EMP_DATA
INTERSECT
SELECT * FROM CUSTOMER

--4. Display name of persons who are Employee but not Customer. 
SELECT * FROM EMP_DATA
EXCEPT
SELECT * FROM CUSTOMER

--5. Display name of persons who are Customer but not Employee.
SELECT *FROM CUSTOMER
UNION
SELECT * FROM EMP_DATA



--SUB QUERIES:
CREATE TABLE STUDENT_DATA (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO STUDENT_DATA(Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

SELECT * FROM STUDENT_DATA;

CREATE TABLE ACADEMIC (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO ACADEMIC(Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

SELECT * FROM ACADEMIC;

CREATE TABLE DEPARTMENT (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO DEPARTMENT (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

SELECT * FROM DEPARTMENT;


--Part – A:
--1. Display details of students who are from computer department.
SELECT * 
FROM STUDENT_DATA 
WHERE DID IN (
	SELECT DID FROM DEPARTMENT 
	WHERE DName = 'COMPUTER'
	);

--2. Displays name of students whose SPI is more than 8. 
SELECT Name 
FROM STUDENT_DATA
WHERE Rno IN (
	SELECT Rno FROM ACADEMIC
	WHERE SPI > 8
	);

--3. Display details of students of computer department who belongs to Rajkot city. 
SELECT * 
FROM STUDENT_DATA 
WHERE DID IN (
	SELECT DID FROM DEPARTMENT 
	WHERE DName = 'COMPUTER'
	) AND City = 'RAJKOT';

--4. Find total number of students of electrical department. 
SELECT COUNT(DID)
FROM DEPARTMENT
WHERE DID IN (
	SELECT DID FROM  DEPARTMENT
	WHERE DName = 'ELECTRICAL');

--5. Display name of student who is having maximum SPI. 
SELECT Name
FROM STUDENT_DATA
WHERE Rno = (
	SELECT Rno FROM ACADEMIC
	WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC)
	);

--6. Display details of students having more than 1 backlog. 
SELECT * 
FROM STUDENT_DATA
WHERE Rno IN (
	SELECT Rno FROM ACADEMIC
	WHERE Bklog > 0
	);

--Part – B: 
--1. Display name of students who are either from computer department or from mechanical department. 
SELECT Name
FROM STUDENT_DATA
WHERE DID IN (
	SELECT DID FROM DEPARTMENT
	WHERE DName IN ('COMPUTER', 'MECHANICAL')
	);

--2. Display name of students who are in same department as 102 studying in. 
SELECT Name
FROM STUDENT_DATA
WHERE DID IN (
	SELECT DID 
	FROM  STUDENT_DATA
	WHERE Rno = 102
	);

--Part – C: 
--1. Display name of students whose SPI is more than 9 and who is from electrical department. 
SELECT Name
FROM STUDENT_DATA
WHERE Rno IN (
	SELECT Rno FROM ACADEMIC 
	WHERE SPI > 9
	) AND 
	DID IN (
	SELECT DID FROM DEPARTMENT 
	WHERE DName = 'ELECTRICAL'
	);

--2. Display name of student who is having second highest SPI. 
SELECT Name
FROM STUDENT_DATA
WHERE Rno IN (
	SELECT Rno
	FROM ACADEMIC
	WHERE SPI = (
		SELECT MAX(SPI) FROM ACADEMIC
		WHERE SPI < (SELECT MAX(SPI) FROM ACADEMIC) 
		)
	)

--3. Display city names whose students branch wise SPI is 9.2 
SELECT City
FROM STUDENT_DATA
WHERE Rno IN (
	SELECT Rno
	FROM ACADEMIC
	WHERE SPI = 9.2
	) AND DID IN (
	SELECT DID FROM DEPARTMENT
	)