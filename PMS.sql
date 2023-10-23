CREATE DATABASE Placement_Management_System;

USE Placement_Management_System;

-- Milestone-2 (DDL Commands)
-- Create Commands

CREATE TABLE Admin (
    Admin_ID INT PRIMARY KEY,
    Admin_Name VARCHAR(255),
    Admin_Password VARCHAR(255),
    Date_Joined DATE,
    Admin_Email VARCHAR(255)
);

CREATE TABLE Company (
    Company_ID INT PRIMARY KEY,
    Company_Name VARCHAR(255),
    Company_Email VARCHAR(255),
    Company_Desc TEXT
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(255),
    Student_Course VARCHAR(255),
    Student_CGPA DECIMAL(3, 2),
    Student_Age INT,
    Student_Email VARCHAR(255),
    Skills TEXT,
    Phone_no VARCHAR(20),
    College_ID INT,
    FOREIGN KEY (College_ID) REFERENCES College(College_ID)
);

CREATE TABLE Job (
    Job_ID INT PRIMARY KEY,
    Job_Desc TEXT,
    Job_Position VARCHAR(255),
    Package DECIMAL(10, 2),
    Tenure INT,
    Job_Location VARCHAR(255),
    Date_Of_Joining DATE,
    Vacancies INT,
    Company_ID INT,
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID)
);

CREATE TABLE Placement (
    Placement_ID INT PRIMARY KEY,
    Placement_type VARCHAR(255),
    Placement_Desc TEXT,
    Student_ID INT,
    Job_ID INT,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Job_ID) REFERENCES Job(Job_ID)
);

CREATE TABLE College (
    College_ID INT PRIMARY KEY,
    College_Name VARCHAR(255),
    College_Address VARCHAR(255),
    College_Ranking INT,
    College_Location VARCHAR(255)
);

-- Milestone-3 (DML Commands)
-- Select, Insert, Update, Delete

-- SELECT from Admin table
SELECT * FROM Admin;

-- INSERT into Admin table
INSERT INTO Admin (Admin_ID, Admin_Name, Admin_Password, Date_Joined, Admin_Email)
VALUES (1, 'Navaneeth Arunkumar', 'password123', '2023-08-18', 'navaneeth.intern@phonepe.com');

-- UPDATE Admin table
UPDATE Admin
SET Admin_Name = 'Niya Arunkumar'
WHERE Admin_ID = 1;

-- DELETE from Admin table
DELETE FROM Admin
WHERE Admin_ID = 1;

-- SELECT from Company table
SELECT * FROM Company;

-- INSERT into Company table
INSERT INTO Company (Company_ID, Company_Name, Company_Email, Company_Desc)
VALUES (1, 'PayTM', 'support@phonepe.com', 'A leading UPI company.');

-- UPDATE Company table
UPDATE Company
SET Company_Name = 'PhonePe'
WHERE Company_ID = 1;

-- DELETE from Company table
DELETE FROM Company
WHERE Company_ID = 1;

-- SELECT from Student table
SELECT * FROM Student;

-- INSERT into Student table
INSERT INTO Student (Student_ID, Student_Name, Student_Course, Student_CGPA, Student_Age, Student_Email, Skills, Phone_no, College_ID, Graduation_Year)
VALUES (1, 'Pankhuri Srivastava', 'Computer Science', 3.75, 19, 'panksri@progress.com', 'Java, Python, SQL', '1902836179', 1, 2026);

-- UPDATE Student table
UPDATE Student
SET Student_CGPA = 3.85
WHERE Student_ID = 1;

-- DELETE from Student table
DELETE FROM Student
WHERE Student_ID = 1;

-- SELECT from Job table
SELECT * FROM Job;

-- INSERT into Job table
INSERT INTO Job (Job_ID, Job_Desc, Job_Position, Package, Tenure, Job_Location, Date_Of_Joining, Vacancies, Company_ID)
VALUES (1, 'Software Engineer', 'Full Stack Developer', 80000.00, 12, 'Bangalore', '2024-01-11', 5, 1);

-- UPDATE Job table
UPDATE Job
SET Package = 85000.00
WHERE Job_ID = 1;

-- DELETE from Job table
DELETE FROM Job
WHERE Job_ID = 1;

-- SELECT from Placement table
SELECT * FROM Placement;

-- INSERT into Placement table
INSERT INTO Placement (Placement_ID, Placement_type, Placement_Desc, Student_ID, Job_ID)
VALUES (1, 'Internship', 'Summer Internship', 1, 1);

-- UPDATE Placement table
UPDATE Placement
SET Placement_Desc = 'Winter Internship'
WHERE Placement_ID = 1;

-- DELETE from Placement table
DELETE FROM Placement
WHERE Placement_ID = 1;

-- SELECT from College table
SELECT * FROM College;

-- INSERT into College table
INSERT INTO College (College_ID, College_Name, College_Address, College_Ranking, College_Location)
VALUES (1, 'Lovely professional university', 'Phagwara', 25, 'Punjab');

-- UPDATE College table
UPDATE College
SET College_Ranking = 15
WHERE College_ID = 1;

-- DELETE from College table
DELETE FROM College
WHERE College_ID = 1;
