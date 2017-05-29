IF EXISTS (SELECT name FROM master.sys.databases WHERE name = N'ToysForBoys')
Begin

PRINT 'Database ToysForBoys exists'
USE master
ALTER DATABASE ToysForBoys SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

DROP Database toysforboys
Print 'ToysForBoys is deleted'

End
ELSE PRINT 'Database ToysForBoys don''t exists'
