-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-11-15 08:17:27.234

-- tables
-- Table: Amenities
CREATE TABLE Amenities (
    Amenities_Id nvarchar(5)  NOT NULL,
    Amentities_Name varchar(20)  NOT NULL,
    Timings nvarchar(20)  NOT NULL,
    Amenities_Cost int  NOT NULL,
    CONSTRAINT Amenities_pk PRIMARY KEY  (Amenities_Id)
);

-- Table: Amenities_Booking
CREATE TABLE Amenities_Booking (
    Amenities_Booking_Id nvarchar(5)  NOT NULL,
    Booking_Id nvarchar(5)  NOT NULL,
    Amenities_Id nvarchar(5)  NOT NULL,
    CONSTRAINT Amenities_Booking_pk PRIMARY KEY  (Amenities_Booking_Id)
);

-- Table: BILL
CREATE TABLE BILL (
    BILL_Id nvarchar(5)  NOT NULL,
    Lodging_Price int  NOT NULL,
    Other_price int  NOT NULL,
    Total_Price int  NOT NULL,
    Booking_Id nvarchar(5)  NOT NULL,
    Invoice_Id nvarchar(10)  NOT NULL,
    CONSTRAINT BILL_pk PRIMARY KEY  (BILL_Id)
);

-- Table: Booking
CREATE TABLE Booking (
    Booking_Id nvarchar(5)  NOT NULL,
    Booking_Method_Id nvarchar(5)  NOT NULL,
    Status_Id nvarchar(5)  NOT NULL,
    Offer_Id nvarchar(5)  NOT NULL,
    NoofDays int  NOT NULL,
    CONSTRAINT Booking_pk PRIMARY KEY  (Booking_Id)
);

-- Table: Booking_Method
CREATE TABLE Booking_Method (
    Booking_Method_Id nvarchar(5)  NOT NULL,
    Agent_name varchar(20)  NOT NULL,
    CONSTRAINT Booking_Method_pk PRIMARY KEY  (Booking_Method_Id)
);

-- Table: Customer
CREATE TABLE Customer (
    Customer_Id nvarchar(5)  NOT NULL,
    Customer_name varchar(20)  NOT NULL,
    Customer_phno bigint  NOT NULL,
    Customer_address nvarchar(100)  NOT NULL,
    Customer_Email nvarchar(20)  NOT NULL,
    ID_Proof nvarchar(50)  NOT NULL,
    CONSTRAINT Customer_pk PRIMARY KEY  (Customer_Id)
);

-- Table: Enquiry
CREATE TABLE Enquiry (
    Enquiry_Id nvarchar(5)  NOT NULL,
    Customer_Id nvarchar(5)  NOT NULL,
    Rooms_Id nvarchar(5)  NOT NULL,
    NoofRoom int  NOT NULL,
    NoofPeople int  NOT NULL,
    From_Date date  NOT NULL,
    To_Date date  NOT NULL,
    Status varchar(5)  NOT NULL,
    CONSTRAINT Enquiry_pk PRIMARY KEY  (Enquiry_Id)
);

-- Table: Hotel_Details
CREATE TABLE Hotel_Details (
    Hotel_Details_Id nvarchar(5)  NOT NULL,
    Hotel_name nvarchar(20)  NOT NULL,
    Hotel_phno bigint  NOT NULL,
    Hotel_address nvarchar(100)  NOT NULL,
    CONSTRAINT Hotel_Details_pk PRIMARY KEY  (Hotel_Details_Id)
);

-- Table: Offer
CREATE TABLE Offer (
    Offer_Id nvarchar(5)  NOT NULL,
    TotalDays int  NOT NULL,
    Offers float(5)  NOT NULL,
    CONSTRAINT Offer_pk PRIMARY KEY  (Offer_Id)
);

-- Table: Partner_Hotel
CREATE TABLE Partner_Hotel (
    Partner_Hotel_Id nvarchar(5)  NOT NULL,
    Enquiry_Id nvarchar(5)  NOT NULL,
    Hotel_Details_Id nvarchar(5)  NOT NULL,
    CONSTRAINT Partner_Hotel_pk PRIMARY KEY  (Partner_Hotel_Id)
);

-- Table: Payment
CREATE TABLE Payment (
    Payment_Id nvarchar(5)  NOT NULL,
    BILL_Id nvarchar(5)  NOT NULL,
    Payment_Mode int  NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY  (Payment_Id)
);

-- Table: Restaurant
CREATE TABLE Restaurant (
    Restaurant_Id nvarchar(5)  NOT NULL,
    Meal varchar(20)  NOT NULL,
    Timings nvarchar(20)  NOT NULL,
    Meal_Cost int  NOT NULL,
    CONSTRAINT Restaurant_pk PRIMARY KEY  (Restaurant_Id)
);

