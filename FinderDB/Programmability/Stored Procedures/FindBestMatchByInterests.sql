CREATE PROCEDURE FindBestMatchByInerests (@ID INT)
AS
SELECT TOP 1 users.ID ,users.[Name], users.Photo, users.AboutMe, DATEDIFF(hour,users.Birthday,GETDATE())/8766 AS Age, count(Interests.name)
FROM UsersInterests ui1 
INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID
INNER JOIN users ON users.ID = ui2.UserID
INNER JOIN interests ON interests.ID = ui1.InterestID
FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@id) OR (pairs.user2ID = users.ID AND pairs.user1ID =@id)
WHERE @ID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @ID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @ID 
AND @ID <> ui2.userid
GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
ORDER BY count(interests.name) DESC
GO
