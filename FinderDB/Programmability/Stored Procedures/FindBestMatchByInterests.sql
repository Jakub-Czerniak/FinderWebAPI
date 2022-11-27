CREATE PROCEDURE FindBestMatchByInterests (@UserID INT)
AS
	DECLARE @UserMin AS INT 
	SELECT @UserMin = Users.MinAgePreference FROM USERS WHERE Users.ID = @UserID
	DECLARE @UserMax AS INT 
	SELECT @UserMax = Users.MaxAgePreference FROM Users WHERE Users.ID = @UserID
	DECLARE @UserAge AS INT
	SELECT @UserAge = DATEDIFF(hour,Users.Birthday,GETDATE())/8766 FROM Users WHERE Users.ID = @UserID

	IF EXISTS (SELECT users.Gender FROM Users WHERE Users.Gender = 'Mężczyzna' AND Users.InterestedM='True' AND Users.InterestedF='True' AND Users.ID = @UserID)
	BEGIN
		SELECT TOP 1 users.ID AS MatchId
		FROM UsersInterests ui1 
		INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID
		INNER JOIN users ON users.ID = ui2.UserID AND users.InterestedM = 'True' AND Users.MaxAgePreference >= @UserAge AND Users.MinAgePreference <= @UserAge
		AND DATEDIFF(hour,Users.Birthday,GETDATE())/8766 BETWEEN @UserMin AND @UserMax 

		INNER JOIN interests ON interests.ID = ui1.InterestID
		FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@UserID) OR (pairs.user2ID = users.ID AND pairs.user1ID =@UserID)
		WHERE @UserID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @UserID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @UserID 
		AND @UserID <> ui2.userid  
		GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
		ORDER BY count(interests.name) DESC
	END
	ELSE 
		IF EXISTS (SELECT users.Gender FROM Users WHERE Users.Gender = 'Mężczyzna' AND Users.InterestedM='True' AND Users.InterestedF='False' AND Users.ID = @UserID)
	BEGIN
		SELECT TOP 1 users.ID AS MatchId
		FROM UsersInterests ui1 
		INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID
		INNER JOIN users ON users.ID = ui2.UserID AND users.InterestedM = 'True' AND Users.MaxAgePreference >= @UserAge AND Users.MinAgePreference <= @UserAge AND Users.Gender = 'Mężczyzna'
		AND DATEDIFF(hour,Users.Birthday,GETDATE())/8766 BETWEEN @UserMin AND @UserMax 

		INNER JOIN interests ON interests.ID = ui1.InterestID
		FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@UserID) OR (pairs.user2ID = users.ID AND pairs.user1ID =@UserID)
		WHERE @UserID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @UserID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @UserID 
		AND @UserID <> ui2.userid  
		GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
		ORDER BY count(interests.name) DESC
	END
	ELSE 
		IF EXISTS (SELECT users.Gender FROM Users WHERE Users.Gender = 'Mężczyzna' AND Users.InterestedM='False' AND Users.InterestedF='True' AND Users.ID = @UserID)
	BEGIN
		SELECT TOP 1 users.ID AS MatchId
		FROM UsersInterests ui1 
		INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID
		INNER JOIN users ON users.ID = ui2.UserID AND users.InterestedM = 'True' AND Users.MaxAgePreference >= @UserAge AND Users.MinAgePreference <= @UserAge AND Users.Gender = 'Kobieta'
		AND DATEDIFF(hour,Users.Birthday,GETDATE())/8766 BETWEEN @UserMin AND @UserMax 

		INNER JOIN interests ON interests.ID = ui1.InterestID
		FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@UserID) OR (pairs.user2ID = users.ID AND pairs.user1ID =@UserID)
		WHERE @UserID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @UserID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @UserID 
		AND @UserID <> ui2.userid  
		GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
		ORDER BY count(interests.name) DESC
	END
	ELSE 
	IF EXISTS (SELECT users.Gender FROM Users WHERE Users.Gender = 'Kobieta' AND Users.InterestedM='True' AND Users.InterestedF='True' AND Users.ID = @UserID)
	BEGIN
		SELECT TOP 1 users.ID AS MatchId
		FROM UsersInterests ui1 
		INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID 
		INNER JOIN users ON users.ID = ui2.UserID AND users.InterestedF = 'True' AND Users.MaxAgePreference >= @UserAge AND Users.MinAgePreference <= @UserAge
		AND DATEDIFF(hour,Users.Birthday,GETDATE())/8766 BETWEEN @UserMin AND @UserMax 
		INNER JOIN interests ON interests.ID = ui1.InterestID
		FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@UserID) OR (pairs.user2ID = users.ID AND pairs.user1ID =@UserID)
		WHERE @UserID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @UserID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @UserID 
		AND @UserID <> ui2.userid 
		GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
		ORDER BY count(interests.name) DESC
	END
		ELSE 
	IF EXISTS (SELECT users.Gender FROM Users WHERE Users.Gender = 'Kobieta' AND Users.InterestedM='True' AND Users.InterestedF='False' AND Users.ID = @UserID)
	BEGIN
		SELECT TOP 1 users.ID AS MatchId
		FROM UsersInterests ui1 
		INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID 
		INNER JOIN users ON users.ID = ui2.UserID AND users.InterestedF = 'True' AND Users.MaxAgePreference >= @UserAge AND Users.MinAgePreference <= @UserAge AND Users.Gender = 'Mężczyzna'
		AND DATEDIFF(hour,Users.Birthday,GETDATE())/8766 BETWEEN @UserMin AND @UserMax 
		INNER JOIN interests ON interests.ID = ui1.InterestID 
		FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@UserID) OR (pairs.user2ID = users.ID AND pairs.user1ID =@UserID)
		WHERE @UserID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @UserID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @UserID 
		AND @UserID <> ui2.userid 
		GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
		ORDER BY count(interests.name) DESC
	END
		ELSE 
	IF EXISTS (SELECT users.Gender FROM Users WHERE Users.Gender = 'Kobieta' AND Users.InterestedM='False' AND Users.InterestedF='True' AND Users.ID = @UserID)
	BEGIN
		SELECT TOP 1 users.ID AS MatchId
		FROM UsersInterests ui1 
		INNER JOIN UsersInterests ui2 ON ui1.InterestID = ui2.InterestID 
		INNER JOIN users ON users.ID = ui2.UserID AND users.InterestedF = 'True' AND Users.MaxAgePreference >= @UserAge AND Users.MinAgePreference <= @UserAge AND Users.Gender = 'Kobieta'
		AND DATEDIFF(hour,Users.Birthday,GETDATE())/8766 BETWEEN @UserMin AND @UserMax 
		INNER JOIN interests ON interests.ID = ui1.InterestID
		FULL OUTER JOIN pairs ON (pairs.user1ID = users.ID AND pairs.user2ID =@UserID) OR (pairs.user2ID = users.ID AND pairs.user1ID =@UserID)
		WHERE @UserID = ui1.userid AND ((pairs.user1ID IS NULL AND pairs.user2ID IS NULL) OR (pairs.user2ID = @UserID AND pairs.User2Decision IS NULL)) AND NOT users.ID = @UserID 
		AND @UserID <> ui2.userid 
		GROUP BY users.name, users.ID, users.Photo, users.AboutMe, users.Birthday
		ORDER BY count(interests.name) DESC
	END
GO