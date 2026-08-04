use QuanLySinhVien;

select *
from student
where StudentName like 'h%';

select *
from class
where month(StartDate) = 12;

select *
from subject
where Credit >= 3 and Credit <= 5;

update student s1
join student s2 on s1.StudentID = s2.StudentID
set s1.ClassID = 2
where s2.StudentName = 'Hung';

select s.StudentName, sub.SubName, m.Mark
from student s
join mark m on s.StudentID = m.StudentID
join subject sub on sub.SubID = m.SubID
order by m.Mark desc, s.StudentName asc;
