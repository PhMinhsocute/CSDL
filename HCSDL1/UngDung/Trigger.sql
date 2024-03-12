--__________Trigger________--
use QLBH_BStore
---	1.Tự động cập nhật số lượng tồn của một sản phẩm trong bảng Sản Phẩm khi sản phẩm được cung cấp thêm.
create trigger tg_CapNhatSLTon
on CTPhieuNhap
for insert
as
	update SanPham
	set SLTon=SLTon+inserted.SoLuong
	From SanPham join inserted on SanPham.MaSP=inserted.MaSP
	--Thực Thi
insert into CTPhieuNhap values('SP013','PN009',20,20000)
	--Xóa
drop trigger tg_CapNhapSLT
--	2.Khi nhập hàng một sản phẩm. Giá sản phẩm không được tăng quá 10% so với giá cũ.
create trigger tg_GNSP
on CTPhieuNhap
for update
as
begin
declare @giacu float, @giamoi float
	select @giacu = GiaNhap from deleted
	select @giamoi = GiaNhap from inserted 
	if (@giamoi >= @giacu*1.1)
begin
	print(N'Giá mới của sản phẩm không được lớn hơn 10% so với giá cũ')
	rollback tran
	end
end
	--Thực Thi
update CTPhieuNhap set GiaNhap='250090' where MaSP='SP002'
select *from CTPhieuNhap where MaSP='SP002'

update CTPhieuNhap set GiaNhap='192400' where MaSP='SP002'
select *from CTPhieuNhap where MaSP='SP002'
