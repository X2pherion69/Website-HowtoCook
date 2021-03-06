USE [DACN]
GO
/****** Object:  Table [dbo].[CategoryFood]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryFood](
	[IDTheLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenTheLoai] [nvarchar](100) NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[IDTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CookingMethod]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CookingMethod](
	[IDMethod] [int] IDENTITY(1,1) NOT NULL,
	[TenPPN] [nvarchar](100) NULL,
 CONSTRAINT [PK_CookingMethod] PRIMARY KEY CLUSTERED 
(
	[IDMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail](
	[IDFood] [int] NOT NULL,
	[IDNguyenLieu] [int] NOT NULL,
	[SoLuong] [nvarchar](50) NULL,
 CONSTRAINT [PK_Detail] PRIMARY KEY CLUSTERED 
(
	[IDNguyenLieu] ASC,
	[IDFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[IDFood] [int] IDENTITY(1,1) NOT NULL,
	[IDTheLoai] [int] NULL,
	[IDMethod] [int] NULL,
	[TenMonAn] [nvarchar](200) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[UserID] [int] NULL,
	[NgayTao] [datetime] NULL,
	[Image] [nvarchar](max) NULL,
	[TieuDe] [nvarchar](max) NULL,
	[ActiveTime] [int] NULL,
	[TotalTime] [int] NULL,
	[Yield] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[IDFood] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[IDNguyenLieu] [int] IDENTITY(1,1) NOT NULL,
	[TenNL] [nvarchar](100) NULL,
	[DonVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguyenLieu] PRIMARY KEY CLUSTERED 
(
	[IDNguyenLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReaderID] [int] NULL,
	[IDFood] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[Vote] [nvarchar](100) NULL,
 CONSTRAINT [PK_MonAn] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14/12/2021 11:27:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CategoryFood] ON 

INSERT [dbo].[CategoryFood] ([IDTheLoai], [TenTheLoai]) VALUES (1, N'Món Mặn')
INSERT [dbo].[CategoryFood] ([IDTheLoai], [TenTheLoai]) VALUES (6, N'Bánh Ngọt')
INSERT [dbo].[CategoryFood] ([IDTheLoai], [TenTheLoai]) VALUES (14, N'Nước uống')
SET IDENTITY_INSERT [dbo].[CategoryFood] OFF
GO
SET IDENTITY_INSERT [dbo].[CookingMethod] ON 

INSERT [dbo].[CookingMethod] ([IDMethod], [TenPPN]) VALUES (1, N'Nướng')
INSERT [dbo].[CookingMethod] ([IDMethod], [TenPPN]) VALUES (2, N'Chiên')
INSERT [dbo].[CookingMethod] ([IDMethod], [TenPPN]) VALUES (3, N'Xào')
INSERT [dbo].[CookingMethod] ([IDMethod], [TenPPN]) VALUES (10, N'Luộc')
INSERT [dbo].[CookingMethod] ([IDMethod], [TenPPN]) VALUES (11, N'Nấu')
INSERT [dbo].[CookingMethod] ([IDMethod], [TenPPN]) VALUES (13, N'Hấp')
SET IDENTITY_INSERT [dbo].[CookingMethod] OFF
GO
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (122, 1, N'100')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (117, 7, N'3')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (117, 8, N'500')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (117, 9, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (117, 10, N'100')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (117, 11, N'15')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (122, 12, N'150')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 14, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 15, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 15, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 15, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 16, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (119, 16, N'2')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (122, 16, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 16, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (117, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (120, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (121, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (122, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (123, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 18, N'')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 19, N'6')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 19, N'5')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (122, 19, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (119, 20, N'2')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (123, 20, N'4')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 20, N'3')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 21, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 21, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 21, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 27, N'10')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 28, N'500')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 29, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 29, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 29, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 30, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 31, N'200')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (116, 32, N'300')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (117, 33, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 34, N'2')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (123, 34, N'5')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 35, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 36, N'500')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 37, N'500')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 38, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 39, N'200')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 40, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (118, 41, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (120, 41, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (121, 41, N'100')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (123, 41, N'10')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 41, N'200')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (119, 42, N'400')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (119, 43, N'2')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (123, 43, N'4')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (120, 44, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (120, 45, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (120, 46, N'110')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (120, 47, N'300')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (120, 48, N'200')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (121, 49, N'100')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (121, 50, N'1')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (121, 51, N'200')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (121, 52, N'50')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 53, N'2')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 54, N'2')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 55, N'100')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 56, N'200')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 56, N'500')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (124, 57, N'500')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 57, N'1000')
INSERT [dbo].[Detail] ([IDFood], [IDNguyenLieu], [SoLuong]) VALUES (125, 58, N'500')
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (116, 1, 2, N'Bún đậu mắm tôm', N'<p>Bước 1: Sơ chế nguyên liệu</p>

<p>Đậu hũ cắt thành từng miếng vuông chiên giòn.</p>

<p>Thịt ba chỉ rửa sạch, để ráo nước sau đó cho vào nồi cùng 1 lít nước, luộc chín. Tiếp theo, cắt mỏng thịt ba chỉ và xếp ra đĩa.</p>

<p>Thả từng miếng chả cốm vào chảo dầu chiên lên, lật đều 2 mặt cho đến khi chả cốm giòn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2018/07/21/1103135/cach-lam-bun-dau-mam-tom-ngon-ngat-ngay-an-mot-lan-la-ghien-1.jpg" style="height:267px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/Files/2018/07/21/1103135/cach-lam-bun-dau-mam-tom-ngon-ngat-ngay-an-mot-lan-la-ghien-2.jpg" style="height:251px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/Files/2018/07/21/1103135/cach-lam-bun-dau-mam-tom-ngon-ngat-ngay-an-mot-lan-la-ghien-3.jpg" style="height:400px; width:400px" /></p>

<p>Bước 2:Sơ chế rau</p>

<p>Dưa leo rửa sạch, gọt vỏ, thái miếng.</p>

<p>Tía tô, rau thơm các loại nhặt bỏ cành, lá già, giập úa sau đó rửa sạch, ngâm nước muối loãng khoảng 30 phút rồi vớt ra rổ, vẩy sạch nước. Bún lá cắt miếng vừa ăn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2018/07/21/1103135/cach-lam-bun-dau-mam-tom-ngon-ngat-ngay-an-mot-lan-la-ghien-4.jpg" style="height:254px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/Files/2018/07/21/1103135/cach-lam-bun-dau-mam-tom-ngon-ngat-ngay-an-mot-lan-la-ghien-5.jpg" style="height:270px; width:400px" /></p>

<h3>Bước 3: Pha mắm tôm</h3>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2018/07/21/1103135/cach-lam-bun-dau-mam-tom-ngon-ngat-ngay-an-mot-lan-la-ghien-6.jpg" style="height:300px; width:400px" /></p>

<p>Bước 4: Thành phẩm</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2018/07/21/1103135/cach-lam-bun-dau-mam-tom-ngon-ngat-ngay-an-mot-lan-la-ghien-9.jpg" style="height:193px; width:400px" /></p>
', 1, CAST(N'2021-12-14T22:00:37.713' AS DateTime), N'~/Content/img/bun-dau-mam-tom-da-nang-mon-an-tu-tin-danh-thuc-da-day-cua-ban-6_14122021100037.jpg', N'Món bún đậu mắm tôm tuy có nhiều thành phần nguyên liệu nhưng lại vô cùng dễ làm và là món ăn kết nối gia đình vào dịp cuối tuần thật thú vị, chúng ta hãy cùng vào bếp và làm ngay thôi!', 20, 30, 2)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (117, 1, 11, N'Bánh canh cua', N'<p><strong>Cách chọn mua cua tươi ngon, thịt chắc:</strong></p>

<ul>
	<li>Khi lựa cua, người mua cần bóp vào mai, yếm của cua để xem có cứng hay không, nếu cứng thì chứng tỏ là cua chắc thịt. Ngược lại thì cua đó ốp thịt hoặc ít thịt.</li>
	<li>Thực hiện thao tác bóp nhẹ vào phần đùi của que dầm bơi, dưới bộ phận mai cua, nếu cua có dấu hiệu giãy giụa toàn bộ que thì nó là cua còn khỏe và thịt ngon.</li>
	<li>Xem mài của lớp da khuỷu trên của càng cua. Nếu có màu hồng đỏ hoặc màu hồng sậm thì cua nhiều thịt.</li>
</ul>

<p><strong>Cách chọn mua chân giò heo ngon:</strong></p>

<ul>
	<li>Nên chọn mua chân giò sau vì chân giò sau thường có nhiều thịt, khi ăn vào giòn nhưng không bị ngấy và có giá trị dinh dưỡng cao hơn chân giò trước.</li>
	<li>Dùng tay ấn vào để thử độ đàn hồi, nếu cảm giác thấy miếng thịt khô và có độ đàn hồi tốt thì đó là chân giò mới.</li>
	<li>Quan sát xem phần móng giò có còn nguyên vẹn hay không và chú ý màu sắc của móng, móng phải có màu hồng nhạt và khi ngửi không có mùi hôi thối mới là chân giò ngon</li>
</ul>

<p><strong>Bước 1: </strong><strong>Làm bánh canh</strong></p>

<p>Cho bột gạo, bột năng, một ít muối và 500ml nước nóng già vào thau để nhào bột. Cho nước nóng già vào hỗn hợp bột và nhào mịn đến khi thấy bột không dính tay nữa thì mang ra cán thật mỏng và cắt sợi.</p>

<p>Đun sôi một nồi nước, thả bánh canh vừa cắt vào luộc đến khi sợi bánh canh nổi lên thì vớt ra ngâm vào nước lạnh.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2019/07/01/1176655/136029-chuan-bi-nguyen-lieu-cho-mon-banh-canh-bot-loc-660x496.jpg" style="height:301px; width:400px" /></p>

<p><strong>Bước 2: Sơ chế cua</strong></p>

<p>Cua biển mua về rửa sạch, hấp chín, gỡ lấy phần thịt và gạch để riêng. Cho hành băm nhuyễn vào chảo phi thơm với dầu ăn, rồi xào thịt cua cùng ít mắm, tiêu cho thơm.</p>

<p>Gạch cua bạn cũng phi hành khô, xào qua, để riêng.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2019/07/01/1176655/lam-cha-cua-1.jpg" style="height:335px; width:500px" /></p>

<p><strong>Bước 3: Sơ chế các nguyên liệu khác</strong></p>

<p>Nấm rơm rửa sạch, ngâm nước muối loãng, bổ dọc, cho vào chảo xào qua.</p>

<p>Thịt chân giò luộc chín, thái khoanh. Trứng cút luộc chín rồi bóc vỏ.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2019/07/01/1176655/cach-bao-quan-nam-rom-1.jpg" style="height:225px; width:400px" /></p>

<p><strong>Bước 4: Nấu nước dùng</strong></p>

<p>Xương lợn chần qua nước sôi, rửa sạch rồi cho vào nồi nước lạnh ninh lấy nước dùng. Phi hành thơm vào nồi và đổ nước hầm xương vào.</p>

<p>Sau khi nêm nếm vừa ăn thì đợi đến lúc nước sôi nhẹ và cho nấm rơm vào cùng.</p>

<p>Hòa một ít bột năng đổ từ từ vào nồi nước dùng, vừa đổ vừa khuấy đều để tạo độ sánh.</p>

<p>Xếp bánh canh ra bát, cho thịt chân giò, thịt cua, gạch cua, trứng cút lên trên. Chan nước dùng rồi rắc hành, mùi, hạt tiêu lên trên và thưởng thức.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2019/07/01/1176655/cach-nau-banh-canh-cua-bien-05.jpg" style="height:270px; width:404px" /></p>

<h3><strong>Thành phẩm</strong></h3>

<p>Bánh canh cua thơm ngon, hấp dẫn, nước dùng thanh ngọt kết hợp với thịt cua dai chắc và sợi bánh canh mềm không bị cứng chắc chắn sẽ khiến bạn hài lòng.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2019/07/01/1176655/banh-canh-cua-dong-1.jpg" style="height:241px; width:500px" /></p>
', 1, CAST(N'2021-12-14T22:13:24.183' AS DateTime), N'~/Content/img/thumbcmscn-1200x676-4_14122021101324.jpg', N'Bánh canh cua là một món ăn hết sức thân thuộc với mọi người. Hương vị sợi bột bánh canh dai dai kết hợp cùng nước dùng ngọt thanh của cua đã mang đến vị ngon khó chối từ của món ăn này. Cùng vào bếp thực hiện ngay món nước đơn giản này nhé!', 20, 50, 3)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (118, 1, 2, N'Bánh xèo miền Trung', N'<h2><strong>Cách chọn mua nấm hương (nấm đông cô) ngon chất lượng</strong></h2>

<ul>
	<li>Đối với nấm đông cô khô: Bạn nên chọn nấm không bị đứt gãy và phần mũ nấm có màu nâu sáng. Ngoài ra, bạn không nên mua nấm có mùi lạ hoặc xuất hiện các vết mốc màu trắng.</li>
	<li>Đối với nấm đông cô tươi: Nên mua nấm không bị dập nát và có kích thước vừa phải. Bạn ưu tiên chọn nấm có phần mũ cúp chặt và màu hơi vàng nâu. Đồng thời, nên chọn những cây nấm có hương thơm đặc trưng, tự nhiên.</li>
</ul>

<h2><strong>Cách làm</strong></h2>

<h2><strong>Bước 1: Trộn bột bánh xèo</strong></h2>

<p>Cho vào <a href="https://www.dienmayxanh.com/chen-bat-to-canh" target="_blank">tô</a> 500gr bột bánh xèo cốt dừa, 100ml bia, 1 muỗng cà phê muối, 1/3 muỗng cà phê bột nghệ, 1/2 muỗng cà phê bột ngọt, 2 quả trứng gà, 50gr hành lá cắt nhỏ, 450ml nước lọc.</p>

<p>Khuấy đều hỗn hợp đến khi bột tan hoàn toàn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/tron-bot-banh-xeo.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/tron-bot-banh-xeo-1.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 2: Chuẩn bị nhân bánh xèo</strong></h2>

<p>Đầu tiên, bạn rửa sạch tôm, lột vỏ và bỏ chỉ đen.</p>

<p>Sau đó, lột vỏ hành tây rồi thái sợi. Đem 50gr nấm hương đi ngâm mềm, rửa lại với nước sạch rồi cắt nhỏ.</p>

<p>Kế đến, lột vỏ tỏi và hành tím, rửa sơ rồi băm nhỏ. Cà rốt gọt vỏ, rửa sạch rồi bào sợi, chừa lại 1 ít để cắt khoanh nhỏ làm nước mắm.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/chuan-bi-nhan-banh-xeo.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/chuan-bi-nhan-banh-xeo-1.jpg" style="height:400px; width:400px" /></p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/chuan-bi-nhan-banh-xeo-3.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 3: Xào nhân bánh xèo</strong></h2>

<p>Bắc chảo lên bếp, cho vào chảo 1 ít dầu ăn rồi cho hành tím băm vào phi thơm.</p>

<p>Khi hành thơm, bạn cho tôm, thịt vào chảo cùng 1/2 muỗng cà phê tiêu, 1/2 muỗng cà phê bột ngọt, 1/3 muỗng cà phê muối, 1 muỗng cà phê nước mắm. Xào đều nhân với lửa vừa đến khi chín hoàn toàn.</p>

<p>Kế đến, cho vào chảo hành tây, cà rốt, nấm hương và tiếp tục xào đến khi rau củ chín.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/xao-nhan-banh-xeo-3.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/xao-nhan-banh-xeo-2.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 4: Đổ bánh xèo</strong></h2>

<p>Bắc chảo mới lên bếp, cho vào 1 ít dầu ăn và làm nóng. Khi dầu nóng, bạn cho vào 1 ít hỗn hợp bột bánh rồi tráng thật đều.</p>

<p>Kế đến, cho nhân lên trên lớp bột bánh, dàn đều phần nhân và cho 1 ít giá lên mặt bánh rồi gấp đôi bánh lại. Chiên bánh với lửa nhỏ đến khi 2 mặt vàng giòn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/do-banh-xeo.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 5: Làm nước chấm bánh xèo</strong></h2>

<p>Cho vào tô 3 muỗng canh nước mắm, 6 muỗng canh nước lọc, 1/4 muỗng cà phê bột ngọt, 5 muỗng cà phê đường, nước cốt của 2 quả chanh, 2 muỗng cà phê giấm, 1 ít tiêu, cà rốt cắt khoanh, 1 ít tỏi, ớt băm.</p>

<p>Khuấy đều hỗn hợp đến khi đường tan là hoàn tất. Bạn có thể nêm nếm lại hoặc thêm ớt cho phù hợp với khẩu vị gia đình.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/lam-nuoc-cham-banh-xeo-1.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Thành phẩm</strong></h2>

<p>Bánh xèo miền Bắc với nấm hương có lớp vỏ giòn rụm, thơm nhẹ ăn kèm cùng nhân tôm thịt bùi béo và rau củ ngọt thanh, chấm với nước mắm chua ngọt, cay cay, siêu ngon miệng.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/04/CookRecipe/GalleryStep/thanh-pham-1315.jpg" style="height:400px; width:400px" /></p>
', 1, CAST(N'2021-12-14T22:28:27.253' AS DateTime), N'~/Content/img/banh-xeo-mien-bac_14122021102827.jpg', N'Bánh xèo là một món ăn bình dị nhưng rất hấp dẫn, thơm ngon. Mỗi vùng miền sẽ có cách làm bánh xèo riêng. Hôm nay, Điện máy XANH sẽ hướng dẫn các bạn 2 cách làm bánh xèo miền Bắc để chiêu đãi cả nhà vào những dịp cuối tuần. Cùng vào bếp thực hiện món bánh này nhé!', 40, 90, 4)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (119, 1, 2, N'Cánh gà chiên nước mắm', N'<h2><strong>Bước 1 (sơ chế nguyên liệu):</strong> </h2>

<p>Cánh gà rửa nước sạch, sau đó rửa lại với nước muối pha loãng cho hết mùi hôi rồi các bạn đem thấm khô, cho vào lò vi sóng quay ít phút (hoặc có thể luộc qua). Làm như vậy bạn cánh gà khi rán sẽ mau chín, tiết kiệm được thời gian rán. Tỏi băm nhỏ.</p>

<h2><strong>Bước 2:</strong> </h2>

<p>Cho cánh gà vào rán ngập dầu với mức lửa to, đến khi lớp da gà có độ giòn và chuyển màu vàng ruộm thì vớt ra. Lót giấy thấm dầu cho bớt độ béo.</p>

<p><img alt="" src="http://imgs.vietnamnet.vn/Images/2016/12/09/08/20161209085123-ga2.jpg" style="height:257px; width:400px" /></p>

<h2><strong>Bước 3:</strong> </h2>

<p>Đem phi thơm tỏi với 1 chút dầu ăn. Khi tỏi thơm hạ lửa nhỏ, cho vào chảo đường và nước mắm theo tỉ lệ: 1:1 (cứ 1 thìa nước mắm kèm một thìa đường). Sau khi ước lượng nước mắm và đường vừa đủ, bật lửa to trở lại rồi thả cánh gà vào, cầm cán chảo lắc qua lắc lại cho hỗn hợp tỏi-mắm-đường ngấm đều. Khi thấy món ăn chuyển màu vàng sánh thì tắt bếp, gắp cánh gà ra đĩa trình bày</p>

<p><img alt="" src="http://imgs.vietnamnet.vn/Images/2016/12/09/08/20161209085123-ga3.jpg" style="height:340px; width:510px" /></p>

<p>Món cánh gà chiên nước mắm có hương vị rất đặc trưng và thơm ngon khiến bất cứ ai cũng phải "ứa nước miếng".</p>

<p>Chúc các bạn thành công với món cánh gà chiên nước mắm này nhé!</p>
', 1, CAST(N'2021-12-14T22:34:11.180' AS DateTime), N'~/Content/img/canh-ga-chien-nuoc-mam-600x400-1_14122021103411.jpg', N'Thay vì những cách chế biến thông thường với thịt gà như: Luộc, rán, rang,… bạn có thể thay đổi bằng món cánh gà chiên nước mắm cho bữa cơm gia đình.

Vị mặn thơm của nước mắm, quyện với tỏi băm và bám đều vào miếng cánh gà khiến cho bất cứ ai khi nhìn thấy món ăn này cũng khó có thể cầm lòng.', 30, 50, 3)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (120, 1, 13, N'Há Cảo', N'<h2><strong>Cách chọn mua củ sắn (củ đậu) tươi ngon</strong></h2>

<ul>
	<li>Bạn nên chọn mua những củ sắn có kích thước vừa hoặc nhỏ, những củ này thường rất giòn ngọt, rất vừa ăn.</li>
	<li>Vỏ củ sắn ngon sẽ có màu nâu sáng, bề mặt vỏ trơn láng, củ còn nguyên vẹn.</li>
	<li>Khi cầm củ sắn lên, bạn có cảm giác chắc tay, ấn vào có cảm giác rất cứng thì nên chọn mua.</li>
	<li>Không mua những củ sắn có kích thước lớn nhưng khi cầm lại có cảm giác nhẹ tay, vì những củ này đã để lâu ngày, hoặc bị già, nhiều xơ và cứng.</li>
	<li>Củ sắn bị dập nát, trên da có xuất hiện những đốm đen, vàng kỳ lạ cũng nên tránh mua, bởi đây là củ sắn sắp bị hư, không dùng được nữa.</li>
</ul>

<h2><strong>Thông tin về bột tàn mì và cách chọn mua</strong></h2>

<ul>
	<li>Bột tàn mì có màu trắng mịn, không chứa gluten và có mùi thơm nhẹ. Khi dùng tay sờ cảm giác được bột trơn láng, mịn.</li>
	<li>Thông thường người ta sử dụng bột tàn mì để chế biến các <a href="https://www.dienmayxanh.com/vao-bep/mon-banh" target="_blank">món bánh</a> ngon như há cảo, bánh pía, bánh bông lan,... hoặc dùng để làm sợi phở, bún, bánh canh,... Bột tàn mì tạo nên màu trắng tinh đẹp mắt cho món ăn, có độ dai mềm và giúp tăng độ nở cho bánh.</li>
	<li>Bạn có thể mua bột tàn mì ở các cửa hàng thực phẩm hoặc cửa hàng chuyên bán nguyên liệu làm bánh. Ngoài ra bạn cũng có thể dễ dàng đặt mua trên các trang thương mại điện tử.</li>
</ul>

<h2><strong>Bước 1: Sơ chế nguyên liệu</strong></h2>

<h3>Củ sắn gọt vỏ, rửa sạch rồi cắt hạt lựu.</h3>

<p>Hành lá nhặt sạch lá hư, bỏ rễ rồi rửa qua với nước, sau đó cắt nhỏ.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-nguyen-lieu-513.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/so-che-nguyen-lieu-514.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 2: Làm nhân tôm thịt</strong></h2>

<p>Cho tôm và thịt băm vào tô, nêm thêm 1 muỗng canh hạt nêm, 1 muỗng canh đường, hành lá cắt nhỏ, 1 muỗng canh dầu mè, 1 muỗng cà phê tiêu cùng phần củ sắn cắt hạt lựu rồi trộn đều lên cho các nguyên liệu hòa quyện.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/lam-nhan-tom-thit-1.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/lam-nhan-tom-thit-3.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 3: Trộn và nhào bột</strong></h2>

<p>Cho vào tô 110gr bột tàn mì, 20gr bột năng rồi trộn đều. Tiếp theo bạn cho 175ml nước sôi vào, trộn đều lên đến khi bột quánh dẻo thì dùng màng bọc thực phẩm bịt kín miệng tô và ủ bột khoảng 5 phút.</p>

<p>Tiếp tục nhào bột nhiều lần cho đến khi bột dẻo mịn là được. Chia bột thành từng phần nhỏ, mỗi phần khoảng 2 ngón tay.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/tron-va-nhao-bot.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/tron-va-nhao-bot-5.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 4: Tạo hình cho bánh</strong></h2>

<p>Lấy 1 phần bột nhỏ, cán mỏng ra thành hình tròn, cho vào giữa bột 1 muỗng cà phê nhân tôm thịt. Gấp các mép bột lại và tạo hình theo ý thích.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/tao-hinh-cho-banh.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/tao-hinh-cho-banh-3.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 5: Hấp bánh</strong></h2>

<p>Cho bánh vào nồi hấp và hấp khoảng 10 phút với lửa lớn đến khi bột trong lại, bánh dậy mùi thơm là hoàn thành.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/hap-banh-5.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Thành phẩm</strong></h2>

<p>Những chiếc bánh há cảo nhân tôm thịt ú nu với lớp vỏ trắng trong, nhìn cực hấp dẫn. Cắn một miếng bánh đầy ụ nhân bạn sẽ cảm nhận được hương vị thơm ngon, mặn ngọt đậm đà mà món ăn này mang đến.</p>

<p>Há cảo ăn đúng bài sẽ dùng kèm với nước tương pha một chút giấm, thêm chút rau răm, dưa leo để tăng hương vị, bạn nhất định phải thử đó nha!</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/07/CookRecipe/GalleryStep/thanh-pham-1272.jpg" style="height:400px; width:400px" /></p>

<p> </p>
', 1, CAST(N'2021-12-14T22:44:41.293' AS DateTime), N'~/Content/img/cach-lam-hacao-suicao-ngon-thm_14122021104441.jpg', N'Há cảo hấp nhân tôm thịt vừa thơm ngon, hấp dẫn lại đơn giản, dễ làm bạn có muốn thử không? Để HomeRecipes mách bạn công thức làm món hấp này để chiêu đãi cả nhà nhé. Còn bây giờ thì mua nguyên liệu và cùng vào bếp thôi nào!', 30, 45, 3)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (121, 1, 11, N'Cháo lòng gà', N'<h2>Cách chọn mua lòng gà tươi ngon</h2>

<ul>
	<li>Nếu mua lòng gà ngoài chợ, bạn cần chú ý đến màu sắc của bộ bòng. Lòng mới có phần mề màu đỏ hồng, gan không bị thâm và không có mùi hôi.</li>
	<li>Trường hợp gan và mề thâm xỉn thì đó là lòng bị nhiễm bệnh hay đã để lâu nên tuyệt đối không lựa chọn.</li>
</ul>

<h2><strong>Bước 1: Sơ chế lòng gà</strong></h2>

<p>Khi làm lòng gà bạn moi hết phân ở mề và lòng ra sau đó cạo, tránh cho nước vào khi đó sẽ khó cạo lớp vỏ bám ở mề.</p>

<p>Sau đó bạn cho nước rửa sạch sau đó bóp với muối trắng. Bóp và rửa lại với nước cho sạch hẳn. Bạn có thể cho 1 ít giấm ăn xoa đều bóp trong vòng 2 phút giúp mề gà sạch và hết mùi hôi.</p>

<p>Với các bộ phận khác chỉ cần bạn cho ít muối bóp rồi rửa lại với nước là được.</p>

<p>Sau khi làm sạch cắt lòng thành từng miếng nhỏ vừa ăn. Mỡ gà ta cũng rửa sạch, để ráo và cắt thành miếng nhỏ.</p>

<h2><strong>Bước 2: Xào lòng gà</strong></h2>

<p>Bắc chảo lên bếp, đến khi chảo nóng hẳn ta cho phần mỡ gà đã để ráo. Xào mỡ gà đến khi tan hết. Sau đó tiếp tục cho lòng gà vào chảo mỡ.</p>

<p>Nêm vào chảo 1 muỗng cà phê muối, 2 muỗng cà phê hạt nêm, 1 muỗng cà phê bột ngọt đảo đều trên chảo khoảng 5 phút đến khi lòng gà đã săn lại thì tắt bếp.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/09/CookRecipe/GalleryStep/xao-long-ga-1.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 3: Nấu cháo</strong></h2>

<h3>Cho 100gr gạo vào <a href="https://www.dienmayxanh.com/chen-bat-to-canh" target="_blank">tô</a> dùng tay vo sạch với 3 lần nước để loại bỏ bụi bẩn có trong gạo (lượng gạo có thể thay đổi phù hợp với khẩu phần ăn).</h3>

<p>Sau đó cho 1 lít nước và gạo đã vo sạch vào <a href="https://www.dienmayxanh.com/noi" target="_blank">nồi</a>, nấu khoảng 15 phút. Sau đó hạ lửa nhỏ nấu thêm 5 phút để hạt cháo bung đều, đẹp mắt.</p>

<p>Khi cháo trắng đã chín ta cho chảo lòng gà đã xào vào nồi cháo, đảo đều. Nêm lại cho vừa ăn rồi tắt bếp.Cho thêm ít tiêu xay và hành lá cắt nhỏ là món cháo thơm ngon đã hoàn thành.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/09/CookRecipe/GalleryStep/nau-chao-13.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/09/CookRecipe/GalleryStep/nau-chao-14.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Thành phẩm</strong></h2>

<p>Món lòng gà nấu cháo là món ăn chẳng còn xa lạ gì với mâm cơm gia đình Việt. Những miếng lòng thấm đều gia vị hòa quyện cùng với cháo gạo ấm nóng, sền sệt.</p>

<p>Từ những nguyên liệu thân quen lại tạo ra được món ngon không thể chối từ.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/09/CookRecipe/GalleryStep/thanh-pham-200.jpg" style="height:400px; width:400px" /></p>
', 1, CAST(N'2021-12-14T22:51:29.837' AS DateTime), N'~/Content/img/chao-long-ga_14122021105129.jpg', N'Món cháo lòng gà thơm ngon bổ dưỡng, ấm nóng sền sệt giúp xoa dịu dạ dày bạn một cách hoàn hảo nhất. Nhanh tay cùng vào bếp cùng HomeRecipes thực hiện ngay món cháo này nhé.', 10, 40, 4)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (122, 1, 11, N'Canh rong biển', N'<h2><strong>Bước 1: Sơ chế nguyên liệu</strong></h2>

<p>Ngâm rong biển khô vào nước lạnh, khoảng 20 phút, cho rong biển nở đều, sau đó vớt ra để ráo và cắt miếng nhỏ vừa ăn.</p>

<p>Thịt bò rửa sạch, thái miếng nhỏ, ướp với 1 muỗng canh nước tương, 1 ít hạt tiêu, 1 muỗng canh rượu trắng và trộn cho thịt bò ngấm đều gia vị.</p>

<p>Tỏi bóc vỏ, băm nhuyễn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2020/07/CookRecipe/GalleryStep/so-che-nguyen-lieu-328.jpg" style="height:300px; width:400px" /></p>

<h2><strong>Bước 2: Xào thịt bò và rong biển</strong></h2>

<p>Cho 1/2 muỗng canh dầu ăn vào nồi, cho thịt bò vừa ướp vào, bật lửa to để đảo cho thịt bò chín tái.</p>

<p>Tiếp theo cho rong biển vào xào cùng, nhớ đảo đều cho rong biển và thịt bò ngấm gia vị.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2018/08/05/1106794/huong-dan-chi-tiet-cach-nau-canh-rong-bien-chuan-vi-han-quoc-cuc-ngon.jpeg" style="height:299px; width:400px" /></p>

<h2><strong>Bước 3: Nấu canh</strong></h2>

<p>Cho nước vào nồi xào rong biển thịt bò để nấu thành canh, chỗ này bạn cho nước vừa đủ để ăn thôi nhé.</p>

<p>Tỏi đã băm nhuyễn cho vào nồi canh rong biển.</p>

<p>Tiếp tục nấu sôi khoảng 15 phút thì tắt bếp. Bạn có thể nêm nếm lại cho vừa với khẩu vị của gia đình nhé!</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2018/08/05/1106794/huong-dan-chi-tiet-cach-nau-canh-rong-bien-chuan-vi-han-quoc-cuc-ngon-1.jpg" style="height:300px; width:400px" /></p>

<h2>Thành phẩm</h2>

<p>Như vậy bạn đã hoàn thành món canh rong biển chuẩn vị Hàn Quốc thơm ngon rồi. Việc còn lại là trút ra tô và thưởng thức ngay thôi!</p>
', 1, CAST(N'2021-12-14T22:58:04.280' AS DateTime), N'~/Content/img/CANHRONGBIENCachnaucanhrongbienthomngonBepCuaVo0-8screenshot_14122021105804.jpg', N'Canh rong biển là món canh truyền thống của người Hàn Quốc, thường được nấu trong dịp sinh nhật, tượng trưng cho sự an lành hạnh phúc. Cùng vào bếp với HomeRecipes ngay để nấu món canh rong biển thơm ngon này nhé!', 15, 20, 3)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (123, 1, 2, N'Trứng chiên', N'<h2><strong>Cách chọn mua trứng gà ngon</strong></h2>

<ul>
	<li>Hãy chọn mua những quả trứng có vỏ dày, không quá to, chúng thường tươi mới hơn những quả vỏ mỏng, to.</li>
	<li>Nếu quan sát thấy vỏ trứng quá nhẵn bóng, đó là những quả đã được bảo quản lâu, ăn vào có thể ảnh hưởng xấu đến sức khỏe.</li>
	<li>Đối với những trứng gà có vỏ ngoài cứng, bạn hãy quan sát xem có một lớp phấn mỏng bao quanh vỏ hay không, nếu có là trứng tươi.</li>
	<li>Để kiểm tra trứng còn mới hay không, bạn hãy lắc nhẹ, nếu không có sự chuyển động là trứng còn mới, nếu chuyển động mạnh, trứng đã cũ.</li>
	<li>Một cách khác để xem trứng có còn tươi mới hay không, bạn có thể cho trứng vào thau nước muối pha loãng, trứng còn mới sẽ chìm xuống đáy thau, nằm ngang.</li>
	<li>Hiện nay đang xuất hiện trứng gà giả, trứng gà tẩy trắng, trứng gà Trung Quốc trên thị trường, hãy mua trứng ở chợ, cửa hàng, siêu thị uy tín để đảm bảo chất lượng của trứng nhé!</li>
</ul>

<h2><strong>Bước 1: Sơ chế nguyên liệu</strong></h2>

<p>Rửa sạch nguyên liệu. Tỏi, ớt bạn dùng <a href="https://www.dienmayxanh.com/dao-lam-bep" target="_blank">d</a>ao băm nhuyễn, hành lá cắt nhỏ. Sau đó bạn đập trứng cho vào <a href="https://www.dienmayxanh.com/chen-bat-to-canh" target="_blank">tô</a>, thêm 1/2 muỗng cà phê muối và 1/2 muỗng cà phê tiêu xay vào.</p>

<p>Dùng cây đánh trứng đánh tan hỗn hợp. Bạn nên đánh trứng thật đều tay đến khi thấy trứng nổi bọt thì ngừng, cách này giúp trứng khi ăn sẽ mềm và mịn hơn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/so-che-nguyen-lieu-312.jpg" style="height:400px; width:400px" /><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/so-che-nguyen-lieu-314.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 2: Chiên trứng</strong></h2>

<p>Bắc <a href="https://www.dienmayxanh.com/chao-chong-dinh" target="_blank">chảo</a> lên bếp, để lửa thật nhỏ, cho 1 muỗng canh dầu ăn vào chảo, chờ dầu sôi bạn cho trứng vào. Rồi rắc thêm 1 ít hành và ớt băm lên trên trứng, giúp món trứng chiên trông đẹp mắt hơn.</p>

<p>Bạn đậy nắp chảo, chiên khoảng 3 phút, tắt bếp, chờ 1 phút hãy mở nắp ra, cách này giúp trứng chín đều cả 2 mặt. Sau đó bạn lấy trứng đặt ra <a href="https://www.dienmayxanh.com/thot" target="_blank">thớt</a>, dùng dao cắt thành các hình tam giác bằng nhau.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/chien-trung-29.jpg" style="height:400px; width:400px" /></p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/chien-trung-28.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 3: Làm trứng chiên nước mắm</strong></h2>

<p>Bạn cho vào chén 4 muỗng canh nước mắm, 4 muỗng canh đường, 1/2 muỗng cà phê bột ngũ vị hương, 1 chút tiêu xay, 1 muỗng canh tương ớt, rồi dùng muỗng trộn đều hỗn hợp.</p>

<p>Bắc bếp với lửa thật nhỏ, cho vào chảo 2 muỗng canh dầu màu điều, cho tỏi băm nhuyễn vào phi đến khi vàng thơm, tiếp tục cho phần nước sốt đã pha chế vào, nấu khoảng 2 phút.</p>

<p>Sau đó cho trứng chiên vào, rắc thêm 1 chút hành lá và ớt và nấu khoảng 3 phút, để ra đĩa và thưởng thức.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/lam-trung-chien-nuoc-mam.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Thành phẩm</strong></h2>

<p>Trứng chiên mềm mịn hòa quyện với nước sốt mặn ngọt ăn kèm với cơm sẽ làm bữa ăn gia đình bạn thêm ngon miệng, hấp dẫn hơn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/thanh-pham-1010.jpg" style="height:400px; width:400px" /></p>
', 1, CAST(N'2021-12-14T23:04:52.897' AS DateTime), N'~/Content/img/Tong-hop-15-cach-lam-trung-chien-ngon-don-gian-hap-dan-de-lam-cho-bua-com-1-1200x676_14122021110452.jpg', N'Trứng chiên là một món chiên vô cùng quen thuộc và được biến tấu theo nhiều cách làm khác nhau cho nhiều món ngon với mùi vị đa dạng. Hôm nay, hãy cùng vào bếp với HomeRecipes để thực hiện ngay 2 món trứng chiên nước mắm và nước tương thơm ngon, lạ miệng với các bước cực kỳ đơn giản ngay sau đây nhé!', 7, 10, 2)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (124, 1, 1, N'Bún thịt nướng', N'<h2><strong>Mẹo chọn mua nguyên liệu tươi ngon</strong></h2>

<ul>
	<li>Để thịt nướng ngon, trước tiên bạn phải chọn thịt tươi bằng cách quan sát màu sắc của miếng thịt có màu hồng tươi, không quá đỏ cũng không quá nhạt. Còn những thịt heo ôi sẽ có màu nhạt, ngả xanh và có mùi hôi.</li>
	<li>Thịt heo ngon có độ săn chắc và đàn hồi cao. Khi chọn thịt bạn hãy nhấn ngón tay vào thịt, nếu thịt đàn hồi trở lại ngay, không nhớt, không chảy nước hay dịch thì đó là miếng thịt ngon.</li>
	<li>Bạn nên chọn thịt vai hoặc thịt ba chỉ để nướng ngon hơn.</li>
	<li>Thịt phải có 20% - 30% là mỡ, vì thịt nạc quá nước sẽ bị khô còn thịt nhiều mỡ quá sẽ bị béo quá gây khó ăn.</li>
	<li>Chọn phần thịt của heo non, có phần da mỏng vì da nướng lên rất là dai.</li>
</ul>

<h2><strong>Bước 1: Sơ chế và ướp thịt</strong></h2>

<p>Thịt heo mua về bạn đem đi rửa sạch, có thể rửa với nước muối pha loãng để thịt sạch hơn nhé. Sau khi rửa xong, bạn dùng dao bén tách da heo ra khỏi phần thịt.</p>

<p>Sau đó, cắt thịt thành từng miếng vừa ăn dày khoảng 3mm.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2020/04/20/1250324/cach-lam-bun-thit-nuong-tai-nha-don-gian-thom-ngo-2.jpg" style="height:239px; width:400px" /></p>

<h2><strong>Bước 2: Sơ chế các nguyên liệu khác</strong></h2>

<p>6 tép tỏi và 1 quả ớt đem rửa sạch, băm nhuyễn. Hành tím lột vỏ, rửa sạch, băm nhuyễn2 cây sả rửa sạch, băm nhuyễn</p>

<p>Sau đó, bạn lấy 1/2 phần tỏi băm, sả băm, hành tím băm cho vào một túi vải và bóp hết nước ra lấy nước cốt cho vào trong tô thịt.</p>

<p>Giá đỗ rửa sạch. Dưa leo cắt thành từng sợi nhỏ. Đồ chua bạn có thể mua ở ngoài chợ hoặc tự làm ở nhà bằng cách bào đu đủ, su hào, cà rốt thành sợi vào một cái bát nhỏ. Sau đó cho 2 muỗng đường, 1/4 muỗng muối, 3 muỗng giấm và trộn đều lên để khoảng 15 phút là có thể sử dụng được.</p>

<p>Rau xà lách rửa sạch, sau đó<strong> </strong>đem thái thành những sợi có chiều dài tùy ý, chiều rộng từ 3 - 4 cm.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2020/04/20/1250324/cach-lam-bun-thit-nuong-tai-nha-don-gian-dam-da-thom-ngon-nuc-mui.jpg" style="height:239px; width:400px" /></p>

<h3><strong>Bước 3: Ướp thịt</strong></h3>

<p>Trộn phần thịt và nước cốt trên với 1 muỗng nước mắm, 3 muỗng nước tương, 2 muỗng mật ong, 2 muỗng dầu hào, 1 thìa hạt nêm, 1 thìa bột ngọt, 1/4 thìa ngũ vị hương. Rồi để ướp ít nhất 30 phút và thỉnh thoảng đảo lại cho thấm gia vị.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2020/04/20/1250324/cach-lam-bun-thit-nuong-tai-nha-don-gian-thom-ngo-6.jpg" style="height:213px; width:400px" /></p>

<h2><strong>Bước 4: Nướng thịt</strong></h2>

<p>Thịt sau khi ướp xong, bạn đem xiên thành từng que rồi đem đi nướng chín. Nếu không có bếp than, bạn cũng có thể nướng thịt bằng lò vi sóng hay bếp nướng điện nhé!</p>

<p>Lật trở đều thịt cho đến khi thịt chín và có màu nâu đỏ đều 2 bên là được.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2020/04/20/1250324/cach-lam-bun-thit-nuong-tai-nha-don-gian-thom-ngo-8.jpg" style="height:247px; width:400px" /></p>

<h2><strong>Bước 5: Làm nước chấm</strong></h2>

<p>Lấy một cái nồi, cho vào trong 5 muỗng đường, 6 muỗng nước mắm và 200ml nước, đun lên cho đến khi đường hòa tan là được.</p>

<p>Cho phần nước mắm cùng 3 thìa giấm ra chén và khuấy đều lên.</p>

<p>Cho phần tỏi băm còn lại cùng ớt băm đã được chuẩn bị bỏ vào chén nước chấm, khuấy đều chúng lên là ta đã hoàn thành chén nước chấm rồi.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2020/04/20/1250324/cach-lam-bun-thit-nuong-tai-nha-don-gian-thom-ngo-11.jpg" style="height:213px; width:400px" /></p>

<h2><strong>Bước 6: Hoàn thành</strong></h2>

<p>Trước khi trình bày món bún thịt nướng, chúng ta sẽ làm một chén mỡ hành trước. Bạn đem hành lá đi cắt nhỏ hình hạt lựu rồi bỏ vào chén. Đun nửa chén dầu cho nóng rồi đổ vào chén hành lúc nãy, thế lá xong chén mỡ hành rồi.</p>

<p>Sau khi thịt nướng xong và chén nước mắm đã hoàn thành. Bạn cho một ít bún và thịt nướng tùy sức ăn của bạn vào tô. Sau đó cho lên trên một ít sau sống, một ít thịt, đồ chua, rưới lên thịt ít mỡ hành, rắc đậu phộng lên rồi ăn kèm với nước mắm vừa pha.</p>

<h2><strong>Thành phẩm</strong></h2>

<p>Vậy là sau nhiều công đoạn chúng ta đã có một tô bún thịt nướng đầy đủ dinh dưỡng có cả thịt lẫn rau, thịt có vị đậm đà, thơm hương của sả và hành, ăn cùng với rau xà lách, dưa leo, ít rau thơm và đồ chua sẽ được cân bằng lại hương vị giúp ta không bị ngán, chấm cùng với nước mắm chua ngọt thêm một ít vị cay nữa thì ngon hết xảy luôn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/Files/2020/04/20/1250324/cach-lam-bun-thit-nuong-tai-nha-don-gian-dam-da-thom-ngon-nuc-mui-1.jpg" style="height:239px; width:400px" /></p>
', 1, CAST(N'2021-12-14T23:14:23.450' AS DateTime), N'~/Content/img/bun-thit-nuong--_1628435068_14122021111423.jpg', N'Bạn lỡ nghiền món bún thịt nướng thơm ngon, hấp dẫn ở ngoài hàng nhưng lại chưa biết làm như thế nào. Đừng lo, hãy áp dụng công thức dưới đây rồi vào bếp làm thử xem có ngon hơn ngoài tiệm không nhé!', 30, 60, 4)
INSERT [dbo].[Food] ([IDFood], [IDTheLoai], [IDMethod], [TenMonAn], [NoiDung], [UserID], [NgayTao], [Image], [TieuDe], [ActiveTime], [TotalTime], [Yield]) VALUES (125, 1, 10, N'Thịt luộc cuốn bánh tráng', N'<p><strong>Cách chọn mua thịt heo tươi ngon</strong></p>

<ul>
	<li>Miếng thịt ngon phải khô, không chảy nhớt, không có mùi hôi lạ và màu sắc hồng hào bình thường.</li>
	<li>Nên mua những khối thịt săn chắc, có độ đàn hồi cao và các thớ thịt đều.</li>
	<li>Nếu ấn ngón tay vào phần thịt thấy thịt không còn thấy đàn hồi thì là thịt cũ, không nên mua nhé.</li>
	<li>Không mua thịt heo có lớp nạc sát da, màu đỏ tươi vì đây thường là thịt từ những con heo được tiêm một loại chất kích thích sinh trưởng.</li>
	<li>Tốt hơn hết bạn hãy mua thịt heo ở những nơi uy tín, thịt có nguồn gốc rõ ràng nhé.</li>
</ul>

<p><strong>Cách chọn mua rau xà lách tươi ngon</strong></p>

<ul>
	<li>Nên chọn mua cây có cuống dài và dày, phần lá màu xanh tươi, các lớp lá dần về bên trong sẽ có màu xanh trắng, nhạt dần.</li>
	<li>Các lá mướt, cuộn chặt, có hương thơm nhẹ là xà lách ngon.</li>
	<li>Chọn những cây cuống giòn và dễ bẻ gãy, đó là xà lách non, mới hái, tươi và ngọt hơn.</li>
	<li>Không nên chọn mua những cây đã bị dập héo, rách lá, mềm ỉu và màu sắc không còn tươi sáng.</li>
</ul>

<p><strong>Cách chọn mua dưa leo tươi ngon</strong></p>

<ul>
	<li>Nên chọn quả có màu xanh tươi sáng, đều màu, vỏ nhẵn, không có sần sùi, không có vết thâm hay màu ố vàng.</li>
	<li>Quả dưa leo ngon thường thẳng, không hoặc ít bị cong vẹo, thon dài, đặc ruột, cầm lên thấy chắc và nặng tay.</li>
	<li>Hạn chế mua những quả ngắn, tròn, cong nhiều, vỏ có vết ố vàng, có kích thước quá to và cầm lên có cảm giác rỗng nhẹ.</li>
	<li>Tránh mua những quả dưa phình ra, to ở giữa hoặc đầu quả to đuôi quả nhỏ (và ngược lại) bởi đây là những quả dưa già, ruột nhiều hạt và nhiều nước, ăn không ngon.</li>
</ul>

<h2><strong>Bước 1: Sơ chế nguyên liệu</strong></h2>

<p>Để làm sạch và khử mùi, thịt heo mua về bạn rửa sơ rồi xát một ít muối lên bề mặt thịt rồi rửa thịt sạch lại với nước 2 lần rồi để ráo.</p>

<p>Rau ăn kèm, xà lách bạn nhặt lấy lá tươi nguyên, bỏ phần lá dập úng, sâu héo, sau đó ngâm 10 phút với nước muối pha loãng rồi rửa sạch lại qua nước lạnh. Cho rau ra <a href="https://www.dienmayxanh.com/thau-ro-gao-nuoc?g=ro" target="_blank">rổ</a> để ráo nước.</p>

<p>Dưa leo mua về bạn rửa thật sạch, có thể bào bỏ vỏ hay không tuỳ thích. Bạn cắt dưa leo thành từng lát mỏng dài khoảng 1 ngón tay, cho ra <a href="https://www.dienmayxanh.com/chen-bat-dia" target="_blank">đĩa</a>.</p>

<p>Tỏi bạn bóc vỏ, rửa sạch cùng ớt rồi băm nhuyễn.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/B11.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 2: Luộc và cắt thịt</strong></h2>

<p>Thịt sau khi đã sơ chế sạch và khử mùi hôi, bạn cho thịt vào <a href="https://www.dienmayxanh.com/noi" target="_blank">nồi</a> nước cùng 2 củ hành tím cắt nhỏ và để lửa trung bình, luộc thịt trong khoảng 30 phút.</p>

<p>Sau thời gian luộc, bạn kiểm tra bằng cách lấy đầu <a href="https://www.dienmayxanh.com/dua" target="_blank">đũa</a> xiên qua miếng thịt thấy không còn chảy máu đỏ nữa, thịt mềm săn là thịt đã chín. Tắt bếp, vớt thịt ra đĩa đợi cho thịt nguội bớt.</p>

<p>Khi thịt đã nguội bớt, bạn cắt thịt thành lát mỏng đều nhau rồi xếp thịt ra đĩa nhé.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/B21.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Bước 3: Pha nước chấm và hoàn thành</strong></h2>

<p>Bạn pha vào <a href="https://www.dienmayxanh.com/chen-bat-chen-com" target="_blank">chén</a> 3 muỗng canh nước mắm, 2 muỗng canh đường, 3 muỗng canh nước lọc, 1/2 quả chanh vắt lấy nước cốt, vắt vào 1 quả tắc và cho tỏi ớt băm nhuyễn vào, khuấy đều cho đường tan hết. Nêm nếm lại và gia giảm cho hợp khẩu vị gia đình mình nhé.</p>

<p>Bạn cho 1 miếng bánh tráng lên mặt phẳng, thoa đều một chút nước cho bánh mềm dai. Xếp 1 hàng thịt theo chiều ngang lên phần rìa bánh, sau đó đến 1 lớp xà lách, rau ăn kèm, dưa leo và thêm chút bún tươi.</p>

<p>Cuối cùng thêm vài lát thịt nữa rồi bạn cuốn chặt tay, gấp 2 mép cuốn vào cho gọn đẹp rồi cuốn tròn cho đến hết bánh.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/B31.jpg" style="height:400px; width:400px" /></p>

<h2><strong>Thành phẩm</strong></h2>

<p>Từng cuốn bánh tráng vừa tay, chắc nịch đầy nhân được cuốn đều nhau cực hấp dẫn. Lớp bánh tráng mỏng, dẻo dai bên ngoài cuộn lấy phần thịt heo được luộc chín mềm, rau giòn thơm mọng nước cực bắt vị.</p>

<p>Thịt heo cuốn bánh tráng chấm cùng chút vị chua ngọt the cay của nước mắm khiến món ăn càng hấp dẫn khó cưỡng, bùng nổ hương vị.</p>

<p>Đây là món ăn đơn giản, dễ thực hiện mà không mất quá nhiều thời gian, phù hợp cho dịp cuối tuần quây quần bên gia đình.</p>

<p><img alt="" src="https://cdn.tgdd.vn/2021/05/CookRecipe/GalleryStep/done1.jpg" style="height:400px; width:400px" /></p>
', 1, CAST(N'2021-12-14T23:24:18.153' AS DateTime), N'~/Content/img/thit-luoc-cuon_14122021112418.jpg', N'Thịt heo cuốn bánh tráng đã trở thành món ngon hàng ngày quen thuộc của mọi gia đình Việt bởi vừa dễ ăn, dễ thực hiện lại còn có thể thoả sức sáng tạo, kết hợp các nguyên liệu mà vẫn cung cấp đầy đủ chất dinh dưỡng.', 30, 60, 4)
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (1, N'Thịt Bò', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (2, N'Cá Điêu Hồng', N'con')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (3, N'Bắp Cải', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (6, N'Cá Chép', N'con')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (7, N'Cua biển', N'con')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (8, N'Bột năng', N'g')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (9, N'Xương Heo', N'kg')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (10, N'Nấm rơm', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (11, N'Trứng cút', N'quả')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (12, N'Rong biển', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (13, N'Bắp', N'trái')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (14, N'Hành tây', N'củ')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (15, N'Hành tím', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (16, N'Củ tỏi', N'củ')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (18, N'Gia vị thông dụng', NULL)
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (19, N'Dầu ăn', N'muỗng canh')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (20, N'Nước mắm', N'muỗng canh')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (21, N'Ớt băm', N'muỗng canh')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (22, N'Hành băm', N'muỗng canh')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (23, N'Bánh canh bột gạo', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (24, N'Bánh canh bột gạo khô', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (25, N'Cá lóc', N'con')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (27, N'Đậu hủ chiên', N'miếng')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (28, N'Thịt ba chỉ', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (29, N'Bún tươi', N'kg')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (30, N'Mắm tôm', N'chén')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (31, N'Dưa leo', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (32, N'Chả cốm', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (33, N'Bột gạo', N'kg')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (34, N'Trứng gà', N'quả')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (35, N'Cà rốt', N'củ')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (36, N'Tôm', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (37, N'Bột bánh xèo', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (38, N'Bột nghệ', N'muỗng canh')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (39, N'Giá', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (40, N'Nấm hương', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (41, N'Hành lá', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (42, N'Cánh gà', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (43, N'Đường', N'muỗng')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (44, N'Củ sắn', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (45, N'Dầu mè', N'muỗng canh')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (46, N'Bột tàn mì', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (47, N'Tôm xây', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (48, N'Thịt heo xây', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (49, N'gạo', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (50, N'Nước', N'lít')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (51, N'Lòng gà', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (52, N'Mỡ gà', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (53, N'Sả', N'cây')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (54, N'Mật ong', N'thìa')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (55, N'Đậu phộng rang', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (56, N'Rau sống', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (57, N'Thịt heo', N'gr')
INSERT [dbo].[Material] ([IDNguyenLieu], [TenNL], [DonVi]) VALUES (58, N'Bánh tráng', N'gr')
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'user')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [FullName], [Email], [Password], [RoleID]) VALUES (1, N'admin', N'Quang Pháp', N'abc@gmail.com', N'123', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Food] FOREIGN KEY([IDFood])
REFERENCES [dbo].[Food] ([IDFood])
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_Food]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Material] FOREIGN KEY([IDNguyenLieu])
REFERENCES [dbo].[Material] ([IDNguyenLieu])
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_Material]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_CategoryFood] FOREIGN KEY([IDTheLoai])
REFERENCES [dbo].[CategoryFood] ([IDTheLoai])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_CategoryFood]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_CookingMethod] FOREIGN KEY([IDMethod])
REFERENCES [dbo].[CookingMethod] ([IDMethod])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_CookingMethod]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_User]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_User] FOREIGN KEY([ReaderID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
