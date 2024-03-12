------------- THÊM DỮ LIỆU ---------------------
--1.TABLE KHÁCH HÀNG
INSERT INTO KhachHang VALUES(N'KH01',N'Ngô Đình Phong',N'0938818411', N'dinhphong@gaim.com')
INSERT INTO KhachHang VALUES(N'KH02',N'Lê Văn Thịnh',N'02116584446',NULL)
INSERT INTO KhachHang VALUES(N'KH03',N'Lê Đức Minh',N'02116584447',N'ducminh@gmail.com')
INSERT INTO KhachHang VALUES(N'KH04',N'Lê Văn Khương',N'02116584448',NULL)
INSERT INTO KhachHang VALUES(N'KH05',N'Mai Hoàng Đức',N'02116584449',N'hoangduc@gmai.com')
INSERT INTO KhachHang VALUES(N'KH06',N'Võ Cẩm Nhung',N'02116584441',NULL)
INSERT INTO KhachHang VALUES(N'KH07',N'Trần Việt Hưng',N'02116584442',N'viethung@gmail.com')
INSERT INTO KhachHang VALUES(N'KH08',N'Đỗ Ngọc Linh',N'02116584443',NULL)
INSERT INTO KhachHang VALUES(N'KH09',N'Hoàng Khánh Hưng',N'02116584444',N'khanhhung@gmail.com')
INSERT INTO KhachHang VALUES(N'KH10',N'Lê Đức Anh ',N'02112384334',NULL)
--2.TABLE NHÂN VIÊN
INSERT INTO NhanVien VALUES(N'NV01', N'Phan Thành Duy',N'Nam', N'5 Dương Quảng hàm - GV - TPHCM', CAST(0x000084E700000000 AS DateTime), N'08858454182')
INSERT INTO NhanVien VALUES(N'NV02', N'Lâm Đại Ngọc',N'Nam', N'2/1A Quang Trung - p.10 - GV - TP.HCM',CONVERT(datetime,'5/6/1996'),	N'08354362205')
INSERT INTO NhanVien VALUES(N'NV03', N'Trần Châu Khoa', N'Nam', N'10 QL 1A - p.11 - q.12 - TP.HCM',CONVERT(datetime,'5/4/1989'), N'09181833333')
INSERT INTO NhanVien VALUES(N'NV04', N'Lê Chí Kiên', N'Nam', N'564/1/3F Nguyễn Xí - Bình Thạnh - TP.HCM', CONVERT(datetime,'5/15/1999'), N'09131620000')
INSERT INTO NhanVien VALUES(N'NV05', N'Phan Thanh Tâm', N'Nam', N'123A Nguyễn Kiệm - q. Gò Vấp - TP.HCM', CONVERT(datetime,'2/25/1987'), N'09186223333')
INSERT INTO NhanVien VALUES(N'NV06', N'Mai Thị Lựu', N'Nữ', N'256/96/4 Phan Đăng Lưu - Bình Thạnh - HCM', CONVERT(datetime,'4/4/1996'), N'09181831444')
INSERT INTO NhanVien VALUES(N'NV07', N'Đào Thị Hồng', N'Nữ', N'764/94 Phạm Văn Chiêu - p.13 - GV - HCM',CONVERT(datetime,'5/5/1997'), N'09754322222')
INSERT INTO NhanVien VALUES(N'NV08', N'Phan Thành Nhân', N'Nam', N'152 Nguyễn Trọng Tuyển - Tân Bình - HCM', CONVERT(datetime,'1/15/1992'), N'09135332332')
INSERT INTO NhanVien VALUES(N'NV09', N'Phan Ánh Dương', N'Nữ', N'65 Nam Kỳ Khởi Nghĩa -q.3 - TP.HCM',CONVERT(datetime,'9/4/1995'), N'09812127678')
INSERT INTO NhanVien VALUES(N'NV10', N'Phan Ánh Nguyệt', N'Nữ', N'32/65/9 Trần Cao Vân - Phú Nhuận - HCM',CONVERT(datetime,'4/23/1989'), N'09812342356')
--3. TABLE NHÀ CUNG CẤP
INSERT INTO NhaCungCap VALUES(N'NCC01', N'Công ty TNHH sản xuất mỹ phẩm Hani', N'43 Nguyễn Bá Tòng, Phường 11, Q. Tân Bình, TPHCM', N'028.62.874.093')
INSERT INTO NhaCungCap VALUES(N'NCC02', N'Cụm Công Nghiệp Triều Khúc, Tân Triều, Thanh Trì, Hà Nội', N'114/90 Tô Ngọc Vân, Phường 15, Gò vấp, TP. HCM',NULL)
INSERT INTO NhaCungCap VALUES(N'NCC03', N'Công Ty TNHH sản xuất mỹ phẩm ViCO', N'Số 94 Đường 208, An Đồng, An Dương, Tp. Hải Phòng ', N'(0225) 3835869')
INSERT INTO NhaCungCap VALUES(N'NCC04', N'Vinamilk', N'10 - Tân Trào - P. Tân Phú - Q7 - TP.HCM', N'(08) 54 155 555')
INSERT INTO NhaCungCap VALUES(N'NCC05', N'Tập đoàn Unilever Việt Nam', N'01 Nguyễn Thị Minh Khai - p. Tân Định - Q.1', N'(08) 8.39696999')
INSERT INTO NhaCungCap VALUES(N'NCC06', N'Công ty sản xuất mỹ phẩm gia công Mỹ Phẩm Dạ Lan', N'Số 37, Đường số 4, Khu Cityland Garden, P.5. Q.Gò Vấp, TPHCM ', N'0914469955')
INSERT INTO NhaCungCap VALUES(N'NCC07', N'Công Ty TNHH sản xuất hóa mỹ phẩm EARTH CORPORATION Việt Nam', N'Lầu 18, Tòa Tháp A, Tòa Nhà Viettel, 285 Cách Mạng Tháng Tám, P. 12, Q. 10, TPHCM ', N'(028) 62560710 ')
INSERT INTO NhaCungCap VALUES(N'NCC08', N'Công ty sản xuất hóa mỹ phẩm Bena', N'Lô A1-A2, Nam Trân, Hòa Minh, Liên Chiểu, Đà Nẵng', N'0511.3769797')
INSERT INTO NhaCungCap VALUES(N'NCC09', N'CÔNG TY TNHH NATURE STORY', N'Quốc Lộ 1A, Phường Tân Thới Hiệp, Quận 12, Thành phố Hồ Chí Minh,', N'028.62.874.093')
INSERT INTO NhaCungCap VALUES(N'NCC10', N'Công ty TNHH sản xuất mỹ phẩm LaHaNa', N'43 Nguyễn Thị Minh Khai, Phường 2, Q.1, TPHCM', N'028.62.874.093')
--4. TABLE LOẠI SẢN PHẨM
INSERT INTO LoaiSP VALUES (N'NTT', N'Nước tẩy trang', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'KCN', N'Kem chống nắng', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'KDA', N'Kem dưỡng ẩm', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'DM', N'Dưỡng môi', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'SRM', N'Sửa rửa mặt', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'NCC', N'Toner/Nước cân bằng da', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'SR', N'Serum/đặc trị', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'L01', N'Lotion/Sữa dưỡng', N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'MN', N'Mặt nạ',N'hóa mỹ phẩm')
INSERT INTO LoaiSP VALUES (N'ST', N'Sữa tắm', N'hóa mỹ phẩm')
--5. TABLE SẢN PHẨM
INSERT INTO SanPham VALUES (N'SP01', N'NTT', N'Nước tẩy trang Bioderma', N'chai',315000, NULL)
INSERT INTO SanPham VALUES (N'SP02', N'NTT', N'Nước tẩy trang LOreal', N'chai',155000,NULL)
INSERT INTO SanPham VALUES (N'SP03', N'NTT', N'Nước tẩy trang Garnier', N'chai',139000,NULL)
INSERT INTO SanPham VALUES (N'SP04', N'KCN', N'Kem chống nắng Anessa', N'chai',429000,NULL)
INSERT INTO SanPham VALUES (N'SP05', N'MN',  N'Mặt nạ giấy BNBG', N'chiếc',17000,NULL)
INSERT INTO SanPham VALUES (N'SP06', N'SRM', N'Sửa rửa mặt SVR', N'chai',429000,NULL)
INSERT INTO SanPham VALUES (N'SP07', N'KDA', N'Kem dưỡng ẩm và phục hồi Klair', N'tuýp',374000,NULL)
INSERT INTO SanPham VALUES (N'SP08', N'ST',  N'Sửa tắm BaBy', N'chai',128000,NULL)
INSERT INTO SanPham VALUES (N'SP09', N'DM',  N'Dưỡng môi Vasaline', N'hủ',55000,NULL)
INSERT INTO SanPham VALUES (N'SP10', N'L01', N'Lotion Simple', N'chai',189000,NULL)
INSERT INTO SanPham VALUES (N'SP11', N'SR',  N'Serum HA Ordinary', N'chai',199000,NULL)
INSERT INTO SanPham VALUES (N'SP12', N'ST',  N'Sữa tắm Dove', N'chai',128000,NULL)
INSERT INTO SanPham VALUES (N'SP13', N'KDA', N'Kem Dưỡng La Roche-Posay Giúp Phục Hồi Da Đa Công Dụng 40ml ', N'hủ',315000, NULL)
INSERT INTO SanPham VALUES (N'SP14', N'KDA', N'Kem Dưỡng Olay Luminous Sáng Da Mờ Thâm Nám Ban Đêm 50g', N'hủ',415000,NULL)
INSERT INTO SanPham VALUES (N'SP15', N'KCN', N'Kem Chống Nắng LOreal Paris X20 Thoáng Da Mỏng Nhẹ 50ml', N'chai',215000,NULL)
INSERT INTO SanPham VALUES (N'SP16', N'KCN', N'Tinh Chất Chống Nắng Sunplay Hiệu Chỉnh Sắc Da 50g (Tím)', N'chai',150000,NULL)
INSERT INTO SanPham VALUES (N'SP17', N'SR',  N'Serum oh!oh! Dưỡng Sáng Da, Giảm Thâm Nám 10ml', N'chai',490000,NULL)
INSERT INTO SanPham VALUES (N'SP18', N'SR',  N'Tinh Chất Cocoon Nghệ Hưng Yên x2 Sáng Da Chuyên Sâu 30ml', N'chai',187000, NULL)
INSERT INTO SanPham VALUES (N'SP19', N'L01', N'Sữa Dưỡng Senka Cấp Ẩm Chuyên Sâu Cho Da 150ml', N'chai',123000, NULL)
INSERT INTO SanPham VALUES (N'SP20', N'L01', N'Dung Dịch Hada Labo Dưỡng Sáng Da, Giảm Thâm Sạm 40ml', N'chai',51000,NULL)

