CREATE PROCEDURE [dbo].[spCommentsReport]
	@ID_REPORT INT
AS
	SELECT C.id,C.description,C.idReport,C.idUser,U.name,U.profilePictureURL 
    FROM [dbo].[Comment] AS C INNER JOIN [dbo].[User] AS U ON C.idUser = U.id 
    AND C.idReport = @ID_REPORT
