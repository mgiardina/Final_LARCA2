USE [master]
GO
/****** Object:  Database [Larca2]    Script Date: 10.06.2016 03:53:13 p.m. ******/
CREATE DATABASE [Larca2] ON  PRIMARY 
( NAME = N'Larca2', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Larca2.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Larca2_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Larca2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Larca2] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Larca2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Larca2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Larca2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Larca2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Larca2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Larca2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Larca2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Larca2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Larca2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Larca2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Larca2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Larca2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Larca2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Larca2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Larca2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Larca2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Larca2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Larca2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Larca2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Larca2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Larca2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Larca2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Larca2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Larca2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Larca2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Larca2] SET  MULTI_USER 
GO
ALTER DATABASE [Larca2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Larca2] SET DB_CHAINING OFF 
GO
USE [Larca2]
GO
/****** Object:  User [LARCA2]    Script Date: 10.06.2016 03:53:27 p.m. ******/
CREATE USER [LARCA2] FOR LOGIN [LARCA2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[LARCA20_AuxData]    Script Date: 10.06.2016 03:53:37 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_AuxData](
	[RowId] [bigint] IDENTITY(1,1) NOT NULL,
	[TopLvl2] [int] NOT NULL,
	[TopLvl3] [int] NOT NULL,
	[XlsRowFrom] [int] NOT NULL,
	[XlsColumnFrom] [int] NOT NULL,
	[LimiteFiltro] [int] NULL,
 CONSTRAINT [PK_LARCA20_AuxData] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Emails]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_Emails](
	[EmailID] [bigint] IDENTITY(1,1) NOT NULL,
	[TipoProceso] [int] NOT NULL,
	[MessageID] [nvarchar](max) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Archivo] [nvarchar](max) NOT NULL,
	[Procesado] [bit] NOT NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_Emails] PRIMARY KEY CLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_ImputOriginal]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_ImputOriginal](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Day] [nvarchar](5) NULL,
	[FPC] [nvarchar](100) NULL,
	[RepCountry] [nvarchar](100) NULL,
	[ProfitCenter] [nvarchar](100) NULL,
	[ReasonCode] [nvarchar](100) NULL,
	[CFR] [nvarchar](100) NULL,
	[SapSite] [nvarchar](100) NULL,
	[Customer] [nvarchar](100) NULL,
	[SU_Cases] [decimal](12, 2) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_ImputOriginal] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Level4]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_Level4](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[RefIdLevel3] [bigint] NULL,
	[Borrado] [bit] NULL,
 CONSTRAINT [PK_LARCA20_Level4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Mailing]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_Mailing](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Data] [nvarchar](5) NULL,
	[Email] [nvarchar](100) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_Mailing] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_MasterData]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_MasterData](
	[IdRenglon] [bigint] IDENTITY(1,1) NOT NULL,
	[Data] [nvarchar](10) NULL,
	[DataIni] [nvarchar](100) NULL,
	[DataFin] [nvarchar](50) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_MasterData] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_MasterDataSMOLess]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_MasterDataSMOLess](
	[dRenglon] [int] IDENTITY(1,1) NOT NULL,
	[RefIdMasterDataSMO] [int] NULL,
	[borrado] [bit] NULL,
 CONSTRAINT [PK_LARCA20_MasterDataSMOLess] PRIMARY KEY CLUSTERED 
(
	[dRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_RcClasification]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_RcClasification](
	[IdRenglon] [bigint] IDENTITY(1,1) NOT NULL,
	[Nivel] [nvarchar](10) NULL,
	[Codigo] [nvarchar](10) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Ownership] [nvarchar](5) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_RcClasification] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Recursos]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_Recursos](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_Recursos] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Responsable]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_Responsable](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[RefIdUsuario] [int] NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_Responsable] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Roles]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_Roles](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_Roles] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_RolesRecursos]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LARCA20_RolesRecursos](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[RefIdRoles] [int] NOT NULL,
	[RefIdRecursos] [int] NOT NULL,
	[Select] [char](1) NULL,
	[Insert] [char](1) NULL,
	[Update] [char](1) NULL,
	[Delete] [char](1) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_RolesRecursos] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LARCA20_SmoScope]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LARCA20_SmoScope](
	[SmoScopeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[RefIdSMO] [bigint] NULL,
	[RefIdBU] [bigint] NULL,
	[RefIdOwner] [bigint] NULL,
	[RefIdRC] [bigint] NULL,
	[Volumen] [decimal](20, 15) NULL,
	[Problem] [nvarchar](100) NULL,
	[Why1] [nvarchar](100) NULL,
	[Why2] [nvarchar](100) NULL,
	[Why3] [nvarchar](100) NULL,
	[ActionPlan] [nvarchar](100) NULL,
	[RefIdResponsable] [int] NULL,
	[DueDate] [datetime] NULL,
	[O_C] [char](1) NULL,
	[Borrado] [bit] NOT NULL,
	[Level4] [bigint] NULL,
 CONSTRAINT [PK_SmoScope] PRIMARY KEY CLUSTERED 
(
	[SmoScopeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LARCA20_SmoScopeDetail]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_SmoScopeDetail](
	[DetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[SmoScopeID] [bigint] NULL,
	[Fecha] [datetime] NULL,
	[SmoID] [bigint] NULL,
	[BuID] [bigint] NULL,
	[OwnerID] [bigint] NULL,
	[Lvl2ID] [bigint] NULL,
	[Lvl3ID] [bigint] NULL,
	[Volumen] [decimal](20, 15) NOT NULL,
	[ReasonID] [bigint] NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_SmoScopeDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_SmoScopeGroup]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_SmoScopeGroup](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[RefIdFrom] [int] NULL,
	[RefIdTo] [int] NULL,
	[Fecha] [smalldatetime] NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_SmoScopeGroup] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_User_Owner]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_User_Owner](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdOwner] [bigint] NULL,
	[IdSmo] [bigint] NULL,
	[IdBU] [bigint] NULL,
	[Borrado] [bit] NULL,
 CONSTRAINT [PK_LARCA20_User_Owner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Usuarios]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_Usuarios](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NOT NULL,
	[Clave] [nvarchar](50) NULL,
	[Fecha] [smalldatetime] NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_UsuariosRoles]    Script Date: 10.06.2016 03:53:38 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_UsuariosRoles](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[RefIdUsuario] [int] NOT NULL,
	[RefIdRoles] [int] NOT NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_UsuariosRoles] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[LARCA20_ImputOriginal] ADD  CONSTRAINT [DF_LARCA20_ImputOriginal_borrado]  DEFAULT ('N') FOR [Borrado]
