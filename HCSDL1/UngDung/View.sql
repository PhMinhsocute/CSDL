--____________VIEW____________--
use QLBH_BStore
--	1.Tạo view vwNhanVienNu làm việc tại cửa hàng với thông tin: MaNV, HoTenNV, Thâm niên.
create view vw_NhanVienNu
as
select MaNV,HoTenNV, year(getdate())-Year(NgayVaoLam) as N'Thâm niên'
from NhanVien 
where GioiTinh=N'Nữ'
	--thực thi
select*from vw_NhanVienNu
	--xóa
drop view vw_NhanVienNu

--	2.Tạo vwDanhSachTop5SanPhamBanChay với thông tin gồm MaSP, TenSP,doanh thu.
create view vw_DanhSachTop5SanPhamBanChay
as
select top 5 SanPham.MaSP,TenSP,sum(Sl*GiaBan) as 'Doanh thu'
from SanPham join CTPhieuXuat on SanPham.MaSP=CTPhieuXuat.MaSP
group by SanPham.MaSP,TenSP
order by sum(SL*GiaBan) desc
	--thực thi
select*from vw_DanhSachTop5SanPhamBanChay

--	3.Tạo khung nhìn vwTinhTrangSanPham hiển thị danh sách các sản phẩm được bán trong năm 2022. Thông tin hiển thị gồm: MaSP,TenLoaiSP 
create view vw_TinhTrangSanPham
as
select SanPham.MaSP,TenLoaiSP,TenSP
from SanPham join LoaiSanPham on SanPham.MaLoaiSP=LoaiSanPham.MaLoaiSP
where SanPham.MaSP in (select MaSP from CTHoaDon where year(NgayDH)='2019')   
	--thực thi
select*from vw_TinhTrangSanPham

--	4.Tạo khung nhìn vwHoaDonThang1 hiển thị danh sách các hóa đơn lập trong tháng 1 với thông tin hiển thị là MaHD, MaNV, NgayDH.
create view vw_HoaDonThang1
as
select CTHoaDon.MaHD,MaNV,NgayDH
from CTHoaDon join bill on CTHoaDon.MaHD=bill.MaHD
where month(NgayDH)=1
	--thực thi
select*from vw_HoaDonThang1

--	5.Tạo khung nhìn hiển thị sản phẩm bán chạy nhất trong tháng 10 năm 2022
create view vw_SanPhamBanChayThang10
as
select SanPham.MaSP,TenSP,max(Sl*GiaBan) as 'Doanh thu'
from SanPham join CTPhieuXuat on SanPham.MaSP=CTPhieuXuat.MaSP 
			 join CTHoaDon on SanPham.MaSP=CTHoaDon.MaSP
where MONTH(NgayDH)=10
group by SanPham.MaSP,TenSP
	--thực thi
select*from vw_SanPhamBanChayThang10
