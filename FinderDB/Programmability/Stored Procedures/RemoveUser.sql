CREATE PROCEDURE RemoveUser @ID INT
AS
	DELETE FROM UsersInterests WHERE UsersInterests.UserID = @ID
	DELETE FROM Pairs WHERE Pairs.User1ID = @ID
	DELETE FROM Pairs WHERE Pairs.User2ID = @ID
	DELETE FROM Users WHERE Users.ID = @ID
GO
