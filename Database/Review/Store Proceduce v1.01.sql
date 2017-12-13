use qldv
go
set xact_abort on 
go
-- Add phim 
create proc sp_addPhim (@matheloai int, @daodien nvarchar(50), @tenphim nvarchar(50), @ngaykhoichieu date, @ngayketthuc date,
@mota nvarchar(200), @hinh nvarchar(100), @nhasanxuat nvarchar(50), @thoiluong int, @trailer nvarchar(50))
as
begin 
	declare @maphim int = 1
	while exists(select * from Phim where maphim = @maphim)
		set @maphim += 1

	insert into Phim values(@maphim, @matheloai, @daodien, @tenphim, @ngaykhoichieu, @ngayketthuc, @mota, @hinh, @nhasanxuat, @thoiluong, @trailer)
end
go

--exec sp_addphim @matheloai = 0, @daodien = '', @tenphim = '', @ngaykhoichieu = '', @ngayketthuc = '', @mota = '', @hinh = '', @nhasanxuat ='',
--@thoiluong = 0, @trailer = ''
go

-- Edit phim
create proc sp_editPhim (@maphim int, @matheloai int, @daodien nvarchar(50), @tenphim nvarchar(50), @ngaykhoichieu date, @ngayketthuc date,
@mota nvarchar(200), @hinh nvarchar(100), @nhasanxuat nvarchar(50), @thoiluong int, @trailer nvarchar(50))
as
begin 
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
end 
go
--trigger kiem tra editphim
create trigger check_editPhim 
on Phim for insert
as
begin
	declare @ngayketthuc date = (select Phim.ngayketthuc from Phim where Phim.maphim in (select maphim from inserted))
	declare @ngaykhoichieu date = (select Phim.ngaykhoichieu from Phim where Phim.maphim in (select maphim from inserted))
	declare @thoiluong int = (select Phim.thoiluong from Phim where Phim.maphim in (select maphim from inserted))
	if(@ngaykhoichieu < GETDATE())
	begin
		raiserror('ngay khong hop le',16,1)
		rollback tran
	end
	if(@ngayketthuc < GETDATE())
	begin
		raiserror('ngay khong hop le',16,1)
		rollback tran
	end
	if(@ngayketthuc < @ngaykhoichieu)
	begin
		raiserror('ngay khong hop le',16,1)
		rollback tran
	end
	if(@thoiluong < 0 )
	begin
		raiserror('thoi luong khong duoc < 0 ',16,1)
		rollback tran
	end
end
go

--exec sp_editPhim @maphim = 0, @matheloai = 0, @daodien = '', @tenphim = '', @ngaykhoichieu = '', @ngayketthuc = '', @mota = '', @hinh = '', @nhasanxuat ='',
--@thoiluong = 0, @trailer = ''
go

-- Delete phim
/*create proc sp_deletePhim @maphim int
as
	if getdate() >= (select dateadd(month, 3, ngayketthuc) from Phim where maphim = @maphim)
		delete from Phim where maphim = @maphim
	else
		raiserror('Can not delete phim because time error', 16, 1)

exec sp_deletePhim 0
go*/

	
-- Load phim con dang chieu
create proc sp_loadPhimDangChieu
as
begin
	select *
	from Phim 
	where ngaykhoichieu <= getdate() and getdate() <= ngayketthuc
end
go


-- Load phim con dang chieu
create proc sp_loadPhimSapChieu
as
begin
	select *
	from Phim 
	where ngaykhoichieu > getdate()
end
go

-- Load phim con dang chieu
create proc sp_loadPhimDaChieu
as
begin
	select *
	from Phim 
	where ngayketthuc < getdate()
end
go

-- Load chi tiet phim
create proc sp_loadChiTietPhim( @maphim int)
as
begin
	select *
	from Phim 
	where maphim = @maphim
end
go

-- Load phim theo the loai
create proc sp_loadPhimTheoTheLoai( @matheloai int)
as
begin
	select *
	from Phim 
	where matheloai = @matheloai
