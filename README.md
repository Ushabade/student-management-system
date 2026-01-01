# Student Management System (MySQL)

## 📌 Project Overview
This project is a **Student Management System** built using **MySQL**.  
It manages students, courses, enrollments, and marks using relational database concepts.

## 🛠️ Technologies Used
- MySQL
- MySQL Workbench
- Git & GitHub

## 🗂️ Database Structure

### 1. Students Table
Stores student details.
- student_id (Primary Key)
- name
- email (Unique)
- gender
- dob
- department

### 2. Courses Table
Stores course details.
- course_id (Primary Key)
- course_name
- credits

### 3. Enrollments Table
Maps students to courses.
- enrollment_id (Primary Key)
- student_id (Foreign Key)
- course_id (Foreign Key)

### 4. Marks Table
Stores marks for students in courses.
- marks_id (Primary Key)
- student_id (Foreign Key)
- course_id (Foreign Key)
- marks

## 🔑 Relationships
- One student can enroll in multiple courses
- One course can have multiple students
- Students receive marks for enrolled courses

## 📊 SQL Features Used
- CREATE, INSERT, SELECT
- PRIMARY KEY & FOREIGN KEY
- JOINS
- AGGREGATE FUNCTIONS (AVG)
- ORDER BY

## 📈 Sample Queries
- List students with their courses
- Find topper using average marks

## 🎯 Learning Outcome
- Strong understanding of relational databases
- Hands-on experience with SQL joins and constraints
- GitHub project management

---
