use qldv 

go

create function maHoaPass (@pass varchar(32))
returns varchar(32)
as
begin
	return CONVERT(VARCHAR(32), HashBytes('MD5', @pass), 2) 
end

