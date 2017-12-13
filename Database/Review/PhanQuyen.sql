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

-- nhan vien ban ve
create login L_nhanvienbanve with password = 'nhanvienbanve'
go
create user U_nhanvienbanve for login L_nhanvienbanve
go
create role R_NhanVienBanVe
grant select on VeDangDat to R_NhanVienBanVe
grant select, update on Ve to R_NhanVienBanVe
grant select, insert, update on KhachHang to R_NhanVienBanVe
go
Sp_AddRoleMember 'R_NhanVienBanVe', 'U_nhanvienbanve'
go

-- nhan vien quan ly
create login L_nhanvienquanly with password = 'nhanvienquanly'
go
create user U_nhanvienquanly for login L_nhanvienquanly
go
create role R_NhanVienQuanLy
grant select, insert, update on NhanVien to R_NhanVienQuanLy
grant select, update on KhachHang to R_NhanVienQuanLy
grant select, insert, update on LoaiVe to R_NhanVienQuanLy
grant select, insert, update on Phim to R_NhanVienQuanLy
grant select, insert, update on TheLoai to R_NhanVienQuanLy
grant select, insert, update on SuatChieu to R_NhanVienQuanLy
grant select, insert, update on PhongChieu to R_NhanVienQuanLy
grant select, insert, update on KhuyenMai to R_NhanVienQuanLy
grant select on Ve to R_NhanVienQuanLy
go
Sp_AddRoleMember 'R_NhanVienQuanLy', 'U_nhanvienquanly'
go