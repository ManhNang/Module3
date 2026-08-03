create database QuanLyBanHang;

use QuanLyBanHang;

create table Customer(
cID int auto_increment not null primary key,
cName varchar(50),
cAge tinyint check (cAge > 0)
);

create table `Order`(
oID int auto_increment not null primary key,
cID int not null,
oDate datetime,
oTotalPrice decimal(18, 2),
foreign key (cID) references Customer(cID)
);

create table Product(
pID int auto_increment not null primary key,
pName varchar(50),
pPrice decimal(18, 2)
);

create table OrderDetail(
oID int not null,
pID int not null,
odQTY int check (odQTY > 0),
primary key (oID, pID),
foreign key (oID) references `Order`(oID),
foreign key (pID) references Product(pID)
);