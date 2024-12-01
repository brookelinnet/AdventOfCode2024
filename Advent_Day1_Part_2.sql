GO
DECLARE @i int = 0
DECLARE @LEFT INT,
		@COUNT INT
WHILE @i < 1000

BEGIN
	SET @COUNT = 0
	SET @left = (
		SELECT 
			[AdventLeft]
		FROM 
			[Advent_Day1_ProcessedData] 
		ORDER BY
			[AdventLeft] 
			OFFSET @i ROWS 
			FETCH FIRST 1 ROWS ONLY
			)

	SET @Count = (
		SELECT 
			COUNT(*) 
		FROM 
			[Advent_Day1_ProcessedData] 
		WHERE
			[AdventRight] = @left)
		UPDATE 
			[Advent_Day1_ProcessedData]
		SET 
			[RIL] = @Count,
			[score] = @left * @Count 
		WHERE 
			[AdventLeft] = @left

	SET @i = @i + 1

END
GO
	SELECT 
		SUM([Score]) 
	FROM	
		[Advent_Day1_ProcessedData] 