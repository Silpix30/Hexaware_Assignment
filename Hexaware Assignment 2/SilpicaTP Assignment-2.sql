create database SISDB;
create schema Sis;

--TASK 1 : DATABASE DESIGN--

create table Sis.Students(Student_id int Primary Key,FirstName varchar(20) , LastName varchar(20),DateofBirth date, Email varchar(30) , Phone_no varchar(10))
create table Sis.Teacher(Teacher_id int Primary Key,FirstName varchar(20),LastName varchar(20),Email varchar(30))
create table Sis.Courses(Course_id int Primary Key, CourseName varchar(100), Credits int,Teacher_id int references Sis.Teacher(Teacher_id))
create table Sis.Enrollments(Enrollment_id int Primary Key, Student_id int references Sis.Students(Student_id), Course_id int references Sis.Courses(Course_id),Enrollment_date date)
create table Sis.Payments(Payment_id int Primary Key,Student_id int references Sis.Students(Student_id),Amount int,Payment_date date)

-- Students
insert into Sis.Students values(1, 'Aarav', 'Patel', '2001-05-15', 'aarav.patel@example.com', '9876543210')
insert into Sis.Students values(2, 'Diya', 'Sharma', '2002-08-22', 'diya.sharma@example.com', '9876543211')
insert into Sis.Students values(3, 'Advait', 'Singh', '2001-12-10', 'advait.singh@example.com', '9876543212')
insert into Sis.Students values(4, 'Ananya', 'Kumar', '2003-03-05', 'ananya.kumar@example.com', '9876543213')
insert into Sis.Students values(5, 'Ishaan', 'Gupta', '2002-01-20', 'ishaan.gupta@example.com', '9876543214')
insert into Sis.Students values(6, 'Aaradhya', 'Reddy', '2003-07-18', 'aaradhya.reddy@example.com', '9876543215')
insert into Sis.Students values(7, 'Yuvraj', 'Khan', '2001-09-30', 'yuvraj.khan@example.com', '9876543216')
insert into Sis.Students values(8, 'Avni', 'Verma', '2002-04-12', 'avni.verma@example.com', '9876543217')
insert into Sis.Students values(9, 'Veer', 'Shah', '2003-06-25', 'veer.shah@example.com', '9876543218')
insert into Sis.Students values(10, 'Saachi', 'Pandey', '2002-02-28', 'saachi.pandey@example.com', '9876543219')

-- Teacher
insert into Sis.Teacher values(51, 'Rohit', 'Sharma', 'rohit.sharma@example.com')
insert into Sis.Teacher values(52, 'Priya', 'Patel', 'priya.patel@example.com')
insert into Sis.Teacher values(53, 'Amit', 'Singh', 'amit.singh@example.com')
insert into Sis.Teacher values(54, 'Neha', 'Gupta', 'neha.gupta@example.com')
insert into Sis.Teacher values(55, 'Manish', 'Kumar', 'manish.kumar@example.com')
insert into Sis.Teacher values(56, 'Sneha', 'Shah', 'sneha.shah@example.com')
insert into Sis.Teacher values(57, 'Ankit', 'Verma', 'ankit.verma@example.com')
insert into Sis.Teacher values(58, 'Nisha', 'Singh', 'nisha.singh@example.com')
insert into Sis.Teacher values(59, 'Raj', 'Yadav', 'raj.yadav@example.com')
insert into Sis.Teacher values(60, 'Kavita', 'Sharma', 'kavita.sharma@example.com')

-- Courses
insert into Sis.Courses values(111, 'Cloud Computing', 4, 51)
insert into Sis.Courses values(112, 'Artificial Intelligence', 4, 52)
insert into Sis.Courses values(113, 'Internet of Things', 3, 53)
insert into Sis.Courses values(114, 'Blockchain', 3, 54)
insert into Sis.Courses values(115, 'Data Science', 4, 55)
insert into Sis.Courses values(116, 'Machine Learning', 4, 56)
insert into Sis.Courses values(117, 'Cybersecurity', 3, 57)
insert into Sis.Courses values(118, 'Web Development', 3, 58)
insert into Sis.Courses values(119, 'Mobile App Development', 3, 59)
insert into Sis.Courses values(120, 'PowerBi', 2, 60)

