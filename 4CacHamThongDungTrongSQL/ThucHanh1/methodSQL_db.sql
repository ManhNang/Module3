use QuanLySinhVien;

select Address, count(StudentID) as 'Số lượng học viên'
from student
group by Address;

select s.StudentID, s.StudentName, avg(m.Mark) as 'Điểm Trung Bình'
from student s
join mark m on s.StudentID = m.StudentID
group by s.StudentID, s.StudentName;

select s.StudentID, s.StudentName, avg(m.Mark) as 'Điểm Trung Bình'
from student s
join mark m on s.StudentID = m.StudentID
group by s.StudentID, s.StudentName
having avg(m.Mark) > 15;

select s.StudentID, s.StudentName, avg(m.Mark) as 'Điểm Trung Bình'
from student s
join mark m on s.StudentID = m.StudentID
group by s.StudentID, s.StudentName
having avg(m.Mark) >= all (select avg(Mark) from mark group by mark.StudentID);
