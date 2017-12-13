--use qldv
--go
--create login administrator with password = 'admin@123'
--go
--create user admin1 for login administrator 
--go
--create role Administrator
--go
--grant  to Administrator
--go
--Sp_AddRoleMember 'Administrator', 'admin1'


use qldv
go
create login L_nhanvienbanve with password = 'nhanvienbanve'
go
create user U_nhanvienbanve for login L_nhanvienbanve
go
create role R_Nhanvienbanve
grant select, update on NhanVien to R_Nhanvienbanve
grant select,update on KhuyenMai to R_Nhanvienbanve
grant select,update on PhongChieu to R_Nhanvienbanve
grant select,update on KhachHang to R_Nhanvienbanve 
go
Sp_AddRoleMember 'R_Nhanvienbanve', 'U_nhanvienbanve'
go
create login L_nhanvienquanly with password = 'nhanvienquanly'
go
create user U_nhanvienquanly for login L_nhanvienquanly
go
create role R_NhanVienquanly
grant select, update, delete on KhachHang to R_NhanVienquanly
grant select,update, delete on LoaiVe to R_NhanVienquanly
grant select,update, delete on Phim to R_NhanVienquanly
grant select,update, delete on SuatChieu to R_NhanVienquanly 
grant select, update, delete on TheLoai to R_NhanVienquanly
grant select,update, delete on Ve to R_NhanVienquanly
grant select,update, delete on VeDangDat to R_NhanVienquanly 
go
Sp_AddRoleMember 'R_NhanVienquanly', 'U_nhanvienquanly'