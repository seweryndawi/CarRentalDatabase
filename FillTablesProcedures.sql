CREATE OR ALTER PROCEDURE dbo.FillCars
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Cars
        (Brand, Model, ProductionYear, DailyRate)
    VALUES
        (N'Toyota', N'Yaris', 2013, 50.00),
        (N'Toyota', N'RAV4', 2014, 60.00),
        (N'Ford', N'Fiesta', 2012, 45.00),
        (N'Ford', N'Kuga', 2013, 40.00),
        (N'Volkswagen', N'Polo', 2013, 55.00),
        (N'Volkswagen', N'Tiguan', 2014, 70.00),
        (N'BMW', N'118i', 2013, 80.00),
        (N'BMW', N'X3', 2014, 30.00),
        (N'Audi', N'A1', 2013, 50.00),
        (N'Audi', N'Q3', 2014, 50.00),
        (N'Mercedes', N'CLA', 2013, 30.00),
        (N'Mercedes', N'GLA', 2014, 70.00),
        (N'Skoda', N'Fabia', 2013, 40.00),
        (N'Skoda', N'Kodiaq', 2014, 80.00),
        (N'Kia', N'Rio', 2012, 40.00),
        (N'Kia', N'Sorento', 2014, 90.00),
        (N'Hyundai', N'i20', 2013, 45.00),
        (N'Hyundai', N'Santa Fe', 2014, 100.00),
        (N'Renault', N'Captur', 2013, 75.00),
        (N'Renault', N'Arkana', 2014, 120.00),
        (N'Peugeot', N'2008', 2013, 80.00),
        (N'Peugeot', N'508', 2014, 145.00),
        (N'Volvo', N'XC40', 2014, 140.00),
        (N'Mazda', N'CX-5', 2013, 145.00),
        (N'Honda', N'CR-V', 2014, 75.00);
END;
GO


CREATE OR ALTER PROCEDURE dbo.FillCustomers
AS
BEGIN
    SET NOCOUNT ON;

    WITH FirstNames AS
    (
        SELECT FirstName
        FROM (VALUES
            (N'Alexander'),
            (N'Benjamin'),
            (N'Daniel'),
            (N'Edward'),
            (N'Gabriel'),
            (N'Henry'),
            (N'Isaac'),
            (N'Jack'),
            (N'Lucas'),
            (N'Michael'),
            (N'Natalie'),
            (N'Olivia'),
            (N'Sophia'),
            (N'Victoria'),
            (N'Zoe')
        ) F(FirstName)
    ),
    LastNames AS
    (
        SELECT LastName
        FROM (VALUES
            (N'Anderson'),
            (N'Baker'),
            (N'Clark'),
            (N'Davis'),
            (N'Evans'),
            (N'Foster'),
            (N'Green'),
            (N'Harris'),
            (N'Johnson'),
            (N'Mitchell')
        ) L(LastName)
    ),
    People AS
    (
        SELECT
            F.FirstName,
            L.LastName,
            ROW_NUMBER() OVER
            (
                ORDER BY F.FirstName, L.LastName
            ) AS Number
        FROM FirstNames F
        CROSS JOIN LastNames L
    )
    INSERT INTO Customers
    (
        FirstName,
        LastName,
        Phone,
        Email
    )
    SELECT
        FirstName,
        LastName,
        CONCAT(N'502', RIGHT(N'000000' + CAST(Number AS NVARCHAR(6)), 6)),
        LOWER(CONCAT(
            FirstName,
            N'.',
            LastName,
            Number,
            N'@email.com'
        ))
    FROM People;
END;
GO


CREATE OR ALTER PROCEDURE dbo.FillRentalLocations
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO RentalLocations
        (Name, City, Address)
    VALUES
        (N'Warszawa Central', N'Warszawa', N'Marszałkowska 100'),
        (N'Krakow Center', N'Kraków', N'Floriańska 25'),
        (N'Gdansk Station', N'Gdańsk', N'Długa 40'),
        (N'Wroclaw Center', N'Wrocław', N'Legnicka 55'),
        (N'Poznan Center', N'Poznań', N'Półwiejska 30');
END;
GO

