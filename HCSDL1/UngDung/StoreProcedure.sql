--____________Store Procedure___________--
use QLBH_BStore
--	1.Xem thông tin khách hàng với tham số truyển vào là MaKH.
create proc sp_TTKhachHang
(@MaKH nvarchar(5))
as
begin
	select  *
	from KhachHang
	where MaKH=@MaKH
end
	--Thực thi
exec sp_TTKhachHang 'KH010'
	--Xóa
drop proc sp_TTKhachHang

--	2.Cho biết danh sách độ tuổi của nhân viên từ cao đến thấp.
create proc sp_TuoiNV
as
begin
	select MaNV,HoTenNV,GioiTinh,year(getdate())-year(NgaySinh) as N'Tuổi'
	from NhanVien
	order by year(getdate())-year(NgaySinh)  desc
end 
	--Thực thi
exec sp_TuoiNV

--	3.Lưu trữ các nhân viên có thời gian vào làm 1 tháng đã lập từ 3 hóa đơn vào bảngNVChinhThuc.
create proc sp_NVChinhThuc
as
begin
if not exists(select *from sys.objects where object_id=OBJECT_ID('dbo.NVChinhThuc'))
begin
	create table NVChinhThuc
	( MaNV nvarchar(5),
	HoTenNV nvarchar(30),
	GioiTinh nvarchar(5),
	NgayVaoLam datetime,
	SoHD int
	)
end
insert into NVChinhThuc
select NhanVien.MaNV,HoTenNV,GioiTinh,NgayVaoLam,count(MaHD) as N'SoHD'
from NhanVien join Bill on NhanVien.MaNV=Bill.MaNV
where MONTH(getdate())- MONTH(NgayVaoLam) >=1
group by NhanVien.MaNV,HoTenNV,GioiTinh,NgayVaoLam
having count(MaHD)>=3
end 
	--Thực thi
exec sp_NVChinhThuc

/*4.Xem số lượng tồn của sản phẩm nếu số lượng tồn = 0 thì “Hết Hàng”
										số lượng tồn <20 “Sắp hết hàng”
										ngược lại thì “Còn hàng” với tham số truyền vào là MaSP.*/
create proc sp_slt 
(@MaSP nvarchar(5))
as
begin
declare @slt int
if exists (select MaSP from SanPham where MaSP=@MaSP)
begin 
	set @slt=(select SLTon from SanPham where MaSP=@MaSP)
	if (@slt=0) print N'Hết hàng'
	else if (@slt<20) print N'Sắp hết hàng'
	else print N'Còn hàng'
	end
else print N'không tìm thấy mặt hàng'
end
	--Thực thi
exec sp_slt 'SP012'

--	5.Tạo thủ tục cập nhật đơn giá mua hàng trong bảng CTPhieuNhap
--với tham số truyền vào là mã sản phẩm do người dùng nhập và xác định giao dịch hoàn thành hoặc quay lui khi giao dịch có lỗi. 
create proc sp_CapNhatGN
@MaSP nvarchar(5), @GiaNhap real
as
declare @error int, @rowcount int
	begin tran 
	if exists (select*from CTPhieuNhap 
	where @MaSP=MaSP)
	begin
		update CTPhieuNhap
		set GiaNhap=@GiaNhap
		where MaSP=@MaSP
	end
	else
		print N'Mặt hàng không tồn tại.'
	select @error=@@ERROR,@rowcount=@@ROWCOUNT
	if @error<>0 or @rowcount<>1
		begin 
		rollback tran
		return -999
		end
	else
	print N'Cập nhật hoàn thành'
	commit tran
	return 0
	--Thực thi
exec sp_CapNhatGN 'SP014','20000'
--	6.Tạo thủ tục thêm thông tin nhà cung cấp mới do người dùng nhập và xác định giao dịch hoàn thành hoặc quay lui khi giao dịch có lỗi.
create proc sp_CapNhatNCC
@MaNCC nvarchar(5),@TenNCC nvarchar(50),
@DiaChi nvarchar(200),@DienThoai nvarchar(15),
@Email ntext, @Website nvarchar(100)
as
declare @error int, @rowcount int
	begin tran
	if exists (select *from NhaCungCap where MaNCC=@MaNCC)
	print N'Đã tồn tại Nhà Cung Cấp'
	else 
	insert into NhaCungCap
	values (@MaNCC,@TenNCC,@DiaChi,@DienThoai,@Email,@Website)
	select @error=@@ERROR ,@rowcount=@@ROWCOUNT
	if @error<>0 or @rowcount<>1
		begin 
		rollback tran
		return -999
		end
	else 
	print N'Cập nhật Thành công'
	commit tran
	return 0
	--Thực thi
exec sp_CapNhatNCC 'NCC21',N'Công ty chuyên cung cấp Gấu sỉ và lẻ',
N'224/3 Hai Bà Trưng Q1','03348218',N'cungcapsile@gmail.com',N'www.GauBong.com.vn'
