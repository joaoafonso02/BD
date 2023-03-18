CREATE TABLE Airport (
	[Code] [int] NOT NULL PRIMARY KEY, 
	[Airport_name] [varchar](32) NOT NULL,
	[City] [varchar](32) NOT NULL,
	[State] [varchar](32) NOT NULL
)
GO

CREATE TABLE Airport_Type (
	[Type_name] [varchar](32) NOT NULL PRIMARY KEY,
	[Company] [varchar](32) NOT NULL,
	[Max_Seats] [int] NOT NULL CHECK (Max_Seats > 0)
)
GO

CREATE TABLE CanLand (
	[Code] [int] NOT NULL REFERENCES Airport(Code),
	[Type_name] [varchar](32) NOT NULL REFERENCES Airport_Type([Type_name])
)
GO

CREATE TABLE Airplane (
	[Airplane_id] [varchar](16) NOT NULL PRIMARY KEY,
	[Total_no_Seats] [int] NOT NULL CHECK (Total_no_Seats > 0),
	[Type_name] [varchar](32) NOT NULL REFERENCES Airport_Type([Type_name])
)
GO

CREATE TABLE Flight (
	[Number_flight1] [int] NOT NULL PRIMARY KEY,
	[Airline] [varchar](32) NOT NULL,
	[WeekDays] [varchar](16) CHECK (WeekDays IN ('Monday',
		'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Suuday')
	)
)
GO

CREATE TABLE Flight_Leg (
	[Leg_Number_flight1] [int] NOT NULL,
	[Flight_Number_flight1] [int] NOT NULL REFERENCES flight([Number_flight1]),
	[Departure_Code] [int] NOT NULL REFERENCES Airport([Code]),
	[Arrival_Code] [int] NOT NULL REFERENCES Airport([Code]),
	[Departure_Time] [varchar](16) NOT NULL,
	[Arrival_Time] [varchar](16) NOT NULL

	PRIMARY KEY (Leg_Number_flight1, Flight_Number_flight1)
)
GO

CREATE TABLE Fares(
	[Code] [int] NOT NULL,
	[Flight_Number_flight1] [int] NOT NULL REFERENCES flight([Number_flight1]),
	[Amount] [int] NOT NULL,
	[Restrictions] [varchar](128) NOT NULL,
	PRIMARY KEY (Code, Flight_Number_flight1)
);

CREATE TABLE Leg_Instance(
	[Leg_Date] [date] NOT NULL,
	[Flight_Number_flight1] [int] NOT NULL REFERENCES Flight([Number_flight1]),
	[Leg_Number_flight1] [int] NOT NULL,
	[Airplane_id] [varchar](16) REFERENCES Airplane([Airplane_id]),
	[Departure_time] [varchar](16) NOT NULL,
	[Arrival_Time] [varchar](16) NOT NULL,
	[Departure_Code] [int] NOT NULL REFERENCES Airport([Code]),
	[Arrival_Code] [int] NOT NULL REFERENCES Airport([Code]),
	[Number_flight1_avail_seats] [int] NOT NULL,

	PRIMARY KEY (Flight_Number_flight1, Leg_Number_flight1, Leg_Date),
	FOREIGN KEY (Leg_Number_flight1, Flight_Number_flight1) REFERENCES Flight_Leg(Leg_Number_flight1, Flight_Number_flight1)
)
GO

CREATE TABLE Seat(
	[Flight_number_flight1] [int] NOT NULL,
	[Leg_Number_flight1] [int] NOT NULL,
	[Seat_Number_flight1] [int] NOT NULL,
	[Seat_date] [date] NOT NULL,
	[Customer_name] [varchar](32) NOT NULL,
	[Customer_Phone] [int] NOT NULL,

	PRIMARY KEY(
		Seat_Number_flight1,
		Seat_date,
		Flight_number_flight1,
		Leg_Number_flight1
	),

	FOREIGN KEY(Flight_number_flight1, Leg_Number_flight1, Seat_date) REFERENCES Leg_Instance(
		Flight_number_flight1,
		Leg_Number_flight1,
		Leg_Date
	)
	

)
GO


