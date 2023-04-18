create database session3_thuchanh1;
use session3_thuchanh1;
CREATE TABLE Class
(
    ClassID   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME    default now(),
    Status    BIT
);
CREATE TABLE Student
(
    StudentId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    ClassId     INT         NOT NULL,
    FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
CREATE TABLE Subject
(
    SubId   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId     INT NOT NULL,
    StudentId INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId, StudentId),
    FOREIGN KEY (SubId) REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);
insert into Class(ClassName,StartDate,Status) values
("A1","2022-11-11",1),
("A2","2023-10-11",1);
insert into Class(ClassName,Status) values
("B2",0);
insert into Student(StudentName,Address,phone,status,ClassId) values
("quan","NgheAn","09231231231",1,1),
("ngan","NgheAn","09231231231",1,1),
("mung","Ha Noi","09231231231",0,2);
insert into Subject(SubName,Credit) values
("HTML",5),
("CSS",5),
("JavaScript",10),
("PHP",10);
insert into Mark(SubId,StudentId,Mark,ExamTimes) values
(1,1,8,1),
(1,2,8,1),
(1,3,8,1);
select * from Student;
select * from Student where Status = true;
select * from Subject where Credit < 10;
select * from Student where ClassId = 1;
select Mark from Mark where SubId = 1;