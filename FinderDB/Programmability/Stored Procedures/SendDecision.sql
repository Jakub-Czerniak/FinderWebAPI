CREATE PROCEDURE SendDecision (@User1_ID INT, @User2_ID INT, @User1_Decision VARCHAR(4))
AS
UPDATE Users SET Users.LastActive = (SELECT GETDATE()) WHERE Users.ID = @User1_ID
IF EXISTS
(
	SELECT * FROM pairs
	WHERE User1ID = @User2_ID AND User2ID = @User1_ID
)
BEGIN 
	IF EXISTS (SELECT * FROM pairs WHERE User1Decision='y' AND @User1_Decision='y' )
	BEGIN
		UPDATE pairs SET pairs.User2Decision = @User1_Decision, pairs.MatchDate=(SELECT GETDATE()) WHERE user1ID = @User2_ID AND user2ID = @User1_ID
	END
	ELSE
	BEGIN
		UPDATE pairs SET pairs.user2decision = @User1_Decision WHERE user1ID = @User2_ID AND user2ID = @User1_ID
	END
END
ELSE
BEGIN
INSERT INTO pairs(user1ID, user2ID, user1decision) VALUES (@User1_ID, @User2_ID, @User1_Decision)
END
GO
