create database QuanLyXuatNhap;

use QuanLyXuatNhap;

create table PhieuXuat(
SoPX varchar(20) not null primary key,
NgayXuat datetime
);

create table VatTu(
MaVTU varchar(20) not null primary key,
TenVTU nvarchar(100)
);

create table PhieuNhap(
SoPN varchar(20) not null primary key,
NgayNhap datetime
);

create table NhaCungCap(
MaNCC varchar(20) not null primary key,
TenNCC nvarchar(100),
DiaChi nvarchar(200)
);

create table NhaCC_SDT(
MaNCC varchar(20) not null,
SDT varchar(15) not null,
primary key (MaNCC, SDT),
foreign key (MaNCC) references NhaCungCap(MaNCC)
);

create table DonDatHang(
SoDH varchar(20) not null primary key,
NgayDH datetime,
MaNCC varchar(20),
foreign key (MaNCC) references NhaCungCap(MaNCC)
);

create table ChiTiet_PhieuXuat(
SoPX varchar(20) not null,
MaVTU varchar(20) not null,
SLXuat int,
DGXuat decimal(18,2),
primary key (SoPX, MaVTU),
foreign key (SoPX) references PhieuXuat(SoPX),
foreign key (MaVTU) references VatTu(MaVTU)
);

create table ChiTiet_PhieuNhap(
SoPN varchar(20) not null,
MaVTU varchar(20) not null,
SLNhap int,
DGNhap decimal(18,2),
primary key (SoPN, MaVTU),
foreign key (SoPN) references PhieuNhap(SoPN),
foreign key (MaVTU) references VatTu(MaVTU)
);

create table ChiTiet_DonHang(
SoDH varchar(20) not null,
MaVTU varchar(20) not null,
primary key (SoDH, MaVTU),
foreign key (SoDH) references DonDatHang(SoDH),
foreign key (MaVTU) references VatTu(MaVTU)
);