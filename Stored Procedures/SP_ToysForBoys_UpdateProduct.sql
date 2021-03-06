USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_ToysForBoys_UpdateProduct]    Script Date: 17/05/2017 13:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patrick Oeyen
-- Create date: 17/05/2017
-- Description:	Modify new product to table products ofToysForBoys database
-- =============================================
CREATE PROCEDURE [dbo].[SP_ToysForBoys_UpdateProduct] 
@id int,
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

	UPDATE [dbo].[products]
    SET [name] =                @name,
        [scale] =               @scale,
        [description] =         @description,
        [quantityInStock] =     @quantityInStock,   
        [quantityInOrder] =     @quantityInOrder,
        [buyPrice] =            @buyPrice, 
        [productlineId] =       @productlineId

	WHERE [id] = @id
END  