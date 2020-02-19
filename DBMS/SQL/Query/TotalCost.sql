create View TotalCost As  --TotalCost
Select A.Booking_Id,A.AmenitiesCost,B.MealCost, C.LodgingCost,(A.AmenitiesCost+B.MealCost+C.LodgingCost)as TotalCost
From
(select Amenities_Booking.Booking_Id,sum(Amenities.Amenities_Cost)as AmenitiesCost
From Amenities_Booking
join Booking on Booking.Booking_Id=Amenities_Booking.Booking_Id
join Amenities on Amenities.Amenities_Id=Amenities_Booking.Amenities_Id
group by Amenities_Booking.Booking_Id) A
join
(select Restaurant_Booking.Booking_Id,sum(Restaurant.Meal_Cost)as MealCost
From Restaurant_Booking
join Restaurant on Restaurant.Restaurant_Id=Restaurant_Booking.Restaurant_Id
join Booking on Booking.Booking_Id=Restaurant_Booking.Booking_Id
group by Restaurant_Booking.Booking_Id)B on A.Booking_Id=B.Booking_Id
join
(Select Booking.Booking_Id,(Room_Type.Cost*Enquiry.NoofRoom*Booking.NoofDays)as LodgingCost
From Enquiry
Join Booking on Enquiry.Enquiry_Id=Booking.Enquiry_Id
Join Rooms on Rooms.Rooms_Id=Enquiry.Rooms_Id
Join Room_Type on Room_Type.Room_Type_Id=Rooms.Room_Type_Id
group by Booking.Booking_Id,Room_Type.Cost*Enquiry.NoofRoom*Booking.NoofDays
)C on C.Booking_Id=B.Booking_Id