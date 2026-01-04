# CREATE DATABSE

create database student_management;
use student_management;
show databases;

# CREATE STUDENTS TABLE --------------------------------------

create table students (
student_id int primary key auto_increment,
name varchar(50),
email varchar(50) unique,
gender varchar(50),
dob date,
department varchar(50)
);

ALTER TABLE students MODIFY dob DATE;


# INSERT INTO STUDENT TABLE

insert into students(name, email, gender, dob, department)
 values("usha","usha@gmail.com","F","2004-05-13","cse");
insert into students(name, email, gender, dob, department)
 values ("nani","nani@gmail.com","M","2006-05-13","Civil");

select * from students;

#CREATE COURCES TABLE---------------------------------------------------

create table courses(
course_id int primary key auto_increment,
course_name varchar(50),
credits int
);

#INSERT INTO COURSES TABLE
insert into courses (course_name, credits) value("java",10),("python",10),("c",9),("c++",8);

select * from courses;

#CREATE ENROLLMENT TABLE---------------------------------------------

create table enrollments(
enrollment_id int primary key auto_increment,
student_id int,
course_id int ,
foreign key(student_id) references students(student_id),
foreign key(course_id) references courses(course_id)
);

# INCERT DATA INTO ENROLLMENT TABLE
insert into enrollments(student_id,course_id) values(1,2);
insert into enrollments(student_id,course_id) values(1,1);
insert into enrollments(student_id,course_id) values(4,1);


select * from enrollments;

#CREATE MARKS TABLE----------------------------------
create table marks(
marks_id int primary key auto_increment,
student_id int,
course_id int,
marks int,
foreign key(student_id) references students (student_id),
foreign key(course_id) references courses (course_id)
);

#INSERT INTO MARKS TEBLE
insert into marks(student_id,course_id,marks) values(1,1,100),(4,2,99),(1,1,76),(4,1,90);

select * from marks;

#QUERYS------------------------------------------------------------
#QUERIES------------------------------------------------------------
>>>>>>> 7f4a6cb (Updated SQL project and README)
# Student with Courses
select s.name , c.course_name 
from students s 
join enrollments e on s.student_id=e.student_id
join courses c on e.course_id=c.course_id;

#Topper
select s.name,avg(m.marks) as avg_marks
from students s
join marks m on s.student_id=m.student_id
group by s.student_id
order by avg_marks desc;



#CREATE ATTENDENCE TABLE-------------------------------------------
create table  attendance( 
attendance_id int primary key auto_increment,
student_id int,
course_id int,
date date,
status varchar(50),
foreign key(student_id) references students(student_id),
foreign key(course_id) references courses (course_id)
);

#INSERT DATA INTO ATTENDANCE TABLE
insert into attendance(student_id,course_id,date,status) 
values(1,1,"2025-1-1","A"),(1,2,"2025-2-2","P"),(4,1,"2025-3-3","P");

insert into attendance(student_id,course_id,date,status) 
values(1,1,"2024-1-1","P"),(1,2,"2024-2-2","A"),(4,1,"2024-3-3","A"),(1,1,"2023-1-1","P"),(1,2,"2023-2-2","A"),(4,1,"2023-3-3","P");


select * from attendance;

#QUERIES------------------------------------------------------------

#View attendance of a single student
select s.name from students s
join attendance a on s.student_id=a.student_id
where  a.status="P" and a.date="2025-3-3";

#View attendance course-wise
select a.status,c.course_id, c.course_name from attendance a
join courses c on c.course_id=a.course_id;

#Calculate total present days for each student
select s.student_id, s.name ,
count(case when a.status="P" then 1 end)as total_presents
from students s
join attendance a on a.student_id=s.student_id
group by s.student_id,s.name;

#Calculate attendance percentage per student
select s.student_id,s.name,
count(*) as total_count,
count(case when a.status="P" then 1 end) as total_presents,
round(
count(case when a.status="P" then 1 end) /nullif(count(0),0) * 100 ,2)as percentaage
from students s
join attendance a on a.student_id=s.student_id
group by s.student_id,s.name;

#Create a VIEW named student_full_report

create view student_full_report_1 as
select
 s.name,
 c.course_name,
 m.marks,
round(
count(case when a.status="P" then 1  else 0 end )/count(a.attendance_id)* 100 ,2) as  percentage
from students s
join marks m on m.marks_id=m.student_id
join courses c on c.course_id=s.student_id
join attendance a on a.attendance_id=s.student_id and a.attendance_id=c.course_id
group by s.student_id,s.name,c.course_name,m.marks;

select * from  student_full_report_1;

#Stored Procedure
delimiter $$
create procedure get_student_report(in p_student_id int)
begin 
select
 s.name,
 c.course_name,
 m.marks,
round(
count(case when a.status="P" then 1  else 0 end )/count(a.attendance_id)* 100 ,2) as  percentage
from students s
join marks m on m.marks_id=m.student_id
join courses c on c.course_id=s.student_id
join attendance a on a.attendance_id=s.student_id and a.attendance_id=c.course_id
where s.student_id=p_student_id
group by s.student_id,s.name,c.course_name,m.marks;
end$$
delimiter $$

call get_student_report(1);

#Trigger: BEFORE INSERT on marks
delimiter $$
create trigger check_marks_bf_insert
before insert on marks
for each row
begin
 if new.marks>100 then
 signal sqlstate "45000"
 set message_text ="marks cant be grater than 100";
 end if;
 end$$
 delimiter $$

INSERT INTO marks (student_id, course_id, marks)
VALUES (1, 1, 120);

#CONSTRAINTS & OPTIMIZATION
alter table marks
add constraint check_marks_range
check(marks between 0 and 100);

#NOT NULL Constraints
alter table students
modify name varchar(50) not null;

alter table marks 
modify marks int not null;



