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
    Collefe_Location VARCHAR(255)
);


-- Alter Commands

ALTER TABLE College
CHANGE COLUMN Collefe_Location College_Location VARCHAR(255);

ALTER TABLE Student
ADD COLUMN Graduation_Year YEAR;


-- Drop Commands

ALTER TABLE Student
DROP COLUMN Graduation_Year;