end
go

-- Load phim theo ten
create proc sp_loadPhimTheoTen( @tenphim nvarchar(50))
as
begin
	select *
	from Phim 
	where tenphim like '%' + @tenphim + '%'
end
go

-- Load tat ca
create proc sp_loadTatCaPhim
as
begin
	select *
	from Phim 
end
go

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add the loai
create proc sp_addTheLoai @tentheloai nvarchar(50)
as
begin
	declare @matheloai int = 1
	while exists (select * from TheLoai where matheloai = @matheloai)
		set @matheloai += 1

	insert into TheLoai values(@matheloai, @tentheloai)
end

go

--exec sp_addTheLoai ''
go

-- Edit the loai
create proc sp_editTheLoai (@matheloai int, @tentheloai nvarchar(50))
as
begin
	update TheLoai 
	set 
		tentheloai = @tentheloai
	where
		matheloai = @matheloai
end
	
go 

--exec sp_editTheLoai @matheloai = 0, @tentheloai = ''
go

-- Delete the loai
/*create proc sp_deleteTheLoai @matheloai int
as
	delete from TheLoai where matheloai = @matheloai

exec sp_deleteTheLoai 0
go*/

-- Load the loai

create proc sp_loadTheLoai (@matheloai int)
as
begin
	select *
	from theloai
	where matheloai = @matheloai
end
	
go 

--exec sp_loadTheLoai @matheloai = 0
go

-- Load tat ca the loai 

create proc sp_loadTatCaTheLoai
as
begin
	select *
	from theloai
end
	
go 

--exec sp_loadTatCaTheLoai
go


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------++

-- Add phong chieu
create proc sp_addPhongChieu (@tenphong nvarchar(50))
as
begin
	declare @maphong int = 1
	while exists (select * from PhongChieu where maphong = @maphong)
		set @maphong += 1
	insert into PhongChieu values(@maphong, @tenphong, 30)
end

go
	
--exec sp_addTheLoai ''
go



-- Edit phong chieu
create proc sp_editPhongChieu (@maphong int, @tenphong nvarchar(50), @soghebandau int)
as
begin
	update PhongChieu 
	set 
		tenphong = @tenphong,
		soghebandau = @soghebandau
	where
		maphong = @maphong
end
go
--trigger check so ghe <0
create trigger check_editPhongChieu 
on PhongChieu for insert 
as
begin
	declare @soghe int = (select PhongChieu.soghebandau from PhongChieu where PhongChieu.maphong in (select maphong from inserted))
	if(@soghe < 0 )
	begin
	raiserror('so ghe khong duoc am',16,1)
	rollback tran
	end
end

--exec sp_editPhongChieu @maphong = 0, @tenphong = '',@soghebandau = 0
go

/*-- Delete phong chieu
create proc sp_deletePhongChieu @maphong int
as
	delete from PhongChieu where maphong = @maphong

exec sp_deleteTheLoai 0
go*/

-- Load phong chieu
create proc sp_loadTatCaPhongChieu
as
begin
	select * from PhongChieu
end

go
--Load chi tiet phong chieu
create proc sp_loadChiTietPhongChieu (@maphong int)
as
begin
	select *
	from PhongChieu
	where maphong = @maphong
end
go

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add khuyen mai
create proc sp_addKhuyenMai (@ngaybatdau date, @ngayketthuc date, @giatri float,@tinhtrang bit)
as
	declare @makm int = 1
	while exists(select * from KhuyenMai where makm = @makm)
		set @makm += 1

	if (getdate() < @ngaybatdau or getdate() > @ngayketthuc)
	begin
		raiserror('Khong the tao khuyen mai. Loi thoi gian khuyen mai', 16, 1)
		rollback tran
	end
	insert into KhuyenMai values(@makm, @ngaybatdau, @ngayketthuc, @giatri, @tinhtrang)

