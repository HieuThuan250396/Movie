use qldv
go
create login administrator with password = 'admin@123'
go
create user admin1 for login administrator 
go
create role Administrator
go
grant all to Administrator
go
Sp_AddRoleMember 'Administrator', 'admin1'