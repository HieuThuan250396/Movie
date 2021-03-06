/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [qldv]    Script Date: 12/9/2017 6:04:10 AM ******/
CREATE DATABASE [qldv]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qldv', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MINH\MSSQL\DATA\qldv.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'qldv_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MINH\MSSQL\DATA\qldv_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [qldv] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qldv].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qldv] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qldv] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qldv] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qldv] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qldv] SET ARITHABORT OFF 
GO
ALTER DATABASE [qldv] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [qldv] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qldv] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qldv] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qldv] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qldv] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qldv] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qldv] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qldv] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qldv] SET  ENABLE_BROKER 
GO
ALTER DATABASE [qldv] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qldv] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qldv] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qldv] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qldv] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qldv] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qldv] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qldv] SET RECOVERY FULL 
GO
ALTER DATABASE [qldv] SET  MULTI_USER 
GO
ALTER DATABASE [qldv] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qldv] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qldv] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qldv] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [qldv] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'qldv', N'ON'
GO
ALTER DATABASE [qldv] SET QUERY_STORE = OFF
GO
USE [qldv]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [qldv]
GO
/****** Object:  User [U_nhanvien2]    Script Date: 12/9/2017 6:04:11 AM ******/
CREATE USER [U_nhanvien2] FOR LOGIN [L_nhanvien2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [U_nhanvien1]    Script Date: 12/9/2017 6:04:11 AM ******/
CREATE USER [U_nhanvien1] FOR LOGIN [L_nhanvien1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [R_NhanVien2]    Script Date: 12/9/2017 6:04:11 AM ******/
CREATE ROLE [R_NhanVien2]
GO
/****** Object:  DatabaseRole [R_NhanVien1]    Script Date: 12/9/2017 6:04:11 AM ******/
CREATE ROLE [R_NhanVien1]
GO
ALTER ROLE [R_NhanVien2] ADD MEMBER [U_nhanvien2]
GO
ALTER ROLE [R_NhanVien1] ADD MEMBER [U_nhanvien1]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/9/2017 6:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	[matkhau] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 12/9/2017 6:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[makm] [int] NOT NULL,
	[ngaybatdau] [datetime] NOT NULL,
	[ngayketthuc] [datetime] NOT NULL,
	[giatri] [float] NOT NULL,
	[tinhtrang] [bit] NOT NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[makm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiVe]    Script Date: 12/9/2017 6:04:11 AM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/9/2017 6:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[manv] [int] NOT NULL,
	[taikhoan] [varchar](20) NOT NULL,
	[matkhau] [varchar](20) NOT NULL,
	[vaitro] [char](2) NOT NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phim]    Script Date: 12/9/2017 6:04:11 AM ******/
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
/****** Object:  Table [dbo].[PhongChieu]    Script Date: 12/9/2017 6:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongChieu](
	[maphong] [int] NOT NULL,
	[tenphong] [nvarchar](50) NOT NULL,
	[soghebandau] [int] NOT NULL,
 CONSTRAINT [PK_PhongChieu] PRIMARY KEY CLUSTERED 
(
	[maphong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuatChieu]    Script Date: 12/9/2017 6:04:11 AM ******/
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
	[soghecontrong] [int] NOT NULL,
 CONSTRAINT [PK_SuatChieu] PRIMARY KEY CLUSTERED 
(
	[masuatchieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 12/9/2017 6:04:11 AM ******/
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
/****** Object:  Table [dbo].[Ve]    Script Date: 12/9/2017 6:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ve](
	[mave] [int] NOT NULL,
	[masuatchieu] [int] NOT NULL,
	[makhachhang] [int] NULL,
	[giave] [int] NOT NULL,
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
/****** Object:  Table [dbo].[VeDangDat]    Script Date: 12/9/2017 6:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VeDangDat](
	[mave] [int] NOT NULL,
	[masuatchieu] [int] NOT NULL,
	[makhachhang] [int] NOT NULL,
	[giave] [int] NOT NULL,
	[tinhtrang] [bit] NOT NULL,
	[giodat] [datetime] NOT NULL,
	[maloaive] [int] NOT NULL,
	[makm] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[LoaiVe] ([maloaive], [tenloaive], [giave]) VALUES (1, N'1', 1)
INSERT [dbo].[NhanVien] ([manv], [taikhoan], [matkhau], [vaitro]) VALUES (1, N'minh', N'123', N'1 ')
INSERT [dbo].[NhanVien] ([manv], [taikhoan], [matkhau], [vaitro]) VALUES (2, N'minh2', N'123', N'2 ')
INSERT [dbo].[Phim] ([maphim], [matheloai], [daodien], [tenphim], [ngaykhoichieu], [ngayketthuc], [mota], [hinh], [nhasanxuat], [thoiluong], [trailer]) VALUES (1, 1, N'1', N'1', CAST(N'1999-01-01' AS Date), CAST(N'1999-01-01' AS Date), N'1', N'a', N'a', 1, N'1')
INSERT [dbo].[PhongChieu] ([maphong], [tenphong], [soghebandau]) VALUES (1, N'1', 1)
INSERT [dbo].[SuatChieu] ([masuatchieu], [maphim], [maphong], [giochieu], [gioketthuc], [ngaychieu], [soghecontrong]) VALUES (1, 1, 1, CAST(N'05:20:00' AS Time), CAST(N'06:05:00' AS Time), CAST(N'1999-01-01' AS Date), 30)
INSERT [dbo].[TheLoai] ([matheloai], [tentheloai]) VALUES (1, N'1')
INSERT [dbo].[VeDangDat] ([mave], [masuatchieu], [makhachhang], [giave], [tinhtrang], [giodat], [maloaive], [makm]) VALUES (1, 1, 1, 1, 1, CAST(N'1999-01-01T05:01:00.000' AS DateTime), 1, 1)
INSERT [dbo].[VeDangDat] ([mave], [masuatchieu], [makhachhang], [giave], [tinhtrang], [giodat], [maloaive], [makm]) VALUES (2, 1, 1, 1, 1, CAST(N'1999-01-01T06:05:00.000' AS DateTime), 1, 1)
/****** Object:  Index [index_khachhang]    Script Date: 12/9/2017 6:04:11 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [index_khachhang] ON [dbo].[KhachHang]
(
	[makhachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_editSuatChieu]    Script Date: 12/9/2017 6:04:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_editSuatChieu](@masuatchieu int, @maphim int, @maphong int, @giochieu time(7), @ngaychieu date, @soghecontrong int)
as
begin
	update SuatChieu 
		set 
			maphim  = @maphim,
			maphong = @maphong,
			giochieu = @giochieu,
			ngaychieu = @ngaychieu,
			soghecontrong = @soghecontrong
		where
			masuatchieu = @masuatchieu
end
GO
USE [master]
GO
ALTER DATABASE [qldv] SET  READ_WRITE 
GO
