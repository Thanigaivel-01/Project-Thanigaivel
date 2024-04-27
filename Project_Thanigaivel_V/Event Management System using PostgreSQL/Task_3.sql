-- Task 3 
-- Event Management System using PostgreSQL.
-- 1.Database Creation
-- Create tables for Events

CREATE TABLE EVENTS4(EVENT_ID INT PRIMARY KEY, EVENT_NAME VARCHAR(20), EVENT_DATE DATE, EVENT_LOCATION VARCHAR(20),EVENT_DESCRIPTION VARCHAR(50));

-- Create tables for Attendees

CREATE TABLE ATTENDEES4(ATTENDEE_ID INT PRIMARY KEY,ATTENDEE_NAME VARCHAR(20),
ATTENDE_PHONE BIGINT,ATTENDEE_EMAIL VARCHAR(20),ATTENDEE_CITY VARCHAR(20));

-- Create tables for Registrations

CREATE TABLE REGISTRATIONS4(REGISTRATION_ID INT PRIMARY KEY,EVENT_ID INT,ATTENDEE_ID INT, Registration_DATE DATE, REGISTRATION_AMOUNT NUMERIC,FOREIGN KEY (EVENT_ID) REFERENCES EVENTS4(EVENT_ID),FOREIGN KEY (ATTENDEE_ID) REFERENCES ATTENDEES4(ATTENDEE_ID));

-- 2) Insert some sample data for Events, Attendees, and Registrations tables with respective fields.

Insert into events4 Values
(1,'Mop Fest','08-10-2021','Chennai','Only Staffs can participate'),
(2,'Chess Olymbia','11-09-2021','Chennai','above 18 years old can participate'),
(3,'Glitzz Event','06-05-2021','Chennai','Only college students are allowed');

Insert into attendees4 Values 
(201,'Sudhakar',7770654321,'Sudha9@gmail.com','Chennai'),
(202,'Mohan',9965432190,'Mohan12@gmail.com','Chennai'),
(203,'Sanjeev',8354321098,'Sanj34@gmail.com','Chennai'),
(204,'Saravanan',8797654321,'Saravana@gmail.com','Chennai'),
(205,'remo',7393155323,'remo@gmail.com','Chennai');

Insert into Registrations4 Values
(11,1,201,'11-02-2021',100),
(22,2,202,'07-01-2021',200),
(33,1,203,'02-01-2021',100),
(44,2,204,'05-01-2021',200),
(55,3,205,'09-02-2021',300);

-- 3.a) Inserting a new event.

Insert into events4 Values(4,'Republic day','01-03-2021','Chennai','Only below 15 years old can participate');

-- b) Updating an event's information

Update Events4 set Event_Name = 'Open Mike' Where EVENT_ID = 3;

-- c) Deleting an event.

DELETE FROM EVENTS4 WHERE EVENT_ID = 4;

-- 4) Manage Track Attendees & Handle Events
-- a)Inserting a new attendee.

Insert Into attendees4 values (206,'Mahalakshmi',8801234567,'maha8@gmail.com','Chennai');

-- b)Registering an attendee for an event.

insert into registrations4 values (66,2,206,'30-05-2024',200);

-- 5.Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics.

Select Ei.event_id, Ei.event_name, Count(Rs.attendee_id) From events4 Ei 
Join registrations4 Rs ON Ei.event_id = Rs.event_id Group by Ei.event_id, Ei.event_name;

