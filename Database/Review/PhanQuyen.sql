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
create login L_nhanvien1 with password = 'nhanvien1'
go
create user U_nhanvien1 for login L_nhanvien1
go
create role R_NhanVien1
grant select, update, delete on NhanVien to R_NhanVien1
grant select,update, delete on KhuyenMai to R_NhanVien1 
grant select,update, delete on PhongChieu to R_NhanVien1 
go
Sp_AddRoleMember 'R_NhanVien1', 'U_nhanvien1'
go
create login L_nhanvien2 with password = 'nhanvien2'
go
create user U_nhanvien2 for login L_nhanvien2
go
create role R_NhanVien2
grant select, update, delete on KhachHang to R_NhanVien2
grant select,update, delete on LoaiVe to R_NhanVien2
grant select,update, delete on Phim to R_NhanVien2
grant select,update, delete on SuatChieu to R_NhanVien2 
grant select, update, delete on TheLoai to R_NhanVien2
grant select,update, delete on Ve to R_NhanVien2
grant select,update, delete on VeDangDat to R_NhanVien2 
go
Sp_AddRoleMember 'R_Nhanvien2', 'U_nhanvien2'