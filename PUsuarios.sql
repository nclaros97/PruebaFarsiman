USE [db_pruebaFarsiman]
GO
/****** Object:  StoredProcedure [dbo].[PUSUARIOS]    Script Date: 4/4/2020 13:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

ALTER PROCEDURE [dbo].[PUSUARIOS]
	-- Add the parameters for the stored procedure here
	@accion VARCHAR(100) = 'INS',
	@var bit =0 OUTPUT,
	@usuNick varchar(40) = 'null',
	@usuPassw varchar(100) = 'null',
	@usuCorreo varchar(100) = 'null'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	IF @accion = 'LOGIN'
	 BEGIN
		
		SET @var = (SELECT Usuarios.UsuId 
		FROM Usuarios WHERE (UsuNick = @usuNick OR UsuCorreo = @usuCorreo) AND UsuPassword = @usuPassw)
		RETURN
	 END

	 IF @accion = 'GET_DATA_USER'
	 BEGIN
		SELECT Usuarios.UsuNick, Usuarios.UsuCorreo, CONCAT([UsuNombres], ' ', [UsuApellidos]), Usuarios.UsuId
		FROM Usuarios
		 WHERE (Usuarios.UsuNick = @usuNick OR Usuarios.UsuCorreo = @usuCorreo) AND Usuarios.UsuPassword = @usuPassw
	 END


END
