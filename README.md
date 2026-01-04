<<<<<<< HEAD
# Student Management System (MySQL)

## Project Overview
This project is a **Student Management System** built using **MySQL**.  
It manages students, courses, enrollments, and marks using relational database concepts.
=======
# 🎓 Student Management System (MySQL)

## 📌 Project Overview
The **Student Management System** is a relational database project built using **MySQL**.  
It manages **students, courses, enrollments, marks, and attendance**, and generates meaningful reports using **views, stored procedures, triggers, and constraints**.

This project demonstrates strong understanding of **database design, relationships, and advanced SQL concepts**.

---
>>>>>>> 7f4a6cb (Updated SQL project and README)

## 🛠️ Technologies Used
- MySQL
- MySQL Workbench
- Git & GitHub


## Database Structure

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

## Relationships
- One student can enroll in multiple courses
- One course can have multiple students
- Students receive marks for enrolled courses

## SQL Features Used
- CREATE, INSERT, SELECT
- PRIMARY KEY & FOREIGN KEY
- JOINS
- AGGREGATE FUNCTIONS (AVG)
- ORDER BY

## Sample Queries
- List students with their courses
- Find topper using average marks

## Learning Outcome
- Strong understanding of relational databases
- Hands-on experience with SQL joins and constraints
- GitHub project management

---
=======
---

## 🗂️ Database Tables

### 1️⃣ Students
Stores student details.
- `student_id` (Primary Key)
- `name` (NOT NULL)
- `email` (UNIQUE)
- `gender`
- `dob`
- `department`

---

### 2️⃣ Courses
Stores course information.
- `course_id` (Primary Key)
- `course_name`
- `credits`

---

### 3️⃣ Enrollments
Maps students to courses (Many-to-Many).
- `enrollment_id` (Primary Key)
- `student_id` (Foreign Key)
- `course_id` (Foreign Key)

---

### 4️⃣ Marks
Stores marks obtained by students.
- `marks_id` (Primary Key)
- `student_id` (Foreign Key)
- `course_id` (Foreign Key)
- `marks` (NOT NULL, CHECK 0–100)

---

### 5️⃣ Attendance
Tracks student attendance.
- `attendance_id` (Primary Key)
- `student_id` (Foreign Key)
- `course_id` (Foreign Key)
- `date`
- `status` (P / A)

---

## 🔗 Database Relationships
- One student can enroll in multiple courses
- One course can have multiple students
- Students receive marks and attendance per course
- Relationships enforced using **Foreign Keys**

---

## 📊 SQL Features Implemented
- `CREATE`, `INSERT`, `SELECT`
- `PRIMARY KEY`, `FOREIGN KEY`
- `NOT NULL`, `UNIQUE`, `CHECK`
- `JOINS`
- `AGGREGATE FUNCTIONS` (AVG, COUNT)
- `VIEWS`
- `STORED PROCEDURES`
- `TRIGGERS`

---

## 📈 Sample Queries
- Students with enrolled courses
- Topper based on average marks
- Attendance percentage per student
- Course-wise attendance report

---

## 👁️ View
### `student_full_report_1`
Provides:
- Student name
- Course name
- Marks
- Attendance percentage

---

## ⚙️ Stored Procedure
### `get_student_report(student_id)`
Generates a complete academic report for a given student.

Usage:
```sql
CALL get_student_report(1);
