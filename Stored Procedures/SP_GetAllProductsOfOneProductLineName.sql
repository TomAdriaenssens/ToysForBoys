USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllProductsOfOneProductLine]    Script Date: 15/05/2017 23:40:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patrick Oeyen
-- Create date: 15/05/2017
-- Description:	Return all products from ToysForBoys database
-- =============================================
Create PROCEDURE [dbo].[SP_GetAllProductsOfOneProductLineName] @name varchar(25)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  p.[id]
      ,p.[name]
      ,p.[scale]
      ,p.[description]
      ,p.[quantityInStock]
      ,p.[quantityInOrder]
      ,p.[buyPrice]
      ,p.[productlineId]
    FROM [toysforboys].[dbo].[products] p
	Inner Join [toysforboys].[dbo].[productlines] l on l.[id] = p.[productlineId]
	Where l.name = @name

END
