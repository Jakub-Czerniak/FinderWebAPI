CREATE PROCEDURE LoginUser @Email VARCHAR(255), @Password VARCHAR(255)
AS
	SELECT Users.ID, Users.[Name], Users.Email, Users.[Password], Users.Gender, Users.Photo, Users.InterestedM, Users.InterestedF, Users.AboutMe, Users.MinAgePreference, Users.MaxAgePreference, DATEDIFF(hour,Users.Birthday,GETDATE())/8766 AS Age
	FROM Users WHERE Users.Email = @Email AND Users.[Password] = @Password
GO