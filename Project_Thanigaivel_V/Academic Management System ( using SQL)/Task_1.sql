-- Task1 
-- a.create table studentInfo

create table StudentInfo4(
STU_ID int primary key,
STU_NAME VARCHAR(30),
DOB DATE,
PHONE_NO varchar(10),
EMAIL_ID VARCHAR(50),
ADDRESS VARCHAR(100));

-- b.create table courseInfo

create table CourseInfo4(
COURSE_ID INT primary key,
COURSE_NAME VARCHAR(30),
COURSE_INSTRUCTOR_NAME VARCHAR(30)
);

-- C.create table enrollmentInfo

create table EnrollmentInfo4(
ENROLLMENT_ID INT,STU_ID INT,COURSE_ID INT,ENROLL_STATUS varchar(30),
FOREIGN KEY (STU_ID) REFERENCES StudentInfo4(STU_ID),
FOREIGN KEY (COURSE_ID) REFERENCES CourseInfo4(COURSE_ID)
);

-- 2.Data Creation

insert into StudentInfo4 (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(91,'Nisha','2000-08-01','8835907650','nisha8@gmail.com',' karapakkam,chennai'),
(92,'Thanigai Vel','2001-11-11','8875807531','Thanigs6@gmail.com','Thuraipakkam,chennai'),
(93,'Chandran','1994-03-08','6747887656','chan5@gmail.com','Perungudi,chennai'),
(94,'Domesh','1998-04-04','8966317680','dom4@gmail.com','Perambur,chennai'),
(95,'Mothesh','2000-05-05','7367678620','Moth3@gmail.com','Guindy,chennai'),
(96,'Kaviya','2001-06-06','8867668650','Kav1@gmail.com','Porur,chennai'),
(97,'Gunashekar','1999-07-07','9987678666','guna@gmail.com','Madipakkam,chennai'),
(98,'hemalatha','2000-09-08','8767678656','hema8@gmail.com','Thambaram,chennai'),
(99,'Sneha','2002-07-09','8799678630','sne3@gmail.com','Mylapore,chennai');

select * from StudentInfo4;

insert into CourseInfo4(COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) values
(1,'C++','Prem'),
(2,'sql','Sathish'),
(3,'java','Ramesh');

insert into EnrollmentInfo4(ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS) values
(50,91,1,'Enrolled'),
(51,91,2,'Enrolled'),
(52,92,2,'Enrolled'),
(53,92,3,'Enrolled'),
(54,93,3,'Enrolled'),
(55,94,1,'Enrolled'),
(56,95,2,'Enrolled'),
(57,96,3,'Enrolled'),
(58,97,1,'Not Enrolled'),
(59,98,2,'Not Enrolled'),
(60,99,3,'Not Enrolled');

-- 3) Retrieve the Student Information
-- a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.

select StudentInfo4.STU_NAME, StudentInfo4.PHONE_NO, StudentInfo4.EMAIL_ID, EnrollmentInfo4.ENROLL_STATUS
from EnrollmentInfo4
inner join StudentInfo4 on EnrollmentInfo4.STU_ID=StudentInfo4.STU_ID;

-- b) Write a query to retrieve a list of courses in which a specific student is enrolled.

select CourseInfo4.COURSE_NAME
from EnrollmentInfo4 ei
inner join CourseInfo4 on ei.COURSE_ID = CourseInfo4.COURSE_ID
where ei.STU_ID = 93 and ei.ENROLL_STATUS='Enrolled';

-- c) Write a query to retrieve course information, including course name, instructor information.

select ci.COURSE_NAME,ci.COURSE_INSTRUCTOR_NAME
from CourseInfo4 ci;

-- d) Write a query to retrieve course information for a specific course .

select COURSE_NAME,COURSE_INSTRUCTOR_NAME
from CourseInfo4
where COURSE_ID =1;

-- e) Write a query to retrieve course information for multiple courses.

select COURSE_NAME,COURSE_INSTRUCTOR_NAME
from CourseInfo4
where COURSE_ID in (1,2,3);

-- 4. Reporting and Analytics (Using joining queries)
-- a) Write a query to retrieve the number of students enrolled in each course
 
select ci.COURSE_NAME,
count(ei.STU_ID) AS Number_of_students
from EnrollmentInfo4 ei
join CourseInfo4 ci on ei.COURSE_ID = ci.COURSE_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by ci.COURSE_NAME;

-- b) Write a query to retrieve the list of students enrolled in a specific course

select si.STU_NAME
from EnrollmentInfo4 ei
join StudentInfo4 si on  ei.STU_ID = si.STU_ID
where ei.COURSE_ID = 2 and ei.ENROLL_STATUS = 'Enrolled';

-- c) Write a query to retrieve the count of enrolled students for each instructor.

select ci.COURSE_INSTRUCTOR_NAME,
count(ei.STU_ID) AS Enrolled_Students_count
from CourseInfo4 ci
join EnrollmentInfo4 ei on ci.Course_ID = ei.COURSE_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by ci.COURSE_INSTRUCTOR_NAME;

-- d) Write a query to retrieve the list of students who are enrolled in multiple courses

select si.STU_NAME,
count(ei.COURSE_ID) as Courses_Enrolled
from StudentInfo4 si
join EnrollmentInfo4 ei on si.STU_ID = ei.STU_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by si.STU_NAME
having count(ei.COURSE_ID) >1;

-- e) Write a query to retrieve the courses that have the highest number of enrolled students(arranging from highest to lowest)

select ci.COURSE_NAME,
count(ei.STU_ID) as Enrolled_Students_count
from EnrollmentInfo4 ei
join  CourseInfo4 ci on ei.COURSE_ID = ci.COURSE_ID
where ei.ENROLL_STATUS = 'Enrolled'
group by ci.COURSE_NAME
order by Enrolled_Students_count desc;