CREATE OR ALTER PROCEDURE dbo.FillDates
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 0;

    DECLARE @StartDate DATE;
    DECLARE @EndDate DATE;
    DECLARE @RentalDays INT;

    WHILE @i < 2000
    BEGIN
        SET @RentalDays = @i % 7 + 1;

        SET @StartDate = DATEADD(DAY, @i, CAST('2018-01-01' AS DATE));
        SET @EndDate = DATEADD(DAY, @RentalDays, @StartDate);

        INSERT INTO RentalDates
        (
            StartDate,
            EndDate,
            EndMonth,
            EndYear
        )
        VALUES
        (
            @StartDate,
            @EndDate,
            MONTH(@EndDate),
            YEAR(@EndDate)
        );
        
        SET @i = @i + 1;
    END;
END;
GO

CREATE OR ALTER PROCEDURE dbo.FillRentals
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 0;

    DECLARE @CarCount INT;
    DECLARE @CustomerCount INT;
    DECLARE @LocationCount INT;

    DECLARE @CarID INT;
    DECLARE @CustomerID INT;
    DECLARE @LocationID INT;
    DECLARE @DateID INT;

    DECLARE @CarOffset INT;
    DECLARE @CustomerOffset INT;
    DECLARE @LocationOffset INT;

    DECLARE @StartDate DATE;
    DECLARE @EndDate DATE;
    DECLARE @RentalDays INT;
    DECLARE @DailyRate DECIMAL(10,2);

    SELECT @CarCount = COUNT(*)
    FROM Cars;

    SELECT @CustomerCount = COUNT(*)
    FROM Customers;

    SELECT @LocationCount = COUNT(*)
    FROM RentalLocations;

    WHILE @i < 2000
    BEGIN
        SET @CarOffset = @i % @CarCount;
        SET @CustomerOffset = @i % @CustomerCount;
        SET @LocationOffset = @i % @LocationCount;

        SELECT
            @CarID = CarID,
            @DailyRate = DailyRate
        FROM Cars
        ORDER BY CarID
        OFFSET @CarOffset ROWS
        FETCH NEXT 1 ROW ONLY;

        SELECT @CustomerID = CustomerID
        FROM Customers
        ORDER BY CustomerID
        OFFSET @CustomerOffset ROWS
        FETCH NEXT 1 ROW ONLY;

        SELECT @LocationID = LocationID
        FROM RentalLocations
        ORDER BY LocationID
        OFFSET @LocationOffset ROWS
        FETCH NEXT 1 ROW ONLY;

        SELECT @DateID = DateID,
            @StartDate = StartDate,
            @EndDate = EndDate
        FROM RentalDates
        ORDER BY DateID
        OFFSET @i ROWS
        FETCH NEXT 1 ROW ONLY;

        SET @RentalDays = DATEDIFF(DAY, @StartDate, @EndDate);

        INSERT INTO Rentals
        (
            CarID,
            CustomerID,
            LocationID,
            DateID,
            TotalPrice
        )
        VALUES
        (
            @CarID,
            @CustomerID,
            @LocationID,
            @DateID,
            @DailyRate * @RentalDays
        );

        -- Summer
        IF MONTH(@StartDate) >= 6 AND MONTH(@StartDate) <= 9
        BEGIN
            SET @CarOffset = (@i + 25) % @CarCount;
            SET @CustomerOffset = (@i + 100) % @CustomerCount;
            
            SELECT 
                @CarID = CarID,
                @DailyRate = DailyRate
            FROM Cars
            ORDER BY CarID
            OFFSET @CarOffset ROWS
            FETCH NEXT 1 ROW ONLY;

            SELECT @CustomerID = CustomerID
            FROM Customers
            ORDER BY CustomerID
            OFFSET @CustomerOffset ROWS
            FETCH NEXT 1 ROW ONLY;

            INSERT INTO Rentals
            (
                CarID,
                CustomerID,
                LocationID,
                DateID,
                TotalPrice
            )
            VALUES
            (
                @CarID,
                @CustomerID,
                @LocationID,
                @DateID,
                @DailyRate - 30
            );
        END;
        SET @i = @i + 1;
    END;
END;
GO