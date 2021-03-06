USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_ToysForBoys_UpdateOrder]    Script Date: 17/05/2017 13:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================
-- Author:		Patrick Oeyen
-- Create date: 18/05/2017
-- Description:	Modify order from table orders of ToysForBoys database
-- ============================================================================================================
CREATE PROCEDURE [dbo].[SP_ToysForBoys_UpdateOrder] 
@id            int,
@orderDate     datetime       = null,
@requiredDate  datetime       = null,
@shippedDate   datetime       = null, 
@comments 	   ntext          = null,
@customerId	   int            = null,
@status		   nvarchar(10)   = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	UPDATE [dbo].[orders]
    SET [orderDate] =           @orderDate,     
        [requiredDate] =        @requiredDate,
        [shippedDate] =         @shippedDate,
        [comments] =            @comments,	 
        [customerId] =          @customerId,
        [status] =              @status		 

	WHERE [id] = @id
END  