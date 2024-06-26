CREATE DATABASE QUAN_LY_SINH_VIEN

USE QUAN_LY_SINH_VIEN

--  TABLE 
CREATE TABLE SINH_VIEN (
	MASV INT IDENTITY NOT NULL,
	FULL_NAME NVARCHAR(50) NOT NULL,
	DIEM_LAN_1 FLOAT DEFAULT 0,
	DIEM_LAN_2 FLOAT DEFAULT 0,

	CONSTRAINT PK_SINH_VIEN PRIMARY KEY (MASV),
	CONSTRAINT CK_GIOI_HAN_DIEM CHECK (DIEM_LAN_1 >= 0 AND DIEM_LAN_1 <= 10 AND DIEM_LAN_2 >= 0 AND DIEM_LAN_2 <= 10)
)

-- Thêm dữ liệu cho SINH_VIEN
INSERT INTO SINH_VIEN (FULL_NAME, DIEM_LAN_1, DIEM_LAN_2) VALUES
(N'Nguyễn Văn A', 7.5, 8.0),
(N'Trần Thị B', 6.0, 7.5),
(N'Lê Văn C', 8.5, 9.0),
(N'Phạm Thị D', 5.0, 6.5),
(N'Hoàng Văn E', 9.0, 8.0),
(N'Nguyễn Thị F', 6.5, 7.0),
(N'Trần Văn G', 7.0, 8.5),
(N'Lê Thị H', 8.0, 6.0),
(N'Phạm Văn I', 9.5, 9.0),
(N'Hoàng Thị K', 7.5, 7.5),
(N'Nguyễn Văn L', 6.0, 6.0),
(N'Trần Thị M', 8.0, 8.5),
(N'Lê Văn N', 5.5, 6.0),
(N'Phạm Thị O', 9.0, 9.5),
(N'Hoàng Văn P', 7.0, 8.0),
(N'Nguyễn Thị Q', 6.0, 7.0),
(N'Trần Văn R', 8.5, 8.5),
(N'Lê Thị S', 7.5, 7.0),
(N'Phạm Văn T', 8.0, 7.5),
(N'Hoàng Thị U', 6.5, 6.0);

SELECT * FROM SINH_VIEN

-- ALTER TABLE 
--> TÊN NGƯỜI DÙNG KHÔNG ĐƯỢC PHÉP NGẮN HƠN 2 KÝ TỰ
ALTER TABLE SINH_VIEN
ADD CONSTRAINT CK_DO_DAI_TEN CHECK(LEN(SINH_VIEN.FULL_NAME) >= 2)


INSERT INTO SINH_VIEN (FULL_NAME, DIEM_LAN_1, DIEM_LAN_2) VALUES
(N'NHƯ', 0.5, 4.0)

INSERT INTO SINH_VIEN (FULL_NAME, DIEM_LAN_1, DIEM_LAN_2) VALUES
(N'LY', 3, NULL)

INSERT INTO SINH_VIEN (FULL_NAME, DIEM_LAN_1, DIEM_LAN_2) VALUES
(N'LY', 9, 8)

--> LẤY RA CÁC BẠN CÓ ĐIỂM LẦN 1 HOẶC LẦN 2 LỚN HƠN 8 
SELECT * FROM SINH_VIEN
WHERE SINH_VIEN.DIEM_LAN_1 >= 8 OR SINH_VIEN.DIEM_LAN_2 >= 8

--> LẤY RA NHỮNG BẠN QUA MÔN NGAY TỪ LẦN 1 >= 5
SELECT * FROM SINH_VIEN
WHERE SINH_VIEN.DIEM_LAN_1 >= 5

--> LẤY RA CÁC BẠN TRƯỢT MÔN (LẦN 1 VÀ LẦN 2 ĐỀU <= 5)
SELECT * FROM SINH_VIEN
WHERE SINH_VIEN.DIEM_LAN_1 < 5 OR SINH_VIEN.DIEM_LAN_2 < 5

