WITH YearMonthRevCTE AS
(
	SELECT 
		CASE 
			WHEN GROUPING(RD.EndYear) = 1 THEN 'Summary'
			ELSE CAST(RD.EndYear AS VARCHAR(4))
		END AS [Year],
		CASE
			WHEN GROUPING(RD.EndMonth) = 1 THEN 'Summary'
			ELSE FORMAT
				(
				DATEFROMPARTS(2000, RD.EndMonth, 1),
				'MMMM',
				'en-US'
				)
		END AS [Month],
		SUM(R.TotalPrice) AS Revenue
	FROM Rentals R
	JOIN RentalDates RD ON RD.DateID = R.DateID
	GROUP BY CUBE(RD.EndYear, RD.EndMonth)
)


SELECT 
	[Year],
	ISNULL([January], 0) AS [January],
    ISNULL([February], 0) AS [February],
    ISNULL([March], 0) AS [March],
    ISNULL([April], 0) AS [April],
    ISNULL([May], 0) AS [May],
    ISNULL([June], 0) AS [June],
    ISNULL([July], 0) AS [July],
    ISNULL([August], 0) AS [August],
    ISNULL([September], 0) AS [September],
    ISNULL([October], 0) AS [October],
    ISNULL([November], 0) AS [November],
    ISNULL([December], 0) AS [December],
	[Summary]
FROM YearMonthRevCTE
PIVOT
(
	SUM(Revenue)
	FOR [Month] IN
	(
		[January], [February], [March], [April],
        [May], [June], [July], [August],
        [September], [October], [November], [December],
        [Summary]
	)
) AS P;
GO