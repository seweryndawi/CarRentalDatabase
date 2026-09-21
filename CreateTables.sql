CREATE TABLE Cars
(
    CarID INT IDENTITY(1,1) PRIMARY KEY,
    Brand NVARCHAR(50) NOT NULL,
    Model NVARCHAR(50) NOT NULL,
    ProductionYear SMALLINT NOT NULL,
    DailyRate DECIMAL(10,2) NOT NULL
);

CREATE TABLE Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Phone NVARCHAR(20),
    Email NVARCHAR(100)
);

CREATE TABLE RentalLocations
(
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    City NVARCHAR(50) NOT NULL,
    Address NVARCHAR(150) NOT NULL
);

CREATE TABLE RentalDates
(
    DateID INT IDENTITY(1, 1) PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    EndMonth INT NOT NULL,
    EndYear INT NOT NULL
)

CREATE TABLE Rentals
(
    RentalID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT NOT NULL,
    CustomerID INT NOT NULL,
    LocationID INT NOT NULL,
    DateID INT NOT NULL,
    TotalPrice DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_Rentals_Cars
        FOREIGN KEY (CarID) REFERENCES Cars(CarID),

    CONSTRAINT FK_Rentals_Customers
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),

    CONSTRAINT FK_Rentals_RentalLocations
        FOREIGN KEY (LocationID) REFERENCES RentalLocations(LocationID),

    CONSTRAINT FK_Rentals_RentalDates
        FOREIGN KEY (DateID) REFERENCES RentalDates(DateID)
);
GO