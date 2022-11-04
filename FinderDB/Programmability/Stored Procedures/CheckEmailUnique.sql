CREATE PROCEDURE CheckEmailUnique @Email VARCHAR(255)
AS
	SELECT @Email FROM Users 
	WHERE @Email = Users.Email
GO
