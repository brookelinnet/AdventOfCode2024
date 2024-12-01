GO
DECLARE 
		@i int = 0,
		@LeftVal INT,
		@RightVal INT,
		@ValDiff INT 
WHILE @i < 1000
	BEGIN
		SET
			@ValDiff = 0

		SET @LeftVal = (
			SELECT
				[left] 
			FROM 
				[AdventDataDay1] 
			ORDER BY
				[LEFT] ASC 
			OFFSET @i ROWS
			FETCH FIRST 1 ROWS ONLY
			)

		SET @RightVal = (
			SELECT 
				[right] 
			FROM 
				[AdventDataDay1] 
			ORDER BY [right] ASC 
			OFFSET @i ROWS 
			FETCH FIRST 1 ROWS ONLY
			)

		IF (@rightval - @leftVal >= 0)
			BEGIN
				SET @ValDiff = @rightval - @leftVal
			END
		ELSE
			BEGIN
				SET @ValDiff = @leftval - @rightVal
			END

		INSERT INTO 
			[Advent_Day1_ProcessedData]
			(
			[AdventLeft],
			[AdventRight],
			[Difference]
			)
		VALUES
			(
			@LeftVal, 
			@RightVal, 
			@ValDiff
			)
	SET @i = @i+1
END
GO
	SELECT 
		SUM([Difference]) 
	FROM 
		[Advent_Day1_ProcessedData]