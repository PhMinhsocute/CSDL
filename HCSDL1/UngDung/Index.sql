--___________INDEX ____________--
use QLBH_BStore
-- 1.Tạo chỉ mục trên thuộc tính mã hóa đơn của bảng Hóa Đơn.
CREATE INDEX index_MaHD on Bill(MaHD)
	-- Thực thi câu lệnh
select*
from Bill
with (index(index_MaHD))
where MaHD='HD03'

select *from bill
where MaHD='HD03'
	-- Xóa câu lệnh 
DROP INDEX HoaDon.index_MaHD

--2. Tạo chỉ mục trên thuộc tính ngày nhập của bảng Phiếu Nhập
CREATE INDEX index_NgayNhap on PhieuNhap(NgayNhap)
	-- Thực thi câu lệnh
select * from PhieuNhap
with (index(index_NgayNhap))
where NgayNhap='2021-10-1'

select *from PhieuNhap
where NgayNhap='2021-10-1'
	-- Xóa câu lệnh
DROP INDEX PhieuNhap.index_NgayNhap



