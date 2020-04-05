-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE PGENERAL
	-- Add the parameters for the stored procedure here
	@accion VARCHAR(100) = 'INS',
	@colNombres VARCHAR(100) = 'NULL',
	@colApellidos VARCHAR(100) = 'NULL',
	@colTelefono VARCHAR(20) = 'NULL',
	@colDireccion VARCHAR(200) = 'NULL',
	@colDistancia FLOAT = 0,
	@SerTraId INT =0,
	@SucId INT = 0,
	@ColId INT =0,
	@viaFecha DATETIME = null,
	@UsuId int = 0,
	@fechaDesde DATETIME = null,
	@fechaHasta DATETIME = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @accion = 'SELECT_GRID_COLABORADOR'
	BEGIN
		SELECT [ColId] AS 'ID'
      ,[ColNombres] AS 'NOMBRES'
      ,[ColApellidos] AS 'APELLIDOS'
      ,[ColTelefono] AS 'TELEFONO'
      ,[ColDireccion] AS 'DIRECCION'
      ,[ColDistancia] AS 'KM'
	  ,ServicioTransporte.SerTraId AS 'ID TRANSPORTE'
      ,ServicioTransporte.SerTraDescripcion AS 'TRANSPORTISTA'
	  ,Sucursal.SucId AS 'ID SUCURSAL'
      ,Sucursal.SucDireccion AS 'SUCURSAL'
	FROM [dbo].[Colaboradores] INNER JOIN Sucursal ON Colaboradores.SucId = Sucursal.SucId INNER JOIN ServicioTransporte ON ServicioTransporte.SerTraId = Colaboradores.SerTraId
	END

	IF @accion = 'SELECT_GRID_COLABORADOR_PARAMETRO'
	BEGIN
		SELECT [ColId] AS 'ID'
      ,[ColNombres] AS 'NOMBRES'
      ,[ColApellidos] AS 'APELLIDOS'
      ,[ColTelefono] AS 'TELEFONO'
      ,[ColDireccion] AS 'DIRECCION'
      ,[ColDistancia] AS 'KM'
	  ,ServicioTransporte.SerTraTarifa AS 'TARIFA'
	  ,(ServicioTransporte.SerTraTarifa * Colaboradores.ColDistancia) AS 'TOTAL'
	FROM [dbo].[Colaboradores] INNER JOIN Sucursal ON Colaboradores.SucId = Sucursal.SucId INNER JOIN ServicioTransporte ON ServicioTransporte.SerTraId = Colaboradores.SerTraId
	WHERE Colaboradores.SucId = @SucId and Colaboradores.SerTraId = @SerTraId
	END

	IF @accion = 'SELECT_CB_SUCURSAL'
	BEGIN
		SELECT SucId AS 'ID', SucNombre AS 'SUCURSAL'
		FROM Sucursal
	END
	
	IF @accion = 'SELECT_CB_TRANSPORTISTA'
	BEGIN
		SELECT SerTraId AS 'ID', SerTraDescripcion AS 'TRANSPORTISTA'
		FROM ServicioTransporte
	END

	IF @accion = 'INS_COLABORADOR'
	BEGIN
		INSERT INTO [dbo].[Colaboradores]
           ([ColNombres]
           ,[ColApellidos]
           ,[ColTelefono]
           ,[ColDireccion]
           ,[ColDistancia]
           ,[SerTraId]
           ,[SucId])
     VALUES
           (@colNombres
           ,@colApellidos
           ,@colTelefono
           ,@colDireccion
           ,@colDistancia
           ,@SerTraId
           ,@SucId)
	END

	IF @accion = 'UPD_COLABORADOR'
	BEGIN
		UPDATE [dbo].[Colaboradores]
   SET [ColNombres] = @colNombres
      ,[ColApellidos] = @colApellidos
      ,[ColTelefono] = @colTelefono
      ,[ColDireccion] = @colDireccion
      ,[ColDistancia] = @colDistancia
      ,[SerTraId] = @SerTraId
      ,[SucId] = @SucId
 WHERE ColId = @ColId
	END

	IF @accion = 'DLT_COLABORADOR'
	BEGIN
	DELETE FROM Colaboradores	
	WHERE ColId = @ColId
	END

	IF @accion = 'INS_VIAJE'
	BEGIN
	INSERT INTO [dbo].[Viajes]
           ([ViaFecha]
           ,[ColId]
           ,[UsuId])
     VALUES
           (@viaFecha
           ,@ColId
           ,@UsuId)
	END

	IF @accion = 'REPORTE'
	BEGIN
	SELECT CONCAT(Colaboradores.ColNombres, ' ', Colaboradores.ColApellidos) AS 'COLABORADOR',
	Usuarios.UsuNick AS 'USUARIO',
	ServicioTransporte.SerTraTarifa AS 'TARIFA/Km TRANSPORTE',
	Colaboradores.ColDistancia AS 'Km DISTANCIA',
	(ServicioTransporte.SerTraTarifa * Colaboradores.ColDistancia) AS 'VALOR A PAGAR'
	FROM Viajes INNER JOIN Colaboradores ON Viajes.ColId = Colaboradores.ColId INNER JOIN ServicioTransporte ON Colaboradores.SerTraId = ServicioTransporte.SerTraId
	INNER JOIN Usuarios ON Usuarios.UsuId = Viajes.UsuId
	WHERE ServicioTransporte.SerTraId = @SerTraId AND ViaFecha BETWEEN @fechaDesde AND @fechaHasta
	END

END
GO
