use QuanLySinhVien;

select * from subject group by SubID having Credit >= (select max(Credit) from subject);

select sub.*, m.Mark
from subject sub
join mark m on sub.SubID = m.SubID
where m.Mark >= (select max(Mark) from mark);

select s.*, avg(m.Mark) as DiemTB
from student s
left join mark m on s.StudentID = m.StudentID
group by s.StudentID
order by DiemTB desc;
