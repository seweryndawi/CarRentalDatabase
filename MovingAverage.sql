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
	AVG(Revenue) OVER (ORDER BY [Year], [Month] ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS [MovingAverage]
FROM MonthlyRevenueCTE;