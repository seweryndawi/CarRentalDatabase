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
	AVG(Revenue) OVER (ORDER BY [Year], [Month] ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS [MovingAverage]
FROM MonthlyRevenueCTE;