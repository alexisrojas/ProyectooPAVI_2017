USE [master]
GO
/****** Object:  Database [Sea Star]    Script Date: 09/11/2017 09:24:48 a.m. ******/
CREATE DATABASE [Sea Star]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sea Star', FILENAME = N'C:\Users\Usuario\Sea Star.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sea Star_log', FILENAME = N'C:\Users\Usuario\Sea Star_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Sea Star] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sea Star].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sea Star] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sea Star] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sea Star] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sea Star] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sea Star] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sea Star] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sea Star] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sea Star] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sea Star] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sea Star] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sea Star] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sea Star] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sea Star] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sea Star] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sea Star] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sea Star] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sea Star] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sea Star] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sea Star] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sea Star] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sea Star] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sea Star] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sea Star] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sea Star] SET  MULTI_USER 
GO
ALTER DATABASE [Sea Star] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sea Star] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sea Star] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sea Star] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Sea Star]
GO
/****** Object:  Table [dbo].[Camarotes]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camarotes](
	[cod_navio] [int] NOT NULL,
	[num_cubierta] [int] NOT NULL,
	[num_camarote] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [int] NOT NULL,
	[ubicacion] [varchar](50) NOT NULL,
	[cant_camas] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_camarotes] PRIMARY KEY CLUSTERED 
(
	[cod_navio] ASC,
	[num_cubierta] ASC,
	[num_camarote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clasificacion_Navio]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion_Navio](
	[cod_clasif] [int] IDENTITY(1,1) NOT NULL,
	[descrip] [varchar](1000) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_clasificacion_navio] PRIMARY KEY CLUSTERED 
(
	[cod_clasif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cubiertas]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cubiertas](
	[cod_navio] [int] NOT NULL,
	[num_cubierta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[leg_encargado] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_cubiertas] PRIMARY KEY CLUSTERED 
(
	[cod_navio] ASC,
	[num_cubierta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forma_pago]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forma_pago](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [pk_id_forma_pago] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Itinerarios]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerarios](
	[cod_itinerario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[categoria] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_itinerarios] PRIMARY KEY CLUSTERED 
(
	[cod_itinerario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Navios]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navios](
	[cod_navio] [int] IDENTITY(1,1) NOT NULL,
	[nombre_navio] [varchar](1000) NOT NULL,
	[altura] [int] NOT NULL,
	[autonomia] [varchar](1000) NOT NULL,
	[desplazamiento] [varchar](1000) NOT NULL,
	[eslora] [int] NOT NULL,
	[manga] [int] NOT NULL,
	[cant_max_pasaj] [int] NOT NULL,
	[cant_tripulantes] [int] NOT NULL,
	[cant_motores] [int] NOT NULL,
	[tipo_clasif] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_navios] PRIMARY KEY CLUSTERED 
(
	[cod_navio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pago]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[id_pago] [int] NOT NULL,
	[id_forma_pago] [int] NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [pk_id_pago] PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pasaje_Camarote]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasaje_Camarote](
	[id_pago] [int] NOT NULL,
	[cod_navio] [int] NOT NULL,
	[fecha_viaje] [date] NOT NULL,
	[num_camarote] [int] NOT NULL,
	[num_cubierta] [int] NOT NULL,
	[tipo_doc] [varchar](50) NOT NULL,
	[nro_doc] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
	[fecha_venta] [date] NOT NULL,
 CONSTRAINT [pk_pasaje_camarote] PRIMARY KEY CLUSTERED 
(
	[id_pago] ASC,
	[cod_navio] ASC,
	[fecha_viaje] ASC,
	[num_camarote] ASC,
	[num_cubierta] ASC,
	[tipo_doc] ASC,
	[nro_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pasajeros]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasajeros](
	[tipo_doc] [varchar](50) NOT NULL,
	[nro_doc] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[ciudad_proc] [varchar](50) NOT NULL,
	[pais_proc] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_pasajeros] PRIMARY KEY CLUSTERED 
(
	[tipo_doc] ASC,
	[nro_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Puerto]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puerto](
	[cod_puerto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_cod_puerto] PRIMARY KEY CLUSTERED 
(
	[cod_puerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Puerto_Itinerario]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puerto_Itinerario](
	[cod_itinerario] [int] NOT NULL,
	[num_escala] [int] NOT NULL,
	[cod_puerto] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_puerto_itinerario] PRIMARY KEY CLUSTERED 
(
	[cod_itinerario] ASC,
	[num_escala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[cod_puesto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_puestos] PRIMARY KEY CLUSTERED 
(
	[cod_puesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Camarote]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_Camarote](
	[tipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_tipo] PRIMARY KEY CLUSTERED 
(
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tripulaciones]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tripulaciones](
	[legajo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[legajo_jefe] [int] NULL,
	[cod_puesto] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_tripulaciones] PRIMARY KEY CLUSTERED 
(
	[legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tripulante_Viaje]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tripulante_Viaje](
	[legajo] [int] NOT NULL,
	[cod_navio] [int] NOT NULL,
	[fecha_viaje] [date] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_Tripulante_Viaje] PRIMARY KEY CLUSTERED 
(
	[legajo] ASC,
	[cod_navio] ASC,
	[fecha_viaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[n_usuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [pk_Users] PRIMARY KEY CLUSTERED 
(
	[n_usuario] ASC,
	[password] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Viajes]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viajes](
	[cod_navio] [int] NOT NULL,
	[fecha_viaje] [date] NOT NULL,
	[duracion] [varchar](50) NOT NULL,
	[cod_itinerario] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[borrado] [bit] NOT NULL,
 CONSTRAINT [pk_viajes] PRIMARY KEY CLUSTERED 
(
	[cod_navio] ASC,
	[fecha_viaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Camarotes] ON 

INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (1, 1, 1, 2, N'gfdg', 4, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (1, 1, 2, 4, N'dsaf', 3, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (1, 1, 3, 3, N'hgfhg', 2, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (1, 4, 4, 2, N'fsdfdsa', 1, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (1, 4, 5, 5, N'posj', 3, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (1, 6, 6, 2, N'odksjf', 1, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (2, 2, 7, 3, N'ofudsñoi', 2, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (2, 7, 8, 4, N'iufso', 3, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (2, 8, 9, 5, N'oipfjsd', 2, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (3, 3, 10, 3, N'hgfuig', 5, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (3, 9, 11, 2, N'ipufsdoi', 1, 0)
INSERT [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote], [tipo], [ubicacion], [cant_camas], [borrado]) VALUES (3, 10, 12, 5, N'iodjfsd', 3, 0)
SET IDENTITY_INSERT [dbo].[Camarotes] OFF
SET IDENTITY_INSERT [dbo].[Clasificacion_Navio] ON 

INSERT [dbo].[Clasificacion_Navio] ([cod_clasif], [descrip], [borrado]) VALUES (1, N'Yate', 0)
INSERT [dbo].[Clasificacion_Navio] ([cod_clasif], [descrip], [borrado]) VALUES (2, N'Ferri', 0)
INSERT [dbo].[Clasificacion_Navio] ([cod_clasif], [descrip], [borrado]) VALUES (3, N'Lancha', 0)
INSERT [dbo].[Clasificacion_Navio] ([cod_clasif], [descrip], [borrado]) VALUES (4, N'Crucero', 0)
SET IDENTITY_INSERT [dbo].[Clasificacion_Navio] OFF
SET IDENTITY_INSERT [dbo].[Cubiertas] ON 

INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (1, 1, N'dasdas', 4, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (1, 4, N'igjfdñh', 4, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (1, 5, N'ifjsodj', 4, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (1, 6, N'ñofihsdñ', 4, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (2, 2, N'udshf', 5, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (2, 7, N'ñojgfkj', 5, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (2, 8, N'kgfjkf', 5, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (3, 3, N'fdsfgfd', 9, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (3, 9, N'jñfjsdjf', 9, 0)
INSERT [dbo].[Cubiertas] ([cod_navio], [num_cubierta], [descripcion], [leg_encargado], [borrado]) VALUES (3, 10, N'ogjfkdj', 9, 0)
SET IDENTITY_INSERT [dbo].[Cubiertas] OFF
SET IDENTITY_INSERT [dbo].[Forma_pago] ON 

INSERT [dbo].[Forma_pago] ([id_forma_pago], [nombre]) VALUES (1, N'Efectivo')
INSERT [dbo].[Forma_pago] ([id_forma_pago], [nombre]) VALUES (2, N'Credito')
INSERT [dbo].[Forma_pago] ([id_forma_pago], [nombre]) VALUES (3, N'Debito')
INSERT [dbo].[Forma_pago] ([id_forma_pago], [nombre]) VALUES (4, N'Tarjeta')
SET IDENTITY_INSERT [dbo].[Forma_pago] OFF
SET IDENTITY_INSERT [dbo].[Itinerarios] ON 

INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (1, N'Europa', N'fsdfs', 0)
INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (4, N'Brasil', N'ifjsdñf', 0)
INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (5, N'Bahamas', N'pdfsjfdj', 0)
INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (6, N'America Del Norte', N'dsjdsj', 0)
INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (7, N'Hawaii', N'ifjdsoi', 0)
INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (8, N'Guyanas', N'ñpoj{oi', 0)
INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (9, N'Inglaterra', N'ojoi', 0)
INSERT [dbo].[Itinerarios] ([cod_itinerario], [descripcion], [categoria], [borrado]) VALUES (10, N'Dubai', N'okknc', 0)
SET IDENTITY_INSERT [dbo].[Itinerarios] OFF
SET IDENTITY_INSERT [dbo].[Navios] ON 

INSERT [dbo].[Navios] ([cod_navio], [nombre_navio], [altura], [autonomia], [desplazamiento], [eslora], [manga], [cant_max_pasaj], [cant_tripulantes], [cant_motores], [tipo_clasif], [borrado]) VALUES (1, N'Esperanza', 345, N'dasdas', N'sadasd', 35, 54, 234, 50, 3, 1, 0)
INSERT [dbo].[Navios] ([cod_navio], [nombre_navio], [altura], [autonomia], [desplazamiento], [eslora], [manga], [cant_max_pasaj], [cant_tripulantes], [cant_motores], [tipo_clasif], [borrado]) VALUES (2, N'Fragata', 234, N'pfdso', N'PODSIF', 95, 75, 783, 64, 5, 3, 0)
INSERT [dbo].[Navios] ([cod_navio], [nombre_navio], [altura], [autonomia], [desplazamiento], [eslora], [manga], [cant_max_pasaj], [cant_tripulantes], [cant_motores], [tipo_clasif], [borrado]) VALUES (3, N'Champagne Supernova', 263, N'fdñskjf', N'ñohfds', 53, 23, 200, 32, 3, 4, 0)
INSERT [dbo].[Navios] ([cod_navio], [nombre_navio], [altura], [autonomia], [desplazamiento], [eslora], [manga], [cant_max_pasaj], [cant_tripulantes], [cant_motores], [tipo_clasif], [borrado]) VALUES (4, N'Oasis', 523, N'fsdfs', N'sofdjfj', 75, 947, 643, 324, 2, 2, 0)
SET IDENTITY_INSERT [dbo].[Navios] OFF
INSERT [dbo].[Pago] ([id_pago], [id_forma_pago], [total]) VALUES (1, 1, 2432)
INSERT [dbo].[Pasaje_Camarote] ([id_pago], [cod_navio], [fecha_viaje], [num_camarote], [num_cubierta], [tipo_doc], [nro_doc], [precio], [borrado], [fecha_venta]) VALUES (1, 2, CAST(N'2013-04-23' AS Date), 7, 2, N'DU', 38330740, 2432, 0, CAST(N'2001-10-30' AS Date))
INSERT [dbo].[Pasajeros] ([tipo_doc], [nro_doc], [nombre], [ciudad_proc], [pais_proc], [borrado]) VALUES (N'DNI', 38330739, N'Marianella', N'Praga', N'Rep. Checa', 0)
INSERT [dbo].[Pasajeros] ([tipo_doc], [nro_doc], [nombre], [ciudad_proc], [pais_proc], [borrado]) VALUES (N'DNI', 45789322, N'Erika', N'Barcelona', N'España', 0)
INSERT [dbo].[Pasajeros] ([tipo_doc], [nro_doc], [nombre], [ciudad_proc], [pais_proc], [borrado]) VALUES (N'DU', 38330740, N'Alexis', N'Londres', N'Inglaterra', 0)
INSERT [dbo].[Pasajeros] ([tipo_doc], [nro_doc], [nombre], [ciudad_proc], [pais_proc], [borrado]) VALUES (N'DU', 39283742, N'Analia', N'Londres', N'Inglaterra', 0)
INSERT [dbo].[Pasajeros] ([tipo_doc], [nro_doc], [nombre], [ciudad_proc], [pais_proc], [borrado]) VALUES (N'Pasaporte', 11345623, N'Graciela', N'Paris', N'Francia', 0)
INSERT [dbo].[Pasajeros] ([tipo_doc], [nro_doc], [nombre], [ciudad_proc], [pais_proc], [borrado]) VALUES (N'Pasaporte', 40563452, N'Mariano', N'Marsella', N'Francia', 0)
SET IDENTITY_INSERT [dbo].[Puerto] ON 

INSERT [dbo].[Puerto] ([cod_puerto], [nombre], [borrado]) VALUES (1, N'Principe', 0)
INSERT [dbo].[Puerto] ([cod_puerto], [nombre], [borrado]) VALUES (2, N'Palos', 0)
INSERT [dbo].[Puerto] ([cod_puerto], [nombre], [borrado]) VALUES (3, N'Valparaiso', 0)
INSERT [dbo].[Puerto] ([cod_puerto], [nombre], [borrado]) VALUES (4, N'Piramide', 0)
SET IDENTITY_INSERT [dbo].[Puerto] OFF
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (1, 1, 4, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (1, 2, 2, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (1, 3, 1, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (4, 1, 1, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (4, 2, 3, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (4, 3, 4, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (5, 1, 1, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (5, 2, 2, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (5, 3, 4, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (5, 4, 3, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (6, 1, 2, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (6, 2, 1, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (6, 3, 3, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (7, 1, 1, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (7, 2, 4, 0)
INSERT [dbo].[Puerto_Itinerario] ([cod_itinerario], [num_escala], [cod_puerto], [borrado]) VALUES (7, 3, 3, 0)
SET IDENTITY_INSERT [dbo].[Puestos] ON 

INSERT [dbo].[Puestos] ([cod_puesto], [descripcion], [borrado]) VALUES (1, N'Gerente', 0)
INSERT [dbo].[Puestos] ([cod_puesto], [descripcion], [borrado]) VALUES (2, N'Capitan', 0)
INSERT [dbo].[Puestos] ([cod_puesto], [descripcion], [borrado]) VALUES (3, N'Marinero', 0)
INSERT [dbo].[Puestos] ([cod_puesto], [descripcion], [borrado]) VALUES (4, N'Limpieza', 0)
INSERT [dbo].[Puestos] ([cod_puesto], [descripcion], [borrado]) VALUES (5, N'Catering', 0)
INSERT [dbo].[Puestos] ([cod_puesto], [descripcion], [borrado]) VALUES (8, N'Mantenimiento', 0)
INSERT [dbo].[Puestos] ([cod_puesto], [descripcion], [borrado]) VALUES (9, N'Encargado', 0)
SET IDENTITY_INSERT [dbo].[Puestos] OFF
SET IDENTITY_INSERT [dbo].[Tipo_Camarote] ON 

INSERT [dbo].[Tipo_Camarote] ([tipo], [nombre], [borrado]) VALUES (2, N'Presidencial', 0)
INSERT [dbo].[Tipo_Camarote] ([tipo], [nombre], [borrado]) VALUES (3, N'Lujoso', 0)
INSERT [dbo].[Tipo_Camarote] ([tipo], [nombre], [borrado]) VALUES (4, N'Hig Fire', 0)
INSERT [dbo].[Tipo_Camarote] ([tipo], [nombre], [borrado]) VALUES (5, N'Intermedio', 0)
INSERT [dbo].[Tipo_Camarote] ([tipo], [nombre], [borrado]) VALUES (6, N'Economico', 0)
SET IDENTITY_INSERT [dbo].[Tipo_Camarote] OFF
SET IDENTITY_INSERT [dbo].[Tripulaciones] ON 

INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (1, N'Gaston', NULL, 1, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (2, N'Alfredo', 1, 2, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (3, N'Walter', 1, 2, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (4, N'Sofia', 2, 9, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (5, N'Marlene', 2, 9, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (6, N'Sebastian', 3, 4, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (7, N'Pablo', 3, 5, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (8, N'Jesi', 6, 2, 0)
INSERT [dbo].[Tripulaciones] ([legajo], [nombre], [legajo_jefe], [cod_puesto], [borrado]) VALUES (9, N'Fran', 2, 9, 0)
SET IDENTITY_INSERT [dbo].[Tripulaciones] OFF
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (1, 1, CAST(N'2016-05-17' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (2, 1, CAST(N'2016-05-17' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (3, 3, CAST(N'2010-10-28' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (4, 2, CAST(N'2013-04-23' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (4, 3, CAST(N'2009-09-09' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (5, 2, CAST(N'2014-03-24' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (5, 2, CAST(N'2015-12-24' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (9, 1, CAST(N'2016-08-25' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (9, 4, CAST(N'2004-04-04' AS Date), 0)
INSERT [dbo].[Tripulante_Viaje] ([legajo], [cod_navio], [fecha_viaje], [borrado]) VALUES (9, 4, CAST(N'2017-07-09' AS Date), 0)
INSERT [dbo].[Users] ([n_usuario], [password]) VALUES (N'admin', N'1234')
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (1, CAST(N'2016-01-02' AS Date), N'3 semanas', 7, 6534, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (1, CAST(N'2016-05-17' AS Date), N'2 meses', 1, 2345, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (1, CAST(N'2016-08-25' AS Date), N'4 meses', 4, 423, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (2, CAST(N'2013-04-23' AS Date), N'3 meses', 6, 2432, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (2, CAST(N'2014-03-24' AS Date), N'2 meses', 1, 2231, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (2, CAST(N'2015-12-24' AS Date), N'5 semanas', 5, 985, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (3, CAST(N'2009-09-09' AS Date), N'3 semanas', 7, 7364, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (3, CAST(N'2010-10-28' AS Date), N'4 meses', 4, 423, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (4, CAST(N'2004-04-04' AS Date), N'3 meses', 6, 3211, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (4, CAST(N'2015-06-10' AS Date), N'3 semanas', 7, 78549, 0)
INSERT [dbo].[Viajes] ([cod_navio], [fecha_viaje], [duracion], [cod_itinerario], [precio], [borrado]) VALUES (4, CAST(N'2017-07-09' AS Date), N'5 semanas', 5, 3432, 0)
ALTER TABLE [dbo].[Camarotes]  WITH CHECK ADD  CONSTRAINT [fk_camarote_cubierta] FOREIGN KEY([cod_navio], [num_cubierta])
REFERENCES [dbo].[Cubiertas] ([cod_navio], [num_cubierta])
GO
ALTER TABLE [dbo].[Camarotes] CHECK CONSTRAINT [fk_camarote_cubierta]
GO
ALTER TABLE [dbo].[Camarotes]  WITH CHECK ADD  CONSTRAINT [fk_camarote_tipo] FOREIGN KEY([tipo])
REFERENCES [dbo].[Tipo_Camarote] ([tipo])
GO
ALTER TABLE [dbo].[Camarotes] CHECK CONSTRAINT [fk_camarote_tipo]
GO
ALTER TABLE [dbo].[Cubiertas]  WITH CHECK ADD  CONSTRAINT [fk_cubierta_navio] FOREIGN KEY([cod_navio])
REFERENCES [dbo].[Navios] ([cod_navio])
GO
ALTER TABLE [dbo].[Cubiertas] CHECK CONSTRAINT [fk_cubierta_navio]
GO
ALTER TABLE [dbo].[Cubiertas]  WITH CHECK ADD  CONSTRAINT [fk_cubiertas_encargado] FOREIGN KEY([leg_encargado])
REFERENCES [dbo].[Tripulaciones] ([legajo])
GO
ALTER TABLE [dbo].[Cubiertas] CHECK CONSTRAINT [fk_cubiertas_encargado]
GO
ALTER TABLE [dbo].[Navios]  WITH CHECK ADD  CONSTRAINT [fk_clasificacion_navio] FOREIGN KEY([tipo_clasif])
REFERENCES [dbo].[Clasificacion_Navio] ([cod_clasif])
GO
ALTER TABLE [dbo].[Navios] CHECK CONSTRAINT [fk_clasificacion_navio]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [fk_pago_forma] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[Forma_pago] ([id_forma_pago])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [fk_pago_forma]
GO
ALTER TABLE [dbo].[Pasaje_Camarote]  WITH CHECK ADD  CONSTRAINT [fk_pasaje_camarote] FOREIGN KEY([cod_navio], [num_cubierta], [num_camarote])
REFERENCES [dbo].[Camarotes] ([cod_navio], [num_cubierta], [num_camarote])
GO
ALTER TABLE [dbo].[Pasaje_Camarote] CHECK CONSTRAINT [fk_pasaje_camarote]
GO
ALTER TABLE [dbo].[Pasaje_Camarote]  WITH CHECK ADD  CONSTRAINT [fk_pasaje_camarote_cubierta] FOREIGN KEY([cod_navio], [num_cubierta])
REFERENCES [dbo].[Cubiertas] ([cod_navio], [num_cubierta])
GO
ALTER TABLE [dbo].[Pasaje_Camarote] CHECK CONSTRAINT [fk_pasaje_camarote_cubierta]
GO
ALTER TABLE [dbo].[Pasaje_Camarote]  WITH CHECK ADD  CONSTRAINT [fk_pasaje_camarote_pago] FOREIGN KEY([id_pago])
REFERENCES [dbo].[Pago] ([id_pago])
GO
ALTER TABLE [dbo].[Pasaje_Camarote] CHECK CONSTRAINT [fk_pasaje_camarote_pago]
GO
ALTER TABLE [dbo].[Pasaje_Camarote]  WITH CHECK ADD  CONSTRAINT [fk_pasaje_camarote_pasajeros] FOREIGN KEY([tipo_doc], [nro_doc])
REFERENCES [dbo].[Pasajeros] ([tipo_doc], [nro_doc])
GO
ALTER TABLE [dbo].[Pasaje_Camarote] CHECK CONSTRAINT [fk_pasaje_camarote_pasajeros]
GO
ALTER TABLE [dbo].[Puerto_Itinerario]  WITH CHECK ADD  CONSTRAINT [fk_itinerario] FOREIGN KEY([cod_itinerario])
REFERENCES [dbo].[Itinerarios] ([cod_itinerario])
GO
ALTER TABLE [dbo].[Puerto_Itinerario] CHECK CONSTRAINT [fk_itinerario]
GO
ALTER TABLE [dbo].[Puerto_Itinerario]  WITH CHECK ADD  CONSTRAINT [fk_puerto] FOREIGN KEY([cod_puerto])
REFERENCES [dbo].[Puerto] ([cod_puerto])
GO
ALTER TABLE [dbo].[Puerto_Itinerario] CHECK CONSTRAINT [fk_puerto]
GO
ALTER TABLE [dbo].[Tripulaciones]  WITH CHECK ADD  CONSTRAINT [fk_legajo_jefe] FOREIGN KEY([legajo_jefe])
REFERENCES [dbo].[Tripulaciones] ([legajo])
GO
ALTER TABLE [dbo].[Tripulaciones] CHECK CONSTRAINT [fk_legajo_jefe]
GO
ALTER TABLE [dbo].[Tripulaciones]  WITH CHECK ADD  CONSTRAINT [fk_puesto] FOREIGN KEY([cod_puesto])
REFERENCES [dbo].[Puestos] ([cod_puesto])
GO
ALTER TABLE [dbo].[Tripulaciones] CHECK CONSTRAINT [fk_puesto]
GO
ALTER TABLE [dbo].[Tripulante_Viaje]  WITH CHECK ADD  CONSTRAINT [fk_legajo_tripulante_viaje] FOREIGN KEY([legajo])
REFERENCES [dbo].[Tripulaciones] ([legajo])
GO
ALTER TABLE [dbo].[Tripulante_Viaje] CHECK CONSTRAINT [fk_legajo_tripulante_viaje]
GO
ALTER TABLE [dbo].[Tripulante_Viaje]  WITH CHECK ADD  CONSTRAINT [fk_viaje_tripulante] FOREIGN KEY([cod_navio], [fecha_viaje])
REFERENCES [dbo].[Viajes] ([cod_navio], [fecha_viaje])
GO
ALTER TABLE [dbo].[Tripulante_Viaje] CHECK CONSTRAINT [fk_viaje_tripulante]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [fk_viajes] FOREIGN KEY([cod_itinerario])
REFERENCES [dbo].[Itinerarios] ([cod_itinerario])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [fk_viajes]
GO
/****** Object:  StoredProcedure [dbo].[DestinosMasViajes]    Script Date: 09/11/2017 09:24:48 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DestinosMasViajes]
as
SELECT I.descripcion, count(*) as 'Viajes'
FROM Viajes V JOIN Itinerarios I on V.cod_itinerario = I.cod_itinerario
WHERE V.borrado = 0 AND I.borrado = 0
GROUP BY I.descripcion
ORDER BY I.descripcion 

GO
USE [master]
GO
ALTER DATABASE [Sea Star] SET  READ_WRITE 
GO
