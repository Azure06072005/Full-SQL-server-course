CREATE DATABASE QLBH
USE QLBH

CREATE TABLE KHACHHANG
(
    MAKH CHAR(4),
    HOTEN VARCHAR(40),
    DCHI VARCHAR(50),
    SODT VARCHAR(20),
    NGSINH SMALLDATETIME,
    DOANHSO MONEY,
    NGDK SMALLDATETIME,
    PRIMARY KEY (MAKH)
)

CREATE TABLE NHANVIEN
(
    MANV CHAR(4),
    HOTEN VARCHAR(40),
    SODT VARCHAR(20),
    NGVL SMALLDATETIME,
    PRIMARY KEY (MANV)
)

CREATE TABLE SANPHAM
(
    MASP CHAR(4),
    TENSP VARCHAR(40),
    DVT VARCHAR(20),
    NUOCSX VARCHAR(40),
    GIA MONEY,
    PRIMARY KEY (MASP)
)

CREATE TABLE HOADON
(
    SOHD INT,
    NGHD SMALLDATETIME,
    MAKH CHAR(4),
    MANV CHAR(4),
    TRIGIA MONEY,
    PRIMARY KEY (SOHD)
)

CREATE TABLE CTHD
(
    SOHD INT,
    MASP CHAR(4),
    SL INT
)

-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)

-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)

CREATE DATABASE QLGV
USE QLGV

CREATE TABLE KHOA 
(
    MAKHOA VARCHAR(4),
    TENKHOA VARCHAR(40),
    NGTLAP SMALLDATETIME,
    TRGKHOA CHAR(4),
    PRIMARY KEY(MAKHOA)
)

CREATE TABLE MONHOC
(
    MAMH VARCHAR(10),
    TENMH VARCHAR(40),
    TCLT TINYINT,
    TCTH TINYINT,
    MAKHOA VARCHAR(4),
    PRIMARY KEY(MAMH)
)

CREATE TABLE DIEUKIEN
(
    MAMH VARCHAR(10),
    MAMH_TRUOC VARCHAR(10)
)

CREATE TABLE GIAOVIEN
(
    MAGV CHAR(4),
    HOTEN VARCHAR(40),
    HOCVI VARCHAR(10),
    HOCHAM VARCHAR(10),
    GIOITINH VARCHAR(3),
    NGSINH SMALLDATETIME,
    NGVL SMALLDATETIME,
    HESO NUMERIC(4, 2),
    MUCLUONG MONEY,
    MAKHOA VARCHAR(4)
    PRIMARY KEY (MAGV)
)

CREATE TABLE LOP 
(
    MALOP CHAR(3),
    TENLOP VARCHAR(40),
    TRGLOP CHAR(5),
    SISO TINYINT,
    MAGVCN CHAR(4)
    PRIMARY KEY (MALOP)
)

CREATE TABLE HOCVIEN
(
    MAHV CHAR(5),
    HO VARCHAR(40),
    TEN VARCHAR(10),
    NGSINH SMALLDATETIME,
    GIOITINH VARCHAR(3),
    NOISINH VARCHAR(40),
    MALOP CHAR(3),
    PRIMARY KEY (MAHV)
)

CREATE TABLE GIANGDAY
(
    MALOP CHAR(3),
    MAMH VARCHAR(10),
    MAGV CHAR(4),
    HOCKY TINYINT,
    NAM SMALLINT,
    TUNGAY SMALLDATETIME,
    DENNGAY SMALLDATETIME,
)

CREATE TABLE KETQUATHI
(
    MAHV CHAR(5),
    MAMH VARCHAR(10),
    LANTHI TINYINT,
    NGTHI SMALLDATETIME,
    DIEM NUMERIC(4, 2),
    KQUA VARCHAR(10),
    PRIMARY KEY(MAHV, MAMH, LANTHI)
)

-- Khoa ngoai bang DIEUKIEN
ALTER TABLE DIEUKIEN ADD CONSTRAINT fk01_DIEUKIEN FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT fk02_DIEUKIEN FOREIGN KEY(MAMH_TRUOC) REFERENCES MONHOC(MAMH)

-- Khoa ngoai bang GIANGDAY
ALTER TABLE GIANGDAY ADD CONSTRAINT fk01_GIANGDAY FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD CONSTRAINT fk02_GIANGDAY FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT fk03_GIANGDAY FOREIGN KEY(MAGV) REFERENCES GIAOVIEN(MAGV)

-- Khoa ngoai bang KETQUATHI
ALTER TABLE KETQUATHI ADD CONSTRAINT fk01_KETQUATHI FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT fk02_KETQUATHI FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
-- ALTER TABLE KETQUATHI ADD CONSTRAINT fk03_KETQUATHI FOREIGN KEY(LANTH) 

-- Khoa ngoai bang GIAOVIEN
ALTER TABLE GIAOVIEN ADD CONSTRAINT fk02_GIAOVIEN FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)

-- Khoa ngoai bang LOP
ALTER TABLE LOP ADD CONSTRAINT fk01_LOP FOREIGN KEY(MAGVCN) REFERENCES GIAOVIEN(MAGV)

-- Khoa ngoai bang HOCVIEN
ALTER TABLE HOCVIEN ADD CONSTRAINT fk01_HOCVIEN FOREIGN KEY(MALOP) REFERENCES LOP(MALOP)

-- Khoa ngoai bang MONHOC
ALTER TABLE MONHOC ADD CONSTRAINT fk01_MONHOC FOREIGN KEY(MAKHOA) REFERENCES KHOA(MAKHOA)

-- Khoa ngoai bang KETQUATHI
ALTER TABLE KETQUATHI ADD CONSTRAINT fk01_KETQUATHI FOREIGN KEY(MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT fk02_KETQUATHI FOREIGN KEY(MAMH) REFERENCES MONHOC(MAMH)
--Cau 1
ALTER TABLE HOCVIEN ADD GHICHU VARCHAR(40)
ALTER TABLE HOCVIEN ADD DIEMTB NUMERIC(4, 2)
ALTER TABLE HOCVIEN ADD XEPLOAI VARCHAR(10)

