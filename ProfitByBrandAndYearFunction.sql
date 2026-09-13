CREATE OR ALTER FUNCTION dbo.ProfitByBrandAndYear
(
	@Brand NVARCHAR(50),
	@Year INT
)
RETURNS DECIMAL(15, 2)
AS
BEGIN
	DECLARE @Profit DECIMAL(15, 2);

	SELECT @Profit = SUM(R.TotalPrice)
	FROM Rentals R
	JOIN Cars C ON C.CarID = R.CarID
	WHERE C.Brand = @Brand
		AND YEAR(R.StartDate) = @Year

	RETURN @Profit;
END;
GO