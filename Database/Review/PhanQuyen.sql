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
create login L_nhanvienbanhang with password = 'nhanvien1'
go
create user U_nhanvienbanhang for login L_nhanvienbanhang
go
create role R_Nhanvienbanhang
grant select, update, delete on NhanVien to R_Nhanvienbanhang
grant select,update, delete on KhuyenMai to R_Nhanvienbanhang
grant select,update, delete on PhongChieu to R_Nhanvienbanhang
grant select,update, delete on KhachHang to R_NhanVienbanhang 
go
Sp_AddRoleMember 'R_Nhanvienbanhang', 'U_nhanvienbanhang'
go
create login L_nhanvienquanly with password = 'nhanvien2'
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