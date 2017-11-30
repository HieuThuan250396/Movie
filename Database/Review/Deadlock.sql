alter proc sp_addKhachHang (@ho nvarchar(50), @tenlot nvarchar(50), @ten nvarchar(50), @ngaysinh date, 
@gioitinh char(2), @sonha nvarchar(50), @tenduong nvarchar(50), @quan nvarchar(50), @thanhpho nvarchar(50), 
@dienthoai nvarchar(50), @email nvarchar(50), @matkhau nvarchar(50))
as
	begin tran
	set tran isolation level serializable 

	select makhachhang from KhachHang with (updlock) order by makhachhang 

	declare @makhachhang int = 1
	while exists(select * from KhachHang where makhachhang = @makhachhang)
		set @makhachhang += 1
	waitfor delay '00:00:05'

	insert into KhachHang values (@makhachhang, @ho, @tenlot, @ten, @ngaysinh, @gioitinh, @sonha, @tenduong, @quan, 
	@thanhpho, @dienthoai, @email, @matkhau)

	commit tran

exec sp_addKhachHang @ho = 'Tran', @tenlot = 'Trong', @ten = 'Nhan', @ngaysinh = '1996-10-04', @gioitinh = 'NA', @sonha = '342', 
@tenduong = 'Nguyen Cong Tru',@quan = '1', @thanhpho = 'TP.HCM', @dienthoai = '0938515316', @email = '123@gmail.com', @matkhau = '123456'
go