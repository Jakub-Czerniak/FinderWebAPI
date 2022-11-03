CREATE PROCEDURE FindMatchedUsersById @id INT
AS
SELECT users.ID, users.name FROM users
INNER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@id) OR (pairs.user2ID = users.ID AND pairs.user1ID =@id)
WHERE NOT users.ID = @id AND Pairs.MatchDate IS NOT NULL
ORDER BY pairs.MatchDate DESC
GO
