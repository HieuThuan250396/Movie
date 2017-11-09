use qldv
go

-- Add phim 
create proc sp_addPhim (@matheloai int, @daodien nvarchar(50), @tenphim nvarchar(50), @ngaykhoichieu date, @ngayketthuc date,
@mota nvarchar(200), @hinh nvarchar(100), @nhasanxuat nvarchar(50), @thoiluong int, @trailer nvarchar(50))
as
	declare @maphim int = 1
	while exists(select * from Phim where maphim = @maphim)
		set @maphim += 1

	insert into Phim values(@maphim, @matheloai, @daodien, @tenphim, @ngaykhoichieu, @ngayketthuc, @mota, @hinh, @nhasanxuat, @thoiluong, @trailer)

exec sp_addphim @matheloai = 0, @daodien = '', @tenphim = '', @ngaykhoichieu = '', @ngayketthuc = '', @mota = '', @hinh = '', @nhasanxuat ='',
@thoiluong = 0, @trailer = ''
go

-- Edit phim
create proc sp_editPhim (@maphim int, @matheloai int, @daodien nvarchar(50), @tenphim nvarchar(50), @ngaykhoichieu date, @ngayketthuc date,
@mota nvarchar(200), @hinh nvarchar(100), @nhasanxuat nvarchar(50), @thoiluong int, @trailer nvarchar(50))
as
	update Phim 
	set 
		matheloai = @matheloai,
		daodien = @daodien,
		tenphim = @tenphim,
		ngaykhoichieu = @ngaykhoichieu,
		ngayketthuc = @ngayketthuc,
		mota = @mota,
		hinh = @hinh,
		nhasanxuat = @nhasanxuat,
		thoiluong = @thoiluong,
		trailer = @trailer
	where maphim = @maphim

exec sp_editPhim @maphim = 0, @matheloai = 0, @daodien = '', @tenphim = '', @ngaykhoichieu = '', @ngayketthuc = '', @mota = '', @hinh = '', @nhasanxuat ='',
@thoiluong = 0, @trailer = ''
go

-- Delete phim
create proc sp_deletePhim @maphim int
as
	if getdate() >= (select dateadd(month, 3, ngayketthuc) from Phim where maphim = @maphim)
		delete from Phim where maphim = @maphim
	else
		raiserror('Can not delete phim because time error', 16, 1)

exec sp_deletePhim 0
go

-- Add the loai
create proc sp_addTheLoai @tentheloai nvarchar(50)
as
	declare @matheloai int = 1
	while exists (select * from TheLoai where matheloai = @matheloai)
		set @matheloai += 1

	insert into TheLoai values(@matheloai, @tentheloai)

exec sp_addTheLoai ''
go

-- Edit the loai
create proc sp_editTheLoai (@matheloai int, @tentheloai nvarchar(50))
as
	update TheLoai 
	set 
		tentheloai = @tentheloai
	where
		matheloai = @matheloai

exec sp_editTheLoai @matheloai = 0, @tentheloai = ''
go

-- Delete the loai
create proc sp_deleteTheLoai @matheloai int
as
	delete from TheLoai where matheloai = @matheloai

exec sp_deleteTheLoai 0
go

-- Add phong chieu
create proc sp_addPhongChieu (@tenphong nvarchar(50), @soghecontrong int, @soghebandau int)
as
	declare @maphong int = 1
	while exists (select * from PhongChieu where maphong = @maphong)
		set @maphong += 1

	insert into TheLoai values(@maphong, @tenphong, @soghecontrong, @soghebandau)

exec sp_addTheLoai ''
go

-- Edit phong chieu
create proc sp_editPhongChieu (@maphong int, @tenphong nvarchar(50), @soghecontrong int, @soghebandau int)
as
	update PhongChieu 
	set 
		tenphong = @tenphong,
		soghecontrong = @soghecontrong,
		soghebandau = @soghebandau
	where
		maphong = @maphong

exec sp_editPhongChieu @maphong = 0, @tenphong = '', @soghecontrong = 0, @soghebandau = 0
go

/*-- Delete phong chieu
create proc sp_deletePhongChieu @maphong int
as
	delete from PhongChieu where maphong = @maphong

exec sp_deleteTheLoai 0
go*/

-- Add khuyen mai
create proc sp_addKhuyenMai (@ngaybatdau date, @ngayketthuc date, @giatri float)
as
	declare @makm int = 1
	while exists(select * from KhuyenMai where makm = @makm)
		set @makm += 1

	insert into KhuyenMai values(@makm, @ngaybatdau, @ngayketthuc, @giatri)

exec sp_addKhuyenMai @ngaybatdau = '', @ngayketthuc = '', @giatri = 0
go

-- Edit khuyen mai
create proc sp_editKhuyenMai (@makm int, @ngaybatdau date, @ngayketthuc date, @giatri float)
as
	update KhuyenMai 
	set 
		ngaybatdau = @ngaybatdau,
		ngayketthuc = @ngayketthuc,
		giatri = @giatri
	where
		makm = @makm

exec sp_editKhuyenMai @makm = 0, @ngaybatdau = '', @ngayketthuc = '', @giatri = 0
go

