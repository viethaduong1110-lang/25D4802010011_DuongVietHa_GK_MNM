# BÀI KIỂM TRA GIỮA HỌC PHẦN - ỨNG DỤNG MÃ NGUỒN MỞ

## 1. Thông tin sinh viên
- **Họ và tên:** Dương Việt Hà
- **Mã số sinh viên (MSSV):25D4802010011
- **Lớp:** TTLT1Đ25
- **Đề số:** 01

## 2. Mô tả ngắn cơ sở dữ liệu
Cơ sở dữ liệu PostgreSQL tên `gk_dienmay` phục vụ quản lý bán hàng tại cửa hàng điện máy, bao gồm 4 bảng:
- `khach_hang`: Lưu trữ thông tin khách hàng (`ma_kh`, `ho_ten`, `thanh_pho`, `sdt`, `email`).
- `san_pham`: Lưu trữ thông tin các mặt hàng điện máy (`ma_sp`, `ten_sp`, `loai`, `don_gia`, `so_luong_ton`).
- `hoa_don`: Lưu thông tin hóa đơn bán hàng (`ma_hd`, `ma_kh`, `ngay_lap`).
- `chi_tiet_hd`: Lưu chi tiết các mặt hàng và số lượng bán trong từng hóa đơn (`ma_hd`, `ma_sp`, `so_luong`).

## 3. Thứ tự chạy các file
Để khởi tạo và chạy toàn bộ bài làm, thực hiện chạy các file trong thư mục `sql/` theo thứ tự sau:
1. `sql/01_create.sql`: Tạo cơ sở dữ liệu `gk_dienmay` và cấu trúc 4 bảng cùng các ràng buộc.
2. `sql/02_data.sql`: Nạp dữ liệu mẫu ban đầu vào 4 bảng.
3. `sql/03_alter_update.sql`: Thực hiện chỉnh sửa cấu trúc bảng và cập nhật, thêm, xóa dữ liệu theo yêu cầu Câu 2.
4. `sql/04_query.sql`: Thực hiện các câu lệnh truy vấn dữ liệu `SELECT` theo yêu cầu Câu 3.

*Lệnh chạy bằng `psql`:*
```bash
psql -U postgres -f sql/01_create.sql
psql -U postgres -d gk_dienmay -f sql/02_data.sql
psql -U postgres -d gk_dienmay -f sql/03_alter_update.sql
psql -U postgres -d gk_dienmay -f sql/04_query.sql
