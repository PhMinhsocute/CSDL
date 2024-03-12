------USER -----
use QLBH_BStore
-- 1.Tạo login QuanLy và user Thuong
create login QuanLy with password ='123',
	default_database =QLBH_BStore
create user Thuong for login QuanLy

	--cấp quyền trên bảng NhanVien
Grant all
on NhanVien
to Thuong
	--test
Select *from NhanVien


-- 2.Tạo login NhanVien và user Minh
create login NhanVien with password='1234',
	default_database = QLBH_BStore
create user Minh for login NhanVien
	--cấp quyền trên bảng SanPham
Grant insert, update
on SanPham
to Minh
	--test 
insert into SanPham
values('SP022','PK01', N'Cột Tóc Mặt Trăng', 30 , N'cái',null)