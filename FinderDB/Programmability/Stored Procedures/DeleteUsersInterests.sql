CREATE PROCEDURE DeleteUsersInterests @UserID int 
AS
	DELETE FROM UsersInterests WHERE UsersInterests.UserID = @UserID
GO
