USE [master]
GO
/****** Object:  Database [QLBH_BStore]    Script Date: 21/04/2023 12:37:28 PM ******/
CREATE DATABASE [QLBH_BStore]
 
GO
ALTER DATABASE [QLBH_BStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH_BStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH_BStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH_BStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH_BStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH_BStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH_BStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH_BStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH_BStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH_BStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH_BStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH_BStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH_BStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH_BStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH_BStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH_BStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH_BStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH_BStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH_BStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH_BStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH_BStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH_BStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH_BStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH_BStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH_BStore] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBH_BStore] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH_BStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH_BStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH_BStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH_BStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBH_BStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLBH_BStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBH_BStore', N'ON'
GO
ALTER DATABASE [QLBH_BStore] SET QUERY_STORE = OFF
GO
USE [QLBH_BStore]
GO
/****** Object:  User [Thuong]    Script Date: 21/04/2023 12:37:28 PM ******/
CREATE USER [Thuong] FOR LOGIN [QuanLy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Minh]    Script Date: 21/04/2023 12:37:28 PM ******/
CREATE USER [Minh] FOR LOGIN [NhanVien] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Synonym [dbo].[HD]    Script Date: 21/04/2023 12:37:28 PM ******/
CREATE SYNONYM [dbo].[HD] FOR [Bill]
GO
/****** Object:  Synonym [dbo].[NV]    Script Date: 21/04/2023 12:37:28 PM ******/
CREATE SYNONYM [dbo].[NV] FOR [dbo].[NhanVien]
GO
/****** Object:  UserDefinedFunction [dbo].[f_SLLoaiSanPham]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_SLLoaiSanPham] (@MaLoaiSP nvarchar(4))
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
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](5) NOT NULL,
	[HoTenNV] [nvarchar](30) NOT NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[DiaChiNV] [nvarchar](150) NOT NULL,
	[NgaySinh] [datetime] NOT NULL,
	[DienThoai] [nvarchar](15) NULL,
	[NoiSinh] [nvarchar](50) NOT NULL,
	[NgayVaoLam] [datetime] NULL,
 CONSTRAINT [PK_Ma_NV] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_NhanVienNu]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_NhanVienNu]
as
select MaNV,HoTenNV, year(getdate())-Year(NgayVaoLam) as N'Thâm niên'
from NhanVien 
where GioiTinh=N'Nữ'
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[MaHD] [nvarchar](5) NOT NULL,
	[MaKH] [nvarchar](5) NOT NULL,
	[MaNV] [nvarchar](5) NOT NULL,
	[SLDat] [int] NULL,
	[TongTien] [real] NULL,
	[PTTT] [nvarchar](100) NULL,
 CONSTRAINT [PK_Ma_HD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHoaDon]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDon](
	[MaHD] [nvarchar](5) NOT NULL,
	[MaSP] [nvarchar](5) NOT NULL,
	[NgayDH] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_HoaDonThang1]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_HoaDonThang1]
as
select CTHoaDon.MaHD,MaNV,NgayDH
from CTHoaDon join bill on CTHoaDon.MaHD=bill.MaHD
where month(NgayDH)=1
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](5) NOT NULL,
	[MaLoaiSP] [nvarchar](4) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[SLTon] [nvarchar](10) NOT NULL,
	[DonViTinh] [nvarchar](20) NOT NULL,
	[Ghichu] [nvarchar](100) NULL,
 CONSTRAINT [PK_Ma_SP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPhieuXuat]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuXuat](
	[MaSP] [nvarchar](5) NOT NULL,
	[SoPX] [nvarchar](5) NOT NULL,
	[SL] [int] NOT NULL,
	[GiaBan] [real] NULL,
 CONSTRAINT [PK_CTPPhieuXuat] PRIMARY KEY CLUSTERED 
(
	[SoPX] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_DanhSachTop5SanPhamBanChay]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_DanhSachTop5SanPhamBanChay]
as
select top 5 SanPham.MaSP,TenSP,sum(Sl*GiaBan) as 'Doanh thu'
from SanPham join CTPhieuXuat on SanPham.MaSP=CTPhieuXuat.MaSP
group by SanPham.MaSP,TenSP
order by sum(SL*GiaBan) desc
GO
/****** Object:  View [dbo].[vw_SanPhamBanChayThang10]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_SanPhamBanChayThang10]
as
select SanPham.MaSP,TenSP,max(Sl*GiaBan) as 'Doanh thu'
from SanPham join CTPhieuXuat on SanPham.MaSP=CTPhieuXuat.MaSP 
			 join CTHoaDon on SanPham.MaSP=CTHoaDon.MaSP
where MONTH(NgayDH)=10
group by SanPham.MaSP,TenSP
GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[MaSP] [nvarchar](5) NOT NULL,
	[SoPN] [nvarchar](5) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[GiaNhap] [real] NULL,
 CONSTRAINT [PK_CTPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[SoPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[f_LoiNhuanThang9]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_LoiNhuanThang9]()
returns table
as 
return
select CTPhieuNhap.MaSP,sum(GiaBan-GiaNhap) as N'Lợi Nhuận'
from CTPhieuNhap join CTPhieuXuat on CTPhieuNhap.MaSP=CTPhieuXuat.MaSP
				 join CTHoaDon on CTPhieuNhap.MaSP=CTHoaDon.MaSP
where year(NgayDH)='2019'
group by CTPhieuNhap.MaSP
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nvarchar](5) NOT NULL,
	[HoTenKH] [nvarchar](30) NOT NULL,
	[Phai] [nvarchar](5) NOT NULL,
	[SODT] [nvarchar](15) NULL,
	[DiaChiKH] [nvarchar](150) NULL,
 CONSTRAINT [PK_Ma_KH] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[f_Top1KH]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[f_Top1KH]()
returns table
as 
return
select  KhachHang.MaKH,HoTenKH,sum(TongTien) as N'Số tiền thanh toán'
from KhachHang join bill on KhachHang.MaKH=Bill.MaKH
group by KhachHang.MaKH,HoTenKH
having sum(TongTien) >=all(select sum(TongTien) from bill group by MaKH)
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [nvarchar](4) NOT NULL,
	[TenLoaiSP] [nvarchar](30) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_MA_LSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_TinhTrangSanPham]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_TinhTrangSanPham]
as
select SanPham.MaSP,TenLoaiSP,TenSP
from SanPham join LoaiSanPham on SanPham.MaLoaiSP=LoaiSanPham.MaLoaiSP
where SanPham.MaSP in (select MaSP from CTHoaDon where year(NgayDH)='2019')  
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](5) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[DienThoai] [nvarchar](15) NOT NULL,
	[Email] [ntext] NULL,
	[Website] [nvarchar](100) NULL,
 CONSTRAINT [PK_Ma_NCC] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NVChinhThuc]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NVChinhThuc](
	[MaNV] [nvarchar](5) NULL,
	[HoTenNV] [nvarchar](30) NULL,
	[GioiTinh] [nvarchar](5) NULL,
	[NgayVaoLam] [datetime] NULL,
	[SoHD] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[SoPN] [nvarchar](5) NOT NULL,
	[MaNV] [nvarchar](5) NOT NULL,
	[MaNCC] [nvarchar](5) NOT NULL,
	[NgayNhap] [datetime] NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[SoPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[SoPX] [nvarchar](5) NOT NULL,
	[MaNV] [nvarchar](5) NOT NULL,
	[MaKH] [nvarchar](5) NOT NULL,
	[NgayBan] [datetime] NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
 CONSTRAINT [PK_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[SoPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [index_MaHD]    Script Date: 21/04/2023 12:37:28 PM ******/
