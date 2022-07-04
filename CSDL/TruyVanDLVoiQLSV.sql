-- Hiển thị danh sách tất cả học viên :
--  select * from student;

-- Hiển thị danh sách học viên đang theo học:
-- SELECT * FROM student where status = true;

-- hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ :
-- select * from subject where credit <10;

-- Hiển thị danh sách học viên lớp A1 :
-- select student.student_id,student.student_name,class.class_id
-- from student join class on student.class_id = class.class_id
-- where class.class_name = 'A1';

-- Hiển thị điểm bộ môn CF của các học viên
select student.student_id,student.student_name,mark.mark_id,subject.sub_id
from student join mark on student.student_id = mark.mark_id join subject on mark.sub_id = subject.sub_id
where subject.sub_name = "CF";





-- select student.student_Id,student.student_Name,class.class_name
-- from student  join class  on student.class_id= class.class_Id;
-- select student.student_id,student.student_name,class.class_name
-- from student join class  on student.class_id = class.class_Id
-- where class.class_name = "A1";

-- select student.student_id,student.student_name,subject.sub_name,mark.mark
-- from student join mark on student.student_id = mark.student_id join subject on mark.sub_id = subject.sub_id
-- where subject.sub_name = 'CF';