GO
ALTER TABLE [dbo].[LARCA20_Mailing] ADD  CONSTRAINT [DF_LARCA20_Mailing_borrado]  DEFAULT ('N') FOR [Borrado]
GO
ALTER TABLE [dbo].[LARCA20_Recursos] ADD  CONSTRAINT [DF_LARCA20_Recursos_borrado]  DEFAULT ('N') FOR [Borrado]
GO
ALTER TABLE [dbo].[LARCA20_Roles] ADD  CONSTRAINT [DF_LARCA20_Roles_borrado]  DEFAULT ('N') FOR [Borrado]
GO
ALTER TABLE [dbo].[LARCA20_RolesRecursos] ADD  CONSTRAINT [DF_LARCA20_RolesRecursos_borrado]  DEFAULT ('N') FOR [Borrado]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeGroup] ADD  CONSTRAINT [DF_LARCA20_SmoScopeGroup_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeGroup] ADD  CONSTRAINT [DF_LARCA20_SmoScopeGroup_Borrado]  DEFAULT ('N') FOR [Borrado]
GO
ALTER TABLE [dbo].[LARCA20_UsuariosRoles] ADD  CONSTRAINT [DF_LARCA20_UsuariosRoles_borrado]  DEFAULT ('N') FOR [Borrado]
GO
ALTER TABLE [dbo].[LARCA20_Level4]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_Level4_LARCA20_RcClasification] FOREIGN KEY([RefIdLevel3])
REFERENCES [dbo].[LARCA20_RcClasification] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_Level4] CHECK CONSTRAINT [FK_LARCA20_Level4_LARCA20_RcClasification]
GO
ALTER TABLE [dbo].[LARCA20_RolesRecursos]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Recursos] FOREIGN KEY([RefIdRecursos])
REFERENCES [dbo].[LARCA20_Recursos] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_RolesRecursos] CHECK CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Recursos]
GO
ALTER TABLE [dbo].[LARCA20_RolesRecursos]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Roles] FOREIGN KEY([RefIdRoles])
REFERENCES [dbo].[LARCA20_Roles] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_RolesRecursos] CHECK CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Roles]
GO
ALTER TABLE [dbo].[LARCA20_SmoScope]  WITH CHECK ADD  CONSTRAINT [MasterBU] FOREIGN KEY([RefIdBU])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScope] CHECK CONSTRAINT [MasterBU]
GO
ALTER TABLE [dbo].[LARCA20_SmoScope]  WITH CHECK ADD  CONSTRAINT [MasterLvl] FOREIGN KEY([RefIdRC])
REFERENCES [dbo].[LARCA20_RcClasification] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScope] CHECK CONSTRAINT [MasterLvl]
GO
ALTER TABLE [dbo].[LARCA20_SmoScope]  WITH CHECK ADD  CONSTRAINT [MasterOwner] FOREIGN KEY([RefIdOwner])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScope] CHECK CONSTRAINT [MasterOwner]
GO
ALTER TABLE [dbo].[LARCA20_SmoScope]  WITH CHECK ADD  CONSTRAINT [MasterSMO] FOREIGN KEY([RefIdSMO])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScope] CHECK CONSTRAINT [MasterSMO]
GO
ALTER TABLE [dbo].[LARCA20_SmoScope]  WITH CHECK ADD  CONSTRAINT [ResponsableSmo] FOREIGN KEY([RefIdResponsable])
REFERENCES [dbo].[LARCA20_Responsable] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScope] CHECK CONSTRAINT [ResponsableSmo]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail]  WITH CHECK ADD  CONSTRAINT [MasterBUDetail] FOREIGN KEY([BuID])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail] CHECK CONSTRAINT [MasterBUDetail]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail]  WITH CHECK ADD  CONSTRAINT [MasterLvl2Detail] FOREIGN KEY([Lvl2ID])
REFERENCES [dbo].[LARCA20_RcClasification] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail] CHECK CONSTRAINT [MasterLvl2Detail]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail]  WITH CHECK ADD  CONSTRAINT [MasterLvl3Detail] FOREIGN KEY([Lvl3ID])
REFERENCES [dbo].[LARCA20_RcClasification] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail] CHECK CONSTRAINT [MasterLvl3Detail]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail]  WITH CHECK ADD  CONSTRAINT [MasterOwnerDetail] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail] CHECK CONSTRAINT [MasterOwnerDetail]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail]  WITH CHECK ADD  CONSTRAINT [MasterReasonDetail] FOREIGN KEY([ReasonID])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail] CHECK CONSTRAINT [MasterReasonDetail]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail]  WITH CHECK ADD  CONSTRAINT [MasterSMODetail] FOREIGN KEY([SmoID])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail] CHECK CONSTRAINT [MasterSMODetail]
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail]  WITH CHECK ADD  CONSTRAINT [SmoScopeDetail] FOREIGN KEY([SmoScopeID])
REFERENCES [dbo].[LARCA20_SmoScope] ([SmoScopeID])
GO
ALTER TABLE [dbo].[LARCA20_SmoScopeDetail] CHECK CONSTRAINT [SmoScopeDetail]
GO
ALTER TABLE [dbo].[LARCA20_User_Owner]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_MasterData] FOREIGN KEY([IdOwner])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_User_Owner] CHECK CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_MasterData]
GO
ALTER TABLE [dbo].[LARCA20_User_Owner]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_MasterData1] FOREIGN KEY([IdSmo])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_User_Owner] CHECK CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_MasterData1]
GO
ALTER TABLE [dbo].[LARCA20_User_Owner]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_User_Owner] FOREIGN KEY([IdBU])
REFERENCES [dbo].[LARCA20_MasterData] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_User_Owner] CHECK CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_User_Owner]
GO
ALTER TABLE [dbo].[LARCA20_User_Owner]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[LARCA20_Usuarios] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_User_Owner] CHECK CONSTRAINT [FK_LARCA20_User_Owner_LARCA20_Usuarios]
GO
ALTER TABLE [dbo].[LARCA20_UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Roles] FOREIGN KEY([RefIdRoles])
REFERENCES [dbo].[LARCA20_Roles] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_UsuariosRoles] CHECK CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Roles]
GO
ALTER TABLE [dbo].[LARCA20_UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Usuarios] FOREIGN KEY([RefIdUsuario])
REFERENCES [dbo].[LARCA20_Usuarios] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_UsuariosRoles] CHECK CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Usuarios]
GO
USE [master]
GO
ALTER DATABASE [Larca2] SET  READ_WRITE 
GO
