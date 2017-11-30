use qldv 

go

create function maHoaPass (@pass varchar(32))
returns varchar(32)
as
begin
	return CONVERT(VARCHAR(32), HashBytes('MD5', @pass), 2) 
end
go

create function func_tangMa (@loaima varchar(20))
returns int
as
begin
	declare @ma int = 1
	if(@loaima = 'maphim')
		while exists(select * from Phim where maphim = @ma)
			set @ma += 1
	if(@loaima = 'matheloai')
		while exists (select * from TheLoai where matheloai = @ma)
			set @ma += 1
	if(@loaima = 'maphongchieu')
		while exists (select * from PhongChieu where maphong = @ma)
			set @ma += 1
	if(@loaima = 'makhuyenmai')
		while exists(select * from KhuyenMai where makm = @ma)
			set @ma += 1
	if(@loaima = 'maloaive')
		while exists(select * from LoaiVe where maloaive = @ma)
		set @ma += 1
	if(@loaima = 'makhachhang')
		while exists(select * from KhachHang where makhachhang = @ma)
		set @ma += 1
	if(@loaima = 'mave')
		while exists(select * from Ve where mave = @ma)
		set @ma += 1
	return @ma
end