-- Delete khuyen mai
create proc sp_deleteKhuyenMai (@makm int)
as
	if getdate() >= (select ngayketthuc from KhuyenMai where makm = @makm)
		delete from KhuyenMai where makm = @makm
	else
		raiserror('Cant delete because of time', 16, 1)

exec sp_deleteKhuyenMai 0
go

-- Add loai ve
create proc sp_addLoaiVe (@tenloaive nvarchar(50), @giave float)
as
	declare @maloaive int = 1
	while exists(select * from LoaiVe where maloaive = @maloaive)
		set @maloaive += 1

	insert into LoaiVe values (@maloaive, @tenloaive, @giave)

exec sp_addLoaiVe @tenloaive = '', @giave = 0
go

-- Edit loai ve
create proc sp_editLoaiVe (@maloaive int, @tenloaive nvarchar(50), @giave float)
as
	update LoaiVe 
	set 
		tenloaive = @tenloaive,
		giave = @giave
	where
		maloaive = @maloaive

exec sp_editLoaiVe @maloaive = 0, @tenloaive = '', @giave = 0
go

-- Delete loai ve
create proc sp_deleteLoaiVe (@maloaive int)
as
	delete from LoaiVe where maloaive = @maloaive

exec sp_deleteLoaiVe 0
go

-- Add khach hang
create proc sp_addKhachHang (@ho nvarchar(50), @tenlot nvarchar(50), @ten nvarchar(50), @ngaysinh date, 
@gioitinh char(2), @sonha nvarchar(50), @tenduong nvarchar(50), @quan nvarchar(50), @thanhpho nvarchar(50), 
@dienthoai nvarchar(50), @email nvarchar(50), @matkhau nvarchar(50))
as
	declare @makhachhang int = 1
	while exists(select * from KhachHang where makhachhang = @makhachhang)
		set @makhachhang += 1

	insert into KhachHang values (@makhachhang, @ho, @tenlot, @ten, @ngaysinh, @gioitinh, @sonha, @tenduong, @quan, 
	@thanhpho, @dienthoai, @email, @matkhau)

exec sp_addKhachHang @ho = '', @tenlot = '', @ten = '', @ngaysinh = '', @gioitinh = '', @sonha = '', @tenduong = '',
@quan = '', @thanhpho = '', @dienthoai = '', @email = '', @matkhau = ''
go

-- Edit khach hang
create proc sp_editKhachHang (@makhachhang int, @ho nvarchar(50), @tenlot nvarchar(50), @ten nvarchar(50), @ngaysinh date, 
@gioitinh char(2), @sonha nvarchar(50), @tenduong nvarchar(50), @quan nvarchar(50), @thanhpho nvarchar(50), 
@dienthoai nvarchar(50), @email nvarchar(50), @matkhau nvarchar(50))
as
	update KhachHang 
	set 
		ho = @ho,
		tenlot = @tenlot,
		ten = @ten,
		ngaysinh = @ngaysinh,
		gioitinh = @gioitinh,
		sonha = @sonha,
		tenduong = @tenduong,
		quan = @quan,
		thanhpho = @thanhpho,
		dienthoai = @dienthoai,
		email = @email,
		matkhau = @matkhau
	where
		makhachhang = @makhachhang

exec sp_editKhachHang @makhachhang = 0, @ho = '', @tenlot = '', @ten = '', @ngaysinh = '', @gioitinh = '', @sonha = '', @tenduong = '',
@quan = '', @thanhpho = '', @dienthoai = '', @email = '', @matkhau = ''
go

-- Delete khach hang
create proc sp_deleteKhachHang @makhachhang int
as
	delete from KhachHang where makhachhang = @makhachhang

exec sp_deleteKhachHang 0
go

-- Add ve
create proc sp_addVe (@masuatchieu int, @makhachhang int, @giave float, @giochieu datetime, @tinhtrang bit, @giodat datetime, @maloaive int, 
@makm int)
as
	declare @mave int = 1
	while exists(select * from Ve where mave = @mave)
		set @mave += 1

	insert into Ve values(@mave, @masuatchieu, @makhachhang, @giave, @giochieu, @tinhtrang, @giodat, @maloaive, @makm)

exec sp_addVe @masuatchieu = 0, @makhachhang = 0, @giave = 0, @giochieu = '', @tinhtrang = 0, @giodat = '', @maloaive = 0, @makm = 0
go

-- Edit ve
create proc sp_editVe (@mave int, @masuatchieu int, @makhachhang int, @giave float, @giochieu datetime, @tinhtrang bit, @giodat datetime, 
@maloaive int, @makm int)
as
	update Ve 
	set 
		masuatchieu = @masuatchieu,
		makhachhang = @makhachhang,
		giave = @giave,
		giochieu = @giochieu,
		tinhtrang = @tinhtrang,
		giodat = @giodat,
		maloaive = @maloaive,
		makm = @makm
	where
		mave = @mave

exec sp_editVe @mave = 0, @masuatchieu = 0, @makhachhang = 0, @giave = 0, @giochieu = '', @tinhtrang = 0, @giodat = '', @maloaive = 0, @makm = 0
go

-- Delete ve
create proc sp_deleteVe @mave int
as
	delete from Ve where mave = @mave

exec sp_deleteVe 0
go