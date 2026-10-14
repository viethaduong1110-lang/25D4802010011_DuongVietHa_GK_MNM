USE gk_dienmay;
GO

-- Cau 3.1: Liệt kê sản phẩm có đơn giá từ 8.000.000 đến 15.000.000 đồng
SELECT ma_sp, ten_sp, loai, don_gia 
FROM san_pham 
WHERE don_gia BETWEEN 8000000 AND 15000000 
ORDER BY don_gia DESC, ten_sp ASC;

-- Cau 3.2: Thống kê tổng tồn kho, đơn giá trung bình, đơn giá cao nhất
SELECT 
    SUM(so_luong_ton) AS tong_ton, 
    ROUND(AVG(CAST(don_gia AS FLOAT)), 0) AS don_gia_tb, 
    MAX(don_gia) AS don_gia_max 
FROM san_pham;

-- Cau 3.3: Liệt kê hóa đơn lập trong tháng 9/2026
SELECT hd.ma_hd, hd.ngay_lap, kh.ho_ten, kh.thanh_pho 
FROM hoa_don hd
JOIN khach_hang kh ON hd.ma_kh = kh.ma_kh
WHERE MONTH(hd.ngay_lap) = 9 AND YEAR(hd.ngay_lap) = 2026
ORDER BY hd.ngay_lap ASC;

-- Cau 3.4: Tính doanh thu theo từng loại sản phẩm có doanh thu > 45.000.000
SELECT 
    sp.loai, 
    SUM(ct.so_luong * sp.don_gia) AS doanh_thu
FROM chi_tiet_hd ct
JOIN san_pham sp ON ct.ma_sp = sp.ma_sp
GROUP BY sp.loai
HAVING SUM(ct.so_luong * sp.don_gia) > 45000000
ORDER BY doanh_thu DESC;

-- Cau 3.5: Khách hàng chưa từng mua sản phẩm thuộc loại Tivi (dùng truy vấn con)
SELECT ma_kh, ho_ten, thanh_pho 
FROM khach_hang 
WHERE ma_kh NOT IN (
    SELECT DISTINCT hd.ma_kh 
    FROM hoa_don hd
    JOIN chi_tiet_hd ct ON hd.ma_hd = ct.ma_hd
    JOIN san_pham sp ON ct.ma_sp = sp.ma_sp
    WHERE sp.loai = 'Tivi'
)
ORDER BY ma_kh;