use quanlysinhvien;
select address,count(student_id) as 'Số lượng học viên ' from student group by address;
select student.student_id,student.student_name,AVG(mark)
from student join mark on student.student_id = mark.student_id
group by student.student_id,student.student_name
having AVG(mark) >= all (select AVG(mark) from mark group by mark.student_id);
-- having AVG(mark)>8;