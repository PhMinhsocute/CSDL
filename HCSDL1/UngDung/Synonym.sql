--______________SYNONYM________________--
use QLBH_BStore
-- 1.Tạo tên đồng nghĩa NV truy xuất vào bảng NhanVien do người dùng dbo làm chủ sở hữu
CREATE synonym NV for dbo.NhanVien
  -- Thực thi 
SELECT * from NV
  -- Xóa câu lệnh 
DROP synonym NV


-- 2.Tạo tên đồng nghĩa HD truy xuất vào bảng HoaDon do người dùng dbo làm chủ sở hữu
create synonym HD for Bill
--Thực thi câu lệnh
SELECT * from HD
--Xóa câu lệnh
DROP synonym HD