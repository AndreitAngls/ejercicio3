USE [master]
GO
/****** Object:  Database [bdAndrea]    Script Date: 5/5/2024 10:45:49 ******/
CREATE DATABASE [bdAndrea]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdAndrea', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdAndrea.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdAndrea_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\bdAndrea_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdAndrea] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdAndrea].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdAndrea] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdAndrea] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdAndrea] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdAndrea] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdAndrea] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdAndrea] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdAndrea] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [bdAndrea] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdAndrea] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdAndrea] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdAndrea] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdAndrea] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdAndrea] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdAndrea] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdAndrea] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdAndrea] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdAndrea] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdAndrea] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdAndrea] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdAndrea] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdAndrea] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdAndrea] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdAndrea] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdAndrea] SET RECOVERY FULL 
GO
ALTER DATABASE [bdAndrea] SET  MULTI_USER 
GO
ALTER DATABASE [bdAndrea] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdAndrea] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bdAndrea] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bdAndrea] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [bdAndrea]
GO
/****** Object:  StoredProcedure [dbo].[agregarCliente]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[agregarCliente]
@CUENTA int,
@NOMBRES varchar(100),
@APELLIDOS varchar(100),
@CI int,
@DOMICILIO varchar(100),
@CELULAR int,
@CORREO varchar(100)
as
insert into cliente values (@CUENTA,@NOMBRES,@APELLIDOS,@CI,@DOMICILIO,@CELULAR,@CORREO)

GO
/****** Object:  StoredProcedure [dbo].[DeleteDetialByID]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteDetialByID]
@IDCLIENTE int
as
	Delete from cliente where IDCLIENTE=@IDCLIENTE;
GO
/****** Object:  StoredProcedure [dbo].[GetDetail]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDetail]
as
	Select IDCLIENTE,CUENTA,NOMBRES,APELLIDOS,CI,DOMICILIO,CELULAR,CORREO from cliente;
GO
/****** Object:  StoredProcedure [dbo].[GetDetialByID]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDetialByID]
@IDCLIENTE int
as
	Select IDCLIENTE,CUENTA,NOMBRES,APELLIDOS,CI,DOMICILIO,CELULAR,CORREO from cliente where IDCLIENTE=@IDCLIENTE
GO
/****** Object:  StoredProcedure [dbo].[InsertDetail]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertDetail]
@CUENTA int,
@NOMBRES varchar(100),
@APELLIDOS varchar(100),
@CI int,
@DOMICILIO varchar(100),
@CELULAR int,
@CORREO varchar(100)
as
insert into cliente values (@CUENTA,@NOMBRES,@APELLIDOS,@CI,@DOMICILIO,@CELULAR,@CORREO)

GO
/****** Object:  StoredProcedure [dbo].[listarCliente]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listarCliente]
as
	select IDCLIENTE AS ID, cuentaBancaria.CUENTA_BANCARIA,NOMBRES,APELLIDOS,CI,DOMICILIO,CELULAR,CORREO
	 from cliente 
	INNER JOIN cuentaBancaria ON cliente.CUENTA=cuentaBancaria.IDCUENTA

GO
/****** Object:  StoredProcedure [dbo].[listarCuenta]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listarCuenta] 
as
select *from cuentaBancaria order by CUENTA_BANCARIA asc

GO
/****** Object:  StoredProcedure [dbo].[UpdateDetail]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateDetail]
@IDCLIENTE int,
@CUENTA int,
@NOMBRES varchar(100),
@APELLIDOS varchar(100),
@CI int,
@DOMICILIO varchar(100),
@CELULAR int,
@CORREO varchar(100)
as

UPDATE cliente set CUENTA=@CUENTA,NOMBRES=@NOMBRES,APELLIDOS=@APELLIDOS,CI=@CI,DOMICILIO=@DOMICILIO,CELULAR=@CELULAR,CORREO=@CORREO where IDCLIENTE=@IDCLIENTE;
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[IDCLIENTE] [int] IDENTITY(1,1) NOT NULL,
	[CUENTA] [int] NULL,
	[NOMBRES] [varchar](100) NULL,
	[APELLIDOS] [varchar](100) NULL,
	[CI] [int] NULL,
	[DOMICILIO] [varchar](100) NULL,
	[CELULAR] [int] NULL,
	[CORREO] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCLIENTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cuentaBancaria]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cuentaBancaria](
	[IDCUENTA] [int] IDENTITY(1,1) NOT NULL,
	[CUENTA_BANCARIA] [varchar](100) NULL,
	[MONTO] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCUENTA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transaccion]    Script Date: 5/5/2024 10:45:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaccion](
	[IDTRANSAC] [int] IDENTITY(1,1) NOT NULL,
	[CUENTA] [int] NULL,
	[NOMBREBENEF] [varchar](100) NULL,
	[APELLIDOBENEF] [varchar](100) NULL,
	[NUMEROCUENTABENEF] [varchar](100) NULL,
	[CONCEPTO] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTRANSAC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (1, 2, N'Rufina', N'Marquez Pacheco', 2059958, N'Vino Tinto', 73240120, N'rfnmrq31@gmail.com')
INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (2, 1, N'Rocio Andrea', N'Calderon Marquez', 5995548, N'Vino Tinto', 68126531, N'andreitangls@gmail.com')
INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (3, 3, N'Juan', N'Calderon Velasquez', 315793, N'Achachicala', 73206408, N'jc210845@gmail.com')
INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (6, 2, N'Manuel', N'Chivas Calderon', 14702012, N'Achachicala', 65112583, N'mnjnt13@gmail.com')
INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (7, 2, N'Manuel', N'Chivas', 14702012, N'Achachicala', 65112583, N'mnjnt13@gmail.com')
INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (10, 2, N'Manuel', N'Chivas', 14702012, N'Achachicala', 65112583, N'mnjnt13@gmail.com')
INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (12, 2, N'Manuel', N'Chivas', 14702012, N'Achachicala', 65112583, N'mnjnt13@gmail.com')
INSERT [dbo].[cliente] ([IDCLIENTE], [CUENTA], [NOMBRES], [APELLIDOS], [CI], [DOMICILIO], [CELULAR], [CORREO]) VALUES (14, 3, N'Rosa Andrea', N'Chivas Calderon', 6543, N'Achachicala', 71258443, N'andreandreangls@gmail.com')
SET IDENTITY_INSERT [dbo].[cliente] OFF
SET IDENTITY_INSERT [dbo].[cuentaBancaria] ON 

INSERT [dbo].[cuentaBancaria] ([IDCUENTA], [CUENTA_BANCARIA], [MONTO]) VALUES (1, N'Cuenta de Ahorro', N'100Bs.')
INSERT [dbo].[cuentaBancaria] ([IDCUENTA], [CUENTA_BANCARIA], [MONTO]) VALUES (2, N'Cuenta Corriente', N'1000Bs.')
INSERT [dbo].[cuentaBancaria] ([IDCUENTA], [CUENTA_BANCARIA], [MONTO]) VALUES (3, N'Deposito a Plazo Fijo', N'5000Bs.')
SET IDENTITY_INSERT [dbo].[cuentaBancaria] OFF
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [fk_cuenta] FOREIGN KEY([CUENTA])
REFERENCES [dbo].[cuentaBancaria] ([IDCUENTA])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [fk_cuenta]
GO
ALTER TABLE [dbo].[transaccion]  WITH CHECK ADD  CONSTRAINT [fk_bancaria] FOREIGN KEY([CUENTA])
REFERENCES [dbo].[cuentaBancaria] ([IDCUENTA])
GO
ALTER TABLE [dbo].[transaccion] CHECK CONSTRAINT [fk_bancaria]
GO
USE [master]
GO
ALTER DATABASE [bdAndrea] SET  READ_WRITE 
GO
