CREATE PROCEDURE UpdateUserDetails @Email VARCHAR(255), @Photo VARBINARY(MAX), @InterestedM VARCHAR(10), @InterestedF VARCHAR(10), @AboutMe VARCHAR(501), @MinAgePreference INT, @MaxAgePreference INT
AS
	UPDATE Users SET Users.AboutMe = @AboutMe, Users.InterestedF = @InterestedF, Users.InterestedM = @InterestedM, Users.Photo = @Photo, Users.MinAgePreference = @MinAgePreference, Users.MaxAgePreference = @MaxAgePreference
	WHERE Users.Email = @Email 
GO
