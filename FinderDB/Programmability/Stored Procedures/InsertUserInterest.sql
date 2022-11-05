CREATE PROCEDURE InsertUserInterest @UserID INT, @InterestID INT 
AS
	INSERT INTO UsersInterests (UserID, InterestID) VALUES (@UserID, @InterestID)
GO