INSERT INTO SanPham VALUES (N'SP21', N'ST',  N'Sữa Tắm Hatomugi Dưỡng Ẩm', N'chai',80000,'~\HinhAnh\SThatomugi.jpg')
INSERT INTO SanPham VALUES (N'SP22', N'ST',  N'Sữa Tắm On: The Body Dưỡng Ẩm Hương Tinh Tế 1000g', N'chai',185000,'~\HinhAnh\STON.jpg')
INSERT INTO SanPham VALUES (N'SP23', N'ST',  N'Sữa Tắm Nước Hoa Tesori dOriente Hương Hoa Sen 500ml', N'chai',229000,'~\HinhAnh\SThoasen.png')
INSERT INTO SanPham VALUES (N'SP24', N'SRM', N'Sữa Rửa Mặt Cetaphil Dịu Lành Cho Da Nhạy Cảm 500ml (Mới)', N'chai',336000,'~\HinhAnh\SRMcetaphil.jpg')
INSERT INTO SanPham VALUES (N'SP25', N'SRM', N'Sữa Rửa Mặt Simple Giúp Da Sạch Thoáng 150ml', N'chai',95000,'~\HinhAnh\SRMsimple.png')
INSERT INTO SanPham VALUES (N'SP26', N'SRM', N'Sữa Rửa Mặt Naruko Dạng Bùn Tràm Trà 120ml', N'chai',165000,'~\HinhAnh\SRMnaruko.png')
INSERT INTO SanPham VALUES (N'SP27', N'MN',  N'Mặt Nạ Naruko Tràm Trà Kiểm Soát Dầu Và Giảm Mụn 26ml', N'chiếc',23000,'~\HinhAnh\MNnaruko.png')
INSERT INTO SanPham VALUES (N'SP28', N'MN',  N'Mặt Nạ Nghệ Hưng Yên Cocoon Giúp Da Rạng Rỡ Mịn Màng 30ml', N'hủ',130000,'~\HinhAnh\mncocoon.jpg')
INSERT INTO SanPham VALUES (N'SP29', N'MN',  N'Mặt Nạ Foodaholic Arbutin Dưỡng Sáng & Làm Đều Màu Da 23ml', N'chiếc',10000,'~\HinhAnh\mnbac23ml.jpg')
INSERT INTO SanPham VALUES (N'SP30', N'MN',  N'Combo Mặt Nạ Đen Sexylook Tràm Trà Kiểm Soát Dầu Mụn 5x28ml', N'hộp',140000,'~\HinhAnh\mnsexylook.jpg')

