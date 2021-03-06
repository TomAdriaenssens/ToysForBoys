USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_ToysForBoys_GetAlLOrders]    Script Date: 15/05/2017 23:32:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================
-- Author:		Patrick Oeyen
-- Create date: 18/05/2017
-- Description:	Gett all orders from table orders of ToysForBoys database
-- ============================================================================================================
CREATE PROCEDURE [dbo].[SP_ToysForBoys_GetAlLOrders] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [id]
      ,[orderDate]
      ,[requiredDate]
      ,[shippedDate]
      ,[comments]
      ,[customerId]
      ,[status]
  FROM [toysforboys].[dbo].[orders]

END
