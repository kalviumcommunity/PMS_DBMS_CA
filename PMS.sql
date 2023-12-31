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

-- Milestone-4 (Advanced SQL Queries - Joins and Subqueries)
-- Inner Joins, Left Joins & Subqueries

-- Inner Join Example
SELECT Student.Student_Name, Job.Job_Desc
FROM Student
INNER JOIN Placement ON Student.Student_ID = Placement.Student_ID
INNER JOIN Job ON Placement.Job_ID = Job.Job_ID;

-- Left Join Example
SELECT Student.Student_Name, Job.Job_Desc
FROM Student
LEFT JOIN Placement ON Student.Student_ID = Placement.Student_ID
LEFT JOIN Job ON Placement.Job_ID = Job.Job_ID;

-- Subquery Example
SELECT *
FROM Job
WHERE Package > (
    SELECT AVG(Package)
    FROM Job
);

-- Subquery with IN Example
SELECT *
FROM Student
WHERE College_ID IN (
    SELECT College_ID
    FROM College
    WHERE College_Location = 'Punjab'
);

-- Subquery with EXISTS Example
SELECT *
FROM Student
WHERE EXISTS (
    SELECT 1
    FROM Placement
    WHERE Placement.Student_ID = Student.Student_ID
);


-- Milestone-5 (Role-Based Access Control - Indexing and query optimization)
-- Creating roles & privileges

-- Create three roles: Placement_Officer, Student, and DB_Admin
CREATE ROLE Placement_Officer;
CREATE ROLE Student;
CREATE ROLE DB_Admin;

-- Grant read and write access for all tables to the Placement_Officer role
GRANT SELECT, INSERT, UPDATE, DELETE ON Placement_Management_System.* TO Placement_Officer;

-- Grant read and write access to relevant tables to the Student role
GRANT SELECT, INSERT, UPDATE, DELETE ON Placement_Management_System.Student TO Student;
GRANT SELECT, INSERT, UPDATE, DELETE ON Placement_Management_System.Placement TO Student;

-- Grant read access to relevant tables for the Student role
GRANT SELECT ON Placement_Management_System.Job TO Student;
GRANT SELECT ON Placement_Management_System.Company TO Student;
GRANT SELECT ON Placement_Management_System.College TO Student;

-- Grant all privileges to the DB_Admin role
GRANT ALL PRIVILEGES ON Placement_Management_System.* TO DB_Admin;

-- Create users
CREATE USER 'Placement_Officer_User'@'localhost' IDENTIFIED BY 'placement_officer_password';
CREATE USER 'Student_User'@'localhost' IDENTIFIED BY 'student_password';
CREATE USER 'DB_Admin_User'@'localhost' IDENTIFIED BY 'db_admin_password';

-- Assign roles to users
GRANT Placement_Officer TO 'Placement_Officer_User'@'localhost';
GRANT Student TO 'Student_User'@'localhost';
GRANT DB_Admin TO 'DB_Admin_User'@'localhost';

-- Set default roles for users
SET DEFAULT ROLE Placement_Officer TO 'Placement_Officer_User'@'localhost';
SET DEFAULT ROLE Student TO 'Student_User'@'localhost';
SET DEFAULT ROLE DB_Admin TO 'DB_Admin_User'@'localhost';


-- Adding Index and Query Optimisation

-- Add an index on the 'Student_ID' column
CREATE INDEX idx_student_id ON Student(Student_ID);

-- Modify the query to fetch information from the 'students' table
SELECT Student.Student_ID, Student.Student_Name, Student.Student_Course, Student.Student_CGPA
FROM Student
JOIN Placement ON Student.Student_ID = Placement.Student_ID
WHERE Student.Student_ID = 1;
