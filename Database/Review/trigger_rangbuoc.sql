use qldv
go
--check key Phim
create trigger check_keyPhim on Phim
instead of insert,update
as
begin
	declare @matheloai int = (select Phim.matheloai from Phim where Phim.maphim in (select maphim from inserted))
	if exists (select * from phim where Phim.maphim in (select maphim from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
	else
		begin
			if  not exists (select matheloai from TheLoai where @matheloai = TheLoai.matheloai)
				begin
					raiserror('khong co theloai nay ',16,1)
					rollback tran 
				end
		end
end
--check key the loai
go
create trigger check_keyTheLoai on TheLoai
instead of insert,update
as
begin
	if exists (select * from TheLoai where TheLoai.matheloai in (select matheloai from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
end
go
--check key Phong Chieu
create trigger check_keyPhong on PhongChieu
instead of insert,update
as
begin
	if exists (select * from PhongChieu where PhongChieu.maphong in (select maphong from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
end
go 
--check key SuatChieu
create trigger check_keySuatChieu on SuatChieu
instead of insert,update
as
begin
	declare @maphim int = (select SuatChieu.maphim from SuatChieu where SuatChieu.maphim in (select maphim from inserted))
	declare @maphong int = (select SuatChieu.maphong from SuatChieu where SuatChieu.maphim in (select maphim from inserted))
	if exists (select * from SuatChieu where SuatChieu.masuatchieu in (select masuatchieu from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
	else
		begin
			if not exists (select maphim from Phim where @maphim = Phim.maphim)
				begin
					raiserror('khong co ma phim nay ',16,1)
					rollback tran 
				end
			if not exists (select maphong from PhongChieu where @maphong = PhongChieu.maphong)
				begin
					raiserror('khong co ma phong nay ',16,1)
					rollback tran 
				end 
		end
end
go
--check key khach hang
create trigger check_keykhachhang on KhachHang
instead of insert,update
as
begin
	if exists (select * from KhachHang where KhachHang.makhachhang in (select makhachhang from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
end
go

--check key ve
create trigger check_keyVe on Ve
instead of insert,update
as
begin
	declare @maloaive int = (select Ve.maloaive from Ve where Ve.maloaive in (select maloaive from inserted))
	declare @makm int = (select Ve.makm from Ve where Ve.makm in (select makm from inserted))
	declare @makhachhang int = (select Ve.makhachhang from Ve where Ve.makm in (select makm from inserted))
	if exists (select * from Ve where Ve.mave in (select mave from inserted) and Ve.masuatchieu in (select masuatchieu from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
	else
		begin
			if not exists (select maloaive from Ve where @maloaive = Ve.maloaive)
				begin
					raiserror('khong co ma loai ve nay ',16,1)
					rollback tran 
				end
			if not exists (select makm from Ve where @makm = Ve.makm)
				begin
					raiserror('khong co ma khuyen mai nay ',16,1)
					rollback tran 
				end
			if not exists (select makhachhang from Ve where @makhachhang = Ve.makhachhang)
				begin
					raiserror('khong co ma khach hang nay ',16,1)
					rollback tran 
				end 	 
		end
end
go
--check key loai ve
create trigger check_keyloaive on LoaiVe
instead of insert,update
as
begin
	if exists (select * from LoaiVe where LoaiVe.maloaive in (select maloaive from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
end
go
--check key 
create trigger check_keykhuyenmai on KhuyenMai
instead of insert,update
as
begin
	if exists (select * from KhuyenMai where KhuyenMai.makm in (select makm from inserted))
		begin
			raiserror('Trung Khoa Chinh',16,1)
			rollback tran	 
		end
end
go