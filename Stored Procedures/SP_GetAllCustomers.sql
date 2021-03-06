USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllCustomers]    Script Date: 15/05/2017 23:32:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patrick Oeyen
-- Create date: 15/05/2017
-- Description:	Return all customers from ToysForBoys database
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetAlLCustomers] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [id]
      ,[name]
      ,[streetAndNumber]
      ,[city]
      ,[state]
      ,[postalCode]
      ,[countryId]
	  ,[email]
  FROM [toysforboys].[dbo].[customers]

END
