CREATE PROCEDURE SendDecision (@User1ID INT, @User2ID INT, @User1Decision VARCHAR(4))
AS
UPDATE Users SET Users.LastActive = (SELECT GETDATE()) WHERE Users.ID = @User1ID
IF EXISTS
(
	SELECT * FROM Pairs
	WHERE User1ID = @User2ID AND User2ID = @User1ID
)
BEGIN 
	IF EXISTS (SELECT * FROM pairs WHERE User1Decision='like' AND @User1Decision='like' )
	BEGIN
		UPDATE pairs SET pairs.User2Decision = @User1Decision, pairs.MatchDate=(SELECT GETDATE()) WHERE user1ID = @User2ID AND user2ID = @User1ID
	END
	ELSE
	BEGIN
		UPDATE pairs SET pairs.user2decision = @User1Decision WHERE user1ID = @User2ID AND user2ID = @User1ID
	END
END
ELSE
BEGIN
INSERT INTO pairs(user1ID, user2ID, user1decision) VALUES (@User1ID, @User2ID, @User1Decision)
END
GO
