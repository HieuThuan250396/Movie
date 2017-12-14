use qldv
go

--check key Phim
create trigger check_keyPhim on Phim
instead of insert
as
begin
	declare @matheloai int = (select Phim.matheloai from Phim where Phim.maphim in (select maphim from inserted))
	if exists (select * from Phim where Phim.maphim in (select maphim from inserted))
		begin
			raiserror('Trung khoa chinh',16,1)
			rollback tran	 
		end
	else if not exists (select matheloai from TheLoai where @matheloai = TheLoai.matheloai)
		begin
			raiserror('Khong co ma the loai nay',16,1)
			rollback tran 
		end
	else
		begin
			declare @maphim int = dbo.func_tangMa('maphim')
			declare @matheloai1 int = (select matheloai from inserted)
			declare @daodien nvarchar(50) = (select daodien from inserted)
			declare @tenphim nvarchar(50) = (select tenphim from inserted)
			declare @ngaykhoichieu date = (select ngaykhoichieu from inserted)
			declare @ngayketthuc date = (select ngayketthuc from inserted)
			declare @mota nvarchar(200) = (select mota from inserted)
			declare @hinh nvarchar(100) = (select hinh from inserted)
			declare @nhasanxuat nvarchar(50) = (select nhasanxuat from inserted)
			declare @thoiluong int = (select thoiluong from inserted)
			declare @trailer nvarchar(50) = (select trailer from inserted)

			insert into Phim values(@maphim, @matheloai1, @daodien, @tenphim, @ngaykhoichieu, 
			@ngayketthuc, @mota, @hinh, @nhasanxuat, @thoiluong, @trailer)
		end
end

--check key the loai
go
create trigger check_keyTheLoai on TheLoai
instead of insert
as
begin
	if exists (select * from TheLoai where TheLoai.matheloai in (select matheloai from inserted))
		begin
			raiserror('Trung khoa chinh',16,1)
			rollback tran	 
		end
	else
		begin
			declare @matheloai int = dbo.func_tangMa('matheloai')
			declare @tentheloai nvarchar(50) = (select tentheloai from inserted)
	
			insert into TheLoai values(@matheloai, @tentheloai)
		end
end
go

--check key Phong Chieu
create trigger check_keyPhong on PhongChieu
instead of insert
as
begin
	if exists (select * from PhongChieu where PhongChieu.maphong in (select maphong from inserted))
		begin
			raiserror('Trung khoa chinh',16,1)
			rollback tran	 
		end
	else
		begin
			declare @maphong int = dbo.func_tangMa('maphongchieu')
			declare @tenphong nvarchar(50) = (select tenphong from inserted)
			declare @soghebandau int = (select soghebandau from inserted)
	
			insert into PhongChieu values(@maphong, @tenphong, @soghebandau)
		end
end
go

--check key SuatChieu
create trigger check_keySuatChieu on SuatChieu
instead of insert
as
begin
	declare @maphim int = (select SuatChieu.maphim from SuatChieu where SuatChieu.maphim in (select maphim from inserted))
	declare @maphong int = (select SuatChieu.maphong from SuatChieu where SuatChieu.maphim in (select maphim from inserted))
	if exists (select * from SuatChieu where SuatChieu.masuatchieu in (select masuatchieu from inserted))
		begin
			raiserror('Trung khoa chinh',16,1)
			rollback tran	 
		end
	else if not exists (select maphim from Phim where @maphim = Phim.maphim)
		begin
			raiserror('Khong co ma phim nay',16,1)
			rollback tran
		end
	else if not exists (select maphong from PhongChieu where @maphong = PhongChieu.maphong)
		begin
			raiserror('Khong co ma phong nay',16,1)
			rollback tran 
		end 
	else
		begin
			declare @masuatchieu int = dbo.func_tangMa('masuatchieu')
			declare @maphim1 int = (select maphim from inserted)
			declare @maphong1 int = (select maphong from inserted)
			declare @giochieu time(7) = (select giochieu from inserted)
			declare @gioketthuc time(7) = (select gioketthuc from inserted)
			declare @ngaychieu date = (select ngaychieu from inserted)
			declare @soghecontrong int = (select soghecontrong from inserted)
	
			insert into SuatChieu values(@masuatchieu, @maphim1, @maphong1, @giochieu, @gioketthuc, @ngaychieu, @soghecontrong)
		end
end
go

--check key khach hang
create trigger check_keyKhachHang on KhachHang
instead of insert
as
begin
	if exists (select * from KhachHang where KhachHang.makhachhang in (select makhachhang from inserted))
		begin
			raiserror('Trung khoa chinh',16,1)
			rollback tran	 
		end
	else
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
end
go

--check key ve
create trigger check_keyVe on Ve
instead of insert
as
begin
	declare @maloaive int = (select Ve.maloaive from Ve where Ve.maloaive in (select maloaive from inserted))
	declare @makm int = (select Ve.makm from Ve where Ve.makm in (select makm from inserted))
	declare @makhachhang int = (select Ve.makhachhang from Ve where Ve.makm in (select makm from inserted))

	if exists (select * from Ve where Ve.mave in (select mave from inserted) and Ve.masuatchieu in (select masuatchieu from inserted))
		begin
			raiserror('Trung khoa chinh',16,1)
			rollback tran	 
		end
	else if not exists (select maloaive from Ve where @maloaive = Ve.maloaive)
		begin
			raiserror('Khong co ma loai ve nay',16,1)
			rollback tran 
		end
	else if not exists (select makm from Ve where @makm = Ve.makm)
		begin
			raiserror('Khong co ma khuyen mai nay',16,1)
			rollback tran 
		end
	else if not exists (select makhachhang from Ve where @makhachhang = Ve.makhachhang)
		begin
			raiserror('Khong co ma khach hang nay',16,1)
			rollback tran 
		end 	 
	else
		begin
			declare @mave int = dbo.func_tangMa('mave')
			declare @masuatchieu int = (select masuatchieu from inserted)
			declare @makhachhang1 int = (select makhachhang from inserted)
			declare @giave int = (select giave from inserted)
			declare @tinhtrang int = (select tinhtrang from inserted)
			declare @giodat datetime = (select giodat from inserted)
			declare @maloaive1 int = (select maloaive from inserted)
			declare @makm1 int = (select makm from inserted)
	
			insert into Ve values(@mave, @masuatchieu, @makhachhang1, @giave, @tinhtrang, @giodat, @maloaive1, @makm1)
		end
end
go

--check key loai ve
create trigger check_keyLoaiVe on LoaiVe
instead of insert,update
as
begin
	if exists (select * from LoaiVe where LoaiVe.maloaive in (select maloaive from inserted))
		begin
			raiserror('Trung khoa chinh',16,1)
			rollback tran	 
		end
	else
		begin
			declare @maloaive int = dbo.func_tangMa('maloaive')
			declare @tenloaive nvarchar(50) = (select tenloaive from inserted)
			declare @giave int = (select giave from inserted)
	
			insert into LoaiVe values(@maloaive, @tenloaive, @giave)
		end
end
go

--check key nhan vien
create trigger check_keyNhanVien on NhanVien
instead of insert,update
as
begin
	if exists (select * from NhanVien where NhanVien.manv in (select manv from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
	else
		begin
			declare @manv int = dbo.func_tangMa('manv')
			declare @taikhoan nvarchar(20) = (select taikhoan from inserted)
			declare @matkhau nvarchar(20) = (select matkhau from inserted)
			declare @vaitro char(2) = (select vaitro from inserted)
	
			insert into NhanVien values(@manv, @taikhoan, @matkhau, @vaitro)
		end
end
go