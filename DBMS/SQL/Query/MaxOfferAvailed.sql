Select Booking.Offer_Id, Count(Booking.Offer_Id) as OfferCount,offer.TotalDays as NoofDays,
convert(varchar(50),cast(offer.Offers*100 as decimal))+ '%' AS OfferValue    --Max Offer Availed
From Booking
join Offer on Booking.Offer_Id=Offer.Offer_Id
WHERE booking.Offer_Id IS NOT NULL
Group by booking.Offer_Id,offer.Offers,offer.TotalDays
HAVING COUNT(*) >= ALL
(SELECT COUNT(*)
FROM Booking
WHERE booking.Offer_Id IS NOT NULL
GROUP BY booking.Offer_Id)
