SELECT * FROM quanlysinhvien.student;
use quanlysinhvien;

-- hiển thị bảng sinh viên bắt đầu với kí tự h
-- select student_name from student where student_name regexp '^h';

-- hiển thị thông tin các lớp học bắt đầu từ tháng 12: 
select * from class where start_date like '_____12%'; 
select class_name,start_date from class where start_date like '_____12%';

-- hiển thị thông tin các môn học có credit từ 3-5 :
-- select * from subject where credit >=3 and credit <=5;
select sub_name,credit from subject where credit >=3 and credit  <=5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2:
update student set class_id = 2 where student_id = 1;

select student.student_id,student.student_name,subject.sub_id,mark.mark_id,mark.mark
from student join mark on student.student_id = mark.student_id join subject on mark.sub_id = subject.sub_id
order by mark.mark DESC , student.student_name ASC;