--> ĐẾM CÁC BẠN SINH VIÊN QUAN MÔN (LẦN 1 VÀ LẦN 2 => 5)
SELECT COUNT(*) AS N'SỐ BẠN ĐÃ HỌC QUA MÔN LÂN 1 VÀ LẦN 2' FROM SINH_VIEN
WHERE SINH_VIEN.DIEM_LAN_1 >= 5 AND SINH_VIEN.DIEM_LAN_2 >= 5


--> ĐẾM SỐ BẠN QUA MÔN LÂN 1 NHƯNG TẠCH LẦN 2
SELECT COUNT(*) AS N'SỐ BẠN QUA MÔN LẦN 1 NHƯNG TẠCH LẦN 2' FROM SINH_VIEN
WHERE SINH_VIEN.DIEM_LAN_1 >= 5 AND SINH_VIEN.DIEM_LAN_2 <= 5
SELECT COUNT(*) AS N'SỐ BẠN THI LẠI LẦN 2' FROM SINH_VIEN
WHERE SINH_VIEN.DIEM_LAN_2 <= 5

--> LẤY RA SINH VIÊN CÓ ĐIỂM LẦN 2 LÀ NULL
SELECT * FROM SINH_VIEN
WHERE SINH_VIEN.DIEM_LAN_2 IS NULL

--> LẤY RA TỐNG SỐ ĐIỂM THI LẦN 2
SELECT * FROM SINH_VIEN
SELECT SUM(SINH_VIEN.DIEM_LAN_2) AS N'TỔNG ĐIỂM THI SINH LÂN 2' FROM SINH_VIEN

--> LẤY RA ĐIỂM TRUNG BÌNH LẦN 2
SELECT * FROM SINH_VIEN
SELECT SUM(SINH_VIEN.DIEM_LAN_2) AS N'TỔNG ĐIỂM THI SINH LÂN 2' FROM SINH_VIEN
SELECT AVG(SINH_VIEN.DIEM_LAN_2) AS N'TỔNG TRUNG BÌNH CỘNG ĐIỂM THI SINH LÂN 2' FROM SINH_VIEN

--> LỌC RA NHƯNG TÊN TRÙNG NHAU
SELECT SINH_VIEN.FULL_NAME FROM SINH_VIEN

SELECT DISTINCT SINH_VIEN.FULL_NAME FROM SINH_VIEN

SELECT COUNT (DISTINCT SINH_VIEN.FULL_NAME) FROM SINH_VIEN












--- -=======================================================================
CREATE TABLE NHAN_VIEN (
	MA_NV INT IDENTITY NOT NULL,
	TEN_NV NVARCHAR(50) NOT NULL,
	NGAY_SINH DATE NOT NULL,
	GIOI_TINH BIT DEFAULT 0 NOT NULL,
	NGAY_VAO_LAM DATE DEFAULT GETDATE() NOT NULL,
	NGHE_NGHIEP NVARCHAR(50) NOT NULL,
	LUONG FLOAT NOT NULL,

	-- LƯƠNG PHẢI LÀ SỐ DƯƠNG
	CONSTRAINT CK_LUONG_NGUYEN_DUONG CHECK(LUONG >= 0),
	-- TÊN NGƯỜI DÙNG KHÔNG DƯỚI 2 KÝ TỰ
	CONSTRAINT CK_CHIEU_DAI_TEN CHECK(LEN(TEN_NV) >= 2),
	-- TUOI PHẢI LỚN HƠN 18 TUỔI
	CONSTRAINT CK_TUOI CHECK(YEAR(GETDATE()) - YEAR(NGAY_SINH) > 18),
	-- CHECK NGHE NGHIỆP NẰM TRONG DANH SÁCH IT, KẾ TOÁN, CEO
	CONSTRAINT CK_NGHE_NGHIEP CHECK (NGHE_NGHIEP IN ('IT', N'KẾ TOÁN', 'CEO')),
	CONSTRAINT CK_NHAN_VIEN PRIMARY KEY (MA_NV)
)


