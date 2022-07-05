-- use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
-- select subject.sub_name,max(credit) from subject;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

-- select mark id,max(mark) from mark;
-- select s.student_id,s.student_name, avg(mark)
-- from student s join mark m on s.student_id = m.student_id
-- group by s.student_id,s.student_name
-- order by avg(mark) desc;
select s.student_id,s.student_name,avg(mark)
from student s join mark m on s.student_id = m.student_id
group by s.student_id,s.student_name
order by avg(mark) desc;







-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
-- select s.student_id,s.student_name,avg(mark)
-- from student s join mark m on s.student_id = m.student_id
-- group by s.student_id,s.student_name
-- order by avg(mark) desc;