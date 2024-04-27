-- Task 2
-- Student Database Management System
-- 1. Create a database named "student_database."

create table Student4(Student_id integer, Stu_name text, Department text, email_id text,
Phone_no numeric, Address text,Date_of_birth date, Gender Text, Major text, GPA numeric,Grade text);

-- 2. Insert 10 sample records into the "student_table" using INSERT command.

Insert Into Student4 Values
(1,'Kumaran','BE IT','kumaran1@gmail.com',9876543210,'Thoraipakkam,Chennai','20-02-2000','Male','Computer Science',9.2,'O'),
(2,'Yukendran','BE ECE','yuke1@gmail.com',9943665522,'Thambaram,Chennai','15-03-2000','Male','Python',8.8,'A+'),
(3,'Kavya','BE CSE','kavya@gmail.com',7890665045,'Porur,Chennai','11-05-2000','Female',
 'Data Science',6.5,'B'),
(4,'Sounder','BE Mech','sounder1@gmail.com',9786543201,'Kolathur,Chennai',
'05-11-2000','Male','Signal System',7.0,'B+'),
(5,'Lakshmi','BE Civil','Lakshmi10@gmail.com',9234567890,
'Vandalur,Chennai','20-08-2001','Male','EG Design',9.0,'O'),
(6,'Ranjith','BE IT ','ranjith17@gmail.com',8899006677,'Perungudi,Chennai','21-06-2000','Male','Computer Science',7.0,'B'),
(7,'Sudhakar','BE ECE','sudha1@gmail.com',9984756821,'Kelambakkam,Chennai','07-02-2000','Male','Control System',4.5,'F'),
(8,'Siva','BE CSE','siva111@gmail.com',9788553355,'Saidapet,Chennai','07-08-2000','Male','Economics',8.2,'B+'),
(9,'Kavi','BE IT','kavi02@gmail.com',8800044433,'Navalur,Chennai','23-09-2000','Female','Java',4.5,'F'),
(10,'Mohan','BE Mech','mohan09@gmail.com',9876543201,'Guindy,Chennai','04-06-2000','Male','Thermo Dynamics',6,'B');

-- 3.Select * from Student4 order by grade desc; 
-- 4.Select * from Student4 where Gender = 'Male'; 
-- 5.Select * from Student4 where Gpa < 5.0;
-- 6. Update Student4 Set Grade = 'O', Email_id = 'sam5@gmail.com ' where Student_id = 8;
-- 7.Select stu_name, date_of_birth from Student4 where Grade = 'B';
-- 8.Select Department, Gender, avg(GPA) from student4 group by Department, Gender;
-- 9.Alter table Student4 rename to studentinfo;
-- 10.Select Stu_Name from studentinfo WHERE GPA = (select max(GPA) from studentinfo)


