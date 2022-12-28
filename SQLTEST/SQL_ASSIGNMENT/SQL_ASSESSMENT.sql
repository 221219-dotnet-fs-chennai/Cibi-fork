CREATE TABLE Department (
    ID INT NOT NULL IDENTITY(1,1),
    [Name] NVARCHAR(50),
    Location NVARCHAR(100)
)

ALTER TABLE Department 
ADD CONSTRAINT PK_DEPARTMENTID PRIMARY KEY(ID)

SELECT * FROM Department

CREATE TABLE Employee (
    ID INT NOT NULL IDENTITY(1, 1),
    [FirstName] NVARCHAR(50),
    LastName NVARCHAR(50),
    SSN bigint,
    DEPT_ID INT FOREIGN KEY REFERENCES Department(ID)
);

ALTER TABLE Employee
ADD CONSTRAINT PK_EmpID PRIMARY KEY(ID);

EXEC sp_fkeys 'Employee'

CREATE TABLE EmpDetails (
    ID INT NOT NULL IDENTITY(1, 1),
    EmployeeID INT UNIQUE,
    Salary int ,
    Address1 NVARCHAR(100),
    Address2 NVARCHAR(100),
    City nvarchar(30),
    State nvarchar(30),
    Country nvarchar(30),
    CONSTRAINT FK_EmployeeID FOREIGN KEY (EmployeeID)
    REFERENCES Employee(ID)
);

INSERT INTO Department VALUES ('Mathematics', 'Chennai'),
('Science', 'Mumbai'), ('Literature', 'Bengal')
SELECT * FROM Department;

INSERT INTO Employee VALUES ('Cibi', 'Sharan', 890239134, 1),
('Siva', 'Balan', 392947225, 2), ('Bharati', 'Bhass', 304928499, 3)
SELECT * FROM Employee;

INSERT INTO EmpDetails VALUES (1, 25000, 'ABCD, 1ST STREET', 'DCBA, 2ND STREET', 'Chennai', 'TamilNadu', 'India'),
(2, 40000, 'EFGH, 3RD STREET', 'HGFE, 4TH STREET', 'Mumbai', 'Maharashtra', 'India'),
 (3, 45000, 'IJKL, 5TH STREET', 'LKJI, 6TH STREET', 'Kolkata', 'Bengal', 'India')

 INSERT INTO EmpDetails VALUES (5, 55000, 'MNOP, 7TH STREET','', 'Pune', 'Maharashtra', 'India')
SELECT * FROM EmpDetails;

INSERT INTO Employee(FirstName, LastName) VALUES ('Tina', 'Smith')

INSERT INTO Department VALUES ('Sociology', 'Bangalore')
INSERT INTO Department VALUES ('Marketing', 'Pune')

INSERT INTO Employee VALUES ('Mani', 'Bala', 230494302, 5)
INSERT INTO Employee VALUES ('Siva','Shakti', 293840203, 5)

-- list all employees in marketing--
SELECT * FROM Employee 
INNER JOIN Department
ON Department.ID = Employee.DEPT_ID
WHERE Department.Name = 'Marketing'

--total salary in Marketing --
SELECT SUM(Salary) AS SALARY_SUM FROM EmpDetails 
INNER JOIN Department
ON EmpDetails.EmployeeID = Department.ID
WHERE Department.Name = 'Marketing'

-- total employees by department--
SELECT COUNT(DEPT_ID) AS TOTAL_EMPLOYEES FROM Employee
JOIN Department
ON Employee.DEPT_ID = Department.ID
WHERE Department.Name = 'Marketing'

-- INCREASE TINA'S SALARY TO 90000 -- // DIDN'T COMPLETE THIS PROBLEM
SELECT * FROM Employee 
INNER JOIN Department
ON Employee.ID = EmpDetails.EmployeeID 

SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM EmpDetails;