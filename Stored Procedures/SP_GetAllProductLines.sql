USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetAllProductLines]    Script Date: 15/05/2017 23:32:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Patrick Oeyen
-- Create date: 15/05/2017
-- Description:	Return all productLines from ToysForBoys database
-- =============================================
CREATE PROCEDURE [dbo].[SP_ProductLines] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [id]
      ,[name]
      ,[description]
  FROM [toysforboys].[dbo].[productlines]

END
