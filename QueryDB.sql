--CREATE DATABASE db_pruebaFarsiman
--USE db_pruebaFarsiman

CREATE TABLE [ServicioTransporte](
	[SerTraId] INT IDENTITY(1,1) NOT NULL,
	[SerTraDescripcion] VARCHAR(200) NOT NULL,
	[SerTraTarifa] MONEY NOT NULL,
	PRIMARY KEY ([SerTraId])
)

CREATE TABLE [Sucursal](
	[SucId] INT IDENTITY(1,1) NOT NULL,
	[SucNombre] VARCHAR(100) NOT NULL,
	[SucDireccion] VARCHAR(200) NOT NULL,
	[Suctelefono] VARCHAR(20) NOT NULL,
	PRIMARY KEY ([SucId])
)

CREATE TABLE [Colaboradores](
	[ColId] INT IDENTITY(1,1) NOT NULL,
	[ColNombres] VARCHAR(100) NOT NULL,
	[ColApellidos] VARCHAR(100) NOT NULL,
	[ColTelefono] VARCHAR(20) NOT NULL,
	[ColDireccion] VARCHAR(200) NOT NULL,
	[ColDistancia] FLOAT NOT NULL,
	[SerTraId] INT NOT NULL,
	[SucId] INT NOT NULL
	PRIMARY KEY ([ColId])
)
--proporciona acceso rapido a los datos
CREATE NONCLUSTERED INDEX [ICOLABORADORES1] ON [Colaboradores] ( 
      [SerTraId])
CREATE NONCLUSTERED INDEX [ICOLABORADORES2] ON [Colaboradores] ( 
      [SucId])

ALTER TABLE [Colaboradores] 
 ADD CONSTRAINT [ICOLABORADORES1] FOREIGN KEY ( [SerTraId] ) REFERENCES [ServicioTransporte]([SerTraId])
ALTER TABLE [Colaboradores] 
 ADD CONSTRAINT [ICOLABORADORES2] FOREIGN KEY ( [SucId] ) REFERENCES [Sucursal]([SucId])

 CREATE TABLE [Usuarios](
	[UsuId] INT IDENTITY(1,1) NOT NULL,
	[UsuNick] VARCHAR(50) UNIQUE NOT NULL,
	[UsuNombres] VARCHAR(100) NOT NULL,
	[UsuApellidos] VARCHAR(100) NOT NULL,
	[UsuCorreo] VARCHAR(100) NOT NULL,
	[UsuTelefono] VARCHAR(20) NOT NULL,
	[UsuPassword] VARCHAR(100) NOT NULL
	PRIMARY KEY ([UsuId])
)

 CREATE TABLE [Viajes](
	[ViaId] INT IDENTITY(1,1) NOT NULL,
	[ViaFecha] DATETIME NOT NULL,
	[ColId] INT NOT NULL,
	[UsuId] INT NOT NULL
	PRIMARY KEY ([ViaId])
)
CREATE NONCLUSTERED INDEX [IVIAJES1] ON [Viajes] ( 
      [ColId])
CREATE NONCLUSTERED INDEX [IVIAJES2] ON [Viajes] ( 
      [UsuId])

ALTER TABLE [Viajes] 
 ADD CONSTRAINT [IVIAJES1] FOREIGN KEY ( [ColId] ) REFERENCES [Colaboradores]([ColId])
ALTER TABLE [Viajes] 
 ADD CONSTRAINT [IVIAJES2] FOREIGN KEY ( [UsuId] ) REFERENCES [Usuarios]([UsuId])