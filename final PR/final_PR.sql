create database final_project;

use final_project;

create table departments (
	departmentID int primary key,
    department_name varchar(50)
);

insert into departments (departmentID, department_name) values
(1, 'computer science'),
(2, 'mathematics'),
(3, 'electronics'),
(4, 'mechanical'),
(5, 'information technology');

create table students (
	studentID int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    birth_date date,
    enrolment_date date
);

insert into students (studentID, first_name, last_name, email, birth_date, enrolment_date) values
(1, 'divyesh', 'jadav', 'divyesh.jadav@email.com', '2001-05-14', '2021-08-01'),
(2, 'tirth', 'donga', 'tirth.donga@email.com', '2002-09-21', '2023-01-15'),
(3, 'ved', 'dhameliya', 'ved.dhameliya@email.com', '2000-11-03', '2020-08-01'),
(4, 'tejas', 'varma', 'tejas.varma@email.com', '2003-01-30', '2023-08-01'),
(5, 'neev', 'shankre', 'neev.shankre@email.com', '2002-07-18', '2022-08-01');

create table courses (
	courseID int primary key,
    course_name varchar(50),
    departmentID int,
    credits int,
    foreign key (departmentID) references departments(departmentID)
);

insert into courses (courseID, course_name, departmentID, credits) values
(101, 'introduction to sql', 1, 3),
(102, 'data structures', 1, 4),
(103, 'linear algebra', 2, 3),
(104, 'digital electronics', 3, 4),
(105, 'thermodynamics', 4, 3);


create table instructors (
	instructorID int primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    departmentID int,
    salary decimal (10,2),
    foreign key (departmentID) references departments(departmentID)
);

insert into instructors (instructorID, first_name, last_name, email, departmentID, salary) values
(1, 'rajesh', 'kumar', 'rajesh.kumar@univ.com', 1, 85000.00),
(2, 'priya', 'nair', 'priya.nair@univ.com', 2, 78000.00),
(3, 'amitabh', 'joshi', 'amitabh.joshi@univ.com', 3, 82000.00),
(4, 'sunita', 'deshmukh', 'sunita.deshmukh@univ.com', 4, 75000.00),
(5, 'vikram', 'iyer', 'vikram.iyer@univ.com', 5, 90000.00);

create table enrollments (
	enrolmentID int primary key,
    studentID int,
    courseID int,
    enrolmentDate date,
    foreign key (studentID) references students(studentID),
    foreign key (courseID) references courses(courseID)
);

insert into enrollments (enrolmentID, studentID, courseID, enrolmentdate) values
(1, 1, 101, '2021-08-05'),
(2, 1, 102, '2021-08-05'),
(3, 2, 101, '2023-01-20'),
(4, 3, 103, '2020-08-10'),
(5, 4, 104, '2023-08-02');


-- Q1. Perform CRUD Operations on all tables.
insert into students (studentid, first_name, last_name, email, birth_date, enrolment_date) 
values (6, 'Tirth', 'Donda', 'tirth.donga@email.com', '2001-03-12', '2023-08-01');

select * from students;

update students set last_name = 'Donga' where studentid = 6;

delete from students where studentID = 6;

-- Q2. Retrieve students who enrolled after 2022.
select * from students where enrolment_date > '2022-12-31';

-- Q3. Retrieve courses offered by the Mathematics department with a limit of 5 courses.
select c.* from courses c join departments d on c.departmentID = d.departmentID where d.department_name = 'mathematics' limit 5;

-- Q4. Get the number of students enrolled in each course, filtering for courses with more than 5 students.
select c.course_name, count(e.studentID) as student_count from enrollments e join courses c on e.courseid = c.courseid group by c.course_name, e.courseid having count(e.studentid) > 5;

-- Q5. Find students who are enrolled in both Introduction to SQL and Data Structures.
select s.studentID, s.first_name, s.last_name from students s join enrollments e on s.studentID = e.studentID join courses c on e.courseid = c.courseid
where c.course_name in ('introduction to sql', 'data structures') group by s.studentid, s.first_name, s.last_name 
having count(distinct c.course_name) = 2;

-- Q6. Find students who are either enrolled in Introduction to SQL or Data Structures.
select distinct s.studentid, s.first_name, s.last_name from students s join enrollments e on s.studentid = e.studentid join courses c on e.courseid = c.courseid
where c.course_name = 'introduction to sql' or c.course_name = 'data structures';

-- Q7. Calculate the average number of credits for all courses.
select avg(credits) as average_credits from courses;

-- Q8. Find the maximum salary of instructors in the Computer Science department.
select max(i.salary) max_salary from instructors i join departments d on i.departmentid = d.departmentid where d.department_name = 'computer science';

-- Q9. Count the number of students enrolled in each department.
select d.department_name, count(distinct e.studentid) as total_students from departments d join courses c on d.departmentid = c.departmentid join enrollments e on c.courseid = e.courseid
group by d.department_name, d.departmentid;

-- Q10. INNER JOIN: Retrieve students and their corresponding courses.
select s.first_name, s.last_name, c.course_name from students s inner join enrollments e on s.studentid = e.studentid inner join courses c on e.courseid = c.courseid;

-- Q11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.
select s.first_name, s.last_name, c.course_name from students s left join enrollments e on s.studentid = e.studentid left join courses c on e.courseid = c.courseid;

-- Q12. Subquery: Find students enrolled in courses that have more than 10 students.
select distinct s.studentid, s.first_name, s.last_name from students s join enrollments e on s.studentid = e.studentid
where e.courseid in (select courseid from enrollments group by courseid having count(studentid) > 10);

-- Q13. Extract the year from the EnrollmentDate of students.
select studentid, first_name, last_name, year(enrolment_date) enrolment_year from students;

-- Q14. Concatenate the instructor's first and last name.
select concat(first_name, ' ', last_name) as full_name from instructors;

-- Q15. Calculate the running total of students enrolled in courses.
select enrolmentid, courseid, enrolmentdate, count(studentid)  over (order by enrolmentdate, enrolmentid) running_total_students from enrollments;

-- Q16. Label students as 'Senior' or 'Junior' based on their year of enrollment.
select studentid, first_name, last_name, enrolment_date,
	case 
		when enrolment_date <= date_sub(current_date(), interval 4 year) then 'senior'
		else 'junior'
	end as student_status
from students;