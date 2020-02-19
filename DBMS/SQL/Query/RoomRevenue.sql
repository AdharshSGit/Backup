select Room1.Room_Type_Id,Room1.Room_Types,sum(Room1.Total_Customers_Booked)as TotalBooking ,Sum(Room1.RoomCost) as TotalRevenue  --Room Revenue
from(
Select Rooms.Room_Type_Id,Room_Type.Room_Types,Count(Rooms.Room_Type_Id) as Total_Customers_Booked,
Room_Type.Cost*Enquiry.NoofRoom*Count(Rooms.Room_Type_Id) as RoomCost
From Rooms 
Join Enquiry on Enquiry.Rooms_Id=Rooms.Rooms_Id
Join Room_Type on Room_Type.Room_Type_Id=Rooms.Room_Type_Id
Where Enquiry.Status= 'Available'
Group by Room_Type.Room_Types,Rooms.Room_Type_Id,Room_Type.Cost*Enquiry.NoofRoom)Room1
Group by Room1.Room_Type_Id,Room1.Room_Types
