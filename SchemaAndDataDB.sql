USE [master]
GO
/****** Object:  Database [db_pruebaFarsiman]    Script Date: 4/4/2020 20:05:19 ******/
CREATE DATABASE [db_pruebaFarsiman]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_pruebaFarsiman', FILENAME = N'C:\SQLDATA\Data\db_pruebaFarsiman.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_pruebaFarsiman_log', FILENAME = N'C:\SQLDATA\Log\db_pruebaFarsiman_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [db_pruebaFarsiman] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_pruebaFarsiman].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_pruebaFarsiman] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_pruebaFarsiman] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_pruebaFarsiman] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_pruebaFarsiman] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_pruebaFarsiman] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET RECOVERY FULL 
GO
ALTER DATABASE [db_pruebaFarsiman] SET  MULTI_USER 
GO
ALTER DATABASE [db_pruebaFarsiman] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_pruebaFarsiman] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_pruebaFarsiman] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_pruebaFarsiman] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_pruebaFarsiman] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_pruebaFarsiman', N'ON'
GO
ALTER DATABASE [db_pruebaFarsiman] SET QUERY_STORE = OFF
GO
USE [db_pruebaFarsiman]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [db_pruebaFarsiman]
GO
/****** Object:  Table [dbo].[Colaboradores]    Script Date: 4/4/2020 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colaboradores](
	[ColId] [int] IDENTITY(1,1) NOT NULL,
	[ColNombres] [varchar](100) NOT NULL,
	[ColApellidos] [varchar](100) NOT NULL,
	[ColTelefono] [varchar](20) NOT NULL,
	[ColDireccion] [varchar](200) NOT NULL,
	[ColDistancia] [float] NOT NULL,
	[SerTraId] [int] NOT NULL,
	[SucId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicioTransporte]    Script Date: 4/4/2020 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicioTransporte](
	[SerTraId] [int] IDENTITY(1,1) NOT NULL,
	[SerTraDescripcion] [varchar](200) NOT NULL,
	[SerTraTarifa] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SerTraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 4/4/2020 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[SucId] [int] IDENTITY(1,1) NOT NULL,
	[SucNombre] [varchar](100) NOT NULL,
	[SucDireccion] [varchar](200) NOT NULL,
	[Suctelefono] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SucId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 4/4/2020 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuId] [int] IDENTITY(1,1) NOT NULL,
	[UsuNick] [varchar](50) NOT NULL,
	[UsuNombres] [varchar](100) NOT NULL,
	[UsuApellidos] [varchar](100) NOT NULL,
	[UsuCorreo] [varchar](100) NOT NULL,
	[UsuTelefono] [varchar](20) NOT NULL,
	[UsuPassword] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UsuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viajes]    Script Date: 4/4/2020 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viajes](
	[ViaId] [int] IDENTITY(1,1) NOT NULL,
	[ViaFecha] [datetime] NOT NULL,
	[ColId] [int] NOT NULL,
	[UsuId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ViaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Colaboradores] ON 

INSERT [dbo].[Colaboradores] ([ColId], [ColNombres], [ColApellidos], [ColTelefono], [ColDireccion], [ColDistancia], [SerTraId], [SucId]) VALUES (4, N'Juan', N'Perez', N'99999999', N'ABC', 60, 1, 1)
INSERT [dbo].[Colaboradores] ([ColId], [ColNombres], [ColApellidos], [ColTelefono], [ColDireccion], [ColDistancia], [SerTraId], [SucId]) VALUES (5, N'Pedro', N'Martinez', N'99999999', N'ERT', 30, 1, 1)
INSERT [dbo].[Colaboradores] ([ColId], [ColNombres], [ColApellidos], [ColTelefono], [ColDireccion], [ColDistancia], [SerTraId], [SucId]) VALUES (6, N'Maria', N'Perez', N'99999999', N'CVG', 25, 1, 1)
INSERT [dbo].[Colaboradores] ([ColId], [ColNombres], [ColApellidos], [ColTelefono], [ColDireccion], [ColDistancia], [SerTraId], [SucId]) VALUES (7, N'Colaborador 1', N'Colaborador 1', N'99999999', N'SPS', 30, 1, 1)
SET IDENTITY_INSERT [dbo].[Colaboradores] OFF
SET IDENTITY_INSERT [dbo].[ServicioTransporte] ON 

INSERT [dbo].[ServicioTransporte] ([SerTraId], [SerTraDescripcion], [SerTraTarifa]) VALUES (1, N'TRANSPORTES XYZ', 5.0000)
INSERT [dbo].[ServicioTransporte] ([SerTraId], [SerTraDescripcion], [SerTraTarifa]) VALUES (2, N'TRANSPORTES ABC', 5.0000)
INSERT [dbo].[ServicioTransporte] ([SerTraId], [SerTraDescripcion], [SerTraTarifa]) VALUES (3, N'TRANSPORTES RTY', 6.0000)
INSERT [dbo].[ServicioTransporte] ([SerTraId], [SerTraDescripcion], [SerTraTarifa]) VALUES (4, N'TRANSPORTES ASD', 4.0000)
SET IDENTITY_INSERT [dbo].[ServicioTransporte] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([SucId], [SucNombre], [SucDireccion], [Suctelefono]) VALUES (1, N'SUCURSAL 1', N'SPS', N'26632569')
INSERT [dbo].[Sucursal] ([SucId], [SucNombre], [SucDireccion], [Suctelefono]) VALUES (2, N'SUCURSAL 2', N'SPS', N'26632569')
INSERT [dbo].[Sucursal] ([SucId], [SucNombre], [SucDireccion], [Suctelefono]) VALUES (3, N'SUCURSAL 3', N'SRC', N'26632569')
INSERT [dbo].[Sucursal] ([SucId], [SucNombre], [SucDireccion], [Suctelefono]) VALUES (4, N'SUCURSAL 4', N'SRC', N'26632569')
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([UsuId], [UsuNick], [UsuNombres], [UsuApellidos], [UsuCorreo], [UsuTelefono], [UsuPassword]) VALUES (1, N'nclaros', N'Nilson Bladimir', N'Claros Mejia', N'nilsonvcm@gmail.com', N'98028242', N'1234')
INSERT [dbo].[Usuarios] ([UsuId], [UsuNick], [UsuNombres], [UsuApellidos], [UsuCorreo], [UsuTelefono], [UsuPassword]) VALUES (3, N'user', N'User', N'User', N'user@test.com', N'99999999', N'1234')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET IDENTITY_INSERT [dbo].[Viajes] ON 

INSERT [dbo].[Viajes] ([ViaId], [ViaFecha], [ColId], [UsuId]) VALUES (4, CAST(N'2020-04-04T17:11:03.520' AS DateTime), 4, 3)
INSERT [dbo].[Viajes] ([ViaId], [ViaFecha], [ColId], [UsuId]) VALUES (5, CAST(N'2020-04-04T17:11:03.520' AS DateTime), 5, 3)
INSERT [dbo].[Viajes] ([ViaId], [ViaFecha], [ColId], [UsuId]) VALUES (6, CAST(N'2020-04-04T17:11:03.520' AS DateTime), 6, 3)
INSERT [dbo].[Viajes] ([ViaId], [ViaFecha], [ColId], [UsuId]) VALUES (7, CAST(N'2020-04-04T17:52:40.770' AS DateTime), 4, 1)
INSERT [dbo].[Viajes] ([ViaId], [ViaFecha], [ColId], [UsuId]) VALUES (8, CAST(N'2020-04-04T17:52:40.770' AS DateTime), 5, 1)
INSERT [dbo].[Viajes] ([ViaId], [ViaFecha], [ColId], [UsuId]) VALUES (9, CAST(N'2020-04-02T17:53:52.000' AS DateTime), 7, 1)
SET IDENTITY_INSERT [dbo].[Viajes] OFF
/****** Object:  Index [ICOLABORADORES1]    Script Date: 4/4/2020 20:05:20 ******/
CREATE NONCLUSTERED INDEX [ICOLABORADORES1] ON [dbo].[Colaboradores]
(
	[SerTraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ICOLABORADORES2]    Script Date: 4/4/2020 20:05:20 ******/
CREATE NONCLUSTERED INDEX [ICOLABORADORES2] ON [dbo].[Colaboradores]
(
	[SucId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__F391DAD3F78EC732]    Script Date: 4/4/2020 20:05:20 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[UsuNick] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IVIAJES1]    Script Date: 4/4/2020 20:05:20 ******/
CREATE NONCLUSTERED INDEX [IVIAJES1] ON [dbo].[Viajes]
(
	[ColId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IVIAJES2]    Script Date: 4/4/2020 20:05:20 ******/
CREATE NONCLUSTERED INDEX [IVIAJES2] ON [dbo].[Viajes]
(
	[UsuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Colaboradores]  WITH CHECK ADD  CONSTRAINT [ICOLABORADORES1] FOREIGN KEY([SerTraId])
REFERENCES [dbo].[ServicioTransporte] ([SerTraId])
GO
ALTER TABLE [dbo].[Colaboradores] CHECK CONSTRAINT [ICOLABORADORES1]
GO
ALTER TABLE [dbo].[Colaboradores]  WITH CHECK ADD  CONSTRAINT [ICOLABORADORES2] FOREIGN KEY([SucId])
REFERENCES [dbo].[Sucursal] ([SucId])
GO
ALTER TABLE [dbo].[Colaboradores] CHECK CONSTRAINT [ICOLABORADORES2]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [IVIAJES1] FOREIGN KEY([ColId])
REFERENCES [dbo].[Colaboradores] ([ColId])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [IVIAJES1]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [IVIAJES2] FOREIGN KEY([UsuId])
REFERENCES [dbo].[Usuarios] ([UsuId])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [IVIAJES2]
GO
/****** Object:  StoredProcedure [dbo].[PGENERAL]    Script Date: 4/4/2020 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PGENERAL]
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
/****** Object:  StoredProcedure [dbo].[PUSUARIOS]    Script Date: 4/4/2020 20:05:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[PUSUARIOS]
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
GO
USE [master]
GO
ALTER DATABASE [db_pruebaFarsiman] SET  READ_WRITE 
GO
