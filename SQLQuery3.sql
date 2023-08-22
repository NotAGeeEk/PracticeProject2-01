CREATE DATABASE Schools
USE Schools


-- Create the Subjects table
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50) NOT NULL
)

-- Insert data into Subjects table
INSERT INTO Subjects (SubjectID, SubjectName)
VALUES
    (1, 'Hindi'),
    (2, 'Social Science'),
    (3, 'Computer Science'),
    (4, 'Chemistry')

-- Create the Classes table as:
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL
)
-- Insert data into Classes table
INSERT INTO Classes (ClassID, ClassName)
VALUES
    (101, 'Class I'),
    (102, 'Class II'),
    (103, 'Class III'),
    (104, 'Class IV')

-- Create the Students table as:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    ClassID INT REFERENCES Classes(ClassID),
    SubjectID INT REFERENCES Subjects(SubjectID)
)

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, ClassID, SubjectID)
VALUES
    (1, 'Nikhil', 'Sharma', '2000-01-01', 101, 1),
    (2, 'Ashish', 'Bharti', '2001-06-11', 102, 2),
    (3, 'Aman', 'Mittal', '2002-02-10', 103, 3),
    (4, 'Pragya', 'Shankdhar', '2003-12-13', 104, 4),
    (5, 'Apoorva', 'Rastogi', '2004-08-23', 101, 2)

-- Now made indexes for better performance
CREATE INDEX IX_Students_ClassID ON Students(ClassID)
CREATE INDEX IX_Students_SubjectID ON Students(SubjectID)

--To Retrieve the list of students in a specific class
SELECT FirstName, LastName
FROM Students
WHERE ClassID = 101

--To get the subject of a specific student as:
SELECT s.SubjectName
FROM Students stu
INNER JOIN Subjects s ON stu.SubjectID = s.SubjectID
WHERE stu.StudentID = 2



--Here It list all subjects taught in a specific class as:
SELECT DISTINCT s.SubjectName
FROM Students stu
INNER JOIN Subjects s ON stu.SubjectID = s.SubjectID
WHERE stu.ClassID = 101

select * from Classes
select * from Students
select * from Subjects

