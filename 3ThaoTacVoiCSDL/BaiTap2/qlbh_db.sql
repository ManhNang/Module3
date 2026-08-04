use QuanLyBanHang;

insert into customer (cName, cAge) 
	values ('Minh Quan', 10),
	('Ngoc Oanh', 20),
    ('Hong Ha', 50);

insert into `order` (cID, oDate)
	values (1, '2006-03-21'),
    (2, '2006-03-23'),
    (1, '2006-03-16');
    
insert into product (pName, pPrice)
	values ('May Giat', 3),
    ('Tu Lanh', 5),
    ('Dieu Hoa', 7),
    ('Quat', 1),
    ('Bep Dien', 2);

insert into orderdetail
	values (1, 1, 3),
	(1, 3, 7),
	(1, 4, 2),
	(2, 1, 1),
	(3, 1, 8),
	(2, 5, 4),
	(2, 3, 3);

select oID, oDate, oTotalPrice
from `order`;

select c.cID, c.cName, p.pName, o.oDate
from `order` o
join customer c on o.cID = c.cID
join orderdetail od on o.oID = od.oID
join product p on od.pID = p.pID;

select c.cID, c.cName
from customer c
left join `order` o on c.cID = o.cID
where o.oID is null;

select o.oID, o.oDate, sum(od.odQTY * p.pPrice) as orderTotalPrice
from orderdetail od
join `order` o on od.oID = o.oID
join product p on od.pID = p.pID
group by o.oID, o.oDate;



