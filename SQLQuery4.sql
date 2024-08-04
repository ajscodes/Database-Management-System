--ALTER OPERATIONS:-

--PART-A:
SELECT * FROM DEPOSIT_DETAIL;
--1. Add two more columns City VARCHAR (20) and Pincode INT. 
ALTER TABLE DEPOSIT ADD CITY VARCHAR(20), PINCODE INT;
--2. Change the size of CNAME column from VARCHAR (50) to VARCHAR (35). 
ALTER TABLE DEPOSIT ALTER COLUMN CNAME VARCHAR(35);
--3. Change the data type DECIMAL to INT in amount Column. 
ALTER TABLE DEPOSIT ALTER COLUMN AMOUNT INT;
--4. Rename Column ActNo to ANO. 
SP_RENAME 'DEPOSIT.ACTNO', ANO; 
--5. Delete Column City from the DEPOSIT table. 
ALTER TABLE DEPOSIT DROP COLUMN CITY;
--6. Change name of table DEPOSIT to DEPOSIT_DETAIL.
SP_RENAME DEPOSIT, DEPOSIT_DETAIL;	--[use only table-name instead of 'table-name' after sp_rename]


--Part�B: 
--1. Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table. 
SP_RENAME 'DEPOSIT_DETAIL.ADATE', AOPENDATE;
--2. Delete Column AOPENDATE from the DEPOSIT_DETAIL table. 
ALTER TABLE DEPOSIT_DETAIL DROP COLUMN AOPENDATE;
--3. Rename Column CNAME to CustomerName.
SP_RENAME 'DEPOSIT_DETAIL.CNAME', CUSTOMERNAME;


--PART-C:
CREATE TABLE STUDENT_DETAIL(
	Enrollment_No VARCHAR(20),
	Name VARCHAR(25),
	CPI DECIMAL(5,2),
	Birthdate DATETIME
);
--1. Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null). 
ALTER TABLE STUDENT_DETAIL ADD City VARCHAR(20) NOT NULL, Backlog INT NULL;
--2. Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35). 
ALTER TABLE STUDENT_DETAIL ALTER COLUMN Name VARCHAR(35);
--3. Change the data type DECIMAL to INT in CPI Column. 
ALTER TABLE STUDENT_DETAIL ALTER COLUMN CPI INT;
--4. Rename Column Enrollment_No to ENO. 
SP_RENAME 'STUDENT_DETAIL.Enrollment_No', ENO;
--5. Delete Column City from the student_detail table. 
ALTER TABLE STUDENT_DETAIL DROP COLUMN City;
--6. Change name of table student_detail to STUDENT_MASTER. 
SP_RENAME STUDENT_DETAIL, STUDENT_MASTER;
SELECT * FROM STUDENT_DETAIL;
SELECT * FROM STUDENT_MASTER;


--DELETE, TRUNCATE,DROP:-

--PART-A:
--1. Delete all the records of DEPOSIT_DETAIL table having amount greater than and equals to 4000.  
DELETE FROM DEPOSIT_DETAIL WHERE AMOUNT>=4000;
--2. Delete all the accounts CHANDI BRANCH. 
DELETE FROM DEPOSIT_DETAIL WHERE BNAME='CHANDI';
--3. Delete all the accounts having account number (ANO) is greater than 105. 
DELETE FROM DEPOSIT_DETAIL WHERE ANO>105;
--4. Delete all the records of Deposit_Detail table. (Use Truncate) 
TRUNCATE TABLE DEPOSIT_DETAIL;
--5. Remove Deposit_Detail table. (Use Drop)
DROP TABLE DEPOSIT_DETAIL;


--PART-B:
CREATE TABLE EMPLOYEE_MASTER(
	EmpNo INT,
	EmpName VARCHAR(25),
	JoiningDate DATETIME,
	Salary DECIMAL (8,2),		
	City VARCHAR(20)
);

INSERT INTO EMPLOYEE_MASTER VALUES 
	(101,'KEYUR','2002-01-05',12000,'RAJKOT'),
	(102,'HARDIK','2004-02-15',14000,'AHMEDABAD'),
	(103,'KAJAL','2006-03-14',15000,'BARODA'),
	(104,'BHOOMI','2005-06-23',12500,'AHMEDABAD'),
	(105,'HARMIT','2004-02-15',14000,'RAJKOT'),
	(106,'MITESH','2001-09-25',5000,'JAMNAGAR'),
	(107,'MEERA',NULL,7000,'MORBI'),
	(108,'KRISHNA','2003-02-06',10000,NULL)

SELECT * FROM EMPLOYEE_MASTER;

--1. Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.  
DELETE FROM EMPLOYEE_MASTER WHERE Salary >= 14000;
--2. Delete all the Employees who belongs to �RAJKOT� city. 
DELETE FROM EMPLOYEE_MASTER WHERE CITY='RAJKOT';
--3. Delete all the Employees who joined after 1-1-2007. 
DELETE FROM EMPLOYEE_MASTER WHERE JoiningDate > '2007-01-01';
--4. Delete the records of Employees whose joining date is null and Name is not null. 
DELETE FROM EMPLOYEE_MASTER WHERE JoiningDate IS NULL AND EmpName IS NOT NULL;
--[ISNULL = WRONG]
--[IS NULL = RIGHT]

--5. Delete the records of Employees whose salary is 50% of 20000. 
DELETE FROM EMPLOYEE_MASTER WHERE Salary = 0.50*20000;
--6. Delete the records of Employees whose City Name is not empty. 
DELETE FROM EMPLOYEE_MASTER WHERE City IS NOT NULL AND City <> '';
--7. Delete all the records of Employee_MASTER table. (Use Truncate)
TRUNCATE TABLE EMPLOYEE_MASTER;
--8. Remove Employee_MASTER table. (Use Drop)
DROP TABLE EMPLOYEE_MASTER;

--Part � C: 
--1. Summarize Delete, Truncate and Drop
--DELETE : DELETE RECORDS ROW BY ROW AND NOT DELETE TABLE SCHEMA
--TRUNCATE : DELETE ALL RECORD AT A TIME BUT NOT DELETE SCHEMA
--DROP : DELETE ALL RECFORD AND SCHEMA AT A TIME