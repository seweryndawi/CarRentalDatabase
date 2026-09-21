WITH MonthlyRevenueCTE AS (
	SELECT 
		RD.EndYear AS [Year],
		RD.EndMonth AS [Month],
		SUM(R.TotalPrice) AS [Revenue]
	FROM Rentals R
	JOIN RentalDates RD ON R.DateID = RD.DateID
	GROUP BY RD.EndYear, RD.EndMonth
)


SELECT 
	[Year],
	[Month],
	ISNULL(Revenue - LAG(Revenue) OVER (PARTITION BY [Year] ORDER BY [Year], [Month]), 0) AS [RevenueChange]
FROM MonthlyRevenueCTE;