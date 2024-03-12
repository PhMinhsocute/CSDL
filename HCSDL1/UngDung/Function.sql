--___________Function_________--
use QLBH_BStore
--	1.Viết hàm cho biết số lượng từng loại sản phẩm khi biết tham số truyền vào là mã loại sản phẩm 
create function f_SLLoaiSanPham (@MaLoaiSP nvarchar(4))
returns int
as
begin 
declare @sosp int;
select @sosp=count(MaSP)
from SanPham 
where MaLoaiSP=@MaLoaiSP
group by MaLoaiSP 
return @sosp
end
	--Thực thi
select dbo.f_SLLoaiSanPham('GB01')
	--Xóa
drop function dbo.f_SLLoaiSanPham
--	2.Viết hàm cho biết khách hàng có hóa đơn cao nhất.
create function f_Top1KH()
returns table
as 
return
select  KhachHang.MaKH,HoTenKH,sum(TongTien) as N'Số tiền thanh toán'
from KhachHang join bill on KhachHang.MaKH=Bill.MaKH
group by KhachHang.MaKH,HoTenKH
having sum(TongTien) >=all(select sum(TongTien) from bill group by MaKH)
	--Thực Thi
select *from f_Top1KH()
