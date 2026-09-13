CREATE OR ALTER PROCEDURE dbo.FillCars
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Cars
        (Brand, Model, ProductionYear, DailyRate, Status)
    VALUES
        (N'Toyota', N'Corolla', 2021, 160.00, N'Available'),
        (N'Toyota', N'Camry', 2022, 210.00, N'Available'),
        (N'Ford', N'Focus', 2020, 150.00, N'Available'),
        (N'Ford', N'Mondeo', 2021, 190.00, N'Available'),
        (N'Volkswagen', N'Golf', 2022, 180.00, N'Available'),
        (N'Volkswagen', N'Passat', 2021, 220.00, N'Available'),
        (N'BMW', N'320i', 2022, 300.00, N'Available'),
        (N'BMW', N'520i', 2023, 380.00, N'Available'),
        (N'Audi', N'A3', 2021, 260.00, N'Available'),
        (N'Audi', N'A4', 2022, 310.00, N'Available'),
        (N'Mercedes', N'A-Class', 2022, 290.00, N'Available'),
        (N'Mercedes', N'C-Class', 2023, 360.00, N'Available'),
        (N'Skoda', N'Octavia', 2021, 170.00, N'Available'),
        (N'Skoda', N'Superb', 2022, 220.00, N'Available'),
        (N'Kia', N'Ceed', 2021, 150.00, N'Available'),
        (N'Kia', N'Sportage', 2022, 230.00, N'Available'),
        (N'Hyundai', N'i30', 2020, 145.00, N'Available'),
        (N'Hyundai', N'Tucson', 2022, 235.00, N'Available'),
        (N'Renault', N'Clio', 2021, 130.00, N'Available'),
        (N'Renault', N'Megane', 2022, 165.00, N'Available'),
        (N'Peugeot', N'208', 2021, 135.00, N'Available'),
        (N'Peugeot', N'308', 2022, 175.00, N'Available'),
        (N'Volvo', N'S60', 2022, 320.00, N'Available'),
        (N'Mazda', N'3', 2021, 180.00, N'Available'),
        (N'Honda', N'Civic', 2022, 190.00, N'Available');
END;
GO


CREATE OR ALTER PROCEDURE dbo.FillCustomers
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Customers
        (FirstName, LastName, Phone, Email)
    VALUES
        (N'Adam', N'Kowalski', N'501100001', N'adam.kowalski@email.com'),
        (N'Anna', N'Nowak', N'501100002', N'anna.nowak@email.com'),
        (N'Piotr', N'Wiśniewski', N'501100003', N'piotr.wisniewski@email.com'),
        (N'Maria', N'Wójcik', N'501100004', N'maria.wojcik@email.com'),
        (N'Jan', N'Kowalczyk', N'501100005', N'jan.kowalczyk@email.com'),
        (N'Katarzyna', N'Kamińska', N'501100006', N'katarzyna.kaminska@email.com'),
        (N'Michał', N'Lewandowski', N'501100007', N'michal.lewandowski@email.com'),
        (N'Agnieszka', N'Zielińska', N'501100008', N'agnieszka.zielinska@email.com'),
        (N'Tomasz', N'Szymański', N'501100009', N'tomasz.szymanski@email.com'),
        (N'Magdalena', N'Woźniak', N'501100010', N'magdalena.wozniak@email.com'),
        (N'Paweł', N'Dąbrowski', N'501100011', N'pawel.dabrowski@email.com'),
        (N'Joanna', N'Kozłowska', N'501100012', N'joanna.kozlowska@email.com'),
        (N'Krzysztof', N'Jankowski', N'501100013', N'krzysztof.jankowski@email.com'),
        (N'Monika', N'Mazur', N'501100014', N'monika.mazur@email.com'),
        (N'Marcin', N'Wojciechowski', N'501100015', N'marcin.wojciechowski@email.com'),
        (N'Ewa', N'Kwiatkowska', N'501100016', N'ewa.kwiatkowska@email.com'),
        (N'Łukasz', N'Krawczyk', N'501100017', N'lukasz.krawczyk@email.com'),
        (N'Aleksandra', N'Kaczmarek', N'501100018', N'aleksandra.kaczmarek@email.com'),
        (N'Jakub', N'Piotrowski', N'501100019', N'jakub.piotrowski@email.com'),
        (N'Natalia', N'Grabowska', N'501100020', N'natalia.grabowska@email.com'),
        (N'Damian', N'Pawłowski', N'501100021', N'damian.pawlowski@email.com'),
        (N'Karolina', N'Michalska', N'501100022', N'karolina.michalska@email.com'),
        (N'Rafał', N'Król', N'501100023', N'rafal.krol@email.com'),
        (N'Patrycja', N'Wieczorek', N'501100024', N'patrycja.wieczorek@email.com'),
        (N'Mateusz', N'Jabłoński', N'501100025', N'mateusz.jablonski@email.com'),
        (N'Julia', N'Wróbel', N'501100026', N'julia.wrobel@email.com'),
        (N'Bartosz', N'Nowicki', N'501100027', N'bartosz.nowicki@email.com'),
        (N'Marta', N'Majewska', N'501100028', N'marta.majewska@email.com'),
        (N'Grzegorz', N'Olszewski', N'501100029', N'grzegorz.olszewski@email.com'),
        (N'Paulina', N'Stępień', N'501100030', N'paulina.stepien@email.com'),
        (N'Artur', N'Jaworski', N'501100031', N'artur.jaworski@email.com'),
        (N'Dorota', N'Malinowska', N'501100032', N'dorota.malinowska@email.com'),
        (N'Wojciech', N'Adamczyk', N'501100033', N'wojciech.adamczyk@email.com'),
        (N'Beata', N'Dudek', N'501100034', N'beata.dudek@email.com'),
        (N'Kamil', N'Nowakowski', N'501100035', N'kamil.nowakowski@email.com'),
        (N'Weronika', N'Pawlak', N'501100036', N'weronika.pawlak@email.com'),
        (N'Robert', N'Górski', N'501100037', N'robert.gorski@email.com'),
        (N'Izabela', N'Witkowska', N'501100038', N'izabela.witkowska@email.com'),
        (N'Norbert', N'Walczak', N'501100039', N'norbert.walczak@email.com'),
        (N'Emilia', N'Rutkowska', N'501100040', N'emilia.rutkowska@email.com'),
        (N'Dariusz', N'Michalak', N'501100041', N'dariusz.michalak@email.com'),
        (N'Sylwia', N'Sikora', N'501100042', N'sylwia.sikora@email.com'),
        (N'Adrian', N'Baran', N'501100043', N'adrian.baran@email.com'),
        (N'Kamila', N'Szewczyk', N'501100044', N'kamila.szewczyk@email.com'),
        (N'Patryk', N'Ostrowski', N'501100045', N'patryk.ostrowski@email.com'),
        (N'Olga', N'Tomaszewska', N'501100046', N'olga.tomaszewska@email.com'),
        (N'Sebastian', N'Zalewski', N'501100047', N'sebastian.zalewski@email.com'),
        (N'Justyna', N'Lis', N'501100048', N'justyna.lis@email.com'),
        (N'Filip', N'Borkowski', N'501100049', N'filip.borkowski@email.com'),
        (N'Zuzanna', N'Makowska', N'501100050', N'zuzanna.makowska@email.com');
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


