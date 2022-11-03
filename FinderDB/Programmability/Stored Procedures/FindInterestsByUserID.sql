CREATE PROCEDURE FindInterestsByUserId (@UserID INT)
AS
SELECT interests.ID,interests.name FROM interests
INNER JOIN UsersInterests ON UsersInterests.InterestID = Interests.ID
INNER JOIN Users ON Users.ID = UsersInterests.UserID
WHERE Users.ID = @UserID
GO