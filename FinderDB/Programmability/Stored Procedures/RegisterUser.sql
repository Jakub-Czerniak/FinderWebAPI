CREATE PROCEDURE RegisterUser @Name VARCHAR(255), @Email VARCHAR(255), @Password VARCHAR(255), @Gender VARCHAR(10), @Photo VARBINARY(MAX), @InterestedM VARCHAR(10), @InterestedF VARCHAR(10), @Birthday DATETIME2
AS
	INSERT INTO Users([Name], Email, [Password], Gender, Photo, InterestedM, InterestedF, Birthday, LastActive, MinAgePreference, MaxAgePreference) VALUES (@Name, @Email, @Password, @Gender, @Photo, @InterestedM, @InterestedF, @Birthday, GETDATE(), MAX(18,DATEDIFF(hour,@Birthday,GETDATE())/8766), DATEDIFF(hour,@Birthday,GETDATE())/8766 ) 
RETURN 0