CREATE OR ALTER PROCEDURE dbo.FillRentals
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 1;

    DECLARE @CarCount INT;
    DECLARE @CustomerCount INT;
    DECLARE @LocationCount INT;

    DECLARE @CarID INT;
    DECLARE @CustomerID INT;
    DECLARE @LocationID INT;

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

    WHILE @i <= 200
    BEGIN
        SET @CarOffset = (@i - 1) % @CarCount;
        SET @CustomerOffset = (@i - 1) % @CustomerCount;
        SET @LocationOffset = (@i - 1) % @LocationCount;

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

        SET @RentalDays = ((@i - 1) % 7) + 1;

        SET @StartDate =
            DATEADD(DAY, @i - 1, CAST('2025-01-01' AS DATE));

        SET @EndDate =
            DATEADD(DAY, @RentalDays, @StartDate);

        INSERT INTO Rentals
        (
            CarID,
            CustomerID,
            LocationID,
            StartDate,
            EndDate,
            TotalPrice
        )
        VALUES
        (
            @CarID,
            @CustomerID,
            @LocationID,
            @StartDate,
            @EndDate,
            @DailyRate * @RentalDays
        );

        SET @i = @i + 1;
    END;


    -- YEAR 2026
    INSERT INTO Rentals
    (
        CarID,
        CustomerID,
        LocationID,
        StartDate,
        EndDate,
        TotalPrice
    )
    SELECT
        V.CarID,
        V.CustomerID,
        V.LocationID,
        V.StartDate,
        V.EndDate,
        C.DailyRate * DATEDIFF(DAY, V.StartDate, V.EndDate)
    FROM
    (
        VALUES
            (1,  1, 1, CAST('2026-01-03' AS DATE), CAST('2026-01-06' AS DATE)),
            (2,  2, 2, CAST('2026-01-07' AS DATE), CAST('2026-01-12' AS DATE)),
            (3,  3, 3, CAST('2026-01-11' AS DATE), CAST('2026-01-13' AS DATE)),
            (4,  4, 4, CAST('2026-01-18' AS DATE), CAST('2026-01-22' AS DATE)),
            (5,  5, 5, CAST('2026-01-25' AS DATE), CAST('2026-01-28' AS DATE)),

            (6,  6, 1, CAST('2026-02-02' AS DATE), CAST('2026-02-06' AS DATE)),
            (7,  7, 2, CAST('2026-02-08' AS DATE), CAST('2026-02-10' AS DATE)),
            (8,  8, 3, CAST('2026-02-13' AS DATE), CAST('2026-02-18' AS DATE)),
            (9,  9, 4, CAST('2026-02-20' AS DATE), CAST('2026-02-23' AS DATE)),
            (10, 10, 5, CAST('2026-02-25' AS DATE), CAST('2026-02-28' AS DATE))
    ) V(CarID, CustomerID, LocationID, StartDate, EndDate)
    JOIN Cars C
        ON C.CarID = V.CarID;
END;
GO