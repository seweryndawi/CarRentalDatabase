WITH MonthlyRevenueCTE AS (
	SELECT 
		YEAR(EndDate) AS [Year],
		MONTH(EndDate) AS [Month],
		SUM(TotalPrice) AS [Revenue]
	FROM Rentals
	GROUP BY YEAR(EndDate), MONTH(EndDate)
)


SELECT 
	[Year],
	[Month],
	ISNULL(Revenue - LAG(Revenue) OVER (PARTITION BY [Year] ORDER BY [Year], [Month]), 0) AS [RevenueChange]
FROM MonthlyRevenueCTE;