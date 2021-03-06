USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_ToysForBoys_AddNewProduct]    Script Date: 17/05/2017 23:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patrick Oeyen
-- Create date: 17/05/2017
-- Description:	Add new product to table products ofToysForBoys database
-- =============================================
Create PROCEDURE [dbo].[SP_ToysForBoys_AddNewProduct] 
@name nvarchar(70),
@scale nvarchar(10),
@description ntext,
@quantityInStock int,
@quantityInOrder int,
@buyPrice numeric(10,2),
@productlineId int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	INSERT INTO [dbo].[products]
           ([name]
           ,[scale]
           ,[description]
           ,[quantityInStock]
           ,[quantityInOrder]
           ,[buyPrice]
           ,[productlineId])
     VALUES(@name,
			@scale,
			@description,
			@quantityInStock,
			@quantityInOrder,
			@buyPrice, 
			@productlineId)
END