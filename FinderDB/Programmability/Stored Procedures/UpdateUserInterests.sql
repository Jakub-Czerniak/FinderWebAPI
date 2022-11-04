CREATE PROCEDURE UpdateUserInterests @InterestName VARCHAR(255), @Email VARCHAR(255), @Password VARCHAR(255)
AS
	INSERT INTO UsersInterests(UserID, InterestID) VALUES ((SELECT ID FROM Users WHERE @Email = Users.Email AND @Password = Users.[Password]), (SELECT ID FROM Interests WHERE Interests.Name = @InterestName) ) 
GO
