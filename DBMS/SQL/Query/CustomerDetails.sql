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
CREATE PROCEDURE DetailsCustomer @Customer_Id nvarchar(20)
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Select Enquiry.Customer_Id,Booking_Method.Agent_name,Enquiry.Rooms_Id,Enquiry.NoofRoom,Enquiry.From_Date,Enquiry.To_Date,Offer.Offers,BILL.Total_Price,bill.Invoice_Id
	From Booking
	Join Enquiry on Enquiry.Enquiry_Id=Booking.Enquiry_Id
	Join Offer on Offer.Offer_Id=Booking.Offer_Id
	Join BILL on Bill.Booking_Id=Booking.Booking_Id
	Join Booking_Method on Booking_Method.Booking_Method_Id=Booking.Booking_Method_Id
	where Enquiry.Customer_Id=@Customer_Id
	Group by Enquiry.Customer_Id,Booking_Method.Agent_name,Enquiry.Rooms_Id,Enquiry.NoofRoom,Enquiry.From_Date,Enquiry.To_Date,Offer.Offers,BILL.Total_Price,bill.Invoice_Id
    -- Insert statements for procedure here
	
END
GO
