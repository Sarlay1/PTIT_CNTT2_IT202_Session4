create table Student (
		student_id int primary key,
        full_name varchar(100) not null, 
        email varchar(100),
        phone varchar(15)
);
create table Course (
		course_id int primary key,
        course_name varchar(100) not null, 
        credits int not null check (credits>0)
);
create table Enrollment(
		student_id int,
        course_id int,
        grade decimal(5,2) default 0,
        primary key(student_id, course_id),
        
        foreign key (student_id) references Student(student_id),
        foreign key (course_id) references Course(course_id)
);


-- Phần 2
insert into Student (student_id, student_name, student_age)
values
	 (1, 'Tiendat', 19),
     (2, 'Camtu', 16),
     (3, 'Tienthanh', 14),
     (4, 'Thanhbinh', 20),
     (5, 'Thanhan', 15);
insert into Course (course_id, course_name, credits)
values 
	(1, 'Lập trình mạng', 3),
    (2, 'Mạng máy tính', 3),
    (3, 'Tiếng anh', 4),
    (4, 'Lập trình web'),
    (5, 'Cấu trúc giải thuật');
insert into Enrollment (student_id, course_id, grade) 
values
	(1, 1, 8.3),
    (2, 3, 7.5),
    (3, 4, 7.0),
    (4, 5, 8.0),
    (5, 2, 7.2);
update enrollment 
set grade = 9.0 where student_id = 2 and course_id = 3; 

select full_name, email, phone from Student;
delete from Course where course_id = 101;
-- Không thể xóa khóa học có mã 101 vì khóa học này đang được tham chiếu
-- bởi bảng Enrollment thông qua khóa ngoại course_id.
-- Nếu xóa sẽ làm mất tính toàn vẹn dữ liệu (vi phạm ràng buộc FOREIGN KEY),
-- do đó hệ quản trị CSDL không cho phép xóa.
