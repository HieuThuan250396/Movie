use qldv
go

create trigger trig_tangMa on Phim
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