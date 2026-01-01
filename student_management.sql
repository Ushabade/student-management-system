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








