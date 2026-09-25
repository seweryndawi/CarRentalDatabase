CREATE OR ALTER FUNCTION dbo.RevenueByBrandAndYear
(
	@Brand NVARCHAR(50),
	@Year INT
)
RETURNS DECIMAL(15, 2)
AS
BEGIN
	DECLARE @Revenue DECIMAL(15, 2);

	SELECT @Revenue = SUM(R.TotalPrice)
	FROM Rentals R
	JOIN Cars C ON C.CarID = R.CarID
	JOIN RentalDates RD ON RD.DateID = R.DateID
	WHERE C.Brand = @Brand
		AND RD.EndYear = @Year

	RETURN @Revenue;
END;
GO