CREATE PROCEDURE FindBestMatchByInterests (@UserID INT)
AS
SELECT TOP 1 users.ID AS MatchId
FROM UsersInterests ui1 
INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID
INNER JOIN users ON users.ID = ui2.UserID
INNER JOIN interests ON interests.ID = ui1.InterestID
FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@UserID) OR (pairs.user2ID = users.ID AND pairs.user1ID =@UserID)
WHERE @UserID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @UserID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @UserID 
AND @UserID <> ui2.userid
GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
ORDER BY count(interests.name) DESC
GO
