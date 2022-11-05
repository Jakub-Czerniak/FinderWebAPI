CREATE PROCEDURE RemoveUser @Email VARCHAR(255), @Password VARCHAR(255)
AS
	DELETE FROM Users WHERE Users.Email = @Email AND Users.Password = @Password
GO
