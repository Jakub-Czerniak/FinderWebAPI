CREATE PROCEDURE LoadUserDetails @ID INT
AS
	SELECT Users.AboutMe, Users.Photo, DATEDIFF(hour,Users.Birthday,GETDATE())/8766 AS Age, Users.Name FROM Users
	WHERE Users.ID = @ID
RETURN 0