-- Enrollments
insert into Sis.Enrollments values(1001, 1, 111, '2020-08-10')
insert into Sis.Enrollments values(1002, 2, 111, '2020-08-12')
insert into Sis.Enrollments values(1003, 3, 112, '2021-01-05')
insert into Sis.Enrollments values(1004, 4, 112, '2021-01-07')
insert into Sis.Enrollments values(1005, 5, 111, '2021-03-15')
insert into Sis.Enrollments values(1006, 6, 113, '2020-09-20')
insert into Sis.Enrollments values(1007, 7, 114, '2020-09-22')
insert into Sis.Enrollments values(1008, 8, 115, '2020-10-10')
insert into Sis.Enrollments values(1009, 9, 116, '2020-11-05')
insert into Sis.Enrollments values(1010, 10, 117, '2021-03-25')

-- Payments
insert into Sis.Payments values(2001, 1, 5000, '2020-09-01')
insert into Sis.Payments values(2002, 2, 5500, '2020-09-03')
insert into Sis.Payments values(2003, 3, 4500, '2021-02-01')
insert into Sis.Payments values(2004, 4, 4000, '2021-02-03')
insert into Sis.Payments values(2005, 5, 6000, '2021-04-15')
insert into Sis.Payments values(2006, 6, 5500, '2020-10-01')
insert into Sis.Payments values(2007, 7, 5000, '2020-10-03')
insert into Sis.Payments values(2008, 8, 5200, '2020-11-01')
insert into Sis.Payments values(2009, 9, 4500, '2020-12-03')
insert into Sis.Payments values(2010, 10, 4800, '2021-05-15')

select * from Sis.Students 
select * from Sis.Teacher
select * from Sis.Courses
select * from Sis.Enrollments
select * from Sis.Payments

--TASK 2 : SELECT,WHERE,BETWEEN,AND,LIKE--

