-- 1
CREATE DATABASE CompanyDb
-- 2 
CREATE TABLE Department(
	Id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(25) NOT NULL,
	Hiring  bit,
	Location nvarchar(50)
)

-- 3
INSERT INTO Department(Name, Hiring, Location)
VALUES('Technology', 1, '1570 Woodward Ave')
INSERT INTO Department(Name, Hiring, Location)
VALUES('Shipping & Receiving', 0, 'Southfield')

-- 4
CREATE TABLE Employee(
	SSN nchar(9) NOT NULL PRIMARY KEY,
	DOB date,
	Phone nchar (10),
	FirstName nvarchar(30) NOT NULL,
	LastName nvarchar(30) NOT NULL,
	DepartmentID int FOREIGN KEY REFERENCES Department(Id)
)

-- 5
INSERT INTO Employee(SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES('123456789', '1/5/1975', '3135555505','Charles', 'Charleston', 2)
INSERT INTO Employee(SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES('987654321', '5/2/1990', '2489995555','Jimmy', 'Scrambles', 1)
INSERT INTO Employee(SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES('456789123', '8/6/2001', '7895555525','Vince', 'Jabowski', 1)
INSERT INTO Employee(SSN, DOB, Phone, FirstName, LastName, DepartmentID)
VALUES('654854632', '4/6/1988', '3139721400','John', 'Johnston', 2)

-- 6
UPDATE Employee 
Set LastName = 'Spiderman'
WHERE DOB = (SELECT MAX(DOB) FROM Employee)
SELECT * FROM Employee

-- 7
SELECT * FROM Employee
WHERE LastName LIKE 'J%'

-- 8
DELETE FROM Employee
WHERE DOB = (SELECT MIN(DOB) FROM Employee)

-- 9
SELECT * FROM Employee
WHERE Phone LIKE '313%'

-- 10
SELECT * FROM Employee
WHERE DOB < '9/9/1999'

-- 11
UPDATE Employee
SET Phone = NULL
WHERE YEAR(DOB) > 2000

-- 12
SELECT * FROM Employee
WHERE PHONE IS NULL

-- 13
SELECT * FROM Department d
JOIN Employee e ON d.Id = e.DepartmentID

-- 14
DROP TABLE Employee
DROP TABLE Department