INSERT INTO SanPham VALUES (N'SP31', N'DM',  N'Son Dưỡng Môi DHC Không Màu Hỗ Trợ Giảm Thâm Môi 1.5g', N'cây',165000,'~\HinhAnh\DMhdhc.jpg')
INSERT INTO SanPham VALUES (N'SP32', N'DM',  N'Son Dưỡng Môi Mediheal Ban Đêm Không Màu 10ml', N'cây',590000,'~\HinhAnh\DMdo10ml.jpg')
INSERT INTO SanPham VALUES (N'SP33', N'DM',  N'Son Dưỡng Cocoon Dầu Dừa Bến Tre 5g', N'cây',280000,'~\HinhAnh\DMcocoon.png')
INSERT INTO SanPham VALUES (N'SP34', N'SR',  N'Serum LOreal Hyaluronic Acid Cấp Ẩm Sáng Da 30ml', N'chai',359000,'~\HinhAnh\SRlorealtim.png')
INSERT INTO SanPham VALUES (N'SP35', N'SR',  N'Serum Garnier Giảm Mụn Mờ Thâm Cho Da Dầu, Mụn 30ml', N'chai',259000,'~\HinhAnh\SRgarnier.png')
INSERT INTO SanPham VALUES (N'SP36', N'SR',  N'Serum GoodnDoc Dưỡng Ẩm, Hỗ Trợ Phục Hồi Da 30ml', N'chai',308000,'~\HinhAnh\SRgoodndoc.jpg')
INSERT INTO SanPham VALUES (N'SP37', N'SR',  N'Serum SVR Làm Giảm Mụn, Mờ Nám, Làm Mềm Mịn Da 30ml', N'chai',554000,'~\HinhAnh\srSVR.png')
INSERT INTO SanPham VALUES (N'SP38', N'SR',  N'Serum 9Wishes Dưỡng Ẩm & Làm Căng Bóng Da 25ml', N'chai',211000,'~\HinhAnh\SR9wishes.jpg')
INSERT INTO SanPham VALUES (N'SP39', N'L01', N'Sữa Dưỡng Thể Vaseline Gluta-Hya Nâng Tông Tức Thì 300ml', N'chai',135000,'~\HinhAnh\L01vasalinehong.jpg')
INSERT INTO SanPham VALUES (N'SP40', N'L01', N'Lotion Chống Nắng Sunplay Dưỡng Thể Sáng Mịn 150g', N'chai',162000,'~\HinhAnh\L01skinaqua.jpg')

