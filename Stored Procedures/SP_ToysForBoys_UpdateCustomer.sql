USE [toysforboys]
GO
/****** Object:  StoredProcedure [dbo].[SP_ToysForBoys_UpdateCustomer]    Script Date: 19/05/2017 15:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ============================================================================================================
-- Author:		Patrick Oeyen
-- Create date: 19/05/2017
-- Description:	Modified customer to table costumers of ToysForBoys database
-- ============================================================================================================
CREATE PROCEDURE [dbo].[SP_ToysForBoys_UpdateCustomer] 
@name			   nvarchar(50),
@streetAndNumber   nvarchar(50),
@city              nvarchar(50),
@state             nvarchar(15),
@postalCode        nvarchar(15),
@countryId		   int,
@email             nvarchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert =statements for procedure here

	Update [dbo].[customers]
	Set     [name]             =  @name			 
           ,[streetAndNumber]  =  @streetAndNumber 
           ,[city]			   =  @city            
           ,[state]			   =  @state           
           ,[postalCode]	   =  @postalCode      
           ,[countryId]		   =  @countryId		 
		   ,[email]			   =  @email
END	