CREATE NONCLUSTERED INDEX [index_MaHD] ON [dbo].[Bill]
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [index_NgayNhap]    Script Date: 21/04/2023 12:37:28 PM ******/
CREATE NONCLUSTERED INDEX [index_NgayNhap] ON [dbo].[PhieuNhap]
(
	[NgayNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [DF_DiaChi_KH]  DEFAULT (N'Chưa có thông tin') FOR [DiaChiKH]
GO
ALTER TABLE [dbo].[NhaCungCap] ADD  CONSTRAINT [DF_DiaChi_NCC]  DEFAULT (N'Chưa có thông tin') FOR [DiaChi]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_DiaChi_NV]  DEFAULT (N'Chưa có thông tin') FOR [DiaChiNV]
GO
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [DF_NoiSinh_NV]  DEFAULT (N'Chưa có thông tin') FOR [NoiSinh]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_MaKH_HD] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_MaKH_HD]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_HD] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_MaNV_HD]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_CTHoaDon_Bill] FOREIGN KEY([MaHD])
REFERENCES [dbo].[Bill] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_CTHoaDon_Bill]
GO
ALTER TABLE [dbo].[CTHoaDon]  WITH CHECK ADD  CONSTRAINT [FK_MaSP_CTHoaDon] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTHoaDon] CHECK CONSTRAINT [FK_MaSP_CTHoaDon]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_SanPham]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_SoPN_CTPhieuNhap] FOREIGN KEY([SoPN])
REFERENCES [dbo].[PhieuNhap] ([SoPN])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_SoPN_CTPhieuNhap]
GO
ALTER TABLE [dbo].[CTPhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuXuat_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPhieuXuat] CHECK CONSTRAINT [FK_CTPhieuXuat_SanPham]
GO
ALTER TABLE [dbo].[CTPhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_SoPX_CTPhieuXuat] FOREIGN KEY([SoPX])
REFERENCES [dbo].[PhieuXuat] ([SoPX])
GO
ALTER TABLE [dbo].[CTPhieuXuat] CHECK CONSTRAINT [FK_SoPX_CTPhieuXuat]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_MaNCC_PhieuNhap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_MaNCC_PhieuNhap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_PhieuNhap] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_MaNV_PhieuNhap]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_MaKH_PhieuXuat] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_MaKH_PhieuXuat]
GO
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_MaNV_PhieuXuat] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_MaNV_PhieuXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_MaLoaiSP_SANPHAM] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_MaLoaiSP_SANPHAM]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [CK_Phai_KH] CHECK  (([Phai]=N'khác' OR [Phai]=N'Nữ' OR [Phai]=N'Nam'))
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [CK_Phai_KH]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_GioiTinh_NV] CHECK  (([gioitinh]=N'khác' OR [gioitinh]=N'Nữ' OR [gioitinh]=N'Nam'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_GioiTinh_NV]
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatGN]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CapNhatGN]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatNCC]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CapNhatNCC]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_NVChinhThuc]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_NVChinhThuc]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_slt]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_slt] 
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
GO
/****** Object:  StoredProcedure [dbo].[sp_TTKhachHang]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TTKhachHang]
(@MaKH nvarchar(5))
as
begin
	select  *
	from KhachHang
	where MaKH=@MaKH
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TuoiNV]    Script Date: 21/04/2023 12:37:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TuoiNV]
as
begin
	select MaNV,HoTenNV,GioiTinh,year(getdate())-year(NgaySinh) as N'Tuổi'
	from NhanVien
	order by year(getdate())-year(NgaySinh)  desc
end 
GO
USE [master]
GO
ALTER DATABASE [QLBH_BStore] SET  READ_WRITE 
GO
