USE [master]
GO
/****** Object:  Database [DBVeterinaria]    Script Date: 17/4/2017 18:14:53 ******/
CREATE DATABASE [DBVeterinaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBVeterinaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBVeterinaria.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DBVeterinaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DBVeterinaria_log.ldf' , SIZE = 24384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DBVeterinaria] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBVeterinaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBVeterinaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBVeterinaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBVeterinaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBVeterinaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBVeterinaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBVeterinaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBVeterinaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBVeterinaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBVeterinaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBVeterinaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBVeterinaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBVeterinaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBVeterinaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBVeterinaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBVeterinaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBVeterinaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBVeterinaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBVeterinaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBVeterinaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBVeterinaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBVeterinaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBVeterinaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBVeterinaria] SET RECOVERY FULL 
GO
ALTER DATABASE [DBVeterinaria] SET  MULTI_USER 
GO
ALTER DATABASE [DBVeterinaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBVeterinaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBVeterinaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBVeterinaria] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DBVeterinaria] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DBVeterinaria]
GO
/****** Object:  Table [dbo].[Cita]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cita](
	[CitaID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[PacienteID] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Cita] PRIMARY KEY CLUSTERED 
(
	[CitaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[idDetalle] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[precio] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Duenno]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Duenno](
	[DuennoID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NULL,
	[Telefono] [varchar](8) NOT NULL,
	[Correo] [varchar](50) NULL,
 CONSTRAINT [PK_Duenno] PRIMARY KEY CLUSTERED 
(
	[DuennoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enfermedad]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enfermedad](
	[EnfermedadID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[Sintomas] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Enfermedad] PRIMARY KEY CLUSTERED 
(
	[EnfermedadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Examen]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examen](
	[ExamenID] [int] IDENTITY(1,1) NOT NULL,
	[Eritrocitos] [float] NOT NULL,
	[Hemoglobina] [float] NOT NULL,
	[Hematocrito] [float] NOT NULL,
	[VCM] [float] NOT NULL,
	[HCM] [float] NOT NULL,
	[CHCM] [float] NOT NULL,
	[Plaquetas] [float] NOT NULL,
	[Leucocitos] [float] NOT NULL,
	[Neutrofilos] [float] NOT NULL,
	[Eosinofilos] [float] NOT NULL,
	[Linfocitos] [float] NOT NULL,
	[PacienteID] [int] NOT NULL,
 CONSTRAINT [PK_Examen] PRIMARY KEY CLUSTERED 
(
	[ExamenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expediente]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expediente](
	[IdExpediente] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdEnfermedad] [int] NOT NULL,
	[IdTratamientos] [int] NOT NULL,
	[IdMedicamentos] [int] NOT NULL,
	[IdExamen] [int] NOT NULL,
	[IdVeterinaria] [int] NOT NULL,
	[IdDuenno] [int] NOT NULL,
 CONSTRAINT [PK_Expediente] PRIMARY KEY CLUSTERED 
(
	[IdExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Factura]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[FacturaID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Subtotal] [float] NOT NULL,
	[Impuesto] [float] NOT NULL,
	[Descuento] [float] NOT NULL,
	[Total] [float] NOT NULL,
	[DuennoID] [int] NOT NULL,
	[idDetalle] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
 CONSTRAINT [PK_Facturacion] PRIMARY KEY CLUSTERED 
(
	[FacturaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[MedicamentosID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[PacienteID] [int] NOT NULL,
	[Dosis] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Medicamentos] PRIMARY KEY CLUSTERED 
(
	[MedicamentosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pacientes](
	[PacienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NOT NULL,
	[Edad] [int] NOT NULL,
	[Peso] [float] NOT NULL,
	[Especie] [varchar](20) NOT NULL,
	[Raza] [varchar](20) NULL,
	[Color] [varchar](20) NOT NULL,
	[Genero] [varchar](10) NOT NULL,
	[DuennoID] [int] NOT NULL,
	[Observaciones] [varchar](100) NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[PacienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[TipoUsuarioID] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[TipoUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tratamientos]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tratamientos](
	[TratamientoID] [int] IDENTITY(1,1) NOT NULL,
	[PacienteID] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Tratamientos] PRIMARY KEY CLUSTERED 
(
	[TratamientoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] NOT NULL,
	[Password] [varbinary](255) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[TipoUsuarioID] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Veterinaria]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Veterinaria](
	[VeterinariaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[SitioWeb] [varchar](50) NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](8) NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Veterinaria] PRIMARY KEY CLUSTERED 
(
	[VeterinariaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Cita] ON 

INSERT [dbo].[Cita] ([CitaID], [Fecha], [PacienteID], [Descripcion]) VALUES (7012, CAST(N'2017-04-27 00:00:00.000' AS DateTime), 3024, N'radiografia')
SET IDENTITY_INSERT [dbo].[Cita] OFF
INSERT [dbo].[DetalleFactura] ([idDetalle], [nombre], [descripcion], [precio]) VALUES (1, N'Medicamentos', N'Compra de medicamentos', CAST(8.000 AS Decimal(18, 3)))
INSERT [dbo].[DetalleFactura] ([idDetalle], [nombre], [descripcion], [precio]) VALUES (2, N'Tratamientos', N'Compra de tratamientos', CAST(5.000 AS Decimal(18, 3)))
INSERT [dbo].[DetalleFactura] ([idDetalle], [nombre], [descripcion], [precio]) VALUES (3, N'Examen Sangre', N'Pago examen sangre', CAST(10.000 AS Decimal(18, 3)))
INSERT [dbo].[DetalleFactura] ([idDetalle], [nombre], [descripcion], [precio]) VALUES (4, N'Consulta medica', N'Pago consulta medica', CAST(15.000 AS Decimal(18, 3)))
INSERT [dbo].[Duenno] ([DuennoID], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (116130437, N'juliana', N'alfaro vargas', N'84728492', N'julialfaro@gmail.com')
INSERT [dbo].[Duenno] ([DuennoID], [Nombre], [Apellidos], [Telefono], [Correo]) VALUES (207330185, N'PruebaCliente', N'Clientes Pruebas', N'24389490', N'koviedo@pruebas.com')
SET IDENTITY_INSERT [dbo].[Enfermedad] ON 

INSERT [dbo].[Enfermedad] ([EnfermedadID], [Nombre], [PacienteID], [Sintomas]) VALUES (2009, N'Anemia', 3018, N'Disminución células rojas')
INSERT [dbo].[Enfermedad] ([EnfermedadID], [Nombre], [PacienteID], [Sintomas]) VALUES (2010, N'Barlow', 3024, N'Afecta las terminaciones de huesos')
SET IDENTITY_INSERT [dbo].[Enfermedad] OFF
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([FacturaID], [Fecha], [Subtotal], [Impuesto], [Descuento], [Total], [DuennoID], [idDetalle], [UsuarioID]) VALUES (4, CAST(N'2017-04-15 00:00:00.000' AS DateTime), 13, 0.2, 2000, 10, 207330185, 1, 1)
SET IDENTITY_INSERT [dbo].[Factura] OFF
SET IDENTITY_INSERT [dbo].[Medicamentos] ON 

INSERT [dbo].[Medicamentos] ([MedicamentosID], [Nombre], [FechaVencimiento], [PacienteID], [Dosis]) VALUES (3013, N'canidryl 1', CAST(N'2019-08-09 00:00:00.000' AS DateTime), 3018, N'100 MG')
INSERT [dbo].[Medicamentos] ([MedicamentosID], [Nombre], [FechaVencimiento], [PacienteID], [Dosis]) VALUES (3016, N'prueba', CAST(N'2017-04-27 00:00:00.000' AS DateTime), 3024, N'100 MG')
SET IDENTITY_INSERT [dbo].[Medicamentos] OFF
SET IDENTITY_INSERT [dbo].[Pacientes] ON 

INSERT [dbo].[Pacientes] ([PacienteID], [Nombre], [Edad], [Peso], [Especie], [Raza], [Color], [Genero], [DuennoID], [Observaciones]) VALUES (3018, N'PruebaP', 12, 13.9, N'Perro', N'Boxer', N'cafe', N'Hembra', 207330185, N'Prueba de Observaciones')
INSERT [dbo].[Pacientes] ([PacienteID], [Nombre], [Edad], [Peso], [Especie], [Raza], [Color], [Genero], [DuennoID], [Observaciones]) VALUES (3024, N'blanca', 2, 6, N'perra', N'boxer', N'blanca', N'Hembra', 207330185, N'ninguna')
SET IDENTITY_INSERT [dbo].[Pacientes] OFF
INSERT [dbo].[TipoUsuario] ([TipoUsuarioID], [Nombre], [Descripcion]) VALUES (1, N'', N'')
SET IDENTITY_INSERT [dbo].[Tratamientos] ON 

INSERT [dbo].[Tratamientos] ([TratamientoID], [PacienteID], [Descripcion]) VALUES (2012, 3018, N'Tratamiento')
INSERT [dbo].[Tratamientos] ([TratamientoID], [PacienteID], [Descripcion]) VALUES (2021, 3024, N'rabia')
INSERT [dbo].[Tratamientos] ([TratamientoID], [PacienteID], [Descripcion]) VALUES (2022, 3024, N'prueba')
SET IDENTITY_INSERT [dbo].[Tratamientos] OFF
INSERT [dbo].[Usuario] ([UsuarioID], [Password], [Nombre], [TipoUsuarioID]) VALUES (1, 0x636C617665, N'usuario', 1)
ALTER TABLE [dbo].[Cita]  WITH CHECK ADD  CONSTRAINT [FK_Cita_Pacientes] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[Cita] CHECK CONSTRAINT [FK_Cita_Pacientes]
GO
ALTER TABLE [dbo].[Enfermedad]  WITH CHECK ADD  CONSTRAINT [FK_Enfermedad_Pacientes] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[Enfermedad] CHECK CONSTRAINT [FK_Enfermedad_Pacientes]
GO
ALTER TABLE [dbo].[Examen]  WITH CHECK ADD  CONSTRAINT [FK_Examen_Pacientes] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[Examen] CHECK CONSTRAINT [FK_Examen_Pacientes]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Duenno] FOREIGN KEY([IdDuenno])
REFERENCES [dbo].[Duenno] ([DuennoID])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Duenno]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Enfermedad] FOREIGN KEY([IdEnfermedad])
REFERENCES [dbo].[Enfermedad] ([EnfermedadID])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Enfermedad]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Examen] FOREIGN KEY([IdExamen])
REFERENCES [dbo].[Examen] ([ExamenID])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Examen]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Medicamentos] FOREIGN KEY([IdMedicamentos])
REFERENCES [dbo].[Medicamentos] ([MedicamentosID])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Medicamentos]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Pacientes] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Pacientes]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Tratamientos] FOREIGN KEY([IdTratamientos])
REFERENCES [dbo].[Tratamientos] ([TratamientoID])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Tratamientos]
GO
ALTER TABLE [dbo].[Expediente]  WITH CHECK ADD  CONSTRAINT [FK_Expediente_Veterinaria] FOREIGN KEY([IdVeterinaria])
REFERENCES [dbo].[Veterinaria] ([VeterinariaID])
GO
ALTER TABLE [dbo].[Expediente] CHECK CONSTRAINT [FK_Expediente_Veterinaria]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Duenno] FOREIGN KEY([DuennoID])
REFERENCES [dbo].[Duenno] ([DuennoID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Duenno]
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD  CONSTRAINT [FK_Medicamentos_Pacientes] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[Medicamentos] CHECK CONSTRAINT [FK_Medicamentos_Pacientes]
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD  CONSTRAINT [FK_Pacientes_Duenno] FOREIGN KEY([DuennoID])
REFERENCES [dbo].[Duenno] ([DuennoID])
GO
ALTER TABLE [dbo].[Pacientes] CHECK CONSTRAINT [FK_Pacientes_Duenno]
GO
ALTER TABLE [dbo].[Tratamientos]  WITH CHECK ADD  CONSTRAINT [FK_Tratamientos_Pacientes] FOREIGN KEY([PacienteID])
REFERENCES [dbo].[Pacientes] ([PacienteID])
GO
ALTER TABLE [dbo].[Tratamientos] CHECK CONSTRAINT [FK_Tratamientos_Pacientes]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([TipoUsuarioID])
REFERENCES [dbo].[TipoUsuario] ([TipoUsuarioID])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO
/****** Object:  StoredProcedure [dbo].[PA_Editar_Usuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nacho
-- Create date: 21/03/2015
-- Description:	CRUD de Usuario
-- =============================================
CREATE PROCEDURE [dbo].[PA_Editar_Usuario]
	@Password varchar(255)
   ,@Nombre varchar(50)
   ,@IDTipoUsuario int
AS
BEGIN
UPDATE [dbo].[Usuario]
   SET [Password] = CONVERT (varbinary (255),PWDENCRYPT (@Password))
      ,[Nombre] = @Nombre
      ,[TipoUsuarioID] = @IDTipoUsuario
 WHERE Nombre = @Nombre 
END

GO
/****** Object:  StoredProcedure [dbo].[PA_Eliminar_Usuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nacho
-- Create date: 21/03/2015
-- Description:	CRUD de Usuario
-- =============================================
CREATE PROCEDURE [dbo].[PA_Eliminar_Usuario]
   @Nombre varchar(50)
AS
BEGIN
DELETE FROM [dbo].[Usuario]
 WHERE Nombre = @Nombre 
END

GO
/****** Object:  StoredProcedure [dbo].[PA_InsertarC_Usuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nacho
-- Create date: 21/03/2015
-- Description:	CRUD de Usuario
-- =============================================
CREATE PROCEDURE [dbo].[PA_InsertarC_Usuario]
	@Password varchar(255)
   ,@Nombre varchar(50)
   ,@IDTipoUsuario int
AS
BEGIN
INSERT INTO [dbo].[Usuario]
           ([Password]
           ,[Nombre]
           ,[TipoUsuarioID])
     VALUES
           (CONVERT (varbinary (255),PWDENCRYPT (@Password))
           ,@Nombre
           ,@IDTipoUsuario)
END

GO
/****** Object:  StoredProcedure [dbo].[PA_SeleccionarCompleto_Usuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nacho
-- Create date: 21/03/2015
-- Description:	CRUD de Usuario
-- =============================================
CREATE PROCEDURE [dbo].[PA_SeleccionarCompleto_Usuario]
   @Nombre varchar(50)
   ,@Password varchar(255)
AS
BEGIN
SELECT [Password]
      ,[Nombre]
      ,[TipoUsuarioID]
  FROM [dbo].[Usuario]
 WHERE Nombre = @Nombre and 1 = PWDCOMPARE (@Password,[Password],0)
END

GO
/****** Object:  StoredProcedure [dbo].[PA_SeleccionarFacturas]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PA_SeleccionarFacturas]
AS
BEGIN
	Select f.*, df.nombre as nombreDetalle, df.precio as precioPaquete, CONCAT(du.nombre,' ') as duennoNombre
	from Factura f,  DetalleFactura df, Duenno du 
	where f.FacturaID = df.idDetalle and du.DuennoID = f.DuennoID order by f.Fecha


	--Select r.*, p.nombre as nombrePaquete, p.PrecioPersona as precioPaquete, CONCAT(u.nombre,' ',u.apellido) as nombreUsuario
	--from reservaPaquete r, paquete p, usuario u
	--where r.idPaquete=p.idPaquete and u.idUsuario=r.idUsuario
	--order by r.fecha;
END

select * from Duenno
select * from DetalleFactura


GO
/****** Object:  StoredProcedure [dbo].[PA_SeleccionarTratamientosNombre]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PA_SeleccionarTratamientosNombre]
	
AS
BEGIN
	
	Select Tratamientos.*, Pacientes.Nombre nombrePaciente from Tratamientos,Pacientes 
	where Tratamientos.PacienteID = Pacientes.PacienteID 
END
GO
/****** Object:  StoredProcedure [dbo].[PA_SelecionarTodos_Usuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nacho
-- Create date: 16/03/2015
-- Description:	CRUD de Producto
-- =============================================
CREATE PROCEDURE [dbo].[PA_SelecionarTodos_Usuario]
AS
BEGIN
SELECT [Password]
      ,[Nombre]
      ,[TipoUsuarioID]
  FROM [dbo].[Usuario]
END

GO
/****** Object:  StoredProcedure [dbo].[Seleccionar_Duenno_Filtro]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Seleccionar_Duenno_Filtro] 
	@Nombre varchar(50)
AS
BEGIN
select * from Duenno where (Nombre like '%' + @Nombre + '%')
	

END
GO
/****** Object:  StoredProcedure [dbo].[Seleccionar_PacienteExamen_Filtro]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Seleccionar_PacienteExamen_Filtro] 
	@Nombre varchar(15)
AS
BEGIN
select * from Pacientes where (Nombre like '%{0}%')
	

END
GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Cita_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Cita_ByID]
	(@citaid int)
AS 
	Delete from Cita
	Where (citaid =  @citaid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Duenno_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Duenno_ByID]
	(@duennoid int)
AS 
	Delete from Duenno
	Where (duennoid =  @duennoid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Enfermedad_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Enfermedad_ByID]
	(@enfermedadid int)
AS 
	Delete from Enfermedad
	Where (enfermedadid =  @enfermedadid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Examen_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Examen_ByID]
	(@examenid int)
AS 
	Delete from Examen
	Where (examenid =  @examenid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Expediente_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Expediente_ByID]
	(@idexpediente int)
AS 
	Delete from Expediente
	Where (idexpediente =  @idexpediente)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Medicamentos_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Medicamentos_ByID]
	(@medicamentosid int)
AS 
	Delete from Medicamentos
	Where (medicamentosid =  @medicamentosid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Pacientes_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Pacientes_ByID]
	(@pacienteid int)
AS 
	Delete from Pacientes
	Where (pacienteid =  @pacienteid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Tratamientos_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Tratamientos_ByID]
	(@tratamientoid int)
AS 
	Delete from Tratamientos
	Where (tratamientoid =  @tratamientoid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_DELETE_Veterinaria_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_DELETE_Veterinaria_ByID]
	(@veterinariaid int)
AS 
	Delete from Veterinaria
	Where (veterinariaid =  @veterinariaid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Cita]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[usp_INSERT_Cita]
	(@fecha datetime,@pacienteid int,@descripcion varchar(100))
AS 
	insert into Cita(fecha ,pacienteid ,descripcion ) 
	 values(@fecha ,@pacienteid ,@descripcion )
GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Duenno]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[usp_INSERT_Duenno]
	(@duennoid int,@nombre varchar(50),@apellidos varchar(50),@telefono varchar(8),@correo varchar(50))
AS 
Begin
INSERT INTO [dbo].[Duenno]
           ([DuennoID]
           ,[Nombre]
           ,[Apellidos]
           ,[Telefono]
           ,[Correo])
     VALUES
           (@duennoid
           ,@nombre
           ,@apellidos
           ,@telefono
           ,@correo)
end
GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Enfermedad]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE PROCEDURE [dbo].[usp_INSERT_Enfermedad]
	(@nombre varchar(50),@pacienteid int,@sintomas varchar(50))
AS 
	insert into Enfermedad(nombre ,pacienteid ,sintomas ) 
	 values(@nombre ,@pacienteid ,@sintomas )
GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Examen]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[usp_INSERT_Examen]
	(@eritrocitos float,@hemoglobina float,@hematocrito float,@vcm float,@hcm float,@chcm float,@plaquetas float,@leucocitos float,@neutrofilos float,@eosinofilos float,@linfocitos float,@pacienteid int)
AS 
	insert into Examen(eritrocitos ,hemoglobina ,hematocrito ,vcm ,hcm ,chcm ,plaquetas ,leucocitos ,neutrofilos ,eosinofilos ,linfocitos ,pacienteid ) 
	 values(@eritrocitos ,@hemoglobina ,@hematocrito ,@vcm ,@hcm ,@chcm ,@plaquetas ,@leucocitos ,@neutrofilos ,@eosinofilos ,@linfocitos ,@pacienteid )

GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Expediente]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[usp_INSERT_Expediente]
	(@idpaciente int,@idenfermedad int,@idtratamientos int,@idmedicamentos int,@idexamen int,@idveterinaria int,@idduenno int,@idradiografia int)
AS 
	insert into Expediente(idpaciente ,idenfermedad ,idtratamientos ,idmedicamentos ,idexamen ,idveterinaria ,idduenno ,idradiografia ) 
	 values(@idpaciente ,@idenfermedad ,@idtratamientos ,@idmedicamentos ,@idexamen ,@idveterinaria ,@idduenno ,@idradiografia )

GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Factura]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[usp_INSERT_Factura]
(@fecha datetime, @subtotal float, @impuesto float, @descuento float, @total float, @duennoID int, @idDetalle int, @usuarioID int)
as
insert into Factura(Fecha,Subtotal, Impuesto, Descuento, Total, DuennoID, idDetalle, UsuarioID) 
values (@fecha, @subtotal, @impuesto, @descuento, @total, @duennoID, @idDetalle, @usuarioID)

GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Medicamentos]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE PROCEDURE [dbo].[usp_INSERT_Medicamentos]
	(@nombre varchar(50),@fechavencimiento datetime,@pacienteid int,@dosis varchar(20))
AS 
	insert into Medicamentos(nombre ,fechavencimiento ,pacienteid ,dosis ) 
	 values(@nombre ,@fechavencimiento ,@pacienteid ,@dosis )
GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Pacientes]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_INSERT_Pacientes]
	(@nombre varchar(15),@edad int,@peso float,@especie varchar(20),@raza varchar(20),@color varchar(20),@genero varchar(10),@duennoid int,@observaciones varchar(100))
AS 
	insert into Pacientes(nombre ,edad ,peso ,especie ,raza ,color ,genero ,duennoid ,observaciones ) 
	 values(@nombre ,@edad ,@peso ,@especie ,@raza ,@color ,@genero ,@duennoid ,@observaciones )

GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Tratamientos]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE PROCEDURE [dbo].[usp_INSERT_Tratamientos]
	(@pacienteid int,@descripcion varchar(50))
AS 
	insert into Tratamientos(pacienteid ,descripcion ) 
	 values(@pacienteid ,@descripcion )
GO
/****** Object:  StoredProcedure [dbo].[usp_INSERT_Veterinaria]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[usp_INSERT_Veterinaria]
	(@nombre varchar(30),@sitioweb varchar(50),@direccion varchar(50),@telefono varchar(8),@email varchar(50))
AS 
	insert into Veterinaria(nombre ,sitioweb ,direccion ,telefono ,email ) 
	 values(@nombre ,@sitioweb ,@direccion ,@telefono ,@email )
GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Adopcion]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[usp_SELECT_Adopcion]
	AS 
	Select * from Duenno

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Cita_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Cita_All]
	AS 

	Select Cita.*, Pacientes.Nombre nombrePaciente from Cita, Pacientes
	where Cita.PacienteID = Pacientes.PacienteID 

	--Select Cita.*, Pacientes.Nombre nombrePaciente, Duenno.Nombre nombreDuenno from Cita, Pacientes, Duenno
	--where Cita.PacienteID = Pacientes.PacienteID & Pacientes.PacienteID * Duenno.DuennoID
GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Cita_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Cita_ByID]
	(@citaid int)
AS 
	Select citaid ,fecha ,pacienteid ,descripcion  from Cita
	Where (citaid =  @citaid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Duenno_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Duenno_All]
	AS 
	Select duennoid ,nombre ,apellidos ,telefono ,correo  from Duenno

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Duenno_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Duenno_ByID]
	(@duennoid int)
AS 
	Select duennoid ,nombre ,apellidos ,telefono ,correo  from Duenno
	Where (duennoid =  @duennoid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Enfermedad_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Enfermedad_All]
	AS 
	Select Enfermedad.*, Pacientes.Nombre nombrePaciente from Enfermedad,Pacientes where
	Enfermedad.PacienteID = Pacientes.PacienteID
GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Enfermedad_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Enfermedad_ByID]
	(@enfermedadid int)
AS 
	Select enfermedadid ,nombre ,pacienteid ,sintomas  from Enfermedad
	Where (enfermedadid =  @enfermedadid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Examen_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Examen_All]
	AS 
	Select examenid ,eritrocitos ,hemoglobina ,hematocrito ,vcm ,hcm ,chcm ,plaquetas ,leucocitos ,neutrofilos ,eosinofilos ,linfocitos ,pacienteid  from Examen

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Examen_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Examen_ByID]
	(@examenid int)
AS 
	Select examenid ,eritrocitos ,hemoglobina ,hematocrito ,vcm ,hcm ,chcm ,plaquetas ,leucocitos ,neutrofilos ,eosinofilos ,linfocitos ,pacienteid  from Examen
	Where (examenid =  @examenid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Expediente_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Expediente_All]
	AS 
	Select idexpediente ,idpaciente ,idenfermedad ,idtratamientos ,idmedicamentos ,idexamen ,idveterinaria ,idduenno ,idradiografia  from Expediente

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Expediente_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Expediente_ByID]
	(@idexpediente int)
AS 
	Select idexpediente ,idpaciente ,idenfermedad ,idtratamientos ,idmedicamentos ,idexamen ,idveterinaria ,idduenno ,idradiografia  from Expediente
	Where (idexpediente =  @idexpediente)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Medicamentos_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Medicamentos_All]
	AS 
	Select Medicamentos.*, Pacientes.Nombre nombrePaciente from Medicamentos,Pacientes
	where Medicamentos.PacienteID = Pacientes.PacienteID
GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Medicamentos_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Medicamentos_ByID]
	(@medicamentosid int)
AS 
	Select medicamentosid ,nombre ,fechavencimiento ,pacienteid ,dosis  from Medicamentos
	Where (medicamentosid =  @medicamentosid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Pacientes_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SELECT_Pacientes_All]
	AS 
	Select *  from Pacientes
GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Pacientes_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SELECT_Pacientes_ByID]
	(@pacienteid int)
AS 
	Select pacienteid ,nombre ,edad ,peso ,especie ,raza ,color ,genero ,veterinariaid ,duennoid ,observaciones  from Pacientes
	Where (pacienteid =  @pacienteid) 
GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Tratamientos_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Tratamientos_All]
	AS 
	Select tratamientoid ,pacienteid ,descripcion  from Tratamientos

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Tratamientos_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Tratamientos_ByID]
	(@tratamientoid int)
AS 
	Select tratamientoid ,pacienteid ,descripcion  from Tratamientos
	Where (tratamientoid =  @tratamientoid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Veterinaria_All]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Veterinaria_All]
	AS 
	Select veterinariaid ,nombre ,sitioweb ,direccion ,telefono ,email  from Veterinaria

GO
/****** Object:  StoredProcedure [dbo].[usp_SELECT_Veterinaria_ByID]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_SELECT_Veterinaria_ByID]
	(@veterinariaid int)
AS 
	Select veterinariaid ,nombre ,sitioweb ,direccion ,telefono ,email  from Veterinaria
	Where (veterinariaid =  @veterinariaid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_SelectUsuario]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_SelectUsuario](@nom varchar(50),@pass varchar(255))
as
select * from Usuario where Nombre = @nom and Password = CONVERT(varbinary(255),@pass,0);

GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Cita]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UPDATE_Cita]
	(@citaid int,@fecha datetime,@pacienteid int,@descripcion varchar(1000))
AS 
	Update  Cita
	Set 	
	fecha =  @fecha  ,
	pacienteid =  @pacienteid  ,
	descripcion =  @descripcion  
	Where (citaid =  @citaid) 
GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Duenno]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UPDATE_Duenno]
	(@duennoid int,@nombre varchar(50),@apellidos varchar(50),@telefono varchar(8),@correo varchar(50))
AS 
Begin

UPDATE [dbo].[Duenno]
   SET [Nombre] = @nombre 
      ,[Apellidos] = @apellidos
      ,[Telefono] = @telefono
      ,[Correo] = @correo
 WHERE DuennoID = @duennoid

end
GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Enfermedad]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UPDATE_Enfermedad]
	(@enfermedadid int,@nombre varchar(50),@pacienteid int,@sintomas varchar(50))
AS 
	Update  Enfermedad
	Set 	
	nombre =  @nombre  ,
	pacienteid =  @pacienteid  ,
	sintomas =  @sintomas  
	Where (enfermedadid =  @enfermedadid)  
GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Examen]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UPDATE_Examen]
	(@examenid int,@eritrocitos float,@hemoglobina float,@hematocrito float,@vcm float,@hcm float,@chcm float,@plaquetas float,@leucocitos float,@neutrofilos float,@eosinofilos float,@linfocitos float,@pacienteid int)
AS 
	Update  Examen
	Set 
	eritrocitos =  @eritrocitos  ,
	hemoglobina =  @hemoglobina  ,
	hematocrito =  @hematocrito  ,
	vcm =  @vcm  ,
	hcm =  @hcm  ,
	chcm =  @chcm  ,
	plaquetas =  @plaquetas  ,
	leucocitos =  @leucocitos  ,
	neutrofilos =  @neutrofilos  ,
	eosinofilos =  @eosinofilos  ,
	linfocitos =  @linfocitos  ,
	pacienteid =  @pacienteid  
	Where (examenid =  @examenid)  

GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Expediente]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_UPDATE_Expediente]
	(@idexpediente int,@idpaciente int,@idenfermedad int,@idtratamientos int,@idmedicamentos int,@idexamen int,@idveterinaria int,@idduenno int,@idradiografia int)
AS 
	Update  Expediente
	Set 	idexpediente =  @idexpediente  ,
	idpaciente =  @idpaciente  ,
	idenfermedad =  @idenfermedad  ,
	idtratamientos =  @idtratamientos  ,
	idmedicamentos =  @idmedicamentos  ,
	idexamen =  @idexamen  ,
	idveterinaria =  @idveterinaria  ,
	idduenno =  @idduenno  ,
	idradiografia =  @idradiografia  
	Where (idexpediente =  @idexpediente)  

GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Medicamentos]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UPDATE_Medicamentos]
	(@medicamentosid int,@nombre varchar(50),@fechavencimiento datetime,@pacienteid int,@dosis varchar(20))
AS 
	Update  Medicamentos
	Set
	nombre =  @nombre  ,
	fechavencimiento =  @fechavencimiento  ,
	pacienteid =  @pacienteid  ,
	dosis =  @dosis  
	Where (medicamentosid =  @medicamentosid) 
GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Pacientes]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UPDATE_Pacientes]
	(@pacienteid int,@nombre varchar(15),@edad int,@peso float,@especie varchar(20),@raza varchar(20),@color varchar(20),@genero varchar(10),@observaciones varchar(100))
AS 
	Update  Pacientes
	Set 
	nombre =  @nombre  ,
	edad =  @edad  ,
	peso =  @peso  ,
	especie =  @especie  ,
	raza =  @raza  ,
	color =  @color  ,
	genero =  @genero  ,
	observaciones =  @observaciones  
	where (PacienteID = @pacienteid)
	
GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Tratamientos]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UPDATE_Tratamientos]
	(@tratamientoid int,@pacienteid int,@descripcion varchar(50))
AS 
	Update  Tratamientos
	Set 
	pacienteid =  @pacienteid  ,
	descripcion =  @descripcion  
	Where (tratamientoid =  @tratamientoid)  
GO
/****** Object:  StoredProcedure [dbo].[usp_UPDATE_Veterinaria]    Script Date: 17/4/2017 18:14:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [dbo].[usp_UPDATE_Veterinaria]
	(@veterinariaid int,@nombre varchar(30),@sitioweb varchar(50),@direccion varchar(50),@telefono varchar(8),@email varchar(50))
AS 
	Update  Veterinaria
	set
	nombre =  @nombre  ,
	sitioweb =  @sitioweb  ,
	direccion =  @direccion  ,
	telefono =  @telefono  ,
	email =  @email  
	Where (VeterinariaID =  @veterinariaid)  

GO
USE [master]
GO
ALTER DATABASE [DBVeterinaria] SET  READ_WRITE 
GO
