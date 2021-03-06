USE [master]
GO
/****** Object:  Database [ticket]    Script Date: 17/11/2017 8:28:30 ******/
CREATE DATABASE [ticket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ticket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NILDS\MSSQL\DATA\ticket.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ticket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.NILDS\MSSQL\DATA\ticket_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ticket] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ticket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ticket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ticket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ticket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ticket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ticket] SET ARITHABORT OFF 
GO
ALTER DATABASE [ticket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ticket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ticket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ticket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ticket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ticket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ticket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ticket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ticket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ticket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ticket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ticket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ticket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ticket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ticket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ticket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ticket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ticket] SET RECOVERY FULL 
GO
ALTER DATABASE [ticket] SET  MULTI_USER 
GO
ALTER DATABASE [ticket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ticket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ticket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ticket] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ticket] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ticket', N'ON'
GO
USE [ticket]
GO
/****** Object:  User [yo]    Script Date: 17/11/2017 8:28:31 ******/
CREATE USER [yo] FOR LOGIN [yo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[atendido]    Script Date: 17/11/2017 8:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atendido](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cola] [int] NULL,
	[id_vendedor] [int] NULL,
	[fecha_atencion] [datetime] NULL,
	[estado] [int] NULL,
	[llama] [int] NULL,
 CONSTRAINT [PK_atendido] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cliente]    Script Date: 17/11/2017 8:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[ci] [varchar](50) NULL,
	[domicilio] [varchar](200) NULL,
	[telefono] [int] NULL,
	[fecha_registro] [date] NULL,
	[sexo] [char](1) NULL,
	[fecha_nacimiento] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cola]    Script Date: 17/11/2017 8:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cola](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[secuencia] [int] NULL,
	[fecha_registro] [datetime] NULL,
	[id_origen] [int] NULL,
	[estado] [int] NULL,
	[numero] [varchar](50) NULL,
	[id_servicio] [int] NULL,
	[id_cliente] [int] NULL,
 CONSTRAINT [PK_cola] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[servicio]    Script Date: 17/11/2017 8:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[servicio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[abreviatura] [varchar](50) NULL,
	[sigla] [varchar](50) NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_servicio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vendedor]    Script Date: 17/11/2017 8:28:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vendedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[sigla] [varchar](50) NULL,
	[password] [nchar](10) NULL,
	[apellido] [varchar](50) NULL,
	[caja] [varchar](50) NULL,
	[estado] [int] NULL,
	[id_servicio] [int] NULL,
 CONSTRAINT [PK_vendedor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [ticket] SET  READ_WRITE 
GO