INSERT INTO SanPham VALUES (N'SP41', N'L01', N'Serum Chống Nắng Dưỡng Thể Bioré Sáng Da Mịn Màng 150ml', N'chai',162000,'~\HinhAnh\L01bioreUV.jpg')
INSERT INTO SanPham VALUES (N'SP42', N'NCC', N'Nước Hoa Hồng Klairs Không Mùi Cho Da Nhạy Cảm 180ml', N'chai',252000,'~\HinhAnh\Tonerklair.jpg')
INSERT INTO SanPham VALUES (N'SP43', N'NCC', N'Nước Hoa Hồng Dr.Pepti Dưỡng Da Căng Bóng 180ml', N'chai',275000,'~\HinhAnh\NCCPepti.jpg')
INSERT INTO SanPham VALUES (N'SP44', N'NCC', N'Nước Dưỡng Da Chinoshio Dokudami Chiết Xuất Lá Diếp Cá 500ml', N'chai',75000,'~\HinhAnh\NCCladiep.jpg')
INSERT INTO SanPham VALUES (N'SP45', N'KDA', N'Kem Dưỡng Ẩm Eucerin Chuyên Sâu Cho Da Khô 50ml', N'chai',199000,'~\HinhAnh\KDAEucerin.png')
INSERT INTO SanPham VALUES (N'SP46', N'KDA', N'Kem Dưỡng GoodnDoc Rau Má Dưỡng Ẩm Phục Hồi Da 50ml', N'chai',399000,'~\HinhAnh\KDAgoodoc.jpg')
INSERT INTO SanPham VALUES (N'SP47', N'KCN', N'Tinh Chất Chống Nắng Tenamyd Dạng Nước SPF50/PA+++ 70ml', N'chai',378000,'~\HinhAnh\KCNtenamud.png')
INSERT INTO SanPham VALUES (N'SP48', N'KCN', N'Kem Chống Nắng Naris Parasola Nâng Tông Da Dạng Gel 80g', N'chai',33000,'~\HinhAnh\KCNnaris.png')
INSERT INTO SanPham VALUES (N'SP49', N'KCN', N'Kem Chống Nắng Cell Fusion C Nâng Tông Da Tuýp 50ml', N'chai',370000,'~\HinhAnh\KCNcellfuision.png')
INSERT INTO SanPham VALUES (N'SP50', N'KCN', N'Combo 2 Gel Sữa Chống Nắng Senka Ẩm Mượt Cho Da Khô 80g', N'chai',215000,'~\HinhAnh\KCNsenka.png')
--6.TABLE PHIẾU NHẬP
INSERT INTO PhieuNhap VALUES (N'PN001', N'NV01', N'NCC01', CAST('12/12/2022' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN002', N'NV05', N'NCC03', CAST('1/10/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN003', N'NV06', N'NCC01', CAST('2/9/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN004', N'NV07', N'NCC05', CAST('2/24/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN005', N'NV08', N'NCC06', CAST('3/9/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN006', N'NV09', N'NCC07', CAST('3/24/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN007', N'NV01', N'NCC04', CAST('4/9/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN008', N'NV02', N'NCC10', CAST('4/24/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN009', N'NV03', N'NCC01', CAST('5/9/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN010', N'NV10', N'NCC10', CAST('5/24/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN011', N'NV04', N'NCC08', CAST('6/9/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN012', N'NV09', N'NCC09', CAST('6/24/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN013', N'NV01', N'NCC01', CAST('7/9/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN014', N'NV05', N'NCC03', CAST('7/24/2023' AS DateTime))
INSERT INTO PhieuNhap VALUES (N'PN015', N'NV05', N'NCC05', CAST('8/9/2023' AS DateTime))
--7. TABLE CHI TIẾT PHIẾU NHẬP
INSERT INTO CTPhieuNhap VALUES (N'SP01', N'PN003', 50, 140000)
INSERT INTO CTPhieuNhap VALUES (N'SP01', N'PN004', 25, 140000)
INSERT INTO CTPhieuNhap VALUES (N'SP01', N'PN014', 10, 140000)
INSERT INTO CTPhieuNhap VALUES (N'SP02', N'PN015', 15, 35000)
INSERT INTO CTPhieuNhap VALUES (N'SP03', N'PN003', 50, 40000)
INSERT INTO CTPhieuNhap VALUES (N'SP03', N'PN004', 40, 46000)
INSERT INTO CTPhieuNhap VALUES (N'SP03', N'PN014', 15, 46000)
INSERT INTO CTPhieuNhap VALUES (N'SP04', N'PN005', 20, 20000)
INSERT INTO CTPhieuNhap VALUES (N'SP04', N'PN007', 90, 20000)
INSERT INTO CTPhieuNhap VALUES (N'SP05', N'PN001', 200, 13800)
INSERT INTO CTPhieuNhap VALUES (N'SP05', N'PN002', 100, 13800)
INSERT INTO CTPhieuNhap VALUES (N'SP05', N'PN013', 20, 13800)
INSERT INTO CTPhieuNhap VALUES (N'SP06', N'PN009', 20, 235000)
INSERT INTO CTPhieuNhap VALUES (N'SP07', N'PN015', 10, 30000)
INSERT INTO CTPhieuNhap VALUES (N'SP08', N'PN001', 15, 160000)
INSERT INTO CTPhieuNhap VALUES (N'SP08', N'PN013', 30, 160000)
INSERT INTO CTPhieuNhap VALUES (N'SP10', N'PN012', 2000, 3200)
INSERT INTO CTPhieuNhap VALUES (N'SP12', N'PN008', 50, 61200)
INSERT INTO CTPhieuNhap VALUES (N'SP13', N'PN005', 56, 13200)
INSERT INTO CTPhieuNhap VALUES (N'SP13', N'PN007', 21, 13200)
INSERT INTO CTPhieuNhap VALUES (N'SP15', N'PN006', 250, 68000)
INSERT INTO CTPhieuNhap VALUES (N'SP15', N'PN010', 10, 80000)
INSERT INTO CTPhieuNhap VALUES (N'SP16', N'PN006', 700, 3600)
INSERT INTO CTPhieuNhap VALUES (N'SP16', N'PN008', 600, 3600)
INSERT INTO CTPhieuNhap VALUES (N'SP16', N'PN010', 400, 3600)
INSERT INTO CTPhieuNhap VALUES (N'SP18', N'PN003', 20, 90000)
INSERT INTO CTPhieuNhap VALUES (N'SP19', N'PN002', 5, 7400000)
INSERT INTO CTPhieuNhap VALUES (N'SP19', N'PN011', 10, 7400000)
--8. TABLE HÓA ĐƠN
INSERT INTO HoaDon VALUES (N'HD01', N'NV01','KH05',CAST('1/2/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD02', N'NV02','KH01',CAST('1/23/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD03', N'NV05','KH04',CAST('2/3/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD04', N'NV06','KH05',CAST('2/5/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD05', N'NV01','KH06',CAST('2/24/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD06', N'NV03','KH07',CAST('3/1/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD07', N'NV06','KH08',CAST('3/12/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD08', N'NV08','KH03',CAST('3/29/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD09', N'NV05','KH09',CAST('4/3/2023' AS DateTime),NULL)
INSERT INTO HoaDon VALUES (N'HD10', N'NV04','KH02',CAST('4/13/2023' AS DateTime),NULL)
--9.TABLE CHI TIẾT HÓA ĐƠN
INSERT INTO CTHoaDon VALUES (N'HD10', N'SP01',2,500000)
INSERT INTO CTHoaDon VALUES (N'HD09', N'SP01',1,50000)
INSERT INTO CTHoaDon VALUES (N'HD03', N'SP02',3,45000)
INSERT INTO CTHoaDon VALUES (N'HD05', N'SP03',2,900000)
INSERT INTO CTHoaDon VALUES (N'HD04', N'SP18',4,400000)
INSERT INTO CTHoaDon VALUES (N'HD02', N'SP12',1,202000)
INSERT INTO CTHoaDon VALUES (N'HD01', N'SP09',1,100000)
INSERT INTO CTHoaDon VALUES (N'HD01', N'SP05',1,20000)
INSERT INTO CTHoaDon VALUES (N'HD08', N'SP11',1,30000)
--10. TABLE ĐƠN ĐẶT HÀNG
--INSERT INTO DonDatHang VALUES (N'DH01', N'KH10',N'NV01',CAST('2/23/2023' AS DateTime),N'Tiền mặt')
--INSERT INTO DonDatHang VALUES (N'DH02', N'KH09',N'NV04',CAST('2/25/2023' AS DateTime),N'Chuyển khoản')
--INSERT INTO DonDatHang VALUES (N'DH03', N'KH02',N'NV02',CAST('2/26/2023' AS DateTime),N'Tiền mặt')
--INSERT INTO DonDatHang VALUES (N'DH04', N'KH03',N'NV01',CAST('2/27/2023' AS DateTime),N'Chuyển khoản')
--INSERT INTO DonDatHang VALUES (N'DH05', N'KH04',N'NV03',CAST('3/1/2023' AS DateTime),N'Tiền mặt')
---- chưa nhập
--INSERT INTO DonDatHang VALUES (N'DH06', N'KH01',N'NV10',CAST('3/3/2023' AS DateTime),N'Chuyển khoản')
--INSERT INTO DonDatHang VALUES (N'DH07', N'KH10',N'NV08',CAST('3/5/2023' AS DateTime),N'Tiền mặt')
--INSERT INTO DonDatHang VALUES (N'DH08', N'KH09',N'NV09',CAST('3/12/2023' AS DateTime),N'Tiền mặt')
--INSERT INTO DonDatHang VALUES (N'DH09', N'KH02',N'NV10',CAST('3/15/2023' AS DateTime),N'Tiền mặt')
--INSERT INTO DonDatHang VALUES (N'DH10', N'KH09',N'NV07',CAST('3/24/2023' AS DateTime),N'Chuyển khoản')

--11. TABLE CHI TIẾT ĐƠN ĐẶT HÀNG
--INSERT INTO CTDonDatHang VALUES (N'DH01', N'SP01',2,400000)
--INSERT INTO CTDonDatHang VALUES (N'DH02', N'SP08',1,412000)
--INSERT INTO CTDonDatHang VALUES (N'DH03', N'SP05',1,2300000)
--INSERT INTO CTDonDatHang VALUES (N'DH04', N'SP11',1,609000)
--INSERT INTO CTDonDatHang VALUES (N'DH05', N'SP12',1,203000)

---Tạo view top 3 sản phẩm mới 
create view top3_newsp
as
select top(3) MaSP, TenSP,DVT,GiaBan, HinhAnh
from SanPham

select * from top3_newsp

drop view top3_newsp

create view top3_spbanchay
as
select top(3) SP.MaSP, TenSP, DVT,GiaBan, HinhAnh
from SanPham SP join CTDonDatHang CTDH on CTDH.MaSP=SP.MaSP
order by SLgDat DESC

select * from top3_spbanchay

drop view top3_spbanchay
-- Thêm HinhAnh vào table SanPham
update SanPham
set HinhAnh='~\HinhAnh\NTTbio.jpg'
where MaSP='SP01';

update SanPham
set HinhAnh='~\HinhAnh\NTTLorel.png'
where MaSP='SP02'

update SanPham
set HinhAnh='~\HinhAnh\NTTGanier.png'
where MaSP='SP03'

update SanPham
set HinhAnh='~\HinhAnh\KCNanessa.jpg'
where MaSP='SP04'

update SanPham
set HinhAnh='~\HinhAnh\mnbnbg.jpg'
where MaSP='SP05'

update SanPham
set HinhAnh='~\HinhAnh\SRMsvr.png'
where MaSP='SP06'

update SanPham
set HinhAnh='~\HinhAnh\KDAklair.jpg'
where MaSP='SP07'

update SanPham
set HinhAnh='~\HinhAnh\STbabypng.png'
where MaSP='SP08'

update SanPham
set HinhAnh='~\HinhAnh\DMvaseline.jpg'
where MaSP='SP09'

update SanPham
set HinhAnh='~\HinhAnh\L01simple.png'
where MaSP='SP10'

update SanPham
set HinhAnh='~\HinhAnh\SRordinary.jpg'
where MaSP='SP11'

update SanPham
set HinhAnh='~\HinhAnh\STdove.png'
where MaSP='SP12'

update SanPham
set HinhAnh='~\HinhAnh\KDAlarocheposay.png'
where MaSP='SP13'

update SanPham
set HinhAnh='~\HinhAnh\KDAolay.png'
where MaSP='SP14'

update SanPham
set HinhAnh='~\HinhAnh\KCNLOreal.png'
where MaSP='SP15'

update SanPham
set HinhAnh='~\HinhAnh\KCNsunplay.jpg'
where MaSP='SP16'

update SanPham
set HinhAnh='~\HinhAnh\SRohoh.png'
where MaSP='SP17'

update SanPham
set HinhAnh='~\HinhAnh\SRcocoon.jpg'
where MaSP='SP18'

update SanPham
set HinhAnh='~\HinhAnh\L01senka.jpg'
where MaSP='SP19'

update SanPham
set HinhAnh='~\HinhAnh\L01Halado.png'
where MaSP='SP20'

