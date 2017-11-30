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
create login nhanvien with password = 'nhanvien'
go
create role NhanVien
grant select, update, delete on KhachHang to NhanVien
go
Sp_AddRoleMember 'nhanvien', 'NhanVien'