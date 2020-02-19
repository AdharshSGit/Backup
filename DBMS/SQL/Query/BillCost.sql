-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE BillCost @Booking_Id nvarchar(20)  --LodgingCost includes Offer

	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
Select (Room_Type.Cost*Booking.NoofDays)*(1-Offer.Offers)as LodgingPrice
From Booking
Join Enquiry on Enquiry.Enquiry_Id=Booking.Enquiry_Id
Join Rooms on Rooms.Rooms_Id=Enquiry.Rooms_Id
Join Room_Type on Room_Type.Room_Type_Id=Rooms.Room_Type_Id
Join Offer on Offer.Offer_Id=Booking.Offer_Id
Where Booking.Booking_Id=@Booking_Id

Group by Room_Type.Cost,Booking.NoofDays,Offer.Offers

END
GO
