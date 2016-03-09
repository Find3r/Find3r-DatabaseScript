CREATE PROCEDURE [dbo].[spFollowingReports]
	@ID_USER INT
AS
SELECT N.id AS id,N.name AS nombre,N.description AS description,N.pictureURL AS urlimagen, N.date AS fechadesaparicion,N.idUser AS idusuario,N.solved AS solved,N.idState AS idprovincia,N.totalComplaints AS cantidad_reportes,N.idCategory AS idcategoria,N.latitude AS latitud,N.longitude AS longitud,U.name AS nombre_usuario,U.profilePictureURL AS urlimagen_perfil_usuario, P.name AS nombre_provincia, 
 (  
              SELECT COUNT(C.idReport) 
              FROM [dbo].[Comment] AS C 
              WHERE C.idReport = N.id 
              GROUP BY C.idReport 
          ) AS cantidad_comentarios
		  ,
		  (
		  		 
		   SELECT NU.following
			FROM [dbo].[UserReport] AS NU
			WHERE NU.idReport = N.id AND NU.idUser = @ID_USER
		  ) AS estado_follow
		  
          FROM [dbo].[Report] AS N , [dbo].[User] AS U, [dbo].[State] as P, [dbo].[UserReport] AS NU
          WHERE N.idUser = U.id AND N.idState = P.id AND N.id = NU.idReport AND NU.idUser = @ID_USER AND NU.following = 1 
         
          ORDER BY N.__createdAt DESC