--Write an SQL query to insert a new student into the "Students" table with the following details
insert into Sis.Students values(11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890')

--Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.
insert into Sis.Enrollments values(1011, 11, 116, '2021-05-10')

--Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
update Sis.Teacher set Email = 'neha@example.com' where Teacher_id = 54

--Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.
delete from Sis.Enrollments where student_id = 11 and course_id = 116

--Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.
update Sis.Courses set Teacher_id = 60 where Course_id=118

--Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.
alter table sis.Enrollments drop constraint FK__Enrollmen__Stude__412EB0B6
alter table sis.enrollments add constraint FK__Enrollmen__Stude__412EB0B6 foreign key (student_id) references sis.students(student_id) on delete cascade
delete from sis.students where Student_id=11

--Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.
update Sis.Payments set Amount=4000 where Payment_id=3

--TASK 3 : AGG FN, HAVING, ORDERBY, GROUPBY AND JOINS--

--Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.
select s.Student_id , SUM(p.Amount) as TotalPayment from Sis.Students s join Sis.Payments p on s.Student_id=p.Student_id group by s.Student_id 

--Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
select c.CourseName , COUNT(e.Student_id) as StudentCount from Sis.Courses c join Sis.Enrollments e on c.Course_id = e.Course_id group by c.CourseName

--Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments
select concat(s.FirstName, ' ', s.LastName) as StudentName from Sis.Students s left join Sis.Enrollments e on s.Student_id =e.Student_id where e.Enrollment_id is null

--Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.
select concat(s.FirstName, ' ', s.LastName) as StudentName, c.CourseName from Sis.Students s join Sis.Enrollments e on s.student_id = e.student_id join Sis.Courses c on e.course_id = c.course_id 

--Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table
select concat(t.FirstName, ' ', t.LastName) as TeacherName, c.CourseName from Sis.Teacher t join Sis.Courses c on t.Teacher_id= c.Teacher_id 

--Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables
select concat(s.FirstName, ' ', s.LastName) as StudentName, e.Enrollment_date from Sis.Students s join Sis.Enrollments e on s.Student_id=e.Student_id join Sis.Courses c on e.Course_id = c.Course_id where c.CourseName ='Cloud Computing'

--Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
select concat(s.FirstName, ' ', s.LastName) as StudentName from Sis.Students s left join Sis.Payments p on s.Student_id = p.Student_id where p.Payment_id is null

--Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records
select c.CourseName from Sis.Courses c left join Sis.Enrollments e on c.Course_id = e.Course_id where e.Enrollment_id is null

--Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
select e1.student_id, count(*) as Enrollments_count
from Sis.Enrollments e1
join Sis.Enrollments e2 on e1.student_id = e2.student_id and e1.enrollment_id <> e2.enrollment_id
group by e1.student_id
having count(*) > 1

--Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.
select concat(t.FirstName, ' ', t.LastName) as TeacherName from Sis.Teacher t left join Sis.Courses c on t.Teacher_id = c.Teacher_id where c.Teacher_id is null

--TASK 4 : SUB QUERIES AND IT'S TYPE--

--Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.
select course_id , avg(Student_count) as Avg_stud_enrolled from (select Course_id , COUNT(student_id) as Student_count from Sis.Enrollments group by Course_id ) as SQ 
group by course_id

--Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
select s.Student_id, concat(s.FirstName, ' ', s.LastName) as StudentName, p.Amount 
from sis.Students s
join sis.Payments p on s.Student_id = p.Student_id 
where p.Amount = (select max(amount) from sis.Payments)

--Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.
select c.Course_id, c.CourseName, COUNT(e.Student_id) as Enrollment_count from Sis.Courses c
join Sis.Enrollments e on c.Course_id = e.Course_id 
group by c.course_id, c.coursename
having COUNT(e.student_id) = (select max(enrollment_count) from (select COUNT(student_id) as Enrollment_count from Sis.Enrollments group by course_id) as Max_enrollments)

--Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
select t.Teacher_id,concat(t.FirstName, ' ', t.LastName) as TeacherName,(select sum(p.amount) from Sis.Courses c
join Sis.Enrollments e on c.course_id = e.course_id
join Sis.Payments p on e.student_id = p.student_id where c.teacher_id = t.Teacher_id) as Total_payments
from Sis.Teacher t

--Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.
select Student_id,concat(s.FirstName, ' ', s.LastName) as StudentName from Sis.Students s
where (select count(distinct course_id) from Sis.Courses) = (select count(distinct course_id) from Sis.Enrollments where student_id = s.student_id)

--Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
select Teacher_id,concat(t.FirstName, ' ', t.LastName) as TeacherName
from Sis.Teacher t where not exists (select 1 from sis.Courses c where c.teacher_id = t.teacher_id)

--Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
select avg(age) as Average_age from (select datediff(year, s.dateofbirth, getdate()) as age from sis.students s where s.dateofbirth is not null) as Student_ages

--Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
select course_id, coursename from sis.courses c where not exists (select 1 from sis.enrollments e where e.course_id = c.course_id)

--Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.
select e.Student_id, e.Course_id, (select sum(p.amount) from sis.payments p where p.student_id = e.student_id) as Total_payments from sis.enrollments e

--Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
select Student_id from (select student_id, count(*) as num_payments from sis.payments group by student_id) as Payment_counts where num_payments > 1

--Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
select s.student_id,concat(s.FirstName, ' ', s.LastName) as StudentName,Total_payments from sis.students s
join (select student_id,sum(amount) as Total_payments from sis.payments group by student_id) as Payment_totals on s.student_id = payment_totals.student_id

--Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
select c.CourseName ,(select COUNT(*) from Sis.Enrollments e where e.course_id = c.course_id) as Enrollment_count from Sis.Courses c

--Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.
select avg(amount) as Average_payment_amount from (select p.amount from sis.students s join sis.payments p on s.student_id = p.student_id) as Payment_amounts


