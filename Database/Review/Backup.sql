use qldv
go
--full backup
BACKUP DATABASE qldv  
TO DISK ='E:\qldv.Bak'  
   WITH FORMAT,  
      MEDIANAME = 'qldv_fbk',  
      NAME = 'Full Backup of qldv';  
GO 
--DIFFERENTIAL backup
BACKUP DATABASE qldv  
   TO DISK ='E:\qldv_dif.Bak' 
   WITH DIFFERENTIAL;  
GO 
--backup log
BACKUP LOG qldv  
   TO  DISK ='E:\qldv_log.Bak'  
GO 
--chua biet huong lam
use qldv
go
declare @masuatchieu int = (select VeDangDat.masuatchieu from VeDangDat)
declare @giodat datetime = (select VeDangDat.giodat from VeDangDat where VeDangDat.mave = 1) 
declare @gioketthuc datetime = (select (cast(SuatChieu.ngaychieu as datetime) + cast(SuatChieu.giochieu as datetime)) from SuatChieu where  SuatChieu.masuatchieu  = 1)
if((select datediff(minute,@giodat,@gioketthuc)) = 20)
	print 'a'
else 
	print 'b'

select * from VeDangDat
--