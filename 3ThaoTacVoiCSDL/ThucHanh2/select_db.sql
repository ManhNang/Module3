use QuanLySinhVien;

select * from Student;

select * from Student where Status = true;

select * from Subject where Credit < 10;

select s.StudentID, s.StudentName, C.ClassName
from Student s join Class c on s.ClassID = c.ClassID
where c.ClassName = 'A1';

select s.StudentID, s.StudentName, sub.SubName, m.Mark
from Student s
join Mark m on s.StudentID = m.StudentID
join Subject sub on m.SubID = sub.SubID
where sub.SubName = 'CF';
