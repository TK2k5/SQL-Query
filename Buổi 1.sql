-- Tạo database
create database quan_ly_shop
use quan_ly_shop

-- Tạo bảng
create table Product (
id_product int,
name_product nvarchar(200),
description nvarchar(200),
price float,
quantity int,
image varchar(200)
)

create table Category (
id_category int,
name_category nvarchar(200),
description nvarchar(200),
image varchar(200),
status varchar(50)
)

-- Thêm thông tin vào bảng
insert into Product (id_product, name_product, description, price, quantity, image)
values
(1, 'prodcuct 1', 'desc 1', 100, 3, 'image 1'),
(2, 'prodcuct 2', 'desc 2', 200, 4, 'image 2'),
(3, 'prodcuct 3', 'desc 3', 300, 5, 'image 3'),
(4, 'prodcuct 4', 'desc 4', 400, 6, 'image 4')

insert into Category (id_category, name_category, description, image, status)
values
(1, 'category 1', 'desc 1', 'image 1', 'Active'),
(2, 'category 2', 'desc 2', 'image 2', 'Inactive'),
(3, 'category 3', 'desc 3', 'image 3', 'Active'),
(4, 'category 4', 'desc 4', 'image 4', 'Inactive'),
(5, 'category 5', 'desc 5', 'image 5', 'Active')
