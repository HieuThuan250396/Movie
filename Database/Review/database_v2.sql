Create database qldv
go
USE [qldv]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makhachhang] [int] NOT NULL,
	[ho] [nvarchar](50) NOT NULL,
	[tenlot] [nvarchar](50) NOT NULL,
	[ten] [nvarchar](50) NOT NULL,
	[ngaysinh] [date] NOT NULL,
	[gioitinh] [char](2) NOT NULL,
	[sonha] [nvarchar](50) NOT NULL,
	[tenduong] [nvarchar](50) NOT NULL,
	[quan] [nvarchar](50) NOT NULL,
	[thanhpho] [nvarchar](50) NOT NULL,
	[dienthoai] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[matkhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[makm] [int] NOT NULL,
	[ngaybatdau] [datetime] NOT NULL,
	[ngayketthuc] [datetime] NOT NULL,
	[giatri] [float] NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[makm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiVe]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVe](
	[maloaive] [int] NOT NULL,
	[tenloaive] [nvarchar](50) NOT NULL,
	[giave] [int] NOT NULL,
 CONSTRAINT [PK_LoaiGhe] PRIMARY KEY CLUSTERED 
(
	[maloaive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phim]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phim](
	[maphim] [int] NOT NULL,
	[matheloai] [int] NOT NULL,
	[daodien] [nvarchar](50) NOT NULL,
	[tenphim] [nvarchar](50) NOT NULL,
	[ngaykhoichieu] [date] NOT NULL,
	[ngayketthuc] [date] NOT NULL,
	[mota] [nvarchar](200) NOT NULL,
	[hinh] [nvarchar](100) NOT NULL,
	[nhasanxuat] [nvarchar](50) NOT NULL,
	[thoiluong] [int] NOT NULL,
	[trailer] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Phim] PRIMARY KEY CLUSTERED 
(
	[maphim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongChieu]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongChieu](
	[maphong] [int] NOT NULL,
	[tenphong] [nvarchar](50) NOT NULL,
	[soghecontrong] [int] NOT NULL,
	[soghebandau] [int] NOT NULL,
 CONSTRAINT [PK_PhongChieu] PRIMARY KEY CLUSTERED 
(
	[maphong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuatChieu]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuatChieu](
	[masuatchieu] [int] NOT NULL,
	[maphim] [int] NOT NULL,
	[maphong] [int] NOT NULL,
	[giochieu] [time](7) NOT NULL,
	[gioketthuc] [time](7) NOT NULL,
	[ngaychieu] [date] NOT NULL,
 CONSTRAINT [PK_SuatChieu] PRIMARY KEY CLUSTERED 
(
	[masuatchieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[matheloai] [int] NOT NULL,
	[tentheloai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TheLoai] PRIMARY KEY CLUSTERED 
(
	[matheloai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ve]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[mave] [int] NOT NULL,
	[masuatchieu] [int] NOT NULL,
	[makhachhang] [int] NULL,
	[giave] [int] NOT NULL,
	[giochieu] [datetime] NOT NULL,
	[tinhtrang] [bit] NOT NULL,
	[giodat] [datetime] NULL,
	[maloaive] [int] NOT NULL,
	[makm] [int] NULL,
 CONSTRAINT [PK_Ve] PRIMARY KEY CLUSTERED 
(
	[mave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Administrator [dbo].[Administrator]    Script Date: 10/28/2017 1:12:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[taikhoan] [varchar](20) NOT NULL,
	[matkhau] [varchar](20) NOT NULL
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Phim]  WITH CHECK ADD  CONSTRAINT [FK_Phim_TheLoai] FOREIGN KEY([matheloai])
REFERENCES [dbo].[TheLoai] ([matheloai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Phim] CHECK CONSTRAINT [FK_Phim_TheLoai]
GO
ALTER TABLE [dbo].[SuatChieu]  WITH CHECK ADD  CONSTRAINT [FK_SuatChieu_Phim] FOREIGN KEY([maphim])
REFERENCES [dbo].[Phim] ([maphim])
GO
ALTER TABLE [dbo].[SuatChieu] CHECK CONSTRAINT [FK_SuatChieu_Phim]
GO
ALTER TABLE [dbo].[SuatChieu]  WITH CHECK ADD  CONSTRAINT [FK_SuatChieu_PhongChieu] FOREIGN KEY([maphong])
REFERENCES [dbo].[PhongChieu] ([maphong])
GO
ALTER TABLE [dbo].[SuatChieu] CHECK CONSTRAINT [FK_SuatChieu_PhongChieu]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_KhachHang] FOREIGN KEY([makhachhang])
REFERENCES [dbo].[KhachHang] ([makhachhang])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_KhachHang]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_KhuyenMai] FOREIGN KEY([makm])
REFERENCES [dbo].[KhuyenMai] ([makm])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_KhuyenMai]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_LoaiVe] FOREIGN KEY([maloaive])
REFERENCES [dbo].[LoaiVe] ([maloaive])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_LoaiVe]
GO
ALTER TABLE [dbo].[Ve]  WITH CHECK ADD  CONSTRAINT [FK_Ve_SuatChieu] FOREIGN KEY([masuatchieu])
REFERENCES [dbo].[SuatChieu] ([masuatchieu])
GO
ALTER TABLE [dbo].[Ve] CHECK CONSTRAINT [FK_Ve_SuatChieu]


-------------------------------------------------------------------

CREATE UNIQUE INDEX index_khachhang
ON KhachHang (makhachhang)


-----------------------