-- Thêm dữ liệu cho NHAN_VIEN
INSERT INTO NHAN_VIEN (TEN_NV, NGAY_SINH, GIOI_TINH, NGAY_VAO_LAM, NGHE_NGHIEP, LUONG) VALUES
(N'Nguyễn Văn A', '1990-05-15', 1, '2015-01-01', N'IT', 8000000),
(N'Trần Thị B', '1985-10-20', 0, '2010-03-10', N'KẾ TOÁN', 10000000),
(N'Lê Văn C', '1982-12-30', 1, '2005-07-20', 'CEO', 20000000),
(N'Phạm Thị D', '1992-07-05', 0, '2018-09-01', N'IT', 7500000),
(N'Hoàng Văn E', '1988-04-12', 1, '2014-02-15', N'KẾ TOÁN', 9000000),
(N'Nguyễn Thị F', '1995-11-25', 0, '2019-05-10', N'IT', 7000000),
(N'Trần Văn G', '1980-09-18', 1, '2002-08-05', 'CEO', 25000000),
(N'Lê Thị H', '1987-03-08', 0, '2013-04-20', N'KẾ TOÁN', 9500000),
(N'Phạm Văn I', '1993-08-02', 1, '2017-11-11', N'IT', 8500000),
(N'Hoàng Thị K', '1998-01-10', 0, '2020-03-01', N'IT', 7800000);


SELECT * FROM NHAN_VIEN

-- THÁNG 5 LÀ SINH NHẬT SẾP, SẾP QUYẾT ĐỊNH TĂNG LƯƠNG CHO NV SINH CÙNG THÁNG 100000
-- GIẢ SỬ SẾP LÀ SINH NHẬT VÀO THÁNG HIỆN TẠI
SELECT * FROM NHAN_VIEN
WHERE MONTH(NHAN_VIEN.NGAY_SINH) = MONTH(GETDATE())

UPDATE NHAN_VIEN
SET LUONG = LUONG + 100000
WHERE MONTH(NHAN_VIEN.NGAY_SINH) = MONTH(GETDATE())

-- TĂNG LƯƠNG CHO TẤT CẢ TOÀN BỘ CÔNG TY +200000
SELECT * FROM NHAN_VIEN

UPDATE NHAN_VIEN
SET LUONG = LUONG + 200000

SELECT * FROM NHAN_VIEN

-- THỜI BUỐI KINH TẾ KHÓ KHĂN CẮT GIẢM NHÂN SỰ LƯƠNG 8TR
DELETE FROM NHAN_VIEN WHERE NHAN_VIEN.LUONG <= 8000000

-- XOÁ NGƯỜI VỪA ĐƯỢC TĂNG LƯƠNG 100K DO TRÙNG THÁNG SINH VỚI SẾP
DELETE FROM NHAN_VIEN
WHERE MONTH(NHAN_VIEN.NGAY_SINH) = MONTH(GETDATE())

-- LẤY RA NHÂN VIÊN NĂM LÀM VIỆC TRÊN 10 NĂM 
SELECT * FROM NHAN_VIEN
WHERE YEAR(GETDATE()) - YEAR(NHAN_VIEN.NGAY_VAO_LAM) >= 10

-- ĐUỔI LUÔN NHỮNG NHÂN VIÊN CÓ THÂM NIÊN DƯỚI 10 NĂM
DELETE FROM NHAN_VIEN
WHERE DATEDIFF(YEAR, NHAN_VIEN.NGAY_VAO_LAM, GETDATE()) < 10 

SELECT GETDATE() AS NgayHienTai; --> LẤY RA NGÀY HIỆN TẠI DẠNG DD/MM/YYYY HH:MM:SS
SELECT CAST(GETDATE() AS DATE) AS NgayHienTai;--> LẤY RA NGÀY HIỆN TẠI DẠNG DD/MM/YYYY
SELECT CONVERT(DATE, GETDATE()) AS NgayHienTai; --> LẤY RA NGÀY HIỆN TẠI DẠNG DD/MM/YYYY
SELECT FORMAT(GETDATE(), 'dd') AS NgayHienTai; --> LẤY NGÀY HIỆN TẠI

--> GROUP BY: GÓI THEO NHÓM
SELECT * FROM NHAN_VIEN
SELECT SUM(NHAN_VIEN.LUONG) AS N'TỔNG LƯƠNG', NHAN_VIEN.NGHE_NGHIEP FROM NHAN_VIEN 
GROUP BY NHAN_VIEN.NGHE_NGHIEP

