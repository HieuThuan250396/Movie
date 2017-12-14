use qldv
go

-- tang ma khach hang
create trigger trig_tangMaKH on KhachHang
instead of insert
as
begin
	declare @makhachhang int = dbo.func_tangMa('makhachhang')
	declare @ho nvarchar(50) = (select ho from inserted)
	declare @tenlot nvarchar(50) = (select tenlot from inserted)
	declare @ten nvarchar(50) = (select ten from inserted)
	declare @ngaysinh date = (select ngaysinh from inserted)
	declare @gioitinh char(2) = (select gioitinh from inserted)
	declare @sonha nvarchar(50) = (select sonha from inserted)
	declare @tenduong nvarchar(50) = (select tenduong from inserted)
	declare @quan nvarchar(50) = (select quan from inserted)
	declare @thanhpho nvarchar(50) = (select thanhpho from inserted)
	declare @dienthoai nvarchar(50) = (select dienthoai from inserted)
	declare @email nvarchar(50) = (select email from inserted)
	declare @matkhau nvarchar(32) = (select matkhau from inserted)

	insert into KhachHang values(@makhachhang, @ho, @tenlot, @ten, @ngaysinh, @gioitinh, @sonha, @tenduong, @quan, @thanhpho, @dienthoai, @email, @matkhau)
end
go

-- tang ma loai ve
create trigger trig_tangMaLV on LoaiVe
instead of insert
as
begin
	declare @maloaive int = dbo.func_tangMa('maloaive')
	declare @tenloaive nvarchar(50) = (select tenloaive from inserted)
	declare @giave int = (select giave from inserted)
	
	insert into LoaiVe values(@maloaive, @tenloaive, @giave)
end
go

-- tang ma nhan vien
create trigger trig_tangMaNV on Nhanvien
instead of insert
as
begin
	declare @manv int = dbo.func_tangMa('manv')
	declare @taikhoan nvarchar(20) = (select taikhoan from inserted)
	declare @matkhau nvarchar(20) = (select matkhau from inserted)
	declare @vaitro char(2) = (select vaitro from inserted)
	
	insert into NhanVien values(@manv, @taikhoan, @matkhau, @vaitro)
end
go

-- tang ma phim
create trigger trig_tangMaPhim on Phim
instead of insert
as
begin
	declare @maphim int = dbo.func_tangMa('maphim')
	declare @matheloai int = (select matheloai from inserted)
	declare @daodien nvarchar(50) = (select daodien from inserted)
	declare @tenphim nvarchar(50) = (select tenphim from inserted)
	declare @ngaykhoichieu date = (select ngaykhoichieu from inserted)
	declare @ngayketthuc date = (select ngayketthuc from inserted)
	declare @mota nvarchar(200) = (select mota from inserted)
	declare @hinh nvarchar(100) = (select hinh from inserted)
	declare @nhasanxuat nvarchar(50) = (select nhasanxuat from inserted)
	declare @thoiluong int = (select thoiluong from inserted)
	declare @trailer nvarchar(50) = (select trailer from inserted)

	insert into Phim values(@maphim, @matheloai, @daodien, @tenphim, @ngaykhoichieu, 
	@ngayketthuc, @mota, @hinh, @nhasanxuat, @thoiluong, @trailer)
end
go

-- tang ma phong chieu
create trigger trig_tangMaPC on PhongChieu
instead of insert
as
begin
	declare @maphong int = dbo.func_tangMa('maphongchieu')
	declare @tenphong nvarchar(50) = (select tenphong from inserted)
	declare @soghebandau int = (select soghebandau from inserted)
	
	insert into PhongChieu values(@maphong, @tenphong, @soghebandau)
end
go

-- tang ma suat chieu
create trigger trig_tangMaSC on SuatChieu
instead of insert
as
begin
	declare @masuatchieu int = dbo.func_tangMa('masuatchieu')
	declare @maphim int = (select maphim from inserted)
	declare @maphong int = (select maphong from inserted)
	declare @giochieu time(7) = (select giochieu from inserted)
	declare @gioketthuc time(7) = (select gioketthuc from inserted)
	declare @ngaychieu date = (select ngaychieu from inserted)
	declare @soghecontrong int = (select soghecontrong from inserted)
	
	insert into SuatChieu values(@masuatchieu, @maphim, @maphong, @giochieu, @gioketthuc, @ngaychieu, @soghecontrong)
end
go

-- tang ma the loai
create trigger trig_tangMaTL on TheLoai
instead of insert
as
begin
	declare @matheloai int = dbo.func_tangMa('matheloai')
	declare @tentheloai nvarchar(50) = (select tentheloai from inserted)
	
	insert into TheLoai values(@matheloai, @tentheloai)
end
go

-- tang ma ve
create trigger trig_tangMaVe on Ve
instead of insert
as
begin
	declare @mave int = dbo.func_tangMa('mave')
	declare @masuatchieu int = (select masuatchieu from inserted)
	declare @makhachhang int = (select makhachhang from inserted)
	declare @giave int = (select giave from inserted)
	declare @tinhtrang int = (select tinhtrang from inserted)
	declare @giodat datetime = (select giodat from inserted)
	declare @maloaive int = (select maloaive from inserted)
	declare @makm int = (select makm from inserted)
	
	insert into Ve values(@mave, @masuatchieu, @makhachhang, @giave, @tinhtrang, @giodat, @maloaive, @makm)
end
go