--exec sp_addKhuyenMai @ngaybatdau = '', @ngayketthuc = '', @giatri = 0
go
--check add khuyen mai 
create trigger check_addKhuyenMai 
on KhuyenMai for insert 
as
begin
	declare @ngaybatdau datetime = (select ngaybatdau from KhuyenMai where KhuyenMai.makm in (select makm from inserted))
	declare @ngayketthuc datetime = (select ngayketthuc from KhuyenMai where KhuyenMai.makm in (select makm from inserted))
	if (getdate() < @ngaybatdau or getdate() > @ngayketthuc)
	begin
		raiserror('Khong the tao khuyen mai. Loi thoi gian khuyen mai', 16, 1)
		rollback tran
	end
end
go

-- Edit khuyen mai
create proc sp_editKhuyenMai (@makm int, @ngaybatdau date, @ngayketthuc date, @giatri float,@tinhtrang bit)
as
	update KhuyenMai 
	set 
		ngaybatdau = @ngaybatdau,
		ngayketthuc = @ngayketthuc,
		giatri = @giatri,
		tinhtrang = @tinhtrang
	where
		makm = @makm

--exec sp_editKhuyenMai @makm = 0, @ngaybatdau = '', @ngayketthuc = '', @giatri = 0
go

-- Delete khuyen mai
/*create proc sp_deleteKhuyenMai (@makm int)
as
	if getdate() >= (select ngayketthuc from KhuyenMai where makm = @makm)
		delete from KhuyenMai where makm = @makm
	else
		raiserror('Cant delete because of time', 16, 1)

--exec sp_deleteKhuyenMai 0
go*/

create proc sp_loadTatCaKhuyenMai
as
begin
	select * from Khuyenmai
end

go

---------------------------------------------------------------------------------------------------------------------------------

-- Add loai ve
create proc sp_addLoaiVe (@tenloaive nvarchar(50), @giave float)
as
begin
	declare @maloaive int = 1
	while exists(select * from LoaiVe where maloaive = @maloaive)
		set @maloaive += 1

	insert into LoaiVe values (@maloaive, @tenloaive, @giave)
end

--exec sp_addLoaiVe @tenloaive = '', @giave = 0
go

-- Edit loai ve
create proc sp_editLoaiVe (@maloaive int, @tenloaive nvarchar(50), @giave float)
as
begin
	update LoaiVe 
	set 
		tenloaive = @tenloaive,
		giave = @giave
	where
		maloaive = @maloaive
end
go
create trigger checkeditLoaive
on LoaiVe for insert
as
begin
	declare @giave int = (select giave from LoaiVe where LoaiVe.maloaive in (select maloaive from inserted))
	if(@giave <= 0 )
	begin
		raiserror('gia ve khong duoc am',16,1)
		rollback tran
	end
end
--exec sp_editLoaiVe @maloaive = 0, @tenloaive = '', @giave = 0
go

-- Delete loai ve
/*create proc sp_deleteLoaiVe (@maloaive int)
as
begin
	delete from LoaiVe where maloaive = @maloaive
end

exec sp_deleteLoaiVe 0
go*/

-- Load loai ve
create proc sp_loadTatCaLoaiVe
as
	select * from LoaiVe

go
-- load chi tiet loai ve
create proc sp_loadChiTietLoaiVe(@maloaive int)
as 
begin 
	select *
	from LoaiVe
	where maloaive = @maloaive
end 

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
go
-- Add khach hang

create proc sp_addKhachHang (@ho nvarchar(50), @tenlot nvarchar(50), @ten nvarchar(50), @ngaysinh date, 
@gioitinh char(2), @sonha nvarchar(50), @tenduong nvarchar(50), @quan nvarchar(50), @thanhpho nvarchar(50), 
@dienthoai nvarchar(50), @email nvarchar(50), @matkhau nvarchar(32))
as
	declare @makhachhang int = 1
	while exists(select * from KhachHang where makhachhang = @makhachhang)
		set @makhachhang += 1
	set @matkhau = dbo.maHoaPass (@matkhau)
	insert into KhachHang values (@makhachhang, @ho, @tenlot, @ten, @ngaysinh, @gioitinh, @sonha, @tenduong, @quan, 
	@thanhpho, @dienthoai, @email, @matkhau)

