use qldv
go
--job kiem tra het han khuyen mai 
declare cur cursor
dynamic
for 
	select makm from KhuyenMai where KhuyenMai.ngayketthuc <= GETDATE()
declare @makm int
open cur
fetch next from cur into @makm
while @@FETCH_STATUS=0
	update KhuyenMai set tinhtrang = 1 where makm = @makm
	fetch next from cur into @makm
close cur 
deallocate cur 
 