-- Table: Restaurant_Booking
CREATE TABLE Restaurant_Booking (
    Restaurant_Booking_Id nvarchar(5)  NOT NULL,
    Restaurant_Id nvarchar(5)  NOT NULL,
    Booking_Id nvarchar(5)  NOT NULL,
    CONSTRAINT Restaurant_Booking_pk PRIMARY KEY  (Restaurant_Booking_Id)
);

-- Table: Room_Type
CREATE TABLE Room_Type (
    Room_Type_Id nvarchar(5)  NOT NULL,
    Room_Types varchar(20)  NOT NULL,
    Cost int  NOT NULL,
    MaxPeople int  NOT NULL,
    CONSTRAINT Room_Type_pk PRIMARY KEY  (Room_Type_Id)
);

-- Table: Rooms
CREATE TABLE Rooms (
    Rooms_Id nvarchar(5)  NOT NULL,
    Rooms_No nvarchar(5)  NOT NULL,
    Floor int  NOT NULL,
    Room_Type_Id nvarchar(5)  NOT NULL,
    CONSTRAINT Rooms_pk PRIMARY KEY  (Rooms_Id)
);

-- foreign keys
-- Reference: Amenities_Booking_Amenities (table: Amenities_Booking)
ALTER TABLE Amenities_Booking ADD CONSTRAINT Amenities_Booking_Amenities
    FOREIGN KEY (Amenities_Id)
    REFERENCES Amenities (Amenities_Id);

-- Reference: Amenities_Booking_Booking (table: Amenities_Booking)
ALTER TABLE Amenities_Booking ADD CONSTRAINT Amenities_Booking_Booking
    FOREIGN KEY (Booking_Id)
    REFERENCES Booking (Booking_Id);

-- Reference: BILL_Booking (table: BILL)
ALTER TABLE BILL ADD CONSTRAINT BILL_Booking
    FOREIGN KEY (Booking_Id)
    REFERENCES Booking (Booking_Id);

-- Reference: Booking_Booking_Method (table: Booking)
ALTER TABLE Booking ADD CONSTRAINT Booking_Booking_Method
    FOREIGN KEY (Booking_Method_Id)
    REFERENCES Booking_Method (Booking_Method_Id);

-- Reference: Booking_Offer (table: Booking)
ALTER TABLE Booking ADD CONSTRAINT Booking_Offer
    FOREIGN KEY (Offer_Id)
    REFERENCES Offer (Offer_Id);

-- Reference: Booking_Status (table: Booking)
ALTER TABLE Booking ADD CONSTRAINT Booking_Status
    FOREIGN KEY (Status_Id)
    REFERENCES Enquiry (Enquiry_Id);

-- Reference: OverBooking_Status (table: Partner_Hotel)
ALTER TABLE Partner_Hotel ADD CONSTRAINT OverBooking_Status
    FOREIGN KEY (Enquiry_Id)
    REFERENCES Enquiry (Enquiry_Id);

-- Reference: Partner_Hotel_Hotel_Details (table: Partner_Hotel)
ALTER TABLE Partner_Hotel ADD CONSTRAINT Partner_Hotel_Hotel_Details
    FOREIGN KEY (Hotel_Details_Id)
    REFERENCES Hotel_Details (Hotel_Details_Id);

-- Reference: Payment_BILL (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_BILL
    FOREIGN KEY (BILL_Id)
    REFERENCES BILL (BILL_Id);

-- Reference: Restaurant_Booking_Booking (table: Restaurant_Booking)
ALTER TABLE Restaurant_Booking ADD CONSTRAINT Restaurant_Booking_Booking
    FOREIGN KEY (Booking_Id)
    REFERENCES Booking (Booking_Id);

-- Reference: Restaurant_Booking_Restaurant (table: Restaurant_Booking)
ALTER TABLE Restaurant_Booking ADD CONSTRAINT Restaurant_Booking_Restaurant
    FOREIGN KEY (Restaurant_Id)
    REFERENCES Restaurant (Restaurant_Id);

-- Reference: Rooms_Room_Type (table: Rooms)
ALTER TABLE Rooms ADD CONSTRAINT Rooms_Room_Type
    FOREIGN KEY (Room_Type_Id)
    REFERENCES Room_Type (Room_Type_Id);

-- Reference: Status_Customer (table: Enquiry)
ALTER TABLE Enquiry ADD CONSTRAINT Status_Customer
    FOREIGN KEY (Customer_Id)
    REFERENCES Customer (Customer_Id);

-- Reference: Status_Rooms (table: Enquiry)
ALTER TABLE Enquiry ADD CONSTRAINT Status_Rooms
    FOREIGN KEY (Rooms_Id)
    REFERENCES Rooms (Rooms_Id);

-- End of file.

