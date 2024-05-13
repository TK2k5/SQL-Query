create database quan_ly_shop_buoi2

use quan_ly_shop_buoi2

-- CREATE TABLE
--> PRODUCT
create table PRODUCTS (
	ID_PRODUCT INT NOT NULL,
	NAME_PRODUCT NVARCHAR(100),
	PRICE FLOAT,
	IMAGE NVARCHAR(255),

	CONSTRAINT PK_PRODUCTS PRIMARY KEY (ID_PRODUCT) --> CONTRAINT THÔNG BÁO LỖI
)

DROP TABLE PRODUCTS

-- Thêm 1 trường mới vào trong product table / ASC & DESC
ALTER TABLE PRODUCTS
ADD DESC_PRODUCT NVARCHAR(255)
ALTER TABLE PRODUCTS
ADD AHIHI INT
-- Sửa 1 trường trong table 
--> exec sp_rename 'Tên bảng.Tên trường', 'Tên mới', + 'column'
EXEC sp_rename 'PRODUCTS.IMAGE', 'IMAGE_PRODUCT', 'COLUMN'

-- Xóa lấy 1 trường trong table
ALTER TABLE PRODUCTS
DROP COLUMN AHIHI

--> CATEGORY
create table CATEGORY (
	ID_CATEGORY INT NOT NULL,
	NAME_CATEGORY NVARCHAR(100),
	DESC_CATEGORY NVARCHAR(255),

	CONSTRAINT PK_CATEGORY PRIMARY KEY (ID_CATEGORY)
)

DROP TABLE CATEGORY

------------------------------
INSERT INTO PRODUCTS (ID_PRODUCT, NAME_PRODUCT, PRICE, IMAGE_PRODUCT, DESC_PRODUCT)
VALUES 
	(1, N'SẢN PHẨM 1',25000,'lol', N'Mô tả sản phẩm'),
	(2, N'SẢN PHẨM 2',25000,'lol', N'Mô tả sản phẩm'),
	(3, N'SẢN PHẨM 3',25000,'lol', N'Mô tả sản phẩm'),
	(4, N'SẢN PHẨM 4',25000,'lol', N'Mô tả sản phẩm'),
	(5, N'SẢN PHẨM 5',25000,'lol', N'Mô tả sản phẩm'),
	(6, N'SẢN PHẨM 6',25000,'lol', N'Mô tả sản phẩm')

SELECT *
FROM CATEGORY

INSERT INTO CATEGORY (ID_CATEGORY, NAME_CATEGORY, DESC_CATEGORY)
VALUES 
	(1, N'LOẠI 1','lol'),
	(2, N'LOẠI 2','lol'),
	(3, N'LOẠI 3','lol')

--1. Lấy ra tất cả sán phẩm có giá từ 1000 đến 10000
SELECT * FROM PRODUCTS
WHERE PRICE > 1000 AND PRICE < 10000

--2. Tìm ra tất cả danh mục sản phẩm có chữ 'NI'
SELECT * FROM CATEGORY
WHERE CATEGORY.NAME_CATEGORY LIKE N'%NI%'