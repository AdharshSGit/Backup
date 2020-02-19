Select  Restaurant.Meal,Restaurant_Booking.Restaurant_Id,COUNT(Restaurant_Booking.Restaurant_Id) as MealPreference,
COUNT(Restaurant_Booking.Restaurant_Id)*Restaurant.Meal_Cost As TotalCost     --MealPreference & MealRevenues
From Booking
Join Enquiry on Enquiry.Enquiry_Id=Booking.Enquiry_Id
Join Restaurant_Booking on Restaurant_Booking.Booking_Id=Booking.Booking_Id
Join Restaurant on restaurant.Restaurant_Id=Restaurant_Booking.Restaurant_Id
WHERE Meal != 'NULL'
Group by Restaurant.Meal,Restaurant_Booking.Restaurant_Id,Restaurant.Meal_Cost
Order by COUNT(Restaurant_Booking.Restaurant_Id) Desc