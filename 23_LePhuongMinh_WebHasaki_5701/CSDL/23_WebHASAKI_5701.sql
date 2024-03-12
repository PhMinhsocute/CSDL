-------- Câu lệnh create
-- 1. Tạo CSDL
create database WebHasaki
go
-- 2. Chọn CSDL
use WebHasaki
go 
--3. Tạo bảng Khách hàng
CREATE TABLE KhachHang
(
	MaKH nvarchar(7) NOT NULL,
	TenKH nvarchar(100) NOT NULL,
	SDT nvarchar(15) NULL,
	Email nvarchar(50) NULL,
	CONSTRAINT PK_KhachHang PRIMARY KEY (MaKH)
)
GO
--4. Tạo bảng Nhân viên
CREATE TABLE NhanVien
(
	MaNV nvarchar(7) NOT NULL,
	HoTenNV nvarchar(150) NOT NULL,
	GioiTinh nvarchar(20) NOT NULL,
	DiaChi nvarchar(100) NULL,
	NgaySinh datetime NULL,
	SDT nvarchar(15) NULL,
	CONSTRAINT PK_NhanVien PRIMARY KEY (MaNV)
)
GO
--5. Tạo bảng Nhà cung cấp
CREATE TABLE NhaCungCap
(
	MaNCC nvarchar(7) NOT NULL,
	TenNCC nvarchar(100) NOT NULL,
	DiaChi nvarchar(150) NULL,
	SDT nvarchar(15) NULL,
	CONSTRAINT PK_NhaCungCap PRIMARY KEY (MaNCC)
)
GO
--6. Tạo bảng Loại sản phẩm
CREATE TABLE LoaiSP
(
	MaLoai nvarchar(7) NOT NULL,
	TenLoai nvarchar(100) NOT NULL,
	GhiChu nvarchar(100) NULL,
	CONSTRAINT PK_LoaiSP PRIMARY KEY (MaLoai)
)
GO
--7. Tạo bảng Sản phẩm
CREATE TABLE SanPham
( 
	MaSP nvarchar(7) NOT NULL,
	MaLoai nvarchar(7) NOT NULL,
	TenSP nvarchar(150) NOT NULL,
	DVT nvarchar(20) NULL, 
	GiaBan float NOT NULL,
	HinhAnh varchar(200) NULL,
	CONSTRAINT PK_SanPham PRIMARY KEY (MaSP),
	CONSTRAINT FK_SP_LoaiSP_MaLoai FOREIGN KEY (MaLoai) REFERENCES LoaiSP(MaLoai)
)
GO
--8. Tạo bảng Phiếu nhập
CREATE TABLE PhieuNhap
( 
	SoPN nvarchar(7) NOT NULL,
	MaNV nvarchar(7) NOT NULL,
	MaNCC nvarchar(7) NOT NULL,
	NgayNhap datetime NOT NULL,
	CONSTRAINT PK_PhieuNhap PRIMARY KEY (SoPN),
	CONSTRAINT FK_PN__NV_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	CONSTRAINT FK_PN_NCC_MaNCC FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
)
GO
--9. Tạo bảng Chi tiết phiếu nhập
CREATE TABLE CTPhieuNhap
(
	MaSP nvarchar(7) NOT NULL,
	SoPN nvarchar(7) NOT NULL,
	SoLuong int,
	GiaNhap float,
	CONSTRAINT PK_CTPhieuNhap PRIMARY KEY (MaSP,SoPN),
	CONSTRAINT FK_CTPN_SP_MaSP FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
	CONSTRAINT FK_CTPN_PN_SoPN FOREIGN KEY (SoPN) REFERENCES PhieuNhap(SoPN)
)
GO
--10. Tạo bảng Hóa đơn
CREATE TABLE HoaDon
(
	MaHD nvarchar(7) NOT NULL,
	MaNV nvarchar(7) NOT NULL,
	MaKH nvarchar(7) NOT NULL,
	NgayBan datetime,
	GhiChu nvarchar(100) NULL,
	CONSTRAINT PK_HoaDon PRIMARY KEY (MaHD),
	CONSTRAINT FK_HD_NV_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
	CONSTRAINT FK_HD_KH_MaKH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
)
--11. Tạo bảng Chi tiết hóa đơn
CREATE TABLE CTHoaDon
(
	MaHD nvarchar(7) NOT NULL,
	MaSP nvarchar(7) NOT NULL,
	SL int NOT NULL,
	DonGia float NOT NULL,
	CONSTRAINT PK_CTHoaDon PRIMARY KEY (MaHD,MaSP),
	CONSTRAINT FK_CTHD_HD_MaHD FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD),
	CONSTRAINT FK_CTHD_SP_MaSP FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
--12. Tạo bảng Đơn đặt hàng
CREATE TABLE DonDatHang
( 
	MaDH nvarchar(100) NOT NULL,
	NgayLap date NULL,
	DiaChiGiao nvarchar(150) NULL,
	NguoiNhan nvarchar(100) NULL,
	SDTNhan nchar(15) NULL,
	ThoiHan date NULL,
	TinhTrang bit NULL,--0: chưa giao , 1: đã giao , 2: đang giao
	MaKH nvarchar(7) NULL,
	MaNV nvarchar(7) NULL,
	PTTT nvarchar(100) NULL,
	CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDH),
	--CONSTRAINT FK_DDH_KH_MaKH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
	--CONSTRAINT FK_DDH_NV_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO
--drop table  DonDatHang
--13. Tạo băng Chi tiết đơn đặt hàng
CREATE TABLE CTDonDatHang
(
	MaDH nvarchar(100) NOT NULL,
	MaSP nvarchar(7) NULL,
	SLgDat int NULL,
	Gia float NULL,
	CONSTRAINT PK_CTDonDatHang PRIMARY KEY (MaDH),
	CONSTRAINT FK_CTDDH_DDH_MaDH FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
	--CONSTRAINT FK_CTDDH_SP_MaSP FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
GO
--drop table  CTDonDatHang
--14. Tạo bảng Liên hệ 
CREATE TABLE LienHe
(
	MaLH nvarchar(7) PRIMARY KEY,
	HoTen nvarchar(100),
	SDT nvarchar(15),
	NoiDung text
)
GO
--15. Tạo bảng Tài Khoản
CREATE TABLE TaiKhoan
(
	TenND nvarchar(150),
	MatKhau nvarchar(150),
	LoaiND nvarchar(100)
)
Go
