-- Bước 1: Tạo CSDL demo
create database demo;

use demo;

-- Bước 2: Tạo bảng Products
create table Products(
	id int auto_increment primary key,
	productCode varchar(20) not null,
	productName varchar(50) not null,
	productPrice decimal(10, 2) check (productPrice >= 0),
	productAmount int check (productAmount >= 0) default 0,
	productDescription text,
	productStatus boolean default true
);

INSERT INTO Products (productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
('P001', 'Laptop Dell XPS 13', 25000000.00, 15, 'Laptop mỏng nhẹ, màn hình sắc nét', 1),
('P002', 'iPhone 15 Pro Max', 34990000.00, 20, 'Điện thoại cao cấp camera nét', 1),
('P003', 'Bàn phím cơ Keychron K2', 1850000.00, 30, 'Bàn phím cơ không dây Bluetooth', 1),
('P004', 'Chuột Logitech MX Master 3S', 2450000.00, 25, 'Chuột công phái học hỗ trợ làm việc', 1),
('P005', 'Màn hình LG 27 inch 4K', 8900000.00, 10, 'Màn hình độ phân giải cao cho đồ họa', 1),
('P006', 'Tai nghe Sony WH-1000XM5', 7990000.00, 12, 'Tai nghe chống ồn chủ động tốt nhất', 1),
('P007', 'Sạc dự phòng Anker 20000mAh', 950000.00, 50, 'Sạc nhanh chuẩn Power Delivery', 1),
('P008', 'Ổ cứng SSD Samsung 1TB', 2300000.00, 40, 'SSD NVMe tốc độ đọc ghi cao', 1),
('P009', 'Đồng hồ Apple Watch Series 9', 10490000.00, 8, 'Đồng hồ thông minh theo dõi sức khỏe', 1),
('P010', 'Loa Bluetooth JBL Flip 6', 2690000.00, 18, 'Loa kháng nước âm bass mạnh mẽ', 1),
('P011', 'Webcam Logitech C920', 1600000.00, 0, 'Webcam Full HD cho họp trực tuyến', 0),
('P012', 'Ghế công sở Ergonomic', 3500000.00, 5, 'Ghế chống đau lưng hỗ trợ cột sống', 1),
('P013', 'Bảng vẽ Wacom Intuos', 2100000.00, 7, 'Bảng vẽ điện tử cho phác thảo', 1),
('P014', 'Tay cầm chơi game Xbox', 1450000.00, 14, 'Tay cầm tương thích PC và Console', 1),
('P015', 'Mic thu âm USB Blue Yeti', 3200000.00, 6, 'Microphone cho streamer và podcast', 1),
('P016', 'Đèn bàn học LED Xiaomi', 450000.00, 35, 'Đèn chống cận bảo vệ mắt', 1),
('P017', 'Router Wi-Fi 6 TP-Link', 1250000.00, 22, 'Phát sóng Wi-Fi tốc độ cao', 1),
('P018', 'Hub USB-C Baseus 7 in 1', 650000.00, 60, 'Bộ chuyển đổi đa năng cho Laptop', 1),
('P019', 'Thẻ nhớ Sandisk 128GB', 380000.00, 100, 'Thẻ nhớ MicroSD tốc độ cao', 1),
('P020', 'Giá đỡ Laptop nhôm', 290000.00, 0, 'Tản nhiệt và nâng chiều cao màn hình', 0);

-- Bước 3: Tạo INDEX và sử dụng EXPLAIN
explain select * from Products where productCode = 'P013'; -- type all, rows 20/20, extra using where

create unique index idx_productCode on Products(productCode);
create index idx_productName_price on Products(productName, productPrice);
explain select * from Products where productCode = 'P013'; -- type const, rows 1/20, extra null

-- Bước 4: Tạo, sửa xóa VIEW
create view product_views as
select productCode, productName, productPrice, productStatus
from Products;

create or replace view product_views as
select productCode, productName, productPrice, productStatus
from Products
where productStatus = true;

drop view product_views;

-- Bước 5: Tạo Store Procedure
delimiter //
create procedure findAllProducts()
begin
	select *
    from Products;
end//

create procedure addProduct
(newCode varchar(20), newName varchar(50), newPrice decimal(10, 2), newAmount int, newDescription text, newStatus boolean)
begin
	insert into Products(productCode, productName, productPrice, productAmount, productDescription, productStatus)
    values(newCode, newName, newPrice, newAmount, newDescription, newStatus);
end//

create procedure updateProductPrice
(idProduct int, productPrice decimal(10, 2))
begin
	update Products set Products.productPrice = productPrice where Products.id = idProduct;
end//

create procedure deleteProduct(idProduct int)
begin
	delete from Products where Products.id = idProduct;
end//
delimiter ;

call findAllProducts();
call addProduct('P021', 'Sản phẩm Test', 1, 1, 'Thử procedure', 1);
call updateProductPrice(21, 6150000.00);
call deleteProduct(21);