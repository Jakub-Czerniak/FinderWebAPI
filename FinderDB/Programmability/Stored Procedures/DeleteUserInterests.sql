﻿CREATE PROCEDURE DeleteUserInterests @UserID int 
AS
	DELETE FROM UsersInterests WHERE UsersInterests.UserID = @UserID
GO
