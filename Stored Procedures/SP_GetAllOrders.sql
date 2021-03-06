USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllOrders]    Script Date: 15/05/2017 23:18:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patrick Oeyen
-- Create date: 15/05/2017
-- Description:	Return all orders from ToysForBoys database
-- =============================================
Create PROCEDURE [dbo].[SP_GetAllOrders] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [id]
      ,[orderDate]
      ,[requiredDate]
      ,[shippedDate]
      ,[comments]
      ,[customerId]
      ,[status]
	FROM [toysforboys].[dbo].[orders]

END
