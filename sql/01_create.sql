CREATE DATABASE gk_dienmay;
GO
USE gk_dienmay;
GO
IF OBJECT_ID('chi_tiet_hd', 'U') IS NOT NULL DROP TABLE chi_tiet_hd;
IF OBJECT_ID('hoa_don', 'U') IS NOT NULL DROP TABLE hoa_don;
IF OBJECT_ID('san_pham', 'U') IS NOT NULL DROP TABLE san_pham;
IF OBJECT_ID('khach_hang', 'U') IS NOT NULL DROP TABLE khach_hang;
GO
-- 1. Bảng khach_hang
CREATE TABLE khach_hang (
    ma_kh VARCHAR(10) PRIMARY KEY,
    ho_ten VARCHAR(80) NOT NULL,
    thanh_pho VARCHAR(50) NULL,
    sdt VARCHAR(15) UNIQUE
);

-- 2. Bảng san_pham
CREATE TABLE san_pham (
    ma_sp VARCHAR(10) PRIMARY KEY,
    ten_sp VARCHAR(100) NOT NULL,
    loai VARCHAR(30) NOT NULL,
    don_gia DECIMAL(12,0) NOT NULL CHECK (don_gia > 0),
    so_luong_ton INT NOT NULL DEFAULT 0 CHECK (so_luong_ton >= 0)
);

-- 3. Bảng hoa_don
CREATE TABLE hoa_don (
    ma_hd VARCHAR(10) PRIMARY KEY,
    ma_kh VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES khach_hang(ma_kh),
    ngay_lap DATE NOT NULL DEFAULT GETDATE()
);

-- 4. Bảng chi_tiet_hd
CREATE TABLE chi_tiet_hd (
    ma_hd VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES hoa_don(ma_hd),
    ma_sp VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES san_pham(ma_sp),
    so_luong INT NOT NULL CHECK (so_luong > 0),
    CONSTRAINT PK_chi_tiet_hd PRIMARY KEY (ma_hd, ma_sp)
);
