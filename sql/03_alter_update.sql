USE gk_dienmay;
GO

IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('khach_hang') AND name = 'email')
BEGIN
    ALTER TABLE khach_hang ADD email VARCHAR(100);
END
GO

UPDATE khach_hang SET email = 'an.nguyen@example.com' WHERE ma_kh = 'KH01';
GO

-- 2b. Giảm 10% đơn giá của tất cả sản phẩm thuộc loại Tivi
UPDATE san_pham 
SET don_gia = don_gia * 0.9 
WHERE loai = 'Tivi';
GO

-- 2c. Thêm khách hàng mới KH09 (đã bao gồm cột email) và hóa đơn HD011 kèm chi tiết
IF NOT EXISTS (SELECT * FROM khach_hang WHERE ma_kh = 'KH09')
BEGIN
    INSERT INTO khach_hang (ma_kh, ho_ten, thanh_pho, sdt, email) 
    VALUES ('KH09', 'Dang Van Kien', 'Viet Tri', '0912000009', NULL);
END

IF NOT EXISTS (SELECT * FROM hoa_don WHERE ma_hd = 'HD011')
BEGIN
    INSERT INTO hoa_don (ma_hd, ma_kh, ngay_lap) 
    VALUES ('HD011', 'KH09', '2026-10-09');
END

IF NOT EXISTS (SELECT * FROM chi_tiet_hd WHERE ma_hd = 'HD011' AND ma_sp = 'SP08')
BEGIN
    INSERT INTO chi_tiet_hd (ma_hd, ma_sp, so_luong) 
    VALUES ('HD011', 'SP08', 2);
END
GO

-- 2d. Xóa sản phẩm có mã SP09
DELETE FROM chi_tiet_hd WHERE ma_sp = 'SP09';
DELETE FROM san_pham WHERE ma_sp = 'SP09';
GO