--exec sp_addKhachHang @ho = 'abc', @tenlot = '', @ten = '', @ngaysinh = '', @gioitinh = '', @sonha = '', @tenduong = '',
--@quan = '', @thanhpho = '', @dienthoai = '123123', @email = '', @matkhau = 'aaa'
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

--exec sp_editKhachHang @makhachhang = 0, @ho = '', @tenlot = '', @ten = '', @ngaysinh = '', @gioitinh = '', @sonha = '', @tenduong = '',
--@quan = '', @thanhpho = '', @dienthoai = '', @email = '', @matkhau = ''
go
--trigger check ngay sinh 
create trigger check_addkhachhang
on KhachHang for insert
as
begin
	declare @ngaysinh date = (select ngaysinh from KhachHang where KhachHang.makhachhang in (select makhachhang from inserted))
	if(@ngaysinh > GETDATE())
	begin
		raiserror('ngay sinh khong hop le',16,1)
		rollback tran
	end
end
/*-- Delete khach hang
create proc sp_deleteKhachHang @makhachhang int
as
	delete from KhachHang where makhachhang = @makhachhang

exec sp_deleteKhachHang 0
go
*/
go
-- load Tat ca khach hang
create proc sp_loadTatCaKhachHang
as 
begin 
	select *
	from KhachHang
end 
go

-- load Chi tiet khach hang theo id
create proc sp_loadChiTietKhachHang(@makhachhang int)
as 
begin 
	select *
	from KhachHang
	where makhachhang = @makhachhang
end 
go

-- load Thong tin dang nhap
create proc sp_loadThongTinDangNhap(@dienthoai nvarchar(50), @matkhau varchar(32))
as 
begin 
	declare @matkhau1 nvarchar(32), @kq int
	
	select @matkhau1 = matkhau 
	from KhachHang
	where dienthoai = @dienthoai


	if @matkhau1 is null
	begin
		raiserror('Sdt ko ton tai', 16, 1)
		set @kq = -1
	end
	else
	begin
		if dbo.maHoaPass(@matkhau) = @matkhau1
		begin
			set @kq = 1
		end
		else 
		begin
			raiserror('Mat khau ko dung', 16, 1)
			set @kq = 0
		end
	end
	select @kq
end 
go

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- add suat chieu
go
create proc sp_addSuatChieu (@maphim int, @maphong int, @giochieu time(7), @ngaychieu date)
as
begin 
	declare @masuatchieu int = 1, @mave int = 1
	while exists(select * from SuatChieu where masuatchieu = @masuatchieu)
		set @masuatchieu += 1
	
	declare  @ngayketthuc date, @thoiluong int

	select @ngayketthuc = ngayketthuc, @thoiluong = thoiluong
	from Phim
	where maphim = @maphim

	if @ngayketthuc is NULL
		RAISERROR('Khong ton tai phim', 16, 4)
	else 
		insert into SuatChieu values(@masuatchieu, @maphim, @maphong, @giochieu, DATEADD(mi, @thoiluong,   @giochieu) ,@ngaychieu, 30)

	while(@mave<=30)
	begin 
		declare @maloaive INT, @ngaygiochieu DATETIME, @giave int 
		set @ngaygiochieu = cast(@ngaychieu as datetime) + cast(@giochieu as datetime)
		if 11 <= @mave and @mave <= 20
		begin
			set @maloaive = 2
			set @giave = 70000
		end
		else
		begin 
			set @maloaive = 1
			set @giave = 50000
		end
		insert into Ve(mave, masuatchieu, makhachhang, maloaive, tinhtrang, giodat, makm, giave) values (@mave, @masuatchieu, null, @maloaive, 0, null, null, @giave )
		set @mave = @mave + 1
	end
	
end
go
---edit suat chieu 
create proc sp_editSuatChieu(@masuatchieu int, @maphim int, @maphong int, @giochieu time(7), @ngaychieu date)
as
begin
	update SuatChieu 
		set 
			maphim  = @maphim,
			maphong = @maphong,
			giochieu = @giochieu,
			ngaychieu = @ngaychieu
		where
			masuatchieu = @masuatchieu
end
go
----load suat chieu
create proc sp_loadSuatChieu
as
begin
	select * 
	from SuatChieu
end
go
---load chi tiet suat chieu
create proc sp_loadChiTietSuatChieu(@masuatchieu int)
as
begin
	select * 
	from SuatChieu
	where masuatchieu = @masuatchieu
end
go
--load suat chieu theo phim 
create proc sp_loadSuatChieuTheoPhim(@maphim int)
as
begin
	select * 
	from SuatChieu
	where  SuatChieu.maphim = @maphim and (SuatChieu.ngaychieu >= getdate())
end
go
--exec sp_loadSuatChieuTheoPhim 2

create proc sp_loadNgayChieuSuatChieuTheoPhim(@maphim int)
as
begin
	select distinct ngaychieu 
	from SuatChieu
	where maphim = @maphim and (SuatChieu.ngaychieu >= getdate())
end
go
--load suat chieu ngay 
create proc sp_loadSuatChieuNgay
as
begin
	select *
	from SuatChieu
	where SuatChieu.ngaychieu = getdate()
end
go



-- Add ve // kiem tra lam lai
create proc sp_addVe (@masuatchieu int, @makhachhang int, @giodat datetime, @maloaive int, @makm int)
as
	
	-- set mave
	declare @mave int = 1
	while exists(select * from Ve where mave = @mave)
		set @mave += 1
	-- set giave
	declare @giave float = (select giave from LoaiVe where maloaive = @maloaive)
	-- set giave - giatri khuyenmai
	if (@makm != null)
	begin
		declare @ngaybatdau datetime = (select ngaybatdau from KhuyenMai where makm = @makm)
		declare @ngayketthuc datetime = (select ngayketthuc from KhuyenMai where makm = @makm)
		
		if (getdate() < @ngaybatdau or getdate() > @ngayketthuc)
			raiserror('Thoi gian su dung khuyen mai khong dung.', 16, 1)
		else
			declare @giatri float = (select giatri from KhuyenMai where makm = @makm)
			set @giave -= @giatri
	end
	-- set giochieu
	-- declare @giochieu datetime = (select giochieu from SuatChieu where masuatchieu = @masuatchieu)
	-- set tinhtrang
	declare @tinhtrang bit = 0


	insert into Ve values(@mave, @masuatchieu, @makhachhang, @giave, @tinhtrang, @giodat, @maloaive, @makm)
	update SuatChieu set soghecontrong -= 1 where SuatChieu.masuatchieu = @masuatchieu 

-- exec sp_addVe @masuatchieu = 0, @makhachhang = 0, @giodat = '', @maloaive = 0, @makm = 0
go

-- Dat ve
create proc sp_datVe (@mave int, @masuatchieu int, @makhachhang int, @makm int)
as
begin
	begin tran
		if(@makm = null or @makm = '' )
		begin
			update Ve 
			set 
				makhachhang = @makhachhang,
				giodat = getdate(),
				tinhtrang = 1
			where
				mave = @mave and masuatchieu = @masuatchieu	
		end
		else 
		begin
		if ((select tinhtrang from KhuyenMai where makm = @makm) = 1)
		begin
		update Ve 
			set 
				makhachhang = @makhachhang,
				giodat = getdate(),
				makm = @makm,
				tinhtrang = 1,
				giave = giave - (select LoaiVe.giave from LoaiVe where LoaiVe.maloaive = @makm)
			where
				mave = @mave and masuatchieu = @masuatchieu
			update KhuyenMai
			set
				KhuyenMai.tinhtrang = 0 
			where 
				KhuyenMai.makm = @makm
		end
		else 
		begin
			raiserror('ma khuyen mai het han',16,1)
		end
		end
		
	insert VeDangDat select * from Ve where Ve.mave = @mave 
	commit tran
end
go
--dat ve
create proc sp_datVe2 (@mave int, @masuatchieu int, @makhachhang int, @makm int)
as
begin
	begin tran
	update Ve set makhachhang = @makh, makm = @makm, giodat = GETDATE(),tinhtrang = 1 where mave = @mave and masuatchieu = @masuatchieu
	declare @gia int, @giodat datetime, @maloaive int
	select @gia = giave, @giodat = giodat, @maloaive = maloaive from Ve where mave = @mave and masuatchieu = @masuatchieu
	insert into VeDangDat values (@mave, @masuatchieu, @makh, @gia, 0, @giodat, @maloaive, @makm)
	commit tran
end
	
go
--tra ve 
create proc sp_traVe (@mave int, @masuatchieu int,@makm int)
as
begin
	begin tran
	if(@makm = null or @makm = '' )
		begin
			update Ve 
			set 
			makhachhang = NULL,
			giodat =NULL,
			makm = NULL,
			tinhtrang = 0
			where
			mave = @mave and masuatchieu = @masuatchieu
	delete from  VeDangDat where VeDangDat.mave  = @mave
		end
	else
		begin
			update Ve 
			set 
			makhachhang = NULL,
			giodat =NULL,
			makm = NULL,
			tinhtrang = 0
			where
			mave = @mave and masuatchieu = @masuatchieu
			delete from  VeDangDat where VeDangDat.mave  = @mave
			update KhuyenMai
			set
			KhuyenMai.tinhtrang = 1
			where 
			KhuyenMai.makm = @makm
		end
	commit tran
end

go

create proc sp_loadVeTheoSuatChieu(@masuatchieu int)
as
	begin
		select * from ve where ve.masuatchieu = @masuatchieu
	end

	

/*
-- Delete ve
create proc sp_deleteVe @mave int
as
	delete from Ve where mave = @mave

exec sp_deleteVe 0
go*/

go
-- Add nhanvien
alter proc sp_addNhanVien (@taikhoan varchar(20), @matkhau varchar(32), @vaitro char(2))
as
	declare @manv int = 1
	while exists(select * from NhanVien where manv = @manv)
		set @manv += 1
	set @matkhau = dbo.maHoaPass (@matkhau)
	insert into NhanVien values(@manv, @taikhoan, @matkhau, @vaitro)
	--update NhanVien set matkhau = dbo.maHoaPass (matkhau) where manv = @manv
go
go
-- Edit nhanvien
create proc sp_editNhanVien (@manv int, @taikhoan varchar(20), @matkhau varchar(32), @vaitro char(2))
as
	update NhanVien 
	set 
		taikhoan = @taikhoan,
		matkhau = @matkhau,
		vaitro = @vaitro
	where
		manv = @manv
go
--load dsNhanvien 
create proc sp_loadDsNhanVien
as
begin
	select * 
	from NhanVien
end
--load nhan vien chi tiet
go
create proc sp_loadNhanVien(@manv int)
as
begin
	select * 
	from NhanVien
	where NhanVien.manv = @manv
end
go
create proc sp_loadThongTinDangNhapNV(@taikhoan varchar(20), @matkhau varchar(32))
as 
begin 
	declare @matkhau1 nvarchar(50), @kq int
	
	select @matkhau1 = matkhau 
	from NhanVien
	where taikhoan = @taikhoan

	if @matkhau1 is null
	begin
		raiserror('khong ton tai tai khoan', 16, 1)
		set @kq = -1
	end
	else
	begin
		if dbo.maHoaPass(@matkhau) = @matkhau1
		begin
			set @kq = 1
		end
		else 
		begin
			raiserror('khong dung mat khau', 16, 1)
			set @kq = 0
		end
	end
	select @kq
end 

--exec sp_loadThongTinDangNhapNV 'trungbv2', '1234'

--select dbo.maHoaPass('admin')

--exec sp_addNhanVien 'admin', 'admin', 'ad'

