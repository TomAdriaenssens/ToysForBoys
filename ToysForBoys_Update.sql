/****** Script for SelectTopNRows command from SSMS  ******/
use toysforboys
UPDATE [toysforboys].[dbo].[products] 
SET scale = CONCAT(
                   REPLACE(
                      LEFT(scale,1), 'T', '1'),      
                      SUBSTRING(scale, 2, LEN(scale)))



Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Classic Cars',
[description] = 'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.'
Where  [name] = 'Tlassic Cars'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Vintage Cars',
[description] = 'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.'
Where  [name] = 'Tintage Cars'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Ships'
Where  [name] = 'Thips'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Planes',
[description] = 'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.'
Where  [name] = 'Tlanes'

Update [toysforboys].[dbo].[productlines] 
Set [name] = 'Motorcycles',
[description] = 'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.'
Where  [name] = 'Totorcycles'

Update [toysforboys].[dbo].[productlines] 
Set [description] = 'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.'
Where  [name] = 'Trains'


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



