
create table Tbstudent
(
studentId int primary key,
studentName nvarchar(100) not null,
feesDetail nvarchar(100),
CourseId int ,
TeacherId int,
foreign key (CourseId) references TbCourse (CourseId),
foreign key (TeacherId) references TbTeacher (TeacherId)
)
create table TbTeacher 
(
TeacherId int primary key,
TeacherName nvarchar(100) not null,
TeacherCourse nvarchar(200) not null
)
create table TbCourse
(
CourseId int primary key,
CourseName nvarchar(100) not null,
CourseFees int  null
)
insert into Tbstudent(studentId,studentName,feesDetail,CourseId,TeacherId) values (2,'ali',300,2,2);
insert into Tbstudent(studentId,studentName,feesDetail,CourseId,TeacherId) values (3,'mohamed',600,3,3);
insert into Tbstudent(studentId,studentName,feesDetail,CourseId,TeacherId) values (4,'sadek',1000,4,4);
insert into Tbstudent(studentId,studentName,feesDetail,CourseId,TeacherId) values (5,'hakemy',3000,5,5);
insert into Tbstudent(studentId,studentName,feesDetail,CourseId,TeacherId) values (6,'hassan',4000,6,6);

insert into TbTeacher(TeacherId,TeacherName,TeacherCourse) values (2,'saeed','math');
insert into TbTeacher(TeacherId,TeacherName,TeacherCourse) values (3,'maher','web desgin');
insert into TbTeacher(TeacherId,TeacherName,TeacherCourse) values (4,'mai','data communication');
insert into TbTeacher(TeacherId,TeacherName,TeacherCourse) values (5,'abo zaid','data structure');
insert into TbTeacher(TeacherId,TeacherName,TeacherCourse) values (6,'reda','data base');
insert into TbTeacher(TeacherId,TeacherName,TeacherCourse) values (7,'sadek','math');

insert into TbCourse(CourseId,CourseName,CourseFees) values (2,'web desgin',2000);
insert into TbCourse(CourseId,CourseName,CourseFees) values (3,'data communication',3000);
insert into TbCourse(CourseId,CourseName,CourseFees) values (4,'data structure',4000);
insert into TbCourse(CourseId,CourseName,CourseFees) values (5,'web programming',5000);
insert into TbCourse(CourseId,CourseName,CourseFees) values (6,'math',1500);

--When Does STUFF Use ?
SELECT STUFF('sadek',1,3,'hassan') AS studentName from Tbstudent;

--What do we use when extracting 3 character from a string ?
SELECT LEFT('math', 3) AS CourseName from TbCourse;

--What do we use when Convert the text to lower-case ?
SELECT LOWER('saeed') from Tbstudent ;

--Select all the tbstudent from the database 
Select * from Tbstudent;

-- Find the highest fees for the student?
select MAX(feesDetail) from Tbstudent;

--To know the min fees in course?
select MIN(CourseFees) from TbCourse;

--To know the average fees?
select AVG(CourseFees) from TbCourse;

--To know the teacher whose first name begins with the letter s?
select * from TbTeacher where TeacherName like 's%';

--To know the course whose the number ID more than 3 ?
select * from TbCourse where CourseId > 3;

--Select all the tbCourse from the database 
Select * from TbCourse;

--What do we use when Remove leading spaces from a string ?
SELECT LTRIM('     ali maher') AS LeftTrimmedString;

--What do we use when Convert the text to upper-case ?
SELECT UPPER('ahmed mohamed is FUN!');

--Find out the largest studentID
select MAX(studentId) from Tbstudent;

--When Does COALESCE Use ?
SELECT COALESCE(NULL, NULL, NULL, 'W3Schools.com', NULL, 'outlook.com');

--Know the least course ID
select MIN(CourseId) from TbCourse;

-- To know the average student ID
select AVG(studentId) from Tbstudent;

--To know the student whose name begins with the letter a
select * from Tbstudent where studentName like 'a%';

--What do we use when Replace "s" with "e" ?
SELECT REPLACE('saeed', 's', 'e')  ;

--Find out the largest courseID
select MAX(CourseId) from TbCourse;

--What do we use when Add several strings together  ?
SELECT CONCAT('gmail', '.com');




  SELECT COUNT(TeacherId), TeacherCourse
FROM TbTeacher
GROUP BY TeacherCourse;

  SELECT COUNT(CourseId), CourseName
FROM TbCourse
GROUP BY CourseName;

  SELECT COUNT(studentId), studentName
FROM Tbstudent
GROUP BY studentName;

 SELECT feesDetail from Tbstudent
INNER join  TbCourse
ON Tbstudent.feesDetail=TbCourse.CourseFees

SELECT feesDetail from Tbstudent
LEFT join  TbCourse
ON Tbstudent.feesDetail=TbCourse.CourseFees
Where TbCourse.CourseFees is NULL

SELECT feesDetail from Tbstudent
RIGHT join  TbCourse
ON Tbstudent.feesDetail=TbCourse.CourseFees
Where Tbstudent.feesDetail is NULL

SELECT feesDetail from Tbstudent
FULL OUTER join  TbCourse
ON Tbstudent.feesDetail=TbCourse.CourseFees

select * from Tbstudent
join TbCourse on TbCourse.Coursefees = Tbstudent.feesDetail;


select studentName from Tbstudent where studentId in (select studentId from TbTeacher where TeacherId > 2);
select CourseName from TbCourse where CourseId in (select CourseId from Tbstudent where studentId > 2);
select TeacherName from TbTeacher where TeacherId in (select TeacherId from TbCourse where CourseId > 4);

UPDATE TbTeacher
SET TeacherName = 'saeed', TeacherCourse = 'data base'
WHERE TeacherId=6;

UPDATE Tbstudent
SET studentName = 'ahmed', feesDetail = 1000 
WHERE studentId=5;

UPDATE TbCourse
SET CourseName = 'mohamed', CourseFees = 500
WHERE CourseId=4;

UPDATE TbTeacher
SET TeacherName = 'ali', TeacherCourse = 'math'
WHERE TeacherId=3;

UPDATE Tbstudent
SET studentName = 'sadek', feesDetail = 100
WHERE studentId=2;

DELETE FROM TbTeacher WHERE TeacherId=1;

DELETE FROM Tbstudent WHERE feesDetail=100;

DELETE FROM TbCourse WHERE CourseName='saeed';

DELETE FROM TbTeacher WHERE TeacherName='ahmed';

DELETE FROM Tbstudent WHERE studentId=2;
