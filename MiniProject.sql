create database online_learning;
use online_learning;

create table student (
    student_id int auto_increment primary key,
    full_name varchar(100) not null,
    birth_date date,
    email varchar(100) not null unique
);

create table teacher (
    teacher_id int auto_increment primary key,
    full_name varchar(100) not null,
    email varchar(100) unique
);

create table course (
    course_id int auto_increment primary key,
    course_name varchar(100) not null,
    description varchar(255),
    total_sessions int check (total_sessions > 0),
    teacher_id int,
    foreign key (teacher_id) references teacher(teacher_id)
);

create table enrollment (
    student_id int,
    course_id int,
    enroll_date date not null,
    primary key (student_id, course_id),
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

create table score (
    student_id int,
    course_id int,
    mid_score decimal(3,1) check (mid_score between 0 and 10),
    final_score decimal(3,1) check (final_score between 0 and 10),
    primary key (student_id, course_id),
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);


insert into student (full_name, birth_date, email) values
('le thanh an', '2003-03-15', 'an@gmail.com'),
('pham thi binh', '2002-09-21', 'binh@gmail.com'),
('tran quang cuong', '2003-01-10', 'cuong@gmail.com'),
('hoang mai dung', '2002-12-05', 'dung@gmail.com'),
('vu duc em', '2003-07-30', 'em@gmail.com');

insert into teacher (full_name, email) values
('nguyen van minh', 'minh@edu.vn'),
('le thi lan', 'lan@edu.vn'),
('pham quoc dat', 'dat@edu.vn'),
('tran hoai nam', 'nam@edu.vn'),
('doan thi hue', 'hue@edu.vn');

insert into course (course_name, description, total_sessions, teacher_id) values
('co so du lieu', 'nhap mon csdl', 12, 1),
('lap trinh java', 'java can ban', 15, 2),
('lap trinh web', 'html css co ban', 10, 3),
('python co ban', 'lap trinh python', 14, 4),
('cau truc du lieu', 'ctdl va giai thuat', 16, 5);
insert into enrollment values
(1, 1, '2024-02-01'),
(1, 2, '2024-02-03'),
(2, 1, '2024-02-05'),
(3, 3, '2024-02-07'),
(5, 5, '2024-02-10');
insert into score values
(1, 1, 7.0, 8.5),
(1, 2, 6.5, 7.5),
(2, 1, 8.0, 8.5),
(3, 3, 7.5, 8.0),
(5, 5, 6.0, 7.0);
update student
set email = 'an_new@gmail.com'
where student_id = 1;

update course
set description = 'co so du lieu tu co ban den nang cao'
where course_id = 1;

update score
set final_score = 9.0
where student_id = 1
  and course_id = 1;
delete from enrollment
where student_id = 5
  and course_id = 5;

delete from score
where student_id = 5
  and course_id = 5;


select * 
from student;
select * 
from teacher;
select * 
from course;
select
    (select full_name from student where student_id = enrollment.student_id),
    (select course_name from course where course_id = enrollment.course_id),
    enroll_date
from enrollment;
select
    (select full_name from student where student_id = score.student_id),
    (select course_name from course where course_id = score.course_id),
    mid_score,
    final_score
from score;
