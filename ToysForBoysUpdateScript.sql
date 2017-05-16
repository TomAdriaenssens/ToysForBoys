/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE [toysforboys].[dbo].[products] 
SET scale = CONCAT(
                   REPLACE(
                      LEFT(scale,1), 'T', '1'),      
                      SUBSTRING(scale, 2, LEN(scale)))



Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Classic Cars'
Where  [name] = 'Tlassic Cars'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Vintage Cars'
Where  [name] = 'Tintage Cars'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Ships'
Where  [name] = 'Thips'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Planes'
Where  [name] = 'Tlanes'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Motorcycles'
Where  [name] = 'Totorcycles'

Update [toysforboys].[dbo].[orders] 
Set [status] = 'RESOLVED'
Where  [status] = 'TESOLVED'


Update [toysforboys].[dbo].[orders] 
Set [status] = 'WAITING'
Where  [status] = 'TAITING'


Update [toysforboys].[dbo].[orders] 
Set [status] = 'CANCELLED'
Where  [status] = 'TANCELLED'

Update [toysforboys].[dbo].[orders] 
Set [status] = 'SHIPPED'
Where  [status] = 'THIPPED'

Update [toysforboys].[dbo].[orders] 
Set [status] = 'DISPUTED'
Where  [status] = 'TISPUTED'

Update [toysforboys].[dbo].[orders] 
Set [status] = 'PROCESSING'
Where  [status] = 'TROCESSING'





