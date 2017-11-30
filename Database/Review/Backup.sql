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

--