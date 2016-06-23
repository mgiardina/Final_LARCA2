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
/****** Object:  Table [dbo].[LARCA20_AuxData]    Script Date: 01/06/2016 11:37:25 ******/
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
 CONSTRAINT [PK_LARCA20_AuxData] PRIMARY KEY CLUSTERED 
(
	[RowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LARCA20_Emails]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_ImputOriginal]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_Level4]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_Mailing]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_MasterData]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_MasterDataSMOLess]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_RcClasification]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_Recursos]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_Responsable]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_Roles]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_RolesRecursos]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_SmoScope]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_SmoScopeDetail]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_SmoScopeGroup]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_User_Owner]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_Usuarios]    Script Date: 01/06/2016 11:37:25 ******/
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
/****** Object:  Table [dbo].[LARCA20_UsuariosRoles]    Script Date: 01/06/2016 11:37:25 ******/
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
SET IDENTITY_INSERT [dbo].[LARCA20_AuxData] ON 

GO
INSERT [dbo].[LARCA20_AuxData] ([RowId], [TopLvl2], [TopLvl3], [XlsRowFrom], [XlsColumnFrom]) VALUES (1, 5, 5, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_AuxData] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Emails] ON 

GO
INSERT [dbo].[LARCA20_Emails] ([EmailID], [TipoProceso], [MessageID], [Fecha], [Archivo], [Procesado], [Borrado]) VALUES (6, 1, N'CALjZ=AsrB2AGkX5FqXoirnuUndpnNRYuzV8b7thLsOh10gK-KQ@mail.gmail.com', CAST(0x0000A60801565B5C AS DateTime), N'16May2016_MasterData_291.xlsx', 1, 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Emails] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_MasterData] ON 

GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (1, N'BU', N'AP/DO & Body Spray [1102244228]', N'APDO', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (2, N'BU', N'Air Care [1000045986]', N'HOME', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (3, N'BU', N'Baby Wipes [1000045671]', N'BABY', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (4, N'BU', N'Diapers [1000043704]', N'BABY', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (5, N'BU', N'Dish Care [1000013884]', N'HOME', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (6, N'BU', N'Fabric Enhancers [1000013893]', N'FABRIC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (7, N'BU', N'Fem Premium BladeRazor System [1105058174]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (8, N'BU', N'Female Disposable Razor [1105055075]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (9, N'BU', N'Female Hair Care [1000114070]', N'HAIR', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (10, N'BU', N'Female Hair Color Wella [1105048683]', N'HAIR COLOR', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (11, N'BU', N'Female Hair Color [1105050832]', N'HAIR COLOR', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (12, N'BU', N'Female Shave Prep [1105054423]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (13, N'BU', N'Female Skin Care [1105057940]', N'SKIN', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (14, N'BU', N'Feminine Care [1100452728]', N'FEM', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (15, N'BU', N'Laundry [1000013883]', N'FABRIC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (16, N'BU', N'Laxative [1107748156]', N'PHC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (17, N'BU', N'Male Disposable Razor [1105135462]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (18, N'BU', N'Male Fragrance [1105130046]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (19, N'BU', N'Male OthSys/DblEdge BladeRazor [1105134988]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (20, N'BU', N'Male Premium BladeRazor System [1105054374]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (21, N'BU', N'Male Shave Prep [1105054527]', N'SHAVE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (22, N'BU', N'Misc Personal Health Care JV [1107692949]', N'PHC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (23, N'BU', N'Oral Care [1000013890]', N'ORAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (24, N'BU', N'Personal Cleansing [1105054352]', N'PCC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (25, N'BU', N'Personal Tissue [1000243535]', N'FAMILY', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (26, N'BU', N'Primary Major Cells [1103196437]', N'POWER', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (27, N'BU', N'Professional Hair Products [1101392477]', N'SALON', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (28, N'BU', N'Rapid Diagnostics [1102779962]', N'PHC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (29, N'BU', N'Respiratory Care [1000013885]', N'PHC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (30, N'BU', N'Stomach Remedy [1000013894]', N'PHC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (31, N'BU', N'Toilet Tissue [1000243536]', N'FAMILY', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (32, N'BU', N'Towels/Napkins [1000243534]', N'FAMILY', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (33, N'BU', N'Laundry Additives [1000020612]', N'FABRIC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (34, N'BU', N'Surface Care [1000020610]', N'HOME', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (35, N'BU', N'Male Skin Care [1105129464]', N'SKIN', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (36, N'BU', N'Mass Fragrance [1107748059]', N'OTHER', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (37, N'BU', N'Professional Other Products [1101410373]', N'SALON', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (38, N'BU', N'Female Hair Care Wella [1100917946]', N'HAIR', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (39, N'BU', N'Misc Fabric Care [1000202983]', N'FABRIC', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (40, N'BU', N'Specialty Batteries [1108249573]', N'POWER', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (41, N'BU', N'Dental Floss [1108830841]', N'ORAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (42, N'BU', N'Dentifrice [1000013890]', N'ORAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (43, N'BU', N'Manual Oral Care [1108830769]', N'ORAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (44, N'BU', N'Oral Rinse [1108830763]', N'ORAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (45, N'BU', N'Whitening/Sensitivity [1108831139]', N'ORAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (46, N'BU', N'Power Oral Care [1101707400]', N'ORAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (47, N'SMO', N'PERU', N'PERU', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (48, N'SMO', N'ARGENTINA', N'ARGENTINA', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (49, N'SMO', N'BRAZIL', N'BRAZIL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (50, N'SMO', N'MEXICO', N'MEXICO', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (51, N'SMO', N'VENEZUELA', N'VENEZUELA', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (52, N'SMO', N'LADMAR CA & DO', N'LADMAR', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (53, N'SMO', N'COLOMBIA', N'COLOMBIA', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (54, N'SMO', N'CHILE', N'CHILE', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (55, N'SMO', N'LADMAR SOUTH AM', N'LADMAR', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (56, N'SMO', N'LADMAR CARIBBEAN', N'LADMAR', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (57, N'OWNER', N'DRP', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (58, N'OWNER', N'MAL', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (59, N'OWNER', N'TOTAL', N'TOTAL', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (60, N'REASON', N'L6_02 Material not listed or exclude', N'L6_02', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (61, N'REASON', N'L6_35 WH Loading error', N'L6_35', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (62, N'REASON', N'L6_R5 Cuts due to Avail (LEO)-PG-CFR', N'L6_R5', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (63, N'REASON', N'L6_01 Allot-lack of remain quantity', N'L6_01', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (64, N'REASON', N'L6_58 CustOrder Encoding Error', N'L6_58', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (65, N'REASON', N'L6_05 P&G initiated quantity change', N'L6_05', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (66, N'REASON', N'L6_07P Availabil. problems at deliver', N'L6_07P', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (67, N'REASON', N'L6_11 Billed but prod not delivered', N'L6_11', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (68, N'REASON', N'L6_45 Error during production estima', N'L6_45', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (69, N'REASON', N'L6_49 Rej-Carrier caused prod dama', N'L6_49', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (70, N'REASON', N'L6_08 Lack of prod at pick/plan', N'L6_08', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (71, N'REASON', N'L6_68 Availab.probl - quality issues', N'L6_68', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (72, N'REASON', N'L6_07M Availabil. problems at deliver', N'L6_07M', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (73, N'REASON', N'L6_10 Rej - quality problems', N'L6_10', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (74, N'REASON', N'L6_61 Missing ProdUnits in ShipCases', N'L6_61', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (75, N'REASON', N'L6_48 CBD OE/M Error', N'L6_48', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (76, N'REASON', N'L6_12 Rej-wrong prod/qty delivered', N'L6_12', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (77, N'REASON', N'L6_51 Rej - bar coding error', N'L6_51', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (78, N'REASON', N'L6_34 Truck capacity - Cust transpor', N'L6_34', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (81, N'OWNER', N'NA', N'NA', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (82, N'REASON', N'L6_33 Truck capacity - P&G transport', N'L6_33', 0)
GO
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (83, N'BU', N'Denture Care [1108830786]', N'ORAL', 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_MasterData] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_RcClasification] ON 

GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (1, N'1', N'1', N'1 Supply Issues', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (2, N'1', N'2', N'2 Business Planning Issues', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (3, N'1', N'3', N'3 Commercial Execution Issue', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (4, N'1', N'7', N'7 Not Analyzed', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (5, N'2', N'1.1', N'1.1 Master Data', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (6, N'2', N'1.2', N'1.2 Supply Planning Execution', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (7, N'2', N'1.3', N'1.3 Quality/Regulatory', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (8, N'2', N'1.4', N'1.4 Material Supply', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (9, N'2', N'1.5', N'1.5 Manufacturing Execution', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (10, N'2', N'1.6', N'1.6 Transport & Warehousing', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (11, N'2', N'1.7', N'1.7 Order Management', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (12, N'2', N'1.8', N'1.8 Other', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (13, N'2', N'1.9', N'1.9 Suppressed Demand-Sup Iss', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (14, N'2', N'1.10', N'1.10 Information /Tech Tools', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (15, N'2', N'2.1', N'2.1 Demand Planning', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (16, N'2', N'2.2', N'2.2 Initiatives Readiness', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (17, N'2', N'2.3', N'2.3 Capacity to Demand Strateg', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (18, N'2', N'2.4', N'2.4 Unplanned or Off-strategy', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (19, N'2', N'2.5', N'2.5 Other', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (20, N'2', N'2.9', N'2.9 Suppressd Demand-Bus Pln', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (21, N'2', N'2.6', N'2.6 Automated Avail Mngmnt', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (22, N'2', N'3.1', N'3.1 Customer Operations', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (23, N'2', N'3.2', N'3.2 Mkt/customer forcast input', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (24, N'2', N'3.3', N'3.3 Communication to customer', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (25, N'2', N'3.4', N'3.4 Cust order out of policy', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (26, N'2', N'3.5', N'3.5 Other', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (27, N'2', N'3.9', N'3.9 Suppressd Demand-Comm Ex', N'', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (28, N'3', N'1.1.1 ', N'1.1.1 SIP Master Data', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (29, N'3', N'1.1.2 ', N'1.1.2 Category Master Data', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (30, N'3', N'1.1.3 ', N'1.1.3 MDO Master Data-2nd lvlDC', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (31, N'3', N'1.1.4 ', N'1.1.4 Order Mngmnt Master Data', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (32, N'3', N'1.1.5 ', N'1.1.5 DRP Master Data', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (33, N'3', N'1.1.6 ', N'1.1.6 Dmnd Pln Sys Master Data', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (34, N'3', N'1.2.1 ', N'1.2.1 Excpt.Mess.not actioned ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (35, N'3', N'1.2.2 ', N'1.2.2 Excpt.Mess.not reviewed ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (36, N'3', N'1.2.3 ', N'1.2.3 SIP SWP         ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (37, N'3', N'1.2.4 ', N'1.2.4 Capacity Planning Error (CSP SWP)              ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (38, N'3', N'1.2.5 ', N'1.2.5 Safety Settng incorrect ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (39, N'3', N'1.2.6 ', N'1.2.6 Phase In/Phase Out (IOL SWP)', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (40, N'3', N'1.2.7 ', N'1.2.7 DRP SWP', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (41, N'3', N'1.2.8 ', N'1.2.8 Site Based DRP process failure ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (42, N'3', N'1.2.9 ', N'1.2.9 Global Planning SWP not followed ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (43, N'3', N'1.2.10', N'1.2.10 Manipulation Feeder Not Available', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (44, N'3', N'1.3.1 ', N'1.3.1 Supplier Quality Manage', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (45, N'3', N'1.3.2 ', N'1.3.2 Manuf Quality - Micro', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (46, N'3', N'1.3.3 ', N'1.3.3 Manuf Quality/Regulatory', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (47, N'3', N'1.3.4 ', N'1.3.4 Manipulation Quality', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (48, N'3', N'1.3.5 ', N'1.3.5 Expired Product', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (49, N'3', N'1.3.6 ', N'1.3.6 Quality Release Exec', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (50, N'3', N'1.3.7 ', N'1.3.7 Product Damage', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (51, N'3', N'1.3.8 ', N'1.3.8 FP Prod/In-prcs. mat. Reg. Req.', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (52, N'3', N'1.3.9 ', N'1.3.9 Supplier - Starting mat. Reg. Req.', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (53, N'3', N'1.3.10', N'1.3.10 Artwork Quality', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (54, N'3', N'1.4.1 ', N'1.4.1 Insuf Supplier Capacity', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (55, N'3', N'1.4.2 ', N'1.4.2 Exc. Mess. not actioned', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (56, N'3', N'1.4.3 ', N'1.4.3 MSM SWP not Followed', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (57, N'3', N'1.4.4 ', N'1.4.4 SLEAs not followed', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (58, N'3', N'1.4.5 ', N'1.4.5 Matl not ordered on time', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (59, N'3', N'1.4.6 ', N'1.4.6 Supplier Execution Mnfg', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (60, N'3', N'1.4.7 ', N'1.4.7 Natural Disaster-Supply', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (61, N'3', N'1.4.8 ', N'1.4.8 Manipulation Materials Not Available', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (62, N'3', N'1.5.1 ', N'1.5.1 Manufact. Execut. MPSA ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (63, N'3', N'1.5.2 ', N'1.5.2 Mnfg Exct Data Integrity', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (64, N'3', N'1.5.3 ', N'1.5.3 Manip.Execut. - MPSA', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (65, N'3', N'1.5.4 ', N'1.5.4 Natural Disaster–No Manf', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (66, N'3', N'1.5.5 ', N'1.5.5 Technical Readiness ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (67, N'3', N'1.5.6 ', N'1.56 Logist/Supp. Readiness ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (68, N'3', N'1.5.7 ', N'1.5.7 Product Comp. not avail', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (69, N'3', N'1.5.8 ', N'1.5.8 Late issue of document.(LAZ/AED)', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (70, N'3', N'1.6.1 ', N'1.6.1 IRA discrepancy ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (71, N'3', N'1.6.2 ', N'1.6.2 Ware.Sys./Process error ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (72, N'3', N'1.6.3 ', N'1.6.3 Outside storage failure ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (73, N'3', N'1.6.4 ', N'1.6.4 Com.iss. -MP/Plant / DC ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (74, N'3', N'1.6.5', N'1.6.5. DC breakdown ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (75, N'3', N'1.6.6 ', N'1.6.6 Inbound haulier Issue  ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (76, N'3', N'1.6.7 ', N'1.6.7 Customs Clearance Delay ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (77, N'3', N'1.6.8 ', N'1.6.8 In-transit LT Incorrect', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (78, N'3', N'1.6.9 ', N'1.6.9 Delay in transit-issue ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (79, N'3', N'1.6.10', N'1.6.10 Stolen Product ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (80, N'3', N'1.6.11', N'1.6.11 Prod.Damage /Transport ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (81, N'3', N'1.6.12', N'1.6.12 Prod.Damaged - Picking ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (82, N'3', N'1.6.13', N'1.6.13 Wrong Product Picked ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (83, N'3', N'1.6.14', N'1.6.14 Paperwork Incomplete ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (84, N'3', N'1.6.15', N'1.6.15 Late Delivery ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (85, N'3', N'1.6.16', N'1.6.16 Cust.Pickup-Truck Size ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (86, N'3', N'1.6.17', N'1.6.17  Shipment Loading Error ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (87, N'3', N'1.6.18', N'1.6.18 Product cut by carrier', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (88, N'3', N'1.6.19', N'1.6.19 Manipulation Feeder Not Delivered', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (89, N'3', N'1.7.1 ', N'1.7.1 Manual Entry Error', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (90, N'3', N'1.7.2 ', N' 1.7.2 Insufficient  Leadtime', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (91, N'3', N'1.7.3 ', N'1.7.3 Systems Error /Interface', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (92, N'3', N'1.7.4 ', N'1.7.4 Delay-New Code or Sub', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (93, N'3', N'1.8.1 ', N'1.8.1 Not covered in 1.0', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (94, N'3', N'1.9.1 ', N'1.9.1 Suppressd Demand-Sup Iss', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (95, N'3', N'1.10.1', N'1.10.1 gATP Functionality', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (96, N'3', N'1.10.2', N'1.10.2 gATP Cuts with Inventory', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (97, N'3', N'2.1.1 ', N'2.1.1   Demand Planning SWP', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (98, N'3', N'2.1.2 ', N'2.1.2 Communication:Demand Planner Error  ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (99, N'3', N'2.1.3 ', N'2.1.3 Wkly demnd mgmnt/cntrl  ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (100, N'3', N'2.1.4 ', N'2.1.4 Sys maint/interface fail', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (101, N'3', N'2.2.1 ', N'2.2.1 CPS Management', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (102, N'3', N'2.2.2 ', N'2.2.2 CMK underestimated Cnsmr', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (103, N'3', N'2.2.3 ', N'2.2.3 Market Plan chng not com', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (104, N'3', N'2.2.4 ', N'2.2.4 Initiative fore not in', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (105, N'3', N'2.2.5 ', N'2.2.5 Planner human error ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (106, N'3', N'2.2.6 ', N'2.2.6 Artwork Planning', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (107, N'3', N'2.2.7 ', N'2.2.7 Project team Execution', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (108, N'3', N'2.3.1 ', N'2.3.1 Capty to Demand Strategy', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (109, N'3', N'2.3.2 ', N'2.3.2 Planned Capacity Not Realized ', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (110, N'3', N'2.4.1 ', N'2.4.1. P&G Management Decision chg', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (111, N'3', N'2.4.2', N'2.4.2.Unplan demand-price chng', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (112, N'3', N'2.4.3', N'2.4.3 Unplan demand-tax/legal', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (113, N'3', N'2.4.5 ', N'2.4.5 Global BP Process not followed or insufficient strategy', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (114, N'3', N'2.4.6 ', N'2.4.6 Legal changes, artwork invalid', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (115, N'3', N'2.5.1', N'2.5.1. Not covered in 2.0', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (116, N'3', N'2.6.1 ', N'2.6.1 Cut without Advance notice', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (117, N'3', N'2.9.1 ', N'2.9.1 Suppressd Demand-Bus Pln', N'DRP', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (118, N'3', N'3.1.1 ', N'3.1.1Cst ordr out of guideline', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (119, N'3', N'3.1.2 ', N'3.1.2Cust order incorrect prod', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (120, N'3', N'3.1.3 ', N'3.1.3Cst order incorrect price', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (121, N'3', N'3.1.4 ', N'3.1.4 Cst ordr outside of date', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (122, N'3', N'3.1.5 ', N'3.1.5 Space/condition at rcvng', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (123, N'3', N'3.1.6 ', N'3.1.6 Sys malfunction at rcvng', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (124, N'3', N'3.1.7', N'3.1.7. Cust financial status', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (125, N'3', N'3.2.1 ', N'3.2.1 CBD input-Demand/Mkt Pln', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (126, N'3', N'3.2.2 ', N'3.2.2 Cust chng qty post-windo', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (127, N'3', N'3.2.3 ', N'3.2.3 Cust Didn’t Communicate Event  ', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (128, N'3', N'3.2.4 ', N'3.2.4 Unplan demand-cust/compet', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (129, N'3', N'3.3.1 ', N'3.3.1Incorrect prd ordr-PG err', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (130, N'3', N'3.3.2 ', N'3.3.2 Prd over allocatn-PG err', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (131, N'3', N'3.3.3 ', N'3.3.3Prod ord out of ship wind', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (132, N'3', N'3.4.1 ', N'3.4.1  Cust. not execute alloc', N'NA', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (133, N'3', N'3.4.2 ', N'3.4.2 Order exceed prom allot', N'NA', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (134, N'3', N'3.4.3 ', N'3.4.3 Order exceed price allot', N'NA', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (135, N'3', N'3.4.4 ', N'3.4.4 Commercial Issue-Price', N'NA', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (136, N'3', N'3.5.1.', N'3.5.1. Not covered in 3.0', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (137, N'3', N'3.9.1 ', N'3.9.1 Suppressed Demand-Comm Ex', N'MAL', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (138, N'3', N'7.1.1', N'7.1.1. Waiting to be analyzed ', N'NA', 0)
GO
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (139, N'2', N'7.1', N'7.1 Not Analyzed', N'', 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_RcClasification] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Roles] ON 

GO
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (1, N'Administrator', 0)
GO
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (2, N'Editor', 0)
GO
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (3, N'Reporter', 0)
GO
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (4, N'MAL Leader', 0)
GO
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (6, N'DRP Ops Leader', 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_SmoScope] ON 

GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (1, CAST(0x0000A60C00AC5A8A AS DateTime), NULL, 1, 81, 25, CAST(3.538405900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (2, CAST(0x0000A60C00AC602E AS DateTime), NULL, 1, 58, 23, CAST(2.532422100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (3, CAST(0x0000A60C00AC6054 AS DateTime), NULL, 1, 57, 6, CAST(1.597561900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (4, CAST(0x0000A60C00AC608D AS DateTime), NULL, 1, 58, 10, CAST(1.417486100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (5, CAST(0x0000A60C00AC611B AS DateTime), NULL, 1, 57, 15, CAST(0.636329700000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (6, CAST(0x0000A60C00AC6125 AS DateTime), NULL, 3, 81, 25, CAST(0.322665600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (7, CAST(0x0000A60C00AC6140 AS DateTime), NULL, 3, 57, 16, CAST(0.297066900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (8, CAST(0x0000A60C00AC6143 AS DateTime), NULL, 3, 58, 10, CAST(0.224376900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (9, CAST(0x0000A60C00AC614D AS DateTime), NULL, 3, 57, 7, CAST(0.012068100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (10, CAST(0x0000A60C00AC6152 AS DateTime), NULL, 41, 81, 25, CAST(0.085075000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (11, CAST(0x0000A60C00AC6158 AS DateTime), NULL, 41, 58, 23, CAST(0.010675200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (12, CAST(0x0000A60C00AC615A AS DateTime), NULL, 41, 58, 10, CAST(0.002332200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (13, CAST(0x0000A60C00AC615F AS DateTime), NULL, 41, 57, 7, CAST(0.002331000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (14, CAST(0x0000A60C00AC6163 AS DateTime), NULL, 41, 81, 139, CAST(0.001998000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (15, CAST(0x0000A60C00AC6165 AS DateTime), NULL, 42, 81, 25, CAST(27.657945800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (16, CAST(0x0000A60C00AC61BB AS DateTime), NULL, 42, 57, 9, CAST(0.221632400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (17, CAST(0x0000A60C00AC61C0 AS DateTime), NULL, 42, 58, 10, CAST(0.214266797880000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (18, CAST(0x0000A60C00AC61D7 AS DateTime), NULL, 42, 58, 24, CAST(0.085802400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (19, CAST(0x0000A60C00AC61DA AS DateTime), NULL, 42, 58, 23, CAST(0.049896000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (20, CAST(0x0000A60C00AC61DE AS DateTime), NULL, 4, 81, 25, CAST(28.263203411800000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (21, CAST(0x0000A60C00AC6226 AS DateTime), NULL, 4, 58, 23, CAST(3.045898050000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (22, CAST(0x0000A60C00AC623A AS DateTime), NULL, 4, 58, 10, CAST(0.914268652790000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (23, CAST(0x0000A60C00AC6291 AS DateTime), NULL, 4, 57, 9, CAST(0.705361987500000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (24, CAST(0x0000A60C00AC6293 AS DateTime), NULL, 4, 57, 7, CAST(0.127166462500000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (25, CAST(0x0000A60C00AC6297 AS DateTime), NULL, 5, 81, 25, CAST(2.700375000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (26, CAST(0x0000A60C00AC62A6 AS DateTime), NULL, 5, 57, 8, CAST(1.530900000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (27, CAST(0x0000A60C00AC62AD AS DateTime), NULL, 5, 58, 10, CAST(0.677335600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (28, CAST(0x0000A60C00AC62C6 AS DateTime), NULL, 5, 58, 22, CAST(0.202500000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (29, CAST(0x0000A60C00AC62CB AS DateTime), NULL, 5, 57, 9, CAST(0.059062500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (30, CAST(0x0000A60C00AC62D1 AS DateTime), NULL, 6, 81, 25, CAST(1.770864500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (31, CAST(0x0000A60C00AC62EC AS DateTime), NULL, 6, 57, 6, CAST(0.900397100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (32, CAST(0x0000A60C00AC62FE AS DateTime), NULL, 6, 58, 23, CAST(0.577858800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (33, CAST(0x0000A60C00AC630A AS DateTime), NULL, 6, 58, 11, CAST(0.211572800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (34, CAST(0x0000A60C00AC630E AS DateTime), NULL, 6, 58, 10, CAST(0.175900200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (35, CAST(0x0000A60C00AC6320 AS DateTime), NULL, 7, 81, 25, CAST(0.925582800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (36, CAST(0x0000A60C00AC6332 AS DateTime), NULL, 7, 58, 23, CAST(0.347965200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (37, CAST(0x0000A60C00AC633A AS DateTime), NULL, 7, 57, 5, CAST(0.052786800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (38, CAST(0x0000A60C00AC6340 AS DateTime), NULL, 7, 58, 10, CAST(0.006132600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (39, CAST(0x0000A60C00AC6343 AS DateTime), NULL, 8, 81, 25, CAST(3.931123200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (40, CAST(0x0000A60C00AC6367 AS DateTime), NULL, 8, 58, 10, CAST(0.116304800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (41, CAST(0x0000A60C00AC6373 AS DateTime), NULL, 8, 57, 15, CAST(0.082665600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (42, CAST(0x0000A60C00AC637A AS DateTime), NULL, 8, 58, 24, CAST(0.060394800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (43, CAST(0x0000A60C00AC637E AS DateTime), NULL, 8, 57, 9, CAST(0.055994400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (44, CAST(0x0000A60C00AC6385 AS DateTime), NULL, 9, 81, 25, CAST(62.562196985430000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (45, CAST(0x0000A60C00AC6507 AS DateTime), NULL, 9, 58, 23, CAST(11.466626808600000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (46, CAST(0x0000A60C00AC658B AS DateTime), NULL, 9, 57, 6, CAST(6.385498440000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (47, CAST(0x0000A60C00AC6643 AS DateTime), NULL, 9, 58, 10, CAST(3.692279000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (48, CAST(0x0000A60C00AC6728 AS DateTime), NULL, 9, 57, 15, CAST(2.272382300000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (49, CAST(0x0000A60C00AC6736 AS DateTime), NULL, 10, 81, 25, CAST(1.670400000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (50, CAST(0x0000A60C00AC6754 AS DateTime), NULL, 10, 58, 10, CAST(0.634627200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (51, CAST(0x0000A60C00AC6777 AS DateTime), NULL, 10, 57, 15, CAST(0.288000000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (52, CAST(0x0000A60C00AC6781 AS DateTime), NULL, 10, 58, 23, CAST(0.264000000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (53, CAST(0x0000A60C00AC6790 AS DateTime), NULL, 10, 57, 6, CAST(0.103200000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (54, CAST(0x0000A60C00AC6794 AS DateTime), NULL, 11, 58, 23, CAST(1.617600000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (55, CAST(0x0000A60C00AC67A5 AS DateTime), NULL, 11, 58, 10, CAST(0.134400000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (56, CAST(0x0000A60C00AC67A8 AS DateTime), NULL, 12, 58, 23, CAST(0.078740000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (57, CAST(0x0000A60C00AC67AF AS DateTime), NULL, 12, 81, 25, CAST(0.015240000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (58, CAST(0x0000A60C00AC67B6 AS DateTime), NULL, 12, 57, 15, CAST(0.013970000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (59, CAST(0x0000A60C00AC67C1 AS DateTime), NULL, 12, 57, 6, CAST(0.006350000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (60, CAST(0x0000A60C00AC67C3 AS DateTime), NULL, 12, 58, 10, CAST(0.002540000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (61, CAST(0x0000A60C00AC67C9 AS DateTime), NULL, 14, 81, 25, CAST(2.256551100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (62, CAST(0x0000A60C00AC67DF AS DateTime), NULL, 14, 58, 23, CAST(1.510194500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (63, CAST(0x0000A60C00AC67EB AS DateTime), NULL, 14, 58, 10, CAST(0.676683400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (64, CAST(0x0000A60C00AC681D AS DateTime), NULL, 14, 57, 5, CAST(0.158128200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (65, CAST(0x0000A60C00AC6824 AS DateTime), NULL, 14, 57, 6, CAST(0.076000000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (66, CAST(0x0000A60C00AC6829 AS DateTime), NULL, 15, 81, 25, CAST(23.529379325000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (67, CAST(0x0000A60C00AC6862 AS DateTime), NULL, 15, 58, 10, CAST(4.545247687430000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (68, CAST(0x0000A60C00AC696B AS DateTime), NULL, 15, 57, 8, CAST(1.825425000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (69, CAST(0x0000A60C00AC696D AS DateTime), NULL, 15, 58, 23, CAST(1.162357900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (70, CAST(0x0000A60C00AC6975 AS DateTime), NULL, 15, 57, 6, CAST(0.419766305000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (71, CAST(0x0000A60C00AC6985 AS DateTime), NULL, 17, 81, 25, CAST(76.161233896800000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (72, CAST(0x0000A60C00AC69FB AS DateTime), NULL, 17, 58, 23, CAST(0.583941600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (73, CAST(0x0000A60C00AC6A04 AS DateTime), NULL, 17, 58, 11, CAST(0.528967200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (74, CAST(0x0000A60C00AC6A09 AS DateTime), NULL, 17, 58, 10, CAST(0.520515600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (75, CAST(0x0000A60C00AC6A1B AS DateTime), NULL, 17, 57, 6, CAST(0.286975200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (76, CAST(0x0000A60C00AC6A1E AS DateTime), NULL, 18, 58, 23, CAST(0.641842800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (77, CAST(0x0000A60C00AC6A21 AS DateTime), NULL, 18, 81, 25, CAST(0.582725700000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (78, CAST(0x0000A60C00AC6A27 AS DateTime), NULL, 18, 58, 10, CAST(0.001200000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (79, CAST(0x0000A60C00AC6A29 AS DateTime), NULL, 20, 81, 25, CAST(15.960617200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (80, CAST(0x0000A60C00AC6A7D AS DateTime), NULL, 20, 57, 15, CAST(0.430620000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (81, CAST(0x0000A60C00AC6A86 AS DateTime), NULL, 20, 57, 7, CAST(0.391960800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (82, CAST(0x0000A60C00AC6A89 AS DateTime), NULL, 20, 58, 10, CAST(0.259588800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (83, CAST(0x0000A60C00AC6A9A AS DateTime), NULL, 20, 58, 11, CAST(0.173066000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (84, CAST(0x0000A60C00AC6A9F AS DateTime), NULL, 21, 57, 6, CAST(0.249316000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (85, CAST(0x0000A60C00AC6AAB AS DateTime), NULL, 21, 81, 25, CAST(0.211172600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (86, CAST(0x0000A60C00AC6ABD AS DateTime), NULL, 21, 57, 8, CAST(0.052752800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (87, CAST(0x0000A60C00AC6AF6 AS DateTime), NULL, 21, 58, 23, CAST(0.031422600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (88, CAST(0x0000A60C00AC6B4F AS DateTime), NULL, 21, 57, 7, CAST(0.029070900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (89, CAST(0x0000A60C00AC6B5F AS DateTime), NULL, 43, 81, 25, CAST(1.663351200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (90, CAST(0x0000A60C00AC6B89 AS DateTime), NULL, 43, 58, 10, CAST(0.468278400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (91, CAST(0x0000A60C00AC6B9E AS DateTime), NULL, 43, 58, 23, CAST(0.129072000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (92, CAST(0x0000A60C00AC6BAB AS DateTime), NULL, 43, 57, 9, CAST(0.070056000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (93, CAST(0x0000A60C00AC6BAE AS DateTime), NULL, 43, 58, 24, CAST(0.065052000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (94, CAST(0x0000A60C00AC6BB2 AS DateTime), NULL, 22, 81, 25, CAST(0.554172500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (95, CAST(0x0000A60C00AC6BB6 AS DateTime), NULL, 22, 57, 7, CAST(0.355468600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (96, CAST(0x0000A60C00AC6BBE AS DateTime), NULL, 44, 57, 6, CAST(0.380250000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (97, CAST(0x0000A60C00AC6BC4 AS DateTime), NULL, 44, 81, 25, CAST(0.026625000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (98, CAST(0x0000A60C00AC6BCA AS DateTime), NULL, 44, 57, 9, CAST(0.011394000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (99, CAST(0x0000A60C00AC6BCD AS DateTime), NULL, 44, 58, 10, CAST(0.006606100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (100, CAST(0x0000A60C00AC6BD6 AS DateTime), NULL, 44, 57, 7, CAST(0.002625000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (101, CAST(0x0000A60C00AC6BD9 AS DateTime), NULL, 24, 81, 25, CAST(17.481155200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (102, CAST(0x0000A60C00AC6C1C AS DateTime), NULL, 24, 58, 10, CAST(0.150220400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (103, CAST(0x0000A60C00AC6C2E AS DateTime), NULL, 24, 58, 24, CAST(0.018119400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (104, CAST(0x0000A60C00AC6C31 AS DateTime), NULL, 27, 57, 15, CAST(0.048734400000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (105, CAST(0x0000A60C00AC6C34 AS DateTime), NULL, 27, 57, 9, CAST(0.047400500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (106, CAST(0x0000A60C00AC6C3A AS DateTime), NULL, 27, 57, 16, CAST(0.023521500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (107, CAST(0x0000A60C00AC6C43 AS DateTime), NULL, 27, 57, 7, CAST(0.002087300000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (108, CAST(0x0000A60C00AC6C47 AS DateTime), NULL, 27, 81, 139, CAST(0.000905900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (109, CAST(0x0000A60C00AC6C49 AS DateTime), NULL, 29, 81, 25, CAST(1.914833271400000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (110, CAST(0x0000A60C00AC6C52 AS DateTime), NULL, 29, 57, 15, CAST(1.042487600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (111, CAST(0x0000A60C00AC6C57 AS DateTime), NULL, 29, 58, 23, CAST(0.994824200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (112, CAST(0x0000A60C00AC6C65 AS DateTime), NULL, 29, 58, 10, CAST(0.129616800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (113, CAST(0x0000A60C00AC6C67 AS DateTime), NULL, 29, 57, 7, CAST(0.039385600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (114, CAST(0x0000A60C00AC6C6C AS DateTime), NULL, 30, 81, 25, CAST(0.365960000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (115, CAST(0x0000A60C00AC6C74 AS DateTime), NULL, 30, 58, 24, CAST(0.004167000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (116, CAST(0x0000A60C00AC6C76 AS DateTime), NULL, 30, 58, 11, CAST(0.000997500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (117, CAST(0x0000A60C00AC6C78 AS DateTime), NULL, 16, 81, 25, CAST(0.484500000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (118, CAST(0x0000A60C00AC6C7F AS DateTime), NULL, 16, 57, 6, CAST(0.073750000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (119, CAST(0x0000A60C00AC6C81 AS DateTime), NULL, 46, 57, 6, CAST(0.047980800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (120, CAST(0x0000A60C00AC6C89 AS DateTime), NULL, 46, 58, 10, CAST(0.009000000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (121, CAST(0x0000A60C00AC6C8E AS DateTime), NULL, 46, 81, 25, CAST(0.001999200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (122, CAST(0x0000A60C00AC6C90 AS DateTime), NULL, 45, 57, 7, CAST(0.136000000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (123, CAST(0x0000A60C00AC6C92 AS DateTime), NULL, 45, 81, 25, CAST(0.056000000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (124, CAST(0x0000A60C00AC6C94 AS DateTime), NULL, 45, 58, 10, CAST(0.027430000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (125, CAST(0x0000A60C00AC6C97 AS DateTime), NULL, 83, 58, 10, CAST(0.004950000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (126, CAST(0x0000A60C00AC6C9A AS DateTime), 48, NULL, 81, 25, CAST(60.278932171400000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (127, CAST(0x0000A60C00AC6EDD AS DateTime), 48, NULL, 58, 23, CAST(4.713356600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (128, CAST(0x0000A60C00AC6F9B AS DateTime), 48, NULL, 58, 10, CAST(1.779413100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (129, CAST(0x0000A60C00AC73AC AS DateTime), 48, NULL, 57, 6, CAST(1.591391300000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (130, CAST(0x0000A60C00AC7453 AS DateTime), 48, NULL, 57, 9, CAST(1.415600200000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (131, CAST(0x0000A60C00AC7479 AS DateTime), 53, NULL, 81, 25, CAST(4.363058650000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (132, CAST(0x0000A60C00AC74B6 AS DateTime), 53, NULL, 57, 6, CAST(0.686902800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (133, CAST(0x0000A60C00AC750D AS DateTime), 53, NULL, 58, 23, CAST(0.188913800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (134, CAST(0x0000A60C00AC752B AS DateTime), 53, NULL, 57, 9, CAST(0.037801800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (135, CAST(0x0000A60C00AC7531 AS DateTime), 53, NULL, 57, 7, CAST(0.032180800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (136, CAST(0x0000A60C00AC7536 AS DateTime), 52, NULL, 81, 25, CAST(3.583622186280000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (137, CAST(0x0000A60C00AC753E AS DateTime), 52, NULL, 57, 6, CAST(1.537256800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (138, CAST(0x0000A60C00AC7587 AS DateTime), 52, NULL, 57, 15, CAST(1.042487600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (139, CAST(0x0000A60C00AC758C AS DateTime), 52, NULL, 58, 23, CAST(0.739954600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (140, CAST(0x0000A60C00AC759A AS DateTime), 52, NULL, 58, 11, CAST(0.700364700000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (141, CAST(0x0000A60C00AC75AD AS DateTime), 50, NULL, 81, 25, CAST(64.149697787500000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (142, CAST(0x0000A60C00AC7B00 AS DateTime), 50, NULL, 58, 23, CAST(11.974717928600000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (143, CAST(0x0000A60C00AC7BCD AS DateTime), 50, NULL, 58, 10, CAST(9.410147285310000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (144, CAST(0x0000A60C00AC824B AS DateTime), 50, NULL, 57, 6, CAST(4.649706405000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (145, CAST(0x0000A60C00AC82A6 AS DateTime), 50, NULL, 57, 8, CAST(1.549102600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (146, CAST(0x0000A60C00AC82B1 AS DateTime), 47, NULL, 81, 25, CAST(2.149844956650000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (147, CAST(0x0000A60C00AC832A AS DateTime), 47, NULL, 58, 10, CAST(1.405964100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (148, CAST(0x0000A60C00AC834B AS DateTime), 47, NULL, 58, 23, CAST(1.116052100000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (149, CAST(0x0000A60C00AC8365 AS DateTime), 47, NULL, 57, 6, CAST(0.737014600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (150, CAST(0x0000A60C00AC8380 AS DateTime), 47, NULL, 58, 22, CAST(0.199800000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (151, CAST(0x0000A60C00AC8382 AS DateTime), 49, NULL, 81, 25, CAST(129.182864661800000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (152, CAST(0x0000A60C00AC8DD4 AS DateTime), 49, NULL, 58, 23, CAST(4.655858450000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (153, CAST(0x0000A60C00AC8E06 AS DateTime), 49, NULL, 57, 15, CAST(3.310037600000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (154, CAST(0x0000A60C00AC8E55 AS DateTime), 49, NULL, 57, 9, CAST(1.894615587500000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (155, CAST(0x0000A60C00AC8E76 AS DateTime), 49, NULL, 57, 8, CAST(1.878177800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (156, CAST(0x0000A60C00AC8E82 AS DateTime), 55, NULL, 57, 6, CAST(0.046696900000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (157, CAST(0x0000A60C00AC8E85 AS DateTime), 54, NULL, 81, 25, CAST(10.985333976800000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (158, CAST(0x0000A60C00AC8EB5 AS DateTime), 54, NULL, 58, 23, CAST(1.790874680000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (159, CAST(0x0000A60C00AC8EDD AS DateTime), 54, NULL, 57, 6, CAST(0.383348740000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (160, CAST(0x0000A60C00AC8EFA AS DateTime), 54, NULL, 58, 10, CAST(0.216792000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (161, CAST(0x0000A60C00AC8F06 AS DateTime), 54, NULL, 58, 22, CAST(0.066508800000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (162, CAST(0x0000A60C00AC8F0C AS DateTime), 51, NULL, 58, 10, CAST(0.828496700000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (163, CAST(0x0000A60C00AC8F24 AS DateTime), 51, NULL, 57, 9, CAST(0.196560000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (164, CAST(0x0000A60C00AC8F29 AS DateTime), 51, NULL, 57, 7, CAST(0.031500000000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (165, CAST(0x0000A60C00AC8F2E AS DateTime), 51, NULL, 57, 12, CAST(0.006007999200000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
INSERT [dbo].[LARCA20_SmoScope] ([SmoScopeID], [Fecha], [RefIdSMO], [RefIdBU], [RefIdOwner], [RefIdRC], [Volumen], [Problem], [Why1], [Why2], [Why3], [ActionPlan], [RefIdResponsable], [DueDate], [O_C], [Borrado], [Level4]) VALUES (166, CAST(0x0000A60C00AC8F31 AS DateTime), 51, NULL, 81, 139, CAST(0.002755500000000 AS Decimal(20, 15)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_SmoScope] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_SmoScopeDetail] ON 

GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1, 131, CAST(0x0000A60C00AC3CAF AS DateTime), 53, 1, 81, 25, 133, CAST(0.051008100000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (2, 131, CAST(0x0000A60C00AC3CB3 AS DateTime), 53, 1, 81, 25, 135, CAST(0.001805600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (3, 141, CAST(0x0000A60C00AC3CE2 AS DateTime), 50, 1, 81, 25, 135, CAST(0.003356600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (4, 146, CAST(0x0000A60C00AC3CE6 AS DateTime), 47, 1, 81, 25, 135, CAST(0.028236800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (5, 146, CAST(0x0000A60C00AC3CEB AS DateTime), 47, 1, 81, 25, 135, CAST(0.018812300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (6, 131, CAST(0x0000A60C00AC415C AS DateTime), 53, 1, 81, 25, 133, CAST(0.094673800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (7, 131, CAST(0x0000A60C00AC415F AS DateTime), 53, 1, 81, 25, 135, CAST(0.005337000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (8, 146, CAST(0x0000A60C00AC4174 AS DateTime), 47, 1, 81, 25, 135, CAST(0.000882400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (9, 146, CAST(0x0000A60C00AC4177 AS DateTime), 47, 1, 81, 25, 135, CAST(0.004341300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (10, 141, CAST(0x0000A60C00AC42FF AS DateTime), 50, 1, 81, 25, 135, CAST(0.001447100000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (11, 151, CAST(0x0000A60C00AC43D6 AS DateTime), 49, 1, 81, 25, 134, CAST(0.055396400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (12, 151, CAST(0x0000A60C00AC43DA AS DateTime), 49, 1, 81, 25, 134, CAST(0.004373400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (13, 151, CAST(0x0000A60C00AC43DE AS DateTime), 49, 1, 81, 25, 135, CAST(0.007273000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (14, 151, CAST(0x0000A60C00AC43E2 AS DateTime), 49, 1, 81, 25, 135, CAST(0.025511500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (15, 131, CAST(0x0000A60C00AC43EA AS DateTime), 53, 1, 81, 25, 133, CAST(1.768766700000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (16, 131, CAST(0x0000A60C00AC43F5 AS DateTime), 53, 1, 81, 25, 135, CAST(0.000902800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (17, 126, CAST(0x0000A60C00AC48CB AS DateTime), 48, 1, 81, 25, 132, CAST(0.004235500000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (18, 126, CAST(0x0000A60C00AC48D7 AS DateTime), 48, 1, 81, 25, 135, CAST(0.000902800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (19, 126, CAST(0x0000A60C00AC48EB AS DateTime), 48, 1, 81, 25, 132, CAST(0.003388400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (20, 151, CAST(0x0000A60C00AC48FE AS DateTime), 49, 1, 81, 25, 134, CAST(0.043734000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (21, 151, CAST(0x0000A60C00AC4903 AS DateTime), 49, 1, 81, 25, 134, CAST(0.029156000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (22, 151, CAST(0x0000A60C00AC4908 AS DateTime), 49, 1, 81, 25, 135, CAST(0.000996900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (23, 151, CAST(0x0000A60C00AC490C AS DateTime), 49, 1, 81, 25, 135, CAST(0.002894200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (24, 126, CAST(0x0000A60C00AC4D8E AS DateTime), 48, 1, 81, 25, 135, CAST(0.001805600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (25, 151, CAST(0x0000A60C00AC4DB1 AS DateTime), 49, 1, 81, 25, 134, CAST(0.165460300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (26, 151, CAST(0x0000A60C00AC4DB5 AS DateTime), 49, 1, 81, 25, 134, CAST(0.032071600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (27, 131, CAST(0x0000A60C00AC4DC2 AS DateTime), 53, 1, 81, 25, 135, CAST(0.001186000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (28, 141, CAST(0x0000A60C00AC4DDC AS DateTime), 50, 1, 81, 25, 135, CAST(0.028236000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (29, 141, CAST(0x0000A60C00AC4DE0 AS DateTime), 50, 1, 81, 25, 135, CAST(0.014578000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (30, 141, CAST(0x0000A60C00AC4DE5 AS DateTime), 50, 1, 81, 25, 135, CAST(0.036112000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (31, 146, CAST(0x0000A60C00AC4DF1 AS DateTime), 47, 1, 81, 25, 135, CAST(0.002647200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (32, 126, CAST(0x0000A60C00AC52C0 AS DateTime), 48, 1, 81, 25, 135, CAST(0.021667200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (33, 151, CAST(0x0000A60C00AC52D4 AS DateTime), 49, 1, 81, 25, 134, CAST(0.047378500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (34, 151, CAST(0x0000A60C00AC52D7 AS DateTime), 49, 1, 81, 25, 135, CAST(0.002186700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (35, 131, CAST(0x0000A60C00AC52DF AS DateTime), 53, 1, 81, 25, 135, CAST(0.000902800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (36, 141, CAST(0x0000A60C00AC5314 AS DateTime), 50, 1, 81, 25, 135, CAST(0.228559000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (37, 141, CAST(0x0000A60C00AC531A AS DateTime), 50, 1, 81, 25, 135, CAST(0.017648000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (38, 141, CAST(0x0000A60C00AC5320 AS DateTime), 50, 1, 81, 25, 135, CAST(0.027084000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (39, 126, CAST(0x0000A60C00AC5834 AS DateTime), 48, 1, 81, 25, 135, CAST(0.006319600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (40, 151, CAST(0x0000A60C00AC5843 AS DateTime), 49, 1, 81, 25, 134, CAST(0.060498700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (41, 151, CAST(0x0000A60C00AC5847 AS DateTime), 49, 1, 81, 25, 134, CAST(0.064143200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (42, 151, CAST(0x0000A60C00AC584B AS DateTime), 49, 1, 81, 25, 135, CAST(0.001457800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (43, 151, CAST(0x0000A60C00AC584F AS DateTime), 49, 1, 81, 25, 135, CAST(0.218670000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (44, 151, CAST(0x0000A60C00AC5853 AS DateTime), 49, 1, 81, 25, 135, CAST(0.360076600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (45, 141, CAST(0x0000A60C00AC5870 AS DateTime), 50, 1, 81, 25, 135, CAST(0.004341300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (46, 146, CAST(0x0000A60C00AC5886 AS DateTime), 47, 1, 81, 25, 135, CAST(0.037943200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (47, 127, CAST(0x0000A60C00AC3B90 AS DateTime), 48, 1, 58, 23, 125, CAST(0.001447100000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (48, 142, CAST(0x0000A60C00AC3CC4 AS DateTime), 50, 1, 58, 23, 125, CAST(0.107772200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (49, 142, CAST(0x0000A60C00AC3CD5 AS DateTime), 50, 1, 58, 23, 125, CAST(0.611503200000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (50, 158, CAST(0x0000A60C00AC4158 AS DateTime), 54, 1, 58, 23, 125, CAST(0.100210800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (51, 142, CAST(0x0000A60C00AC4168 AS DateTime), 50, 1, 58, 23, 125, CAST(0.018314000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (52, 158, CAST(0x0000A60C00AC43E6 AS DateTime), 54, 1, 58, 23, 125, CAST(0.011736400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (53, 127, CAST(0x0000A60C00AC48E8 AS DateTime), 48, 1, 58, 23, 125, CAST(0.076696300000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (54, 142, CAST(0x0000A60C00AC4913 AS DateTime), 50, 1, 58, 23, 125, CAST(0.169310700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (55, 142, CAST(0x0000A60C00AC4917 AS DateTime), 50, 1, 58, 23, 125, CAST(0.001805600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (56, 127, CAST(0x0000A60C00AC4D7F AS DateTime), 48, 1, 58, 23, 125, CAST(0.007235500000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (57, 127, CAST(0x0000A60C00AC4DA2 AS DateTime), 48, 1, 58, 23, 125, CAST(0.797352100000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (58, 158, CAST(0x0000A60C00AC4DBB AS DateTime), 54, 1, 58, 23, 125, CAST(0.000882400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (59, 158, CAST(0x0000A60C00AC4DBF AS DateTime), 54, 1, 58, 23, 125, CAST(0.009028000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (60, 142, CAST(0x0000A60C00AC4DCB AS DateTime), 50, 1, 58, 23, 125, CAST(0.264819300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (61, 142, CAST(0x0000A60C00AC4DCE AS DateTime), 50, 1, 58, 23, 125, CAST(0.065904400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (62, 142, CAST(0x0000A60C00AC4DD3 AS DateTime), 50, 1, 58, 23, 125, CAST(0.000902800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (63, 127, CAST(0x0000A60C00AC52A8 AS DateTime), 48, 1, 58, 23, 125, CAST(0.005788400000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (64, 127, CAST(0x0000A60C00AC52BB AS DateTime), 48, 1, 58, 23, 125, CAST(0.002894200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (65, 127, CAST(0x0000A60C00AC52C4 AS DateTime), 48, 1, 58, 23, 125, CAST(0.004341300000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (66, 158, CAST(0x0000A60C00AC52DB AS DateTime), 54, 1, 58, 23, 125, CAST(0.180560000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (67, 142, CAST(0x0000A60C00AC52EA AS DateTime), 50, 1, 58, 23, 125, CAST(0.014471000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (68, 142, CAST(0x0000A60C00AC52EE AS DateTime), 50, 1, 58, 23, 125, CAST(0.078543600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (69, 142, CAST(0x0000A60C00AC530A AS DateTime), 50, 1, 58, 23, 125, CAST(0.000902800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (70, 137, CAST(0x0000A60C00AC3CB7 AS DateTime), 52, 1, 57, 6, 40, CAST(0.199615000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (71, 144, CAST(0x0000A60C00AC3CC0 AS DateTime), 50, 1, 57, 6, 37, CAST(0.090887200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (72, 149, CAST(0x0000A60C00AC416F AS DateTime), 47, 1, 57, 6, 39, CAST(0.005294400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (73, 129, CAST(0x0000A60C00AC43B1 AS DateTime), 48, 1, 57, 6, 39, CAST(0.007059200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (74, 3, CAST(0x0000A60C00AC43C6 AS DateTime), 49, 1, 57, 6, 36, CAST(0.037902800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (75, 144, CAST(0x0000A60C00AC43F9 AS DateTime), 50, 1, 57, 6, 37, CAST(0.008824000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (76, 144, CAST(0x0000A60C00AC4401 AS DateTime), 50, 1, 57, 6, 37, CAST(0.165008800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (77, 149, CAST(0x0000A60C00AC4417 AS DateTime), 47, 1, 57, 6, 39, CAST(0.079416000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (78, 129, CAST(0x0000A60C00AC48DB AS DateTime), 48, 1, 57, 6, 39, CAST(0.008824000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (79, 3, CAST(0x0000A60C00AC48EF AS DateTime), 49, 1, 57, 6, 36, CAST(0.072161100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (80, 129, CAST(0x0000A60C00AC4D72 AS DateTime), 48, 1, 57, 6, 39, CAST(0.023824800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (81, 129, CAST(0x0000A60C00AC4D95 AS DateTime), 48, 1, 57, 6, 39, CAST(0.008824000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (82, 3, CAST(0x0000A60C00AC4DA6 AS DateTime), 49, 1, 57, 6, 36, CAST(0.643618700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (83, 3, CAST(0x0000A60C00AC52C7 AS DateTime), 49, 1, 57, 6, 36, CAST(0.099859300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (84, 137, CAST(0x0000A60C00AC52E3 AS DateTime), 52, 1, 57, 6, 37, CAST(0.018812300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (85, 149, CAST(0x0000A60C00AC5324 AS DateTime), 47, 1, 57, 6, 39, CAST(0.097946400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (86, 129, CAST(0x0000A60C00AC5823 AS DateTime), 48, 1, 57, 6, 37, CAST(0.001447100000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (87, 149, CAST(0x0000A60C00AC5875 AS DateTime), 47, 1, 57, 6, 37, CAST(0.014118400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (88, 149, CAST(0x0000A60C00AC5879 AS DateTime), 47, 1, 57, 6, 39, CAST(0.014118400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (89, 128, CAST(0x0000A60C00AC3CA6 AS DateTime), 48, 1, 58, 10, 86, CAST(0.000882400000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (90, 128, CAST(0x0000A60C00AC3CAB AS DateTime), 48, 1, 58, 10, 78, CAST(0.037060800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (91, 143, CAST(0x0000A60C00AC3CC8 AS DateTime), 50, 1, 58, 10, 86, CAST(0.000882400000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (92, 143, CAST(0x0000A60C00AC3CCD AS DateTime), 50, 1, 58, 10, 86, CAST(0.002708400000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (93, 143, CAST(0x0000A60C00AC3CD9 AS DateTime), 50, 1, 58, 10, 80, CAST(0.000882400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (94, 143, CAST(0x0000A60C00AC3CDD AS DateTime), 50, 1, 58, 10, 80, CAST(0.000902800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (95, 128, CAST(0x0000A60C00AC42F7 AS DateTime), 48, 1, 58, 10, 78, CAST(0.010588800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (96, 128, CAST(0x0000A60C00AC43AD AS DateTime), 48, 1, 58, 10, 78, CAST(0.002647200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (97, 128, CAST(0x0000A60C00AC43B6 AS DateTime), 48, 1, 58, 10, 78, CAST(0.011471200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (98, 128, CAST(0x0000A60C00AC43BA AS DateTime), 48, 1, 58, 10, 70, CAST(0.002012600000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (99, 128, CAST(0x0000A60C00AC43BD AS DateTime), 48, 1, 58, 10, 70, CAST(0.000882400000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (100, 128, CAST(0x0000A60C00AC43C2 AS DateTime), 48, 1, 58, 10, 70, CAST(0.009318100000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (101, 4, CAST(0x0000A60C00AC43CB AS DateTime), 49, 1, 58, 10, 71, CAST(0.201146900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (102, 4, CAST(0x0000A60C00AC43EE AS DateTime), 53, 1, 58, 10, 86, CAST(0.002647200000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (103, 4, CAST(0x0000A60C00AC43F2 AS DateTime), 53, 1, 58, 10, 86, CAST(0.004895100000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (104, 147, CAST(0x0000A60C00AC441E AS DateTime), 47, 1, 58, 10, 70, CAST(0.000882400000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (105, 128, CAST(0x0000A60C00AC48C8 AS DateTime), 48, 1, 58, 10, 78, CAST(0.002647200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (106, 128, CAST(0x0000A60C00AC48D0 AS DateTime), 48, 1, 58, 10, 78, CAST(0.041472800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (107, 128, CAST(0x0000A60C00AC48D3 AS DateTime), 48, 1, 58, 10, 70, CAST(0.014118400000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (108, 128, CAST(0x0000A60C00AC48E3 AS DateTime), 48, 1, 58, 10, 78, CAST(0.084710400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (109, 4, CAST(0x0000A60C00AC48F3 AS DateTime), 49, 1, 58, 10, 71, CAST(0.037624600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (110, 143, CAST(0x0000A60C00AC491B AS DateTime), 50, 1, 58, 10, 80, CAST(0.003211900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (111, 143, CAST(0x0000A60C00AC491F AS DateTime), 50, 1, 58, 10, 80, CAST(0.002894200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (112, 143, CAST(0x0000A60C00AC4924 AS DateTime), 50, 1, 58, 10, 80, CAST(0.005788400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (113, 143, CAST(0x0000A60C00AC4927 AS DateTime), 50, 1, 58, 10, 80, CAST(0.000728900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (114, 128, CAST(0x0000A60C00AC4D6E AS DateTime), 48, 1, 58, 10, 78, CAST(0.007941600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (115, 128, CAST(0x0000A60C00AC4D7A AS DateTime), 48, 1, 58, 10, 78, CAST(0.026472000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (116, 128, CAST(0x0000A60C00AC4D82 AS DateTime), 48, 1, 58, 10, 82, CAST(0.006670800000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (117, 128, CAST(0x0000A60C00AC4D86 AS DateTime), 48, 1, 58, 10, 82, CAST(0.000902800000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (118, 128, CAST(0x0000A60C00AC4D8A AS DateTime), 48, 1, 58, 10, 86, CAST(0.000728900000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (119, 128, CAST(0x0000A60C00AC4D9E AS DateTime), 48, 1, 58, 10, 78, CAST(0.088240000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (120, 4, CAST(0x0000A60C00AC4DA9 AS DateTime), 49, 1, 58, 10, 71, CAST(0.230088900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (121, 143, CAST(0x0000A60C00AC4DD7 AS DateTime), 50, 1, 58, 10, 80, CAST(0.001764800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (122, 147, CAST(0x0000A60C00AC4DED AS DateTime), 47, 1, 58, 10, 70, CAST(0.000882400000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (123, 128, CAST(0x0000A60C00AC52B7 AS DateTime), 48, 1, 58, 10, 78, CAST(0.026472000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (124, 4, CAST(0x0000A60C00AC52CC AS DateTime), 49, 1, 58, 10, 71, CAST(0.109979600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (125, 143, CAST(0x0000A60C00AC52F6 AS DateTime), 50, 1, 58, 10, 86, CAST(0.139471000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (126, 143, CAST(0x0000A60C00AC52FC AS DateTime), 50, 1, 58, 10, 86, CAST(0.026894900000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (127, 143, CAST(0x0000A60C00AC5301 AS DateTime), 50, 1, 58, 10, 86, CAST(0.020483200000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (128, 143, CAST(0x0000A60C00AC5305 AS DateTime), 50, 1, 58, 10, 86, CAST(0.030521300000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (129, 143, CAST(0x0000A60C00AC5310 AS DateTime), 50, 1, 58, 10, 80, CAST(0.002286300000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (130, 128, CAST(0x0000A60C00AC5827 AS DateTime), 48, 1, 58, 10, 78, CAST(0.037060800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (131, 128, CAST(0x0000A60C00AC582B AS DateTime), 48, 1, 58, 10, 78, CAST(0.074121600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (132, 128, CAST(0x0000A60C00AC582F AS DateTime), 48, 1, 58, 10, 80, CAST(0.000902800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (133, 4, CAST(0x0000A60C00AC583B AS DateTime), 49, 1, 58, 10, 71, CAST(0.082484700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (134, 4, CAST(0x0000A60C00AC585B AS DateTime), 52, 1, 58, 10, 78, CAST(0.002894200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (135, 143, CAST(0x0000A60C00AC5863 AS DateTime), 50, 1, 58, 10, 70, CAST(0.006876100000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (136, 143, CAST(0x0000A60C00AC5867 AS DateTime), 50, 1, 58, 10, 80, CAST(0.004196000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (137, 143, CAST(0x0000A60C00AC586C AS DateTime), 50, 1, 58, 10, 80, CAST(0.000847100000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (138, 147, CAST(0x0000A60C00AC5881 AS DateTime), 47, 1, 58, 10, 70, CAST(0.005294400000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (139, 153, CAST(0x0000A60C00AC43CF AS DateTime), 49, 1, 57, 15, 97, CAST(0.008746800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (140, 153, CAST(0x0000A60C00AC43D2 AS DateTime), 49, 1, 57, 15, 97, CAST(0.129744200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (141, 153, CAST(0x0000A60C00AC48F7 AS DateTime), 49, 1, 57, 15, 97, CAST(0.074347800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (142, 153, CAST(0x0000A60C00AC48FB AS DateTime), 49, 1, 57, 15, 97, CAST(0.226687900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (143, 153, CAST(0x0000A60C00AC4DAD AS DateTime), 49, 1, 57, 15, 97, CAST(0.029884900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (144, 153, CAST(0x0000A60C00AC52D0 AS DateTime), 49, 1, 57, 15, 97, CAST(0.009475700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (145, 153, CAST(0x0000A60C00AC583F AS DateTime), 49, 1, 57, 15, 97, CAST(0.157442400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (146, 146, CAST(0x0000A60C00AC4180 AS DateTime), 47, 3, 81, 25, 135, CAST(0.005760000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (147, 146, CAST(0x0000A60C00AC4184 AS DateTime), 47, 3, 81, 25, 135, CAST(0.026330400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (148, 146, CAST(0x0000A60C00AC442C AS DateTime), 47, 3, 81, 25, 135, CAST(0.002160000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (149, 146, CAST(0x0000A60C00AC4430 AS DateTime), 47, 3, 81, 25, 135, CAST(0.020844900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (150, 151, CAST(0x0000A60C00AC493B AS DateTime), 49, 3, 81, 25, 135, CAST(0.082290000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (151, 146, CAST(0x0000A60C00AC493F AS DateTime), 47, 3, 81, 25, 135, CAST(0.013165200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (152, 151, CAST(0x0000A60C00AC4E02 AS DateTime), 49, 3, 81, 25, 135, CAST(0.049374000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (153, 151, CAST(0x0000A60C00AC4E06 AS DateTime), 49, 3, 81, 25, 135, CAST(0.016458000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (154, 151, CAST(0x0000A60C00AC4E0A AS DateTime), 49, 3, 81, 25, 135, CAST(0.001097100000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (155, 146, CAST(0x0000A60C00AC4E0E AS DateTime), 47, 3, 81, 25, 135, CAST(0.010971000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (156, 151, CAST(0x0000A60C00AC5331 AS DateTime), 49, 3, 81, 25, 135, CAST(0.000822900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (157, 151, CAST(0x0000A60C00AC5335 AS DateTime), 49, 3, 81, 25, 135, CAST(0.033738900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (158, 151, CAST(0x0000A60C00AC533A AS DateTime), 49, 3, 81, 25, 135, CAST(0.002194200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (159, 151, CAST(0x0000A60C00AC533F AS DateTime), 49, 3, 81, 25, 135, CAST(0.055539000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (160, 151, CAST(0x0000A60C00AC5898 AS DateTime), 49, 3, 81, 25, 135, CAST(0.000822900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (161, 151, CAST(0x0000A60C00AC589C AS DateTime), 49, 3, 81, 25, 135, CAST(0.001097100000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (162, 7, CAST(0x0000A60C00AC3CEF AS DateTime), 49, 3, 57, 16, 102, CAST(0.227120400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (163, 7, CAST(0x0000A60C00AC532C AS DateTime), 49, 3, 57, 16, 102, CAST(0.069946500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (164, 147, CAST(0x0000A60C00AC3CF4 AS DateTime), 47, 3, 58, 10, 70, CAST(0.001097100000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (165, 8, CAST(0x0000A60C00AC4427 AS DateTime), 49, 3, 58, 10, 80, CAST(0.000411400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (166, 8, CAST(0x0000A60C00AC492F AS DateTime), 49, 3, 58, 10, 80, CAST(0.004937400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (167, 8, CAST(0x0000A60C00AC4933 AS DateTime), 49, 3, 58, 10, 80, CAST(0.009051900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (168, 8, CAST(0x0000A60C00AC4937 AS DateTime), 49, 3, 58, 10, 80, CAST(0.000822800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (169, 128, CAST(0x0000A60C00AC4DFA AS DateTime), 48, 3, 58, 10, 82, CAST(0.001097100000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (170, 8, CAST(0x0000A60C00AC4DFE AS DateTime), 49, 3, 58, 10, 80, CAST(0.049374000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (171, 128, CAST(0x0000A60C00AC588F AS DateTime), 48, 3, 58, 10, 82, CAST(0.001234200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (172, 8, CAST(0x0000A60C00AC5894 AS DateTime), 49, 3, 58, 10, 70, CAST(0.156351000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (173, 9, CAST(0x0000A60C00AC3CF7 AS DateTime), 47, 3, 57, 7, 47, CAST(0.002194200000000 AS Decimal(20, 15)), 71, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (174, 9, CAST(0x0000A60C00AC4188 AS DateTime), 47, 3, 57, 7, 47, CAST(0.002194200000000 AS Decimal(20, 15)), 71, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (175, 9, CAST(0x0000A60C00AC4435 AS DateTime), 47, 3, 57, 7, 47, CAST(0.007679700000000 AS Decimal(20, 15)), 71, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (176, 151, CAST(0x0000A60C00AC4439 AS DateTime), 49, 41, 81, 25, 135, CAST(0.003399900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (177, 151, CAST(0x0000A60C00AC443E AS DateTime), 49, 41, 81, 25, 135, CAST(0.008006400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (178, 151, CAST(0x0000A60C00AC58A0 AS DateTime), 49, 41, 81, 25, 135, CAST(0.070000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (179, 151, CAST(0x0000A60C00AC58A4 AS DateTime), 49, 41, 81, 25, 135, CAST(0.000999900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (180, 151, CAST(0x0000A60C00AC58A8 AS DateTime), 49, 41, 81, 25, 135, CAST(0.002668800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (181, 142, CAST(0x0000A60C00AC3CFC AS DateTime), 50, 41, 58, 23, 125, CAST(0.004003200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (182, 142, CAST(0x0000A60C00AC4303 AS DateTime), 50, 41, 58, 23, 125, CAST(0.006672000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (183, 147, CAST(0x0000A60C00AC4443 AS DateTime), 47, 41, 58, 10, 70, CAST(0.000333000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (184, 143, CAST(0x0000A60C00AC4E12 AS DateTime), 50, 41, 58, 10, 80, CAST(0.001334400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (185, 143, CAST(0x0000A60C00AC5344 AS DateTime), 50, 41, 58, 10, 86, CAST(0.000664800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (186, 13, CAST(0x0000A60C00AC418C AS DateTime), 47, 41, 57, 7, 47, CAST(0.000666000000000 AS Decimal(20, 15)), 71, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (187, 13, CAST(0x0000A60C00AC4447 AS DateTime), 47, 41, 57, 7, 47, CAST(0.000333000000000 AS Decimal(20, 15)), 71, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (188, 13, CAST(0x0000A60C00AC4E16 AS DateTime), 47, 41, 57, 7, 47, CAST(0.001332000000000 AS Decimal(20, 15)), 71, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (189, 14, CAST(0x0000A60C00AC58AC AS DateTime), 47, 41, 81, 139, 138, CAST(0.001998000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (190, 126, CAST(0x0000A60C00AC3D04 AS DateTime), 48, 42, 81, 25, 135, CAST(0.014221200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (191, 126, CAST(0x0000A60C00AC3D09 AS DateTime), 48, 42, 81, 25, 134, CAST(0.038601600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (192, 151, CAST(0x0000A60C00AC3D0D AS DateTime), 49, 42, 81, 25, 134, CAST(15.784471500000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (193, 151, CAST(0x0000A60C00AC3D11 AS DateTime), 49, 42, 81, 25, 134, CAST(0.099045000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (194, 151, CAST(0x0000A60C00AC3D16 AS DateTime), 49, 42, 81, 25, 134, CAST(0.676324800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (195, 151, CAST(0x0000A60C00AC3D1A AS DateTime), 49, 42, 81, 25, 134, CAST(0.066840000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (196, 151, CAST(0x0000A60C00AC3D1E AS DateTime), 49, 42, 81, 25, 133, CAST(0.030160000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (197, 141, CAST(0x0000A60C00AC3D34 AS DateTime), 50, 42, 81, 25, 135, CAST(0.010582000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (198, 146, CAST(0x0000A60C00AC3D38 AS DateTime), 47, 42, 81, 25, 135, CAST(0.001396800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (199, 141, CAST(0x0000A60C00AC4195 AS DateTime), 50, 42, 81, 25, 135, CAST(0.007936500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (200, 126, CAST(0x0000A60C00AC444E AS DateTime), 48, 42, 81, 25, 134, CAST(0.001206300000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (201, 126, CAST(0x0000A60C00AC4456 AS DateTime), 48, 42, 81, 25, 135, CAST(0.094816000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (202, 126, CAST(0x0000A60C00AC445A AS DateTime), 48, 42, 81, 25, 135, CAST(0.017268600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (203, 151, CAST(0x0000A60C00AC4463 AS DateTime), 49, 42, 81, 25, 134, CAST(4.991868000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (204, 151, CAST(0x0000A60C00AC4467 AS DateTime), 49, 42, 81, 25, 134, CAST(0.058843800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (205, 151, CAST(0x0000A60C00AC446B AS DateTime), 49, 42, 81, 25, 133, CAST(0.052824000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (206, 151, CAST(0x0000A60C00AC4473 AS DateTime), 49, 42, 81, 25, 134, CAST(0.013147200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (207, 151, CAST(0x0000A60C00AC4477 AS DateTime), 49, 42, 81, 25, 135, CAST(0.018370600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (208, 151, CAST(0x0000A60C00AC447A AS DateTime), 49, 42, 81, 25, 135, CAST(0.174979500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (209, 151, CAST(0x0000A60C00AC447F AS DateTime), 49, 42, 81, 25, 135, CAST(0.020634000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (210, 151, CAST(0x0000A60C00AC4947 AS DateTime), 49, 42, 81, 25, 134, CAST(0.129940800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (211, 151, CAST(0x0000A60C00AC494A AS DateTime), 49, 42, 81, 25, 134, CAST(0.133782000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (212, 151, CAST(0x0000A60C00AC4956 AS DateTime), 49, 42, 81, 25, 134, CAST(0.022642400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (213, 151, CAST(0x0000A60C00AC495F AS DateTime), 49, 42, 81, 25, 135, CAST(0.264120000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (214, 126, CAST(0x0000A60C00AC4E1E AS DateTime), 48, 42, 81, 25, 135, CAST(0.014221200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (215, 151, CAST(0x0000A60C00AC4E22 AS DateTime), 49, 42, 81, 25, 134, CAST(0.168483600000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (216, 151, CAST(0x0000A60C00AC4E2E AS DateTime), 49, 42, 81, 25, 135, CAST(0.017608000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (217, 151, CAST(0x0000A60C00AC4E32 AS DateTime), 49, 42, 81, 25, 135, CAST(0.084120000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (218, 141, CAST(0x0000A60C00AC4E3F AS DateTime), 50, 42, 81, 25, 135, CAST(1.430585600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (219, 151, CAST(0x0000A60C00AC5351 AS DateTime), 49, 42, 81, 25, 134, CAST(1.525114800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (220, 151, CAST(0x0000A60C00AC5355 AS DateTime), 49, 42, 81, 25, 134, CAST(0.104593200000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (221, 151, CAST(0x0000A60C00AC5359 AS DateTime), 49, 42, 81, 25, 134, CAST(0.130741600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (222, 151, CAST(0x0000A60C00AC535D AS DateTime), 49, 42, 81, 25, 135, CAST(0.024211000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (223, 151, CAST(0x0000A60C00AC5362 AS DateTime), 49, 42, 81, 25, 135, CAST(0.027512500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (224, 151, CAST(0x0000A60C00AC5366 AS DateTime), 49, 42, 81, 25, 135, CAST(0.003174400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (225, 151, CAST(0x0000A60C00AC536B AS DateTime), 49, 42, 81, 25, 135, CAST(0.254177700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (226, 141, CAST(0x0000A60C00AC5383 AS DateTime), 50, 42, 81, 25, 135, CAST(0.201058000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (227, 151, CAST(0x0000A60C00AC58B1 AS DateTime), 49, 42, 81, 25, 134, CAST(0.013206000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (228, 151, CAST(0x0000A60C00AC58B5 AS DateTime), 49, 42, 81, 25, 134, CAST(0.811205400000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (229, 151, CAST(0x0000A60C00AC58B8 AS DateTime), 49, 42, 81, 25, 134, CAST(0.049667200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (230, 151, CAST(0x0000A60C00AC58BC AS DateTime), 49, 42, 81, 25, 135, CAST(0.005158400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (231, 151, CAST(0x0000A60C00AC58C0 AS DateTime), 49, 42, 81, 25, 135, CAST(0.000730400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (232, 151, CAST(0x0000A60C00AC58C3 AS DateTime), 49, 42, 81, 25, 135, CAST(0.067296000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (233, 141, CAST(0x0000A60C00AC58CC AS DateTime), 50, 42, 81, 25, 135, CAST(0.001058200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (234, 154, CAST(0x0000A60C00AC446F AS DateTime), 49, 42, 57, 9, 62, CAST(0.021926200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (235, 154, CAST(0x0000A60C00AC4952 AS DateTime), 49, 42, 57, 9, 62, CAST(0.045630200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (236, 154, CAST(0x0000A60C00AC4E26 AS DateTime), 49, 42, 57, 9, 62, CAST(0.148150000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (237, 154, CAST(0x0000A60C00AC4E2A AS DateTime), 49, 42, 57, 9, 62, CAST(0.005926000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (238, 128, CAST(0x0000A60C00AC3D00 AS DateTime), 48, 42, 58, 10, 80, CAST(0.002370400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (239, 143, CAST(0x0000A60C00AC3D2C AS DateTime), 50, 42, 58, 10, 86, CAST(0.001058200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (240, 143, CAST(0x0000A60C00AC3D30 AS DateTime), 50, 42, 58, 10, 80, CAST(0.007539800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (241, 128, CAST(0x0000A60C00AC444A AS DateTime), 48, 42, 58, 10, 83, CAST(0.001984000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (242, 128, CAST(0x0000A60C00AC4452 AS DateTime), 48, 42, 58, 10, 82, CAST(0.001587400000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (243, 128, CAST(0x0000A60C00AC445F AS DateTime), 48, 42, 58, 10, 83, CAST(0.007936000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (244, 143, CAST(0x0000A60C00AC4483 AS DateTime), 50, 42, 58, 10, 80, CAST(0.000793700000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (245, 128, CAST(0x0000A60C00AC4943 AS DateTime), 48, 42, 58, 10, 83, CAST(0.001190400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (246, 17, CAST(0x0000A60C00AC4963 AS DateTime), 53, 42, 58, 10, 83, CAST(0.002380800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (247, 143, CAST(0x0000A60C00AC496A AS DateTime), 50, 42, 58, 10, 80, CAST(0.001587300000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (248, 128, CAST(0x0000A60C00AC4E1A AS DateTime), 48, 42, 58, 10, 83, CAST(0.007936000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (249, 128, CAST(0x0000A60C00AC5348 AS DateTime), 48, 42, 58, 10, 83, CAST(0.004761600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (250, 128, CAST(0x0000A60C00AC534C AS DateTime), 48, 42, 58, 10, 80, CAST(0.002338600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (251, 143, CAST(0x0000A60C00AC5376 AS DateTime), 50, 42, 58, 10, 86, CAST(0.158237297880000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (252, 143, CAST(0x0000A60C00AC537A AS DateTime), 50, 42, 58, 10, 86, CAST(0.001058200000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (253, 143, CAST(0x0000A60C00AC537F AS DateTime), 50, 42, 58, 10, 86, CAST(0.008465600000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (254, 143, CAST(0x0000A60C00AC58C7 AS DateTime), 50, 42, 58, 10, 70, CAST(0.003041500000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (255, 18, CAST(0x0000A60C00AC495A AS DateTime), 49, 42, 58, 24, 129, CAST(0.085802400000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (256, 133, CAST(0x0000A60C00AC3D23 AS DateTime), 53, 42, 58, 23, 125, CAST(0.019800000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (257, 133, CAST(0x0000A60C00AC4190 AS DateTime), 53, 42, 58, 23, 125, CAST(0.027720000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (258, 133, CAST(0x0000A60C00AC4966 AS DateTime), 53, 42, 58, 23, 125, CAST(0.002376000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (259, 126, CAST(0x0000A60C00AC3D3C AS DateTime), 48, 4, 81, 25, 134, CAST(1.142302600000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (260, 126, CAST(0x0000A60C00AC3D40 AS DateTime), 48, 4, 81, 25, 134, CAST(0.121500000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (261, 126, CAST(0x0000A60C00AC3D44 AS DateTime), 48, 4, 81, 25, 132, CAST(0.001777800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (262, 151, CAST(0x0000A60C00AC3D66 AS DateTime), 49, 4, 81, 25, 134, CAST(0.863200000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (263, 151, CAST(0x0000A60C00AC3D7C AS DateTime), 49, 4, 81, 25, 135, CAST(3.000481360000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (264, 151, CAST(0x0000A60C00AC3D81 AS DateTime), 49, 4, 81, 25, 135, CAST(0.582703334000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (265, 146, CAST(0x0000A60C00AC3D89 AS DateTime), 47, 4, 81, 25, 135, CAST(0.007266300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (266, 126, CAST(0x0000A60C00AC448A AS DateTime), 48, 4, 81, 25, 134, CAST(2.624505100000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (267, 126, CAST(0x0000A60C00AC448E AS DateTime), 48, 4, 81, 25, 134, CAST(0.045000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (268, 126, CAST(0x0000A60C00AC449B AS DateTime), 48, 4, 81, 25, 135, CAST(1.244834500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (269, 126, CAST(0x0000A60C00AC449E AS DateTime), 48, 4, 81, 25, 132, CAST(0.053334000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (270, 151, CAST(0x0000A60C00AC44A7 AS DateTime), 49, 4, 81, 25, 135, CAST(0.746038200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (271, 151, CAST(0x0000A60C00AC44AA AS DateTime), 49, 4, 81, 25, 135, CAST(0.814196467800000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (272, 146, CAST(0x0000A60C00AC44BA AS DateTime), 47, 4, 81, 25, 135, CAST(0.000533300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (273, 126, CAST(0x0000A60C00AC496E AS DateTime), 48, 4, 81, 25, 134, CAST(0.200164400000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (274, 126, CAST(0x0000A60C00AC4972 AS DateTime), 48, 4, 81, 25, 134, CAST(0.572651600000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (275, 126, CAST(0x0000A60C00AC4986 AS DateTime), 48, 4, 81, 25, 135, CAST(0.492507500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (276, 151, CAST(0x0000A60C00AC498D AS DateTime), 49, 4, 81, 25, 134, CAST(0.005200200000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (277, 151, CAST(0x0000A60C00AC499A AS DateTime), 49, 4, 81, 25, 135, CAST(0.832774200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (278, 151, CAST(0x0000A60C00AC499E AS DateTime), 49, 4, 81, 25, 135, CAST(0.991996750000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (279, 146, CAST(0x0000A60C00AC49AA AS DateTime), 47, 4, 81, 25, 135, CAST(0.005066400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (280, 126, CAST(0x0000A60C00AC4E43 AS DateTime), 48, 4, 81, 25, 134, CAST(0.265500000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (281, 126, CAST(0x0000A60C00AC4E47 AS DateTime), 48, 4, 81, 25, 132, CAST(0.159113100000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (282, 126, CAST(0x0000A60C00AC4E6D AS DateTime), 48, 4, 81, 25, 132, CAST(0.077334300000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (283, 151, CAST(0x0000A60C00AC4E72 AS DateTime), 49, 4, 81, 25, 134, CAST(0.369315000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (284, 151, CAST(0x0000A60C00AC4E86 AS DateTime), 49, 4, 81, 25, 135, CAST(2.706491500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (285, 151, CAST(0x0000A60C00AC4E8A AS DateTime), 49, 4, 81, 25, 135, CAST(0.000533300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (286, 146, CAST(0x0000A60C00AC4E91 AS DateTime), 47, 4, 81, 25, 135, CAST(0.009333500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (287, 126, CAST(0x0000A60C00AC538B AS DateTime), 48, 4, 81, 25, 134, CAST(4.061197500000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (288, 126, CAST(0x0000A60C00AC538F AS DateTime), 48, 4, 81, 25, 134, CAST(0.146997000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (289, 126, CAST(0x0000A60C00AC5396 AS DateTime), 48, 4, 81, 25, 132, CAST(0.026667000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (290, 126, CAST(0x0000A60C00AC53A2 AS DateTime), 48, 4, 81, 25, 132, CAST(0.028800000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (291, 151, CAST(0x0000A60C00AC53B6 AS DateTime), 49, 4, 81, 25, 135, CAST(0.283559100000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (292, 151, CAST(0x0000A60C00AC53BA AS DateTime), 49, 4, 81, 25, 135, CAST(0.169868400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (293, 151, CAST(0x0000A60C00AC53BF AS DateTime), 49, 4, 81, 25, 135, CAST(0.703480900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (294, 126, CAST(0x0000A60C00AC58D5 AS DateTime), 48, 4, 81, 25, 134, CAST(4.247520100000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (295, 126, CAST(0x0000A60C00AC58D9 AS DateTime), 48, 4, 81, 25, 134, CAST(0.385488000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (296, 126, CAST(0x0000A60C00AC58DD AS DateTime), 48, 4, 81, 25, 132, CAST(0.081778800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (297, 126, CAST(0x0000A60C00AC58E1 AS DateTime), 48, 4, 81, 25, 132, CAST(0.027900000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (298, 126, CAST(0x0000A60C00AC58F6 AS DateTime), 48, 4, 81, 25, 132, CAST(0.081000000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (299, 151, CAST(0x0000A60C00AC58F9 AS DateTime), 49, 4, 81, 25, 134, CAST(0.000888900000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (300, 151, CAST(0x0000A60C00AC58FE AS DateTime), 49, 4, 81, 25, 134, CAST(0.009533700000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (301, 151, CAST(0x0000A60C00AC590A AS DateTime), 49, 4, 81, 25, 135, CAST(0.069669500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (302, 146, CAST(0x0000A60C00AC5916 AS DateTime), 47, 4, 81, 25, 135, CAST(0.003199800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (303, 152, CAST(0x0000A60C00AC3D6B AS DateTime), 49, 4, 58, 23, 125, CAST(0.037799800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (304, 148, CAST(0x0000A60C00AC3D85 AS DateTime), 47, 4, 58, 23, 125, CAST(0.203997000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (305, 152, CAST(0x0000A60C00AC44A3 AS DateTime), 49, 4, 58, 23, 125, CAST(0.241397400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (306, 148, CAST(0x0000A60C00AC44B6 AS DateTime), 47, 4, 58, 23, 125, CAST(0.024000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (307, 152, CAST(0x0000A60C00AC4991 AS DateTime), 49, 4, 58, 23, 125, CAST(0.594333500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (308, 158, CAST(0x0000A60C00AC49A2 AS DateTime), 54, 4, 58, 23, 125, CAST(0.128000000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (309, 148, CAST(0x0000A60C00AC49A6 AS DateTime), 47, 4, 58, 23, 125, CAST(0.016000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (310, 152, CAST(0x0000A60C00AC4E76 AS DateTime), 49, 4, 58, 23, 125, CAST(0.342660500000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (311, 152, CAST(0x0000A60C00AC4E79 AS DateTime), 49, 4, 58, 23, 125, CAST(0.499390950000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (312, 148, CAST(0x0000A60C00AC4E8E AS DateTime), 47, 4, 58, 23, 125, CAST(0.326912900000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (313, 152, CAST(0x0000A60C00AC53A6 AS DateTime), 49, 4, 58, 23, 125, CAST(0.017778500000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (314, 152, CAST(0x0000A60C00AC53AA AS DateTime), 49, 4, 58, 23, 125, CAST(0.088004000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (315, 148, CAST(0x0000A60C00AC53C2 AS DateTime), 47, 4, 58, 23, 125, CAST(0.041067600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (316, 158, CAST(0x0000A60C00AC590D AS DateTime), 54, 4, 58, 23, 125, CAST(0.457000000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (317, 148, CAST(0x0000A60C00AC5912 AS DateTime), 47, 4, 58, 23, 125, CAST(0.027555900000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (318, 128, CAST(0x0000A60C00AC3D49 AS DateTime), 48, 4, 58, 10, 81, CAST(0.031201200000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (319, 128, CAST(0x0000A60C00AC3D4D AS DateTime), 48, 4, 58, 10, 81, CAST(0.001500000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (320, 128, CAST(0x0000A60C00AC3D51 AS DateTime), 48, 4, 58, 10, 82, CAST(0.001600000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (321, 128, CAST(0x0000A60C00AC3D55 AS DateTime), 48, 4, 58, 10, 82, CAST(0.009066600000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (322, 128, CAST(0x0000A60C00AC3D5A AS DateTime), 48, 4, 58, 10, 86, CAST(0.028444800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (323, 128, CAST(0x0000A60C00AC3D5E AS DateTime), 48, 4, 58, 10, 80, CAST(0.003222200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (324, 128, CAST(0x0000A60C00AC3D62 AS DateTime), 48, 4, 58, 10, 81, CAST(0.000888900000000 AS Decimal(20, 15)), 74, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (325, 22, CAST(0x0000A60C00AC3D78 AS DateTime), 49, 4, 58, 10, 80, CAST(0.005833100000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (326, 128, CAST(0x0000A60C00AC4492 AS DateTime), 48, 4, 58, 10, 70, CAST(0.003999300000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (327, 128, CAST(0x0000A60C00AC4496 AS DateTime), 48, 4, 58, 10, 82, CAST(0.007111200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (328, 160, CAST(0x0000A60C00AC44AE AS DateTime), 54, 4, 58, 10, 84, CAST(0.002400000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (329, 160, CAST(0x0000A60C00AC44B2 AS DateTime), 54, 4, 58, 10, 86, CAST(0.001600000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (330, 162, CAST(0x0000A60C00AC44C2 AS DateTime), 51, 4, 58, 10, 86, CAST(0.091020800000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (331, 128, CAST(0x0000A60C00AC4976 AS DateTime), 48, 4, 58, 10, 81, CAST(0.000800000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (332, 128, CAST(0x0000A60C00AC497A AS DateTime), 48, 4, 58, 10, 82, CAST(0.001666700000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (333, 128, CAST(0x0000A60C00AC497E AS DateTime), 48, 4, 58, 10, 86, CAST(0.001200000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (334, 128, CAST(0x0000A60C00AC4983 AS DateTime), 48, 4, 58, 10, 80, CAST(0.011044500000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (335, 22, CAST(0x0000A60C00AC4996 AS DateTime), 49, 4, 58, 10, 80, CAST(0.007810850000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (336, 162, CAST(0x0000A60C00AC49B3 AS DateTime), 51, 4, 58, 10, 86, CAST(0.127996800000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (337, 162, CAST(0x0000A60C00AC49B7 AS DateTime), 51, 4, 58, 10, 80, CAST(0.001422200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (338, 128, CAST(0x0000A60C00AC4E4B AS DateTime), 48, 4, 58, 10, 70, CAST(0.013333000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (339, 128, CAST(0x0000A60C00AC4E4F AS DateTime), 48, 4, 58, 10, 81, CAST(0.004288900000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (340, 128, CAST(0x0000A60C00AC4E53 AS DateTime), 48, 4, 58, 10, 82, CAST(0.001000000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (341, 128, CAST(0x0000A60C00AC4E57 AS DateTime), 48, 4, 58, 10, 82, CAST(0.002233300000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (342, 128, CAST(0x0000A60C00AC4E5C AS DateTime), 48, 4, 58, 10, 80, CAST(0.003888900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (343, 128, CAST(0x0000A60C00AC4E61 AS DateTime), 48, 4, 58, 10, 80, CAST(0.000888900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (344, 128, CAST(0x0000A60C00AC4E65 AS DateTime), 48, 4, 58, 10, 81, CAST(0.028444000000000 AS Decimal(20, 15)), 74, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (345, 128, CAST(0x0000A60C00AC4E6A AS DateTime), 48, 4, 58, 10, 81, CAST(0.000888900000000 AS Decimal(20, 15)), 74, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (346, 22, CAST(0x0000A60C00AC4E7F AS DateTime), 49, 4, 58, 10, 86, CAST(0.141675000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (347, 22, CAST(0x0000A60C00AC4E82 AS DateTime), 49, 4, 58, 10, 80, CAST(0.019167240290000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (348, 162, CAST(0x0000A60C00AC4E96 AS DateTime), 51, 4, 58, 10, 70, CAST(0.007111000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (349, 162, CAST(0x0000A60C00AC4E9A AS DateTime), 51, 4, 58, 10, 86, CAST(0.045510400000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (350, 162, CAST(0x0000A60C00AC4E9D AS DateTime), 51, 4, 58, 10, 80, CAST(0.006577700000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (351, 128, CAST(0x0000A60C00AC539B AS DateTime), 48, 4, 58, 10, 70, CAST(0.013333000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (352, 128, CAST(0x0000A60C00AC539E AS DateTime), 48, 4, 58, 10, 86, CAST(0.001600000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (353, 22, CAST(0x0000A60C00AC53B2 AS DateTime), 49, 4, 58, 10, 80, CAST(0.002466562500000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (354, 147, CAST(0x0000A60C00AC53C6 AS DateTime), 47, 4, 58, 10, 70, CAST(0.029334000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (355, 162, CAST(0x0000A60C00AC53CB AS DateTime), 51, 4, 58, 10, 70, CAST(0.001422200000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (356, 162, CAST(0x0000A60C00AC53CF AS DateTime), 51, 4, 58, 10, 86, CAST(0.045510400000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (357, 128, CAST(0x0000A60C00AC58E4 AS DateTime), 48, 4, 58, 10, 70, CAST(0.002666000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (358, 128, CAST(0x0000A60C00AC58E9 AS DateTime), 48, 4, 58, 10, 82, CAST(0.001533400000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (359, 128, CAST(0x0000A60C00AC58ED AS DateTime), 48, 4, 58, 10, 86, CAST(0.021333600000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (360, 128, CAST(0x0000A60C00AC58F2 AS DateTime), 48, 4, 58, 10, 80, CAST(0.043701900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (361, 162, CAST(0x0000A60C00AC591A AS DateTime), 51, 4, 58, 10, 86, CAST(0.136531200000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (362, 154, CAST(0x0000A60C00AC5901 AS DateTime), 49, 4, 57, 9, 62, CAST(0.705361987500000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (363, 24, CAST(0x0000A60C00AC49AE AS DateTime), 47, 4, 57, 7, 47, CAST(0.004666900000000 AS Decimal(20, 15)), 74, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (364, 24, CAST(0x0000A60C00AC53AE AS DateTime), 49, 4, 57, 7, 49, CAST(0.047833162500000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (365, 24, CAST(0x0000A60C00AC5906 AS DateTime), 49, 4, 57, 7, 49, CAST(0.074666400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (366, 126, CAST(0x0000A60C00AC3D8D AS DateTime), 48, 5, 81, 25, 134, CAST(0.048000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (367, 141, CAST(0x0000A60C00AC3DBE AS DateTime), 50, 5, 81, 25, 135, CAST(0.077625000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (368, 126, CAST(0x0000A60C00AC44C6 AS DateTime), 48, 5, 81, 25, 134, CAST(0.900000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (369, 126, CAST(0x0000A60C00AC44CE AS DateTime), 48, 5, 81, 25, 135, CAST(1.053500000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (370, 126, CAST(0x0000A60C00AC49BB AS DateTime), 48, 5, 81, 25, 134, CAST(0.012000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (371, 126, CAST(0x0000A60C00AC4EA1 AS DateTime), 48, 5, 81, 25, 134, CAST(0.096000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (372, 126, CAST(0x0000A60C00AC4EA5 AS DateTime), 48, 5, 81, 25, 135, CAST(0.012000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (373, 141, CAST(0x0000A60C00AC4EB9 AS DateTime), 50, 5, 81, 25, 135, CAST(0.063750000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (374, 126, CAST(0x0000A60C00AC53D3 AS DateTime), 48, 5, 81, 25, 134, CAST(0.072000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (375, 141, CAST(0x0000A60C00AC53EF AS DateTime), 50, 5, 81, 25, 135, CAST(0.238500000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (376, 126, CAST(0x0000A60C00AC5921 AS DateTime), 48, 5, 81, 25, 134, CAST(0.127000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (377, 145, CAST(0x0000A60C00AC49C0 AS DateTime), 50, 5, 57, 8, 59, CAST(0.680400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (378, 145, CAST(0x0000A60C00AC4EB1 AS DateTime), 50, 5, 57, 8, 59, CAST(0.255150000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (379, 145, CAST(0x0000A60C00AC53DB AS DateTime), 50, 5, 57, 8, 59, CAST(0.212625000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (380, 145, CAST(0x0000A60C00AC5929 AS DateTime), 50, 5, 57, 8, 59, CAST(0.042525000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (381, 145, CAST(0x0000A60C00AC5939 AS DateTime), 50, 5, 57, 8, 59, CAST(0.340200000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (382, 128, CAST(0x0000A60C00AC3D91 AS DateTime), 48, 5, 58, 10, 70, CAST(0.020250000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (383, 143, CAST(0x0000A60C00AC3D96 AS DateTime), 50, 5, 58, 10, 82, CAST(0.004725600000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (384, 143, CAST(0x0000A60C00AC3D9A AS DateTime), 50, 5, 58, 10, 78, CAST(0.021037500000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (385, 143, CAST(0x0000A60C00AC3D9F AS DateTime), 50, 5, 58, 10, 80, CAST(0.001800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (386, 128, CAST(0x0000A60C00AC44CA AS DateTime), 48, 5, 58, 10, 82, CAST(0.001000000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (387, 143, CAST(0x0000A60C00AC44D1 AS DateTime), 50, 5, 58, 10, 82, CAST(0.010800000000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (388, 143, CAST(0x0000A60C00AC44D6 AS DateTime), 50, 5, 58, 10, 80, CAST(0.003000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (389, 143, CAST(0x0000A60C00AC49C4 AS DateTime), 50, 5, 58, 10, 86, CAST(0.000750000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (390, 143, CAST(0x0000A60C00AC49C8 AS DateTime), 50, 5, 58, 10, 80, CAST(0.001500000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (391, 143, CAST(0x0000A60C00AC4EB5 AS DateTime), 50, 5, 58, 10, 80, CAST(0.001687500000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (392, 143, CAST(0x0000A60C00AC53DF AS DateTime), 50, 5, 58, 10, 81, CAST(0.011250000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (393, 143, CAST(0x0000A60C00AC53E3 AS DateTime), 50, 5, 58, 10, 86, CAST(0.157950000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (394, 143, CAST(0x0000A60C00AC53E7 AS DateTime), 50, 5, 58, 10, 86, CAST(0.023760000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (395, 143, CAST(0x0000A60C00AC592D AS DateTime), 50, 5, 58, 10, 82, CAST(0.000562500000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (396, 143, CAST(0x0000A60C00AC5932 AS DateTime), 50, 5, 58, 10, 86, CAST(0.147825000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (397, 143, CAST(0x0000A60C00AC5935 AS DateTime), 50, 5, 58, 10, 86, CAST(0.263250000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (398, 143, CAST(0x0000A60C00AC593D AS DateTime), 50, 5, 58, 10, 78, CAST(0.003750000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (399, 143, CAST(0x0000A60C00AC5941 AS DateTime), 50, 5, 58, 10, 80, CAST(0.002437500000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (400, 161, CAST(0x0000A60C00AC4EA9 AS DateTime), 54, 5, 58, 22, 118, CAST(0.002700000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (401, 150, CAST(0x0000A60C00AC53F8 AS DateTime), 47, 5, 58, 22, 118, CAST(0.199800000000000 AS Decimal(20, 15)), 77, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (402, 134, CAST(0x0000A60C00AC419A AS DateTime), 53, 5, 57, 9, 67, CAST(0.002812500000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (403, 134, CAST(0x0000A60C00AC4EAD AS DateTime), 53, 5, 57, 9, 67, CAST(0.007875000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (404, 134, CAST(0x0000A60C00AC53D7 AS DateTime), 53, 5, 57, 9, 67, CAST(0.002812500000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (405, 134, CAST(0x0000A60C00AC5925 AS DateTime), 53, 5, 57, 9, 67, CAST(0.000562500000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (406, 29, CAST(0x0000A60C00AC594A AS DateTime), 47, 5, 57, 9, 67, CAST(0.045000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (407, 151, CAST(0x0000A60C00AC3DC3 AS DateTime), 49, 6, 81, 25, 135, CAST(0.003152800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (408, 151, CAST(0x0000A60C00AC3DC6 AS DateTime), 49, 6, 81, 25, 135, CAST(0.015764000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (409, 141, CAST(0x0000A60C00AC3DD3 AS DateTime), 50, 6, 81, 25, 132, CAST(0.206577800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (410, 141, CAST(0x0000A60C00AC3DD7 AS DateTime), 50, 6, 81, 25, 132, CAST(0.001329900000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (411, 141, CAST(0x0000A60C00AC3DDF AS DateTime), 50, 6, 81, 25, 132, CAST(0.069154800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (412, 141, CAST(0x0000A60C00AC3DE2 AS DateTime), 50, 6, 81, 25, 132, CAST(0.059845500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (413, 141, CAST(0x0000A60C00AC3E01 AS DateTime), 50, 6, 81, 25, 135, CAST(0.042575500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (414, 141, CAST(0x0000A60C00AC41A1 AS DateTime), 50, 6, 81, 25, 132, CAST(0.009752600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (415, 141, CAST(0x0000A60C00AC4306 AS DateTime), 50, 6, 81, 25, 132, CAST(0.029701100000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (416, 141, CAST(0x0000A60C00AC4312 AS DateTime), 50, 6, 81, 25, 135, CAST(0.063060000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (417, 151, CAST(0x0000A60C00AC44E6 AS DateTime), 49, 6, 81, 25, 135, CAST(0.373023000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (418, 151, CAST(0x0000A60C00AC49CF AS DateTime), 49, 6, 81, 25, 135, CAST(0.009665900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (419, 151, CAST(0x0000A60C00AC49D3 AS DateTime), 49, 6, 81, 25, 135, CAST(0.446521200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (420, 151, CAST(0x0000A60C00AC4EBD AS DateTime), 49, 6, 81, 25, 135, CAST(0.005517200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (421, 151, CAST(0x0000A60C00AC4EC1 AS DateTime), 49, 6, 81, 25, 135, CAST(0.020700700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (422, 151, CAST(0x0000A60C00AC53FC AS DateTime), 49, 6, 81, 25, 135, CAST(0.013606700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (423, 151, CAST(0x0000A60C00AC5401 AS DateTime), 49, 6, 81, 25, 135, CAST(0.353888300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (424, 141, CAST(0x0000A60C00AC5425 AS DateTime), 50, 6, 81, 25, 135, CAST(0.002458800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (425, 141, CAST(0x0000A60C00AC5429 AS DateTime), 50, 6, 81, 25, 135, CAST(0.044568700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (426, 132, CAST(0x0000A60C00AC3DCB AS DateTime), 53, 6, 57, 6, 36, CAST(0.009140800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (427, 156, CAST(0x0000A60C00AC3DCF AS DateTime), 55, 6, 57, 6, 36, CAST(0.046696900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (428, 144, CAST(0x0000A60C00AC3DE6 AS DateTime), 50, 6, 57, 6, 37, CAST(0.104618800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (429, 132, CAST(0x0000A60C00AC419E AS DateTime), 53, 6, 57, 6, 36, CAST(0.002836800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (430, 144, CAST(0x0000A60C00AC430A AS DateTime), 50, 6, 57, 6, 37, CAST(0.018618600000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (431, 144, CAST(0x0000A60C00AC44F3 AS DateTime), 50, 6, 57, 6, 37, CAST(0.113508000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (432, 144, CAST(0x0000A60C00AC44F7 AS DateTime), 50, 6, 57, 6, 37, CAST(0.018602700000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (433, 132, CAST(0x0000A60C00AC49D6 AS DateTime), 53, 6, 57, 6, 36, CAST(0.001260800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (434, 132, CAST(0x0000A60C00AC4EC5 AS DateTime), 53, 6, 57, 6, 36, CAST(0.006619200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (435, 137, CAST(0x0000A60C00AC4EC9 AS DateTime), 52, 6, 57, 6, 40, CAST(0.012947800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (436, 144, CAST(0x0000A60C00AC4EDD AS DateTime), 50, 6, 57, 6, 37, CAST(0.095309500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (437, 144, CAST(0x0000A60C00AC4EE5 AS DateTime), 50, 6, 57, 6, 37, CAST(0.314743000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (438, 144, CAST(0x0000A60C00AC5419 AS DateTime), 50, 6, 57, 6, 37, CAST(0.155494200000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (439, 142, CAST(0x0000A60C00AC3DDB AS DateTime), 50, 6, 58, 23, 125, CAST(0.086890000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (440, 142, CAST(0x0000A60C00AC41A5 AS DateTime), 50, 6, 58, 23, 125, CAST(0.094590000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (441, 152, CAST(0x0000A60C00AC44E2 AS DateTime), 49, 6, 58, 23, 125, CAST(0.052017900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (442, 142, CAST(0x0000A60C00AC44EE AS DateTime), 50, 6, 58, 23, 125, CAST(0.054231600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (443, 152, CAST(0x0000A60C00AC49CB AS DateTime), 49, 6, 58, 23, 125, CAST(0.086696500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (444, 142, CAST(0x0000A60C00AC49DB AS DateTime), 50, 6, 58, 23, 125, CAST(0.119247700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (445, 142, CAST(0x0000A60C00AC49DF AS DateTime), 50, 6, 58, 23, 125, CAST(0.084185100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (446, 33, CAST(0x0000A60C00AC3DEE AS DateTime), 50, 6, 58, 11, 89, CAST(0.207467400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (447, 33, CAST(0x0000A60C00AC44E9 AS DateTime), 50, 6, 58, 11, 90, CAST(0.004105400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (448, 143, CAST(0x0000A60C00AC3DEA AS DateTime), 50, 6, 58, 10, 78, CAST(0.089229900000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (449, 143, CAST(0x0000A60C00AC3DF8 AS DateTime), 50, 6, 58, 10, 80, CAST(0.018444100000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (450, 143, CAST(0x0000A60C00AC3DFC AS DateTime), 50, 6, 58, 10, 80, CAST(0.003458000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (451, 143, CAST(0x0000A60C00AC430E AS DateTime), 50, 6, 58, 10, 78, CAST(0.013595300000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (452, 143, CAST(0x0000A60C00AC44FC AS DateTime), 50, 6, 58, 10, 78, CAST(0.004137700000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (453, 143, CAST(0x0000A60C00AC49E3 AS DateTime), 50, 6, 58, 10, 78, CAST(0.000315300000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (454, 143, CAST(0x0000A60C00AC49E7 AS DateTime), 50, 6, 58, 10, 80, CAST(0.000315300000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (455, 143, CAST(0x0000A60C00AC4EE2 AS DateTime), 50, 6, 58, 10, 85, CAST(0.018918000000000 AS Decimal(20, 15)), 78, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (456, 143, CAST(0x0000A60C00AC4EE9 AS DateTime), 50, 6, 58, 10, 78, CAST(0.019623800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (457, 143, CAST(0x0000A60C00AC4EF1 AS DateTime), 50, 6, 58, 10, 80, CAST(0.001222700000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (458, 143, CAST(0x0000A60C00AC540D AS DateTime), 50, 6, 58, 10, 81, CAST(0.000273200000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (459, 143, CAST(0x0000A60C00AC5410 AS DateTime), 50, 6, 58, 10, 81, CAST(0.000354600000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (460, 143, CAST(0x0000A60C00AC5414 AS DateTime), 50, 6, 58, 10, 86, CAST(0.001912400000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (461, 143, CAST(0x0000A60C00AC541D AS DateTime), 50, 6, 58, 10, 78, CAST(0.003468300000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (462, 143, CAST(0x0000A60C00AC5421 AS DateTime), 50, 6, 58, 10, 80, CAST(0.000631600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (463, 126, CAST(0x0000A60C00AC3E09 AS DateTime), 48, 7, 81, 25, 132, CAST(0.028663800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (464, 151, CAST(0x0000A60C00AC3E0D AS DateTime), 49, 7, 81, 25, 135, CAST(0.010665600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (465, 151, CAST(0x0000A60C00AC3E11 AS DateTime), 49, 7, 81, 25, 135, CAST(0.021470400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (466, 126, CAST(0x0000A60C00AC4504 AS DateTime), 48, 7, 81, 25, 132, CAST(0.001333200000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (467, 151, CAST(0x0000A60C00AC450A AS DateTime), 49, 7, 81, 25, 135, CAST(0.026664000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (468, 126, CAST(0x0000A60C00AC49F6 AS DateTime), 48, 7, 81, 25, 132, CAST(0.031330200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (469, 126, CAST(0x0000A60C00AC4A03 AS DateTime), 48, 7, 81, 25, 132, CAST(0.008665800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (470, 126, CAST(0x0000A60C00AC4EFD AS DateTime), 48, 7, 81, 25, 132, CAST(0.006666000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (471, 126, CAST(0x0000A60C00AC4F05 AS DateTime), 48, 7, 81, 25, 132, CAST(0.099323400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (472, 151, CAST(0x0000A60C00AC4F08 AS DateTime), 49, 7, 81, 25, 135, CAST(0.001333200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (473, 126, CAST(0x0000A60C00AC542D AS DateTime), 48, 7, 81, 25, 132, CAST(0.005999400000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (474, 126, CAST(0x0000A60C00AC5439 AS DateTime), 48, 7, 81, 25, 132, CAST(0.012665400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (475, 151, CAST(0x0000A60C00AC543D AS DateTime), 49, 7, 81, 25, 135, CAST(0.582393600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (476, 151, CAST(0x0000A60C00AC5441 AS DateTime), 49, 7, 81, 25, 135, CAST(0.064411200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (477, 151, CAST(0x0000A60C00AC5445 AS DateTime), 49, 7, 81, 25, 135, CAST(0.023997600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (478, 158, CAST(0x0000A60C00AC3E15 AS DateTime), 54, 7, 58, 23, 125, CAST(0.010665600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (479, 127, CAST(0x0000A60C00AC49EA AS DateTime), 48, 7, 58, 23, 125, CAST(0.013332000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (480, 127, CAST(0x0000A60C00AC49F2 AS DateTime), 48, 7, 58, 23, 125, CAST(0.069326400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (481, 127, CAST(0x0000A60C00AC49FF AS DateTime), 48, 7, 58, 23, 125, CAST(0.023997600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (482, 127, CAST(0x0000A60C00AC4EF9 AS DateTime), 48, 7, 58, 23, 125, CAST(0.003999600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (483, 127, CAST(0x0000A60C00AC4F01 AS DateTime), 48, 7, 58, 23, 125, CAST(0.223977600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (484, 127, CAST(0x0000A60C00AC5434 AS DateTime), 48, 7, 58, 23, 125, CAST(0.002666400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (485, 37, CAST(0x0000A60C00AC4501 AS DateTime), 48, 7, 57, 5, 29, CAST(0.004798800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (486, 37, CAST(0x0000A60C00AC49EF AS DateTime), 48, 7, 57, 5, 29, CAST(0.008797800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (487, 37, CAST(0x0000A60C00AC49FA AS DateTime), 48, 7, 57, 5, 29, CAST(0.001599600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (488, 37, CAST(0x0000A60C00AC4EF6 AS DateTime), 48, 7, 57, 5, 29, CAST(0.015996000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (489, 37, CAST(0x0000A60C00AC5431 AS DateTime), 48, 7, 57, 5, 29, CAST(0.021594600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (490, 143, CAST(0x0000A60C00AC5449 AS DateTime), 50, 7, 58, 10, 86, CAST(0.005332800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (491, 143, CAST(0x0000A60C00AC544C AS DateTime), 50, 7, 58, 10, 86, CAST(0.000799800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (492, 126, CAST(0x0000A60C00AC3E1D AS DateTime), 48, 8, 81, 25, 132, CAST(0.008896000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (493, 151, CAST(0x0000A60C00AC3E24 AS DateTime), 49, 8, 81, 25, 135, CAST(0.010665600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (494, 151, CAST(0x0000A60C00AC3E28 AS DateTime), 49, 8, 81, 25, 135, CAST(0.103989600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (495, 141, CAST(0x0000A60C00AC3E38 AS DateTime), 50, 8, 81, 25, 132, CAST(0.167983200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (496, 141, CAST(0x0000A60C00AC41A9 AS DateTime), 50, 8, 81, 25, 132, CAST(0.063993600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (497, 146, CAST(0x0000A60C00AC41AD AS DateTime), 47, 8, 81, 25, 132, CAST(0.008896000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (498, 141, CAST(0x0000A60C00AC4316 AS DateTime), 50, 8, 81, 25, 132, CAST(0.167983200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (499, 126, CAST(0x0000A60C00AC4516 AS DateTime), 48, 8, 81, 25, 132, CAST(0.022240000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (500, 141, CAST(0x0000A60C00AC4529 AS DateTime), 50, 8, 81, 25, 132, CAST(0.183981600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (501, 146, CAST(0x0000A60C00AC4532 AS DateTime), 47, 8, 81, 25, 132, CAST(0.053376000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (502, 126, CAST(0x0000A60C00AC4A0F AS DateTime), 48, 8, 81, 25, 132, CAST(0.022240000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (503, 151, CAST(0x0000A60C00AC4A1B AS DateTime), 49, 8, 81, 25, 135, CAST(0.199980000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (504, 151, CAST(0x0000A60C00AC4A20 AS DateTime), 49, 8, 81, 25, 135, CAST(0.007999200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (505, 126, CAST(0x0000A60C00AC4F15 AS DateTime), 48, 8, 81, 25, 132, CAST(0.013344000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (506, 141, CAST(0x0000A60C00AC4F24 AS DateTime), 50, 8, 81, 25, 132, CAST(0.007999200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (507, 146, CAST(0x0000A60C00AC4F2D AS DateTime), 47, 8, 81, 25, 132, CAST(0.102304000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (508, 126, CAST(0x0000A60C00AC5450 AS DateTime), 48, 8, 81, 25, 135, CAST(0.004448000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (509, 151, CAST(0x0000A60C00AC5454 AS DateTime), 49, 8, 81, 25, 135, CAST(0.015998400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (510, 151, CAST(0x0000A60C00AC5459 AS DateTime), 49, 8, 81, 25, 135, CAST(0.039996000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (511, 151, CAST(0x0000A60C00AC545D AS DateTime), 49, 8, 81, 25, 135, CAST(2.159913600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (512, 146, CAST(0x0000A60C00AC5464 AS DateTime), 47, 8, 81, 25, 132, CAST(0.564896000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (513, 128, CAST(0x0000A60C00AC3E20 AS DateTime), 48, 8, 58, 10, 82, CAST(0.001333200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (514, 40, CAST(0x0000A60C00AC3E2C AS DateTime), 52, 8, 58, 10, 78, CAST(0.034663200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (515, 128, CAST(0x0000A60C00AC4519 AS DateTime), 48, 8, 58, 10, 80, CAST(0.003000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (516, 40, CAST(0x0000A60C00AC4A24 AS DateTime), 52, 8, 58, 10, 78, CAST(0.035996400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (517, 143, CAST(0x0000A60C00AC4A2C AS DateTime), 50, 8, 58, 10, 86, CAST(0.004448000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (518, 40, CAST(0x0000A60C00AC4F1C AS DateTime), 52, 8, 58, 10, 78, CAST(0.002666400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (519, 143, CAST(0x0000A60C00AC4F29 AS DateTime), 50, 8, 58, 10, 80, CAST(0.003000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (520, 143, CAST(0x0000A60C00AC5461 AS DateTime), 50, 8, 58, 10, 86, CAST(0.031197600000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (521, 153, CAST(0x0000A60C00AC451E AS DateTime), 49, 8, 57, 15, 97, CAST(0.001333200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (522, 153, CAST(0x0000A60C00AC4522 AS DateTime), 49, 8, 57, 15, 97, CAST(0.036000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (523, 153, CAST(0x0000A60C00AC4525 AS DateTime), 49, 8, 57, 15, 97, CAST(0.003999600000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (524, 153, CAST(0x0000A60C00AC4A13 AS DateTime), 49, 8, 57, 15, 97, CAST(0.005332800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (525, 153, CAST(0x0000A60C00AC4A17 AS DateTime), 49, 8, 57, 15, 97, CAST(0.036000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (526, 42, CAST(0x0000A60C00AC3E3B AS DateTime), 50, 8, 58, 24, 129, CAST(0.019998000000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (527, 42, CAST(0x0000A60C00AC452E AS DateTime), 50, 8, 58, 24, 129, CAST(0.031996800000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (528, 42, CAST(0x0000A60C00AC4A30 AS DateTime), 50, 8, 58, 24, 129, CAST(0.008400000000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (529, 130, CAST(0x0000A60C00AC3E19 AS DateTime), 48, 8, 57, 9, 68, CAST(0.007999200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (530, 130, CAST(0x0000A60C00AC4512 AS DateTime), 48, 8, 57, 9, 68, CAST(0.023997600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (531, 130, CAST(0x0000A60C00AC4A0B AS DateTime), 48, 8, 57, 9, 68, CAST(0.007999200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (532, 130, CAST(0x0000A60C00AC4F11 AS DateTime), 48, 8, 57, 9, 68, CAST(0.015998400000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (533, 151, CAST(0x0000A60C00AC3E7C AS DateTime), 49, 9, 81, 25, 134, CAST(1.883803000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (534, 151, CAST(0x0000A60C00AC3E80 AS DateTime), 49, 9, 81, 25, 134, CAST(1.116466000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (535, 151, CAST(0x0000A60C00AC3E84 AS DateTime), 49, 9, 81, 25, 134, CAST(5.258755000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (536, 151, CAST(0x0000A60C00AC3E88 AS DateTime), 49, 9, 81, 25, 134, CAST(0.913893000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (537, 151, CAST(0x0000A60C00AC3E98 AS DateTime), 49, 9, 81, 25, 134, CAST(0.231232000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (538, 151, CAST(0x0000A60C00AC3E9B AS DateTime), 49, 9, 81, 25, 135, CAST(0.006714400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (539, 151, CAST(0x0000A60C00AC3E9F AS DateTime), 49, 9, 81, 25, 135, CAST(0.000960000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (540, 151, CAST(0x0000A60C00AC3EA3 AS DateTime), 49, 9, 81, 25, 135, CAST(0.037455500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (541, 157, CAST(0x0000A60C00AC3EB7 AS DateTime), 54, 9, 81, 25, 133, CAST(0.285651000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (542, 136, CAST(0x0000A60C00AC3ECA AS DateTime), 52, 9, 81, 25, 133, CAST(1.414106201880000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (543, 136, CAST(0x0000A60C00AC3ECE AS DateTime), 52, 9, 81, 25, 133, CAST(0.175129603560000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (544, 136, CAST(0x0000A60C00AC3ED2 AS DateTime), 52, 9, 81, 25, 133, CAST(0.005227749360000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (545, 141, CAST(0x0000A60C00AC3EEC AS DateTime), 50, 9, 81, 25, 134, CAST(0.009801400000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (546, 141, CAST(0x0000A60C00AC3EFC AS DateTime), 50, 9, 81, 25, 134, CAST(0.042473600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (547, 141, CAST(0x0000A60C00AC3F01 AS DateTime), 50, 9, 81, 25, 135, CAST(0.414934400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (548, 141, CAST(0x0000A60C00AC3F20 AS DateTime), 50, 9, 81, 25, 134, CAST(0.037572800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (549, 141, CAST(0x0000A60C00AC3F28 AS DateTime), 50, 9, 81, 25, 134, CAST(0.001633600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (550, 141, CAST(0x0000A60C00AC3F2B AS DateTime), 50, 9, 81, 25, 135, CAST(0.441023000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (551, 141, CAST(0x0000A60C00AC3F30 AS DateTime), 50, 9, 81, 25, 135, CAST(0.000270000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (552, 146, CAST(0x0000A60C00AC3F3F AS DateTime), 47, 9, 81, 25, 135, CAST(0.247150200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (553, 146, CAST(0x0000A60C00AC3F43 AS DateTime), 47, 9, 81, 25, 135, CAST(0.003033500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (554, 146, CAST(0x0000A60C00AC3F47 AS DateTime), 47, 9, 81, 25, 135, CAST(0.000750000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (555, 146, CAST(0x0000A60C00AC3F4B AS DateTime), 47, 9, 81, 25, 135, CAST(0.061964100000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (556, 146, CAST(0x0000A60C00AC3F4F AS DateTime), 47, 9, 81, 25, 132, CAST(0.002100400000000 AS Decimal(20, 15)), 74, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (557, 131, CAST(0x0000A60C00AC41C1 AS DateTime), 53, 9, 81, 25, 135, CAST(0.003914000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (558, 131, CAST(0x0000A60C00AC41C5 AS DateTime), 53, 9, 81, 25, 135, CAST(0.015402750000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (559, 141, CAST(0x0000A60C00AC41CD AS DateTime), 50, 9, 81, 25, 134, CAST(0.015402200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (560, 141, CAST(0x0000A60C00AC41E1 AS DateTime), 50, 9, 81, 25, 134, CAST(0.210734400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (561, 141, CAST(0x0000A60C00AC41E6 AS DateTime), 50, 9, 81, 25, 135, CAST(0.347956800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (562, 141, CAST(0x0000A60C00AC41F3 AS DateTime), 50, 9, 81, 25, 134, CAST(0.026137600000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (563, 141, CAST(0x0000A60C00AC41F7 AS DateTime), 50, 9, 81, 25, 135, CAST(0.565200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (564, 141, CAST(0x0000A60C00AC41FB AS DateTime), 50, 9, 81, 25, 135, CAST(0.000270000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (565, 146, CAST(0x0000A60C00AC4207 AS DateTime), 47, 9, 81, 25, 132, CAST(0.294056000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (566, 146, CAST(0x0000A60C00AC420F AS DateTime), 47, 9, 81, 25, 135, CAST(0.050875600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (567, 146, CAST(0x0000A60C00AC4213 AS DateTime), 47, 9, 81, 25, 135, CAST(0.056621500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (568, 141, CAST(0x0000A60C00AC4322 AS DateTime), 50, 9, 81, 25, 134, CAST(0.007001000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (569, 141, CAST(0x0000A60C00AC4337 AS DateTime), 50, 9, 81, 25, 134, CAST(0.166627200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (570, 141, CAST(0x0000A60C00AC433A AS DateTime), 50, 9, 81, 25, 135, CAST(0.695913600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (571, 141, CAST(0x0000A60C00AC4346 AS DateTime), 50, 9, 81, 25, 134, CAST(0.089848000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (572, 141, CAST(0x0000A60C00AC434B AS DateTime), 50, 9, 81, 25, 135, CAST(0.249940800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (573, 141, CAST(0x0000A60C00AC4350 AS DateTime), 50, 9, 81, 25, 135, CAST(3.250800000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (574, 141, CAST(0x0000A60C00AC4354 AS DateTime), 50, 9, 81, 25, 135, CAST(0.001080000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (575, 126, CAST(0x0000A60C00AC4539 AS DateTime), 48, 9, 81, 25, 134, CAST(0.824280500000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (576, 126, CAST(0x0000A60C00AC4570 AS DateTime), 48, 9, 81, 25, 135, CAST(0.223223300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (577, 126, CAST(0x0000A60C00AC4573 AS DateTime), 48, 9, 81, 25, 135, CAST(0.015405000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (578, 151, CAST(0x0000A60C00AC45A0 AS DateTime), 49, 9, 81, 25, 134, CAST(3.569603800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (579, 151, CAST(0x0000A60C00AC45C7 AS DateTime), 49, 9, 81, 25, 134, CAST(0.204829000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (580, 151, CAST(0x0000A60C00AC45CA AS DateTime), 49, 9, 81, 25, 134, CAST(0.000933400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (581, 151, CAST(0x0000A60C00AC45D6 AS DateTime), 49, 9, 81, 25, 135, CAST(0.018670000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (582, 151, CAST(0x0000A60C00AC45DA AS DateTime), 49, 9, 81, 25, 135, CAST(0.029872000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (583, 151, CAST(0x0000A60C00AC45DE AS DateTime), 49, 9, 81, 25, 135, CAST(0.107349500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (584, 151, CAST(0x0000A60C00AC45E2 AS DateTime), 49, 9, 81, 25, 135, CAST(0.546911900000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (585, 151, CAST(0x0000A60C00AC45E7 AS DateTime), 49, 9, 81, 25, 135, CAST(2.039843600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (586, 157, CAST(0x0000A60C00AC45FA AS DateTime), 54, 9, 81, 25, 133, CAST(1.529771000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (587, 141, CAST(0x0000A60C00AC4613 AS DateTime), 50, 9, 81, 25, 134, CAST(0.007001000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (588, 141, CAST(0x0000A60C00AC4633 AS DateTime), 50, 9, 81, 25, 134, CAST(0.334888000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (589, 141, CAST(0x0000A60C00AC4638 AS DateTime), 50, 9, 81, 25, 135, CAST(0.411667200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (590, 141, CAST(0x0000A60C00AC4657 AS DateTime), 50, 9, 81, 25, 134, CAST(0.001800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (591, 141, CAST(0x0000A60C00AC465A AS DateTime), 50, 9, 81, 25, 135, CAST(0.439200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (592, 146, CAST(0x0000A60C00AC4670 AS DateTime), 47, 9, 81, 25, 132, CAST(0.200371800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (593, 146, CAST(0x0000A60C00AC467F AS DateTime), 47, 9, 81, 25, 135, CAST(0.054454000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (594, 146, CAST(0x0000A60C00AC4684 AS DateTime), 47, 9, 81, 25, 135, CAST(0.030525000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (595, 146, CAST(0x0000A60C00AC468B AS DateTime), 47, 9, 81, 25, 132, CAST(0.039907600000000 AS Decimal(20, 15)), 74, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (596, 126, CAST(0x0000A60C00AC4A55 AS DateTime), 48, 9, 81, 25, 132, CAST(0.009000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (597, 126, CAST(0x0000A60C00AC4A7C AS DateTime), 48, 9, 81, 25, 135, CAST(0.305030600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (598, 126, CAST(0x0000A60C00AC4A80 AS DateTime), 48, 9, 81, 25, 135, CAST(0.002250000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (599, 126, CAST(0x0000A60C00AC4A84 AS DateTime), 48, 9, 81, 25, 135, CAST(0.046652400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (600, 151, CAST(0x0000A60C00AC4AAF AS DateTime), 49, 9, 81, 25, 134, CAST(0.082148000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (601, 151, CAST(0x0000A60C00AC4AB3 AS DateTime), 49, 9, 81, 25, 134, CAST(1.601214700000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (602, 151, CAST(0x0000A60C00AC4AB7 AS DateTime), 49, 9, 81, 25, 134, CAST(1.076674000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (603, 151, CAST(0x0000A60C00AC4AD9 AS DateTime), 49, 9, 81, 25, 134, CAST(0.139091500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (604, 151, CAST(0x0000A60C00AC4ADD AS DateTime), 49, 9, 81, 25, 134, CAST(3.864464800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (605, 151, CAST(0x0000A60C00AC4AE1 AS DateTime), 49, 9, 81, 25, 134, CAST(0.280912000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (606, 151, CAST(0x0000A60C00AC4AF1 AS DateTime), 49, 9, 81, 25, 135, CAST(0.009335000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (607, 151, CAST(0x0000A60C00AC4AF5 AS DateTime), 49, 9, 81, 25, 135, CAST(0.046675000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (608, 151, CAST(0x0000A60C00AC4AF9 AS DateTime), 49, 9, 81, 25, 135, CAST(0.020536300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (609, 151, CAST(0x0000A60C00AC4AFD AS DateTime), 49, 9, 81, 25, 135, CAST(0.009335000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (610, 151, CAST(0x0000A60C00AC4B01 AS DateTime), 49, 9, 81, 25, 135, CAST(2.456840000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (611, 157, CAST(0x0000A60C00AC4B05 AS DateTime), 54, 9, 81, 25, 133, CAST(0.034538000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (612, 141, CAST(0x0000A60C00AC4B1C AS DateTime), 50, 9, 81, 25, 134, CAST(0.015402200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (613, 141, CAST(0x0000A60C00AC4B2F AS DateTime), 50, 9, 81, 25, 134, CAST(0.133955200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (614, 141, CAST(0x0000A60C00AC4B33 AS DateTime), 50, 9, 81, 25, 135, CAST(0.411667200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (615, 141, CAST(0x0000A60C00AC4B4F AS DateTime), 50, 9, 81, 25, 134, CAST(0.545622400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (616, 141, CAST(0x0000A60C00AC4B60 AS DateTime), 50, 9, 81, 25, 134, CAST(0.024036800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (617, 141, CAST(0x0000A60C00AC4B64 AS DateTime), 50, 9, 81, 25, 134, CAST(0.001400200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (618, 141, CAST(0x0000A60C00AC4B68 AS DateTime), 50, 9, 81, 25, 135, CAST(0.525600000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (619, 141, CAST(0x0000A60C00AC4B6C AS DateTime), 50, 9, 81, 25, 135, CAST(0.000540000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (620, 146, CAST(0x0000A60C00AC4B78 AS DateTime), 47, 9, 81, 25, 135, CAST(0.012690800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (621, 146, CAST(0x0000A60C00AC4B7C AS DateTime), 47, 9, 81, 25, 135, CAST(0.008401500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (622, 146, CAST(0x0000A60C00AC4B83 AS DateTime), 47, 9, 81, 25, 132, CAST(0.044108400000000 AS Decimal(20, 15)), 74, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (623, 126, CAST(0x0000A60C00AC4F71 AS DateTime), 48, 9, 81, 25, 135, CAST(0.230113800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (624, 126, CAST(0x0000A60C00AC4F75 AS DateTime), 48, 9, 81, 25, 135, CAST(0.077886200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (625, 151, CAST(0x0000A60C00AC4F97 AS DateTime), 49, 9, 81, 25, 134, CAST(0.162429000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (626, 151, CAST(0x0000A60C00AC4F9B AS DateTime), 49, 9, 81, 25, 134, CAST(1.355268800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (627, 151, CAST(0x0000A60C00AC4FBF AS DateTime), 49, 9, 81, 25, 134, CAST(0.203503000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (628, 151, CAST(0x0000A60C00AC4FC3 AS DateTime), 49, 9, 81, 25, 134, CAST(1.698110000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (629, 151, CAST(0x0000A60C00AC4FD2 AS DateTime), 49, 9, 81, 25, 135, CAST(0.005601000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (630, 151, CAST(0x0000A60C00AC4FD6 AS DateTime), 49, 9, 81, 25, 135, CAST(1.564260400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (631, 151, CAST(0x0000A60C00AC4FDA AS DateTime), 49, 9, 81, 25, 135, CAST(0.089845000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (632, 157, CAST(0x0000A60C00AC4FFA AS DateTime), 54, 9, 81, 25, 133, CAST(0.672120000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (633, 131, CAST(0x0000A60C00AC5006 AS DateTime), 53, 9, 81, 25, 135, CAST(0.000933500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (634, 141, CAST(0x0000A60C00AC502A AS DateTime), 50, 9, 81, 25, 134, CAST(0.385529600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (635, 141, CAST(0x0000A60C00AC502D AS DateTime), 50, 9, 81, 25, 135, CAST(0.632203200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (636, 141, CAST(0x0000A60C00AC5041 AS DateTime), 50, 9, 81, 25, 134, CAST(0.370827200000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (637, 141, CAST(0x0000A60C00AC504C AS DateTime), 50, 9, 81, 25, 135, CAST(0.136200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (638, 141, CAST(0x0000A60C00AC5050 AS DateTime), 50, 9, 81, 25, 135, CAST(3.660835000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (639, 141, CAST(0x0000A60C00AC5055 AS DateTime), 50, 9, 81, 25, 135, CAST(0.000810000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (640, 141, CAST(0x0000A60C00AC5059 AS DateTime), 50, 9, 81, 25, 135, CAST(0.694034162500000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (641, 146, CAST(0x0000A60C00AC506F AS DateTime), 47, 9, 81, 25, 135, CAST(0.021937156650000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (642, 126, CAST(0x0000A60C00AC5474 AS DateTime), 48, 9, 81, 25, 134, CAST(0.134424000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (643, 126, CAST(0x0000A60C00AC54A1 AS DateTime), 48, 9, 81, 25, 135, CAST(0.732564200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (644, 126, CAST(0x0000A60C00AC54A5 AS DateTime), 48, 9, 81, 25, 135, CAST(0.156921300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (645, 151, CAST(0x0000A60C00AC54B5 AS DateTime), 49, 9, 81, 25, 134, CAST(0.944528000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (646, 151, CAST(0x0000A60C00AC54B9 AS DateTime), 49, 9, 81, 25, 134, CAST(0.635888000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (647, 151, CAST(0x0000A60C00AC54E0 AS DateTime), 49, 9, 81, 25, 134, CAST(0.007468000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (648, 151, CAST(0x0000A60C00AC54E4 AS DateTime), 49, 9, 81, 25, 134, CAST(0.042941000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (649, 151, CAST(0x0000A60C00AC54E8 AS DateTime), 49, 9, 81, 25, 135, CAST(0.004667500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (650, 151, CAST(0x0000A60C00AC54EC AS DateTime), 49, 9, 81, 25, 135, CAST(0.077013750000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (651, 151, CAST(0x0000A60C00AC54F0 AS DateTime), 49, 9, 81, 25, 135, CAST(0.015672700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (652, 151, CAST(0x0000A60C00AC54F4 AS DateTime), 49, 9, 81, 25, 135, CAST(0.110318500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (653, 157, CAST(0x0000A60C00AC5527 AS DateTime), 54, 9, 81, 25, 133, CAST(0.336056080000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (654, 136, CAST(0x0000A60C00AC552F AS DateTime), 52, 9, 81, 25, 133, CAST(0.857350895040000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (655, 136, CAST(0x0000A60C00AC553F AS DateTime), 52, 9, 81, 25, 133, CAST(1.066460869440000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (656, 136, CAST(0x0000A60C00AC5543 AS DateTime), 52, 9, 81, 25, 133, CAST(0.065346867000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (657, 141, CAST(0x0000A60C00AC5547 AS DateTime), 50, 9, 81, 25, 134, CAST(0.026603800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (658, 141, CAST(0x0000A60C00AC5563 AS DateTime), 50, 9, 81, 25, 134, CAST(0.619134400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (659, 141, CAST(0x0000A60C00AC5567 AS DateTime), 50, 9, 81, 25, 135, CAST(1.898243200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (660, 141, CAST(0x0000A60C00AC5586 AS DateTime), 50, 9, 81, 25, 134, CAST(0.169653400000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (661, 141, CAST(0x0000A60C00AC558A AS DateTime), 50, 9, 81, 25, 134, CAST(0.001400200000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (662, 141, CAST(0x0000A60C00AC55A3 AS DateTime), 50, 9, 81, 25, 134, CAST(0.045740800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (663, 141, CAST(0x0000A60C00AC55A7 AS DateTime), 50, 9, 81, 25, 135, CAST(0.008168000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (664, 141, CAST(0x0000A60C00AC55AF AS DateTime), 50, 9, 81, 25, 135, CAST(1.616400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (665, 141, CAST(0x0000A60C00AC55B3 AS DateTime), 50, 9, 81, 25, 135, CAST(0.000945000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (666, 146, CAST(0x0000A60C00AC55CB AS DateTime), 47, 9, 81, 25, 135, CAST(0.047328000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (667, 127, CAST(0x0000A60C00AC3E47 AS DateTime), 48, 9, 58, 23, 125, CAST(0.036000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (668, 127, CAST(0x0000A60C00AC3E4F AS DateTime), 48, 9, 58, 23, 125, CAST(0.232200000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (669, 127, CAST(0x0000A60C00AC3E74 AS DateTime), 48, 9, 58, 23, 125, CAST(0.063000000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (670, 127, CAST(0x0000A60C00AC3E78 AS DateTime), 48, 9, 58, 23, 125, CAST(0.405235100000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (671, 158, CAST(0x0000A60C00AC3EAF AS DateTime), 54, 9, 58, 23, 125, CAST(0.136800000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (672, 158, CAST(0x0000A60C00AC3EB3 AS DateTime), 54, 9, 58, 23, 125, CAST(0.022294400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (673, 133, CAST(0x0000A60C00AC3EBF AS DateTime), 53, 9, 58, 23, 125, CAST(0.001867000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (674, 139, CAST(0x0000A60C00AC3EC6 AS DateTime), 52, 9, 58, 23, 125, CAST(0.001867000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (675, 142, CAST(0x0000A60C00AC3EE7 AS DateTime), 50, 9, 58, 23, 125, CAST(0.161299200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (676, 142, CAST(0x0000A60C00AC3EF8 AS DateTime), 50, 9, 58, 23, 125, CAST(0.262126800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (677, 142, CAST(0x0000A60C00AC3F1C AS DateTime), 50, 9, 58, 23, 125, CAST(0.007701100000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (678, 148, CAST(0x0000A60C00AC3F34 AS DateTime), 47, 9, 58, 23, 125, CAST(0.005467000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (679, 148, CAST(0x0000A60C00AC3F38 AS DateTime), 47, 9, 58, 23, 125, CAST(0.000600000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (680, 133, CAST(0x0000A60C00AC41BD AS DateTime), 53, 9, 58, 23, 125, CAST(0.041074000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (681, 142, CAST(0x0000A60C00AC41C9 AS DateTime), 50, 9, 58, 23, 125, CAST(0.080649600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (682, 142, CAST(0x0000A60C00AC41D9 AS DateTime), 50, 9, 58, 23, 125, CAST(0.008401000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (683, 142, CAST(0x0000A60C00AC41DD AS DateTime), 50, 9, 58, 23, 125, CAST(0.059370000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (684, 148, CAST(0x0000A60C00AC4203 AS DateTime), 47, 9, 58, 23, 125, CAST(0.038805000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (685, 127, CAST(0x0000A60C00AC431E AS DateTime), 48, 9, 58, 23, 125, CAST(0.019800000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (686, 142, CAST(0x0000A60C00AC432F AS DateTime), 50, 9, 58, 23, 125, CAST(0.317557800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (687, 142, CAST(0x0000A60C00AC4333 AS DateTime), 50, 9, 58, 23, 125, CAST(0.120841500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (688, 142, CAST(0x0000A60C00AC4342 AS DateTime), 50, 9, 58, 23, 125, CAST(0.013442400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (689, 127, CAST(0x0000A60C00AC4545 AS DateTime), 48, 9, 58, 23, 125, CAST(0.092412000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (690, 127, CAST(0x0000A60C00AC4555 AS DateTime), 48, 9, 58, 23, 125, CAST(0.032735000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (691, 127, CAST(0x0000A60C00AC4559 AS DateTime), 48, 9, 58, 23, 125, CAST(0.003860400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (692, 127, CAST(0x0000A60C00AC4597 AS DateTime), 48, 9, 58, 23, 125, CAST(0.127550000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (693, 127, CAST(0x0000A60C00AC459B AS DateTime), 48, 9, 58, 23, 125, CAST(0.003500400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (694, 158, CAST(0x0000A60C00AC45F3 AS DateTime), 54, 9, 58, 23, 125, CAST(0.268848000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (695, 158, CAST(0x0000A60C00AC45F6 AS DateTime), 54, 9, 58, 23, 125, CAST(0.022752600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (696, 142, CAST(0x0000A60C00AC462B AS DateTime), 50, 9, 58, 23, 125, CAST(0.525888700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (697, 142, CAST(0x0000A60C00AC462F AS DateTime), 50, 9, 58, 23, 125, CAST(0.018623300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (698, 148, CAST(0x0000A60C00AC4668 AS DateTime), 47, 9, 58, 23, 125, CAST(0.125200500000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (699, 148, CAST(0x0000A60C00AC466C AS DateTime), 47, 9, 58, 23, 125, CAST(0.000600000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (700, 127, CAST(0x0000A60C00AC4A4C AS DateTime), 48, 9, 58, 23, 125, CAST(0.018000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (701, 127, CAST(0x0000A60C00AC4A50 AS DateTime), 48, 9, 58, 23, 125, CAST(0.038505000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (702, 127, CAST(0x0000A60C00AC4A66 AS DateTime), 48, 9, 58, 23, 125, CAST(0.192600000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (703, 127, CAST(0x0000A60C00AC4A6B AS DateTime), 48, 9, 58, 23, 125, CAST(0.063023200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (704, 127, CAST(0x0000A60C00AC4AA7 AS DateTime), 48, 9, 58, 23, 125, CAST(0.337826200000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (705, 127, CAST(0x0000A60C00AC4AAB AS DateTime), 48, 9, 58, 23, 125, CAST(0.002520000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (706, 158, CAST(0x0000A60C00AC4B0C AS DateTime), 54, 9, 58, 23, 125, CAST(0.098951000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (707, 158, CAST(0x0000A60C00AC4B14 AS DateTime), 54, 9, 58, 23, 125, CAST(0.018462000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (708, 142, CAST(0x0000A60C00AC4B27 AS DateTime), 50, 9, 58, 23, 125, CAST(0.449709800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (709, 142, CAST(0x0000A60C00AC4B2B AS DateTime), 50, 9, 58, 23, 125, CAST(0.203874000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (710, 142, CAST(0x0000A60C00AC4B48 AS DateTime), 50, 9, 58, 23, 125, CAST(0.668616300000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (711, 142, CAST(0x0000A60C00AC4B4C AS DateTime), 50, 9, 58, 23, 125, CAST(0.011202000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (712, 148, CAST(0x0000A60C00AC4B70 AS DateTime), 47, 9, 58, 23, 125, CAST(0.018000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (713, 127, CAST(0x0000A60C00AC4F48 AS DateTime), 48, 9, 58, 23, 125, CAST(0.322848000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (714, 127, CAST(0x0000A60C00AC4F4C AS DateTime), 48, 9, 58, 23, 125, CAST(0.041421400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (715, 127, CAST(0x0000A60C00AC4F93 AS DateTime), 48, 9, 58, 23, 125, CAST(0.272671000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (716, 158, CAST(0x0000A60C00AC4FE2 AS DateTime), 54, 9, 58, 23, 125, CAST(0.115200000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (717, 158, CAST(0x0000A60C00AC4FF2 AS DateTime), 54, 9, 58, 23, 125, CAST(0.056202000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (718, 158, CAST(0x0000A60C00AC4FF6 AS DateTime), 54, 9, 58, 23, 125, CAST(0.004083800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (719, 142, CAST(0x0000A60C00AC5022 AS DateTime), 50, 9, 58, 23, 125, CAST(0.365483300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (720, 142, CAST(0x0000A60C00AC5026 AS DateTime), 50, 9, 58, 23, 125, CAST(0.460122200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (721, 142, CAST(0x0000A60C00AC503D AS DateTime), 50, 9, 58, 23, 125, CAST(1.465395800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (722, 148, CAST(0x0000A60C00AC5064 AS DateTime), 47, 9, 58, 23, 125, CAST(0.248388100000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (723, 127, CAST(0x0000A60C00AC547D AS DateTime), 48, 9, 58, 23, 125, CAST(0.001080000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (724, 127, CAST(0x0000A60C00AC5491 AS DateTime), 48, 9, 58, 23, 125, CAST(0.040203000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (725, 127, CAST(0x0000A60C00AC54B1 AS DateTime), 48, 9, 58, 23, 125, CAST(0.264542000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (726, 158, CAST(0x0000A60C00AC550B AS DateTime), 54, 9, 58, 23, 125, CAST(0.054134000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (727, 158, CAST(0x0000A60C00AC5523 AS DateTime), 54, 9, 58, 23, 125, CAST(0.014001280000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (728, 139, CAST(0x0000A60C00AC553B AS DateTime), 52, 9, 58, 23, 125, CAST(0.100818000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (729, 142, CAST(0x0000A60C00AC555B AS DateTime), 50, 9, 58, 23, 125, CAST(0.136523100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (730, 142, CAST(0x0000A60C00AC555F AS DateTime), 50, 9, 58, 23, 125, CAST(0.764166800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (731, 142, CAST(0x0000A60C00AC559A AS DateTime), 50, 9, 58, 23, 125, CAST(0.191951400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (732, 142, CAST(0x0000A60C00AC559F AS DateTime), 50, 9, 58, 23, 125, CAST(1.133504028600000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (733, 148, CAST(0x0000A60C00AC55C3 AS DateTime), 47, 9, 58, 23, 125, CAST(0.034228300000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (734, 129, CAST(0x0000A60C00AC3E44 AS DateTime), 48, 9, 57, 6, 37, CAST(0.004200600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (735, 129, CAST(0x0000A60C00AC3E4B AS DateTime), 48, 9, 57, 6, 37, CAST(0.081211600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (736, 129, CAST(0x0000A60C00AC3E6D AS DateTime), 48, 9, 57, 6, 37, CAST(0.313644800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (737, 159, CAST(0x0000A60C00AC3EA7 AS DateTime), 54, 9, 57, 6, 37, CAST(0.108908000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (738, 132, CAST(0x0000A60C00AC3EBB AS DateTime), 53, 9, 57, 6, 37, CAST(0.315060000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (739, 137, CAST(0x0000A60C00AC3EC2 AS DateTime), 52, 9, 57, 6, 37, CAST(0.000933500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (740, 137, CAST(0x0000A60C00AC3EDA AS DateTime), 52, 9, 57, 6, 37, CAST(0.005805000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (741, 144, CAST(0x0000A60C00AC3EF0 AS DateTime), 50, 9, 57, 6, 37, CAST(0.018120000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (742, 144, CAST(0x0000A60C00AC3F10 AS DateTime), 50, 9, 57, 6, 37, CAST(0.019665000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (743, 159, CAST(0x0000A60C00AC41B2 AS DateTime), 54, 9, 57, 6, 37, CAST(0.009335000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (744, 132, CAST(0x0000A60C00AC41B6 AS DateTime), 53, 9, 57, 6, 37, CAST(0.010502000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (745, 132, CAST(0x0000A60C00AC41B9 AS DateTime), 53, 9, 57, 6, 39, CAST(0.000933500000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (746, 144, CAST(0x0000A60C00AC41D1 AS DateTime), 50, 9, 57, 6, 37, CAST(0.036315000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (747, 144, CAST(0x0000A60C00AC41EB AS DateTime), 50, 9, 57, 6, 37, CAST(0.001575000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (748, 149, CAST(0x0000A60C00AC41FF AS DateTime), 47, 9, 57, 6, 37, CAST(0.016336200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (749, 129, CAST(0x0000A60C00AC431A AS DateTime), 48, 9, 57, 6, 37, CAST(0.002800400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (750, 144, CAST(0x0000A60C00AC4326 AS DateTime), 50, 9, 57, 6, 37, CAST(0.109755000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (751, 129, CAST(0x0000A60C00AC453D AS DateTime), 48, 9, 57, 6, 37, CAST(0.049007000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (752, 129, CAST(0x0000A60C00AC4541 AS DateTime), 48, 9, 57, 6, 40, CAST(0.021600000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (753, 129, CAST(0x0000A60C00AC4549 AS DateTime), 48, 9, 57, 6, 37, CAST(0.016802400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (754, 129, CAST(0x0000A60C00AC454D AS DateTime), 48, 9, 57, 6, 40, CAST(0.001500000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (755, 129, CAST(0x0000A60C00AC4578 AS DateTime), 48, 9, 57, 6, 37, CAST(0.176425200000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (756, 129, CAST(0x0000A60C00AC457B AS DateTime), 48, 9, 57, 6, 39, CAST(0.007468000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (757, 129, CAST(0x0000A60C00AC457F AS DateTime), 48, 9, 57, 6, 40, CAST(0.009600000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (758, 137, CAST(0x0000A60C00AC45FF AS DateTime), 52, 9, 57, 6, 37, CAST(0.006615000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (759, 137, CAST(0x0000A60C00AC460F AS DateTime), 52, 9, 57, 6, 40, CAST(0.179232000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (760, 144, CAST(0x0000A60C00AC4618 AS DateTime), 50, 9, 57, 6, 37, CAST(0.055751600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (761, 144, CAST(0x0000A60C00AC461B AS DateTime), 50, 9, 57, 6, 37, CAST(0.056025000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (762, 144, CAST(0x0000A60C00AC463F AS DateTime), 50, 9, 57, 6, 37, CAST(0.001920000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (763, 149, CAST(0x0000A60C00AC465F AS DateTime), 47, 9, 57, 6, 37, CAST(0.085103600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (764, 149, CAST(0x0000A60C00AC4663 AS DateTime), 47, 9, 57, 6, 39, CAST(0.022403200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (765, 129, CAST(0x0000A60C00AC4A3C AS DateTime), 48, 9, 57, 6, 37, CAST(0.046206600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (766, 129, CAST(0x0000A60C00AC4A40 AS DateTime), 48, 9, 57, 6, 40, CAST(0.006000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (767, 129, CAST(0x0000A60C00AC4A59 AS DateTime), 48, 9, 57, 6, 37, CAST(0.035005000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (768, 129, CAST(0x0000A60C00AC4A5D AS DateTime), 48, 9, 57, 6, 40, CAST(0.019500000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (769, 129, CAST(0x0000A60C00AC4A88 AS DateTime), 48, 9, 57, 6, 37, CAST(0.173624800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (770, 129, CAST(0x0000A60C00AC4A8C AS DateTime), 48, 9, 57, 6, 40, CAST(0.011400000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (771, 159, CAST(0x0000A60C00AC4B08 AS DateTime), 54, 9, 57, 6, 37, CAST(0.041074000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (772, 159, CAST(0x0000A60C00AC4B10 AS DateTime), 54, 9, 57, 6, 37, CAST(0.108908000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (773, 137, CAST(0x0000A60C00AC4B18 AS DateTime), 52, 9, 57, 6, 37, CAST(0.039205600000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (774, 144, CAST(0x0000A60C00AC4B20 AS DateTime), 50, 9, 57, 6, 37, CAST(0.259162800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (775, 144, CAST(0x0000A60C00AC4B3C AS DateTime), 50, 9, 57, 6, 37, CAST(0.044527400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (776, 144, CAST(0x0000A60C00AC4B40 AS DateTime), 50, 9, 57, 6, 37, CAST(0.025905000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (777, 129, CAST(0x0000A60C00AC4F34 AS DateTime), 48, 9, 57, 6, 37, CAST(0.021003000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (778, 129, CAST(0x0000A60C00AC4F38 AS DateTime), 48, 9, 57, 6, 37, CAST(0.063009000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (779, 129, CAST(0x0000A60C00AC4F3C AS DateTime), 48, 9, 57, 6, 40, CAST(0.000600000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (780, 129, CAST(0x0000A60C00AC4F7A AS DateTime), 48, 9, 57, 6, 37, CAST(0.155422200000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (781, 129, CAST(0x0000A60C00AC4F7E AS DateTime), 48, 9, 57, 6, 40, CAST(0.028200000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (782, 159, CAST(0x0000A60C00AC4FDE AS DateTime), 54, 9, 57, 6, 37, CAST(0.024300000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (783, 159, CAST(0x0000A60C00AC4FE6 AS DateTime), 54, 9, 57, 6, 37, CAST(0.011178000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (784, 159, CAST(0x0000A60C00AC4FEA AS DateTime), 54, 9, 57, 6, 37, CAST(0.000405000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (785, 132, CAST(0x0000A60C00AC4FFE AS DateTime), 53, 9, 57, 6, 37, CAST(0.025204800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (786, 137, CAST(0x0000A60C00AC500A AS DateTime), 52, 9, 57, 6, 37, CAST(0.014400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (787, 137, CAST(0x0000A60C00AC500E AS DateTime), 52, 9, 57, 6, 37, CAST(0.048542000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (788, 137, CAST(0x0000A60C00AC5012 AS DateTime), 52, 9, 57, 6, 37, CAST(0.006615000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (789, 144, CAST(0x0000A60C00AC5016 AS DateTime), 50, 9, 57, 6, 37, CAST(0.763785600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (790, 144, CAST(0x0000A60C00AC5035 AS DateTime), 50, 9, 57, 6, 37, CAST(1.167224200000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (791, 144, CAST(0x0000A60C00AC5039 AS DateTime), 50, 9, 57, 6, 37, CAST(0.060435000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (792, 149, CAST(0x0000A60C00AC505D AS DateTime), 47, 9, 57, 6, 37, CAST(0.052200000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (793, 149, CAST(0x0000A60C00AC5061 AS DateTime), 47, 9, 57, 6, 37, CAST(0.001890000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (794, 129, CAST(0x0000A60C00AC5479 AS DateTime), 48, 9, 57, 6, 37, CAST(0.011201600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (795, 129, CAST(0x0000A60C00AC5480 AS DateTime), 48, 9, 57, 6, 37, CAST(0.012601800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (796, 129, CAST(0x0000A60C00AC5484 AS DateTime), 48, 9, 57, 6, 40, CAST(0.000900000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (797, 129, CAST(0x0000A60C00AC54A9 AS DateTime), 48, 9, 57, 6, 37, CAST(0.179225600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (798, 159, CAST(0x0000A60C00AC54F7 AS DateTime), 54, 9, 57, 6, 37, CAST(0.012420000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (799, 159, CAST(0x0000A60C00AC54FC AS DateTime), 54, 9, 57, 6, 37, CAST(0.009000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (800, 159, CAST(0x0000A60C00AC5500 AS DateTime), 54, 9, 57, 6, 37, CAST(0.000405000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (801, 159, CAST(0x0000A60C00AC5503 AS DateTime), 54, 9, 57, 6, 39, CAST(0.000466740000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (802, 159, CAST(0x0000A60C00AC5514 AS DateTime), 54, 9, 57, 6, 37, CAST(0.014904000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (803, 159, CAST(0x0000A60C00AC5518 AS DateTime), 54, 9, 57, 6, 37, CAST(0.030600000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (804, 159, CAST(0x0000A60C00AC551C AS DateTime), 54, 9, 57, 6, 37, CAST(0.009045000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (805, 132, CAST(0x0000A60C00AC552B AS DateTime), 53, 9, 57, 6, 37, CAST(0.002100400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (806, 137, CAST(0x0000A60C00AC5533 AS DateTime), 52, 9, 57, 6, 37, CAST(0.392745500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (807, 137, CAST(0x0000A60C00AC5537 AS DateTime), 52, 9, 57, 6, 37, CAST(0.006480000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (808, 144, CAST(0x0000A60C00AC554B AS DateTime), 50, 9, 57, 6, 37, CAST(0.153325800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (809, 144, CAST(0x0000A60C00AC558E AS DateTime), 50, 9, 57, 6, 37, CAST(0.231202400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (810, 144, CAST(0x0000A60C00AC5592 AS DateTime), 50, 9, 57, 6, 37, CAST(0.004800000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (811, 149, CAST(0x0000A60C00AC55B7 AS DateTime), 47, 9, 57, 6, 37, CAST(0.118800000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (812, 149, CAST(0x0000A60C00AC55BA AS DateTime), 47, 9, 57, 6, 37, CAST(0.001620000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (813, 149, CAST(0x0000A60C00AC55BE AS DateTime), 47, 9, 57, 6, 39, CAST(0.194168000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (814, 128, CAST(0x0000A60C00AC3E53 AS DateTime), 48, 9, 58, 10, 70, CAST(0.031605000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (815, 128, CAST(0x0000A60C00AC3E57 AS DateTime), 48, 9, 58, 10, 70, CAST(0.005601000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (816, 128, CAST(0x0000A60C00AC3E5B AS DateTime), 48, 9, 58, 10, 70, CAST(0.001166800000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (817, 128, CAST(0x0000A60C00AC3E5E AS DateTime), 48, 9, 58, 10, 82, CAST(0.017719100000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (818, 128, CAST(0x0000A60C00AC3E62 AS DateTime), 48, 9, 58, 10, 86, CAST(0.003734000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (819, 128, CAST(0x0000A60C00AC3E66 AS DateTime), 48, 9, 58, 10, 80, CAST(0.009568200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (820, 128, CAST(0x0000A60C00AC3E69 AS DateTime), 48, 9, 58, 10, 80, CAST(0.003500600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (821, 128, CAST(0x0000A60C00AC3E71 AS DateTime), 48, 9, 58, 10, 78, CAST(0.022403200000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (822, 160, CAST(0x0000A60C00AC3EAB AS DateTime), 54, 9, 58, 10, 78, CAST(0.002880000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (823, 143, CAST(0x0000A60C00AC3F04 AS DateTime), 50, 9, 58, 10, 86, CAST(0.009034600000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (824, 143, CAST(0x0000A60C00AC3F08 AS DateTime), 50, 9, 58, 10, 82, CAST(0.001867000000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (825, 143, CAST(0x0000A60C00AC3F0C AS DateTime), 50, 9, 58, 10, 85, CAST(0.471726500000000 AS Decimal(20, 15)), 78, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (826, 143, CAST(0x0000A60C00AC3F23 AS DateTime), 50, 9, 58, 10, 80, CAST(0.010123700000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (827, 147, CAST(0x0000A60C00AC3F3B AS DateTime), 47, 9, 58, 10, 70, CAST(0.001867000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (828, 147, CAST(0x0000A60C00AC420A AS DateTime), 47, 9, 58, 10, 70, CAST(0.002800500000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (829, 128, CAST(0x0000A60C00AC4552 AS DateTime), 48, 9, 58, 10, 83, CAST(0.009101300000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (830, 128, CAST(0x0000A60C00AC455D AS DateTime), 48, 9, 58, 10, 70, CAST(0.006534500000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (831, 128, CAST(0x0000A60C00AC4561 AS DateTime), 48, 9, 58, 10, 81, CAST(0.002917200000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (832, 128, CAST(0x0000A60C00AC4564 AS DateTime), 48, 9, 58, 10, 81, CAST(0.001166800000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (833, 128, CAST(0x0000A60C00AC4568 AS DateTime), 48, 9, 58, 10, 82, CAST(0.045741500000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (834, 128, CAST(0x0000A60C00AC456C AS DateTime), 48, 9, 58, 10, 82, CAST(0.001867000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (835, 128, CAST(0x0000A60C00AC4593 AS DateTime), 48, 9, 58, 10, 83, CAST(0.000700100000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (836, 47, CAST(0x0000A60C00AC45CE AS DateTime), 49, 9, 58, 10, 70, CAST(0.000933500000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (837, 47, CAST(0x0000A60C00AC45D3 AS DateTime), 49, 9, 58, 10, 70, CAST(0.000540000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (838, 160, CAST(0x0000A60C00AC45EB AS DateTime), 54, 9, 58, 10, 78, CAST(0.005601000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (839, 160, CAST(0x0000A60C00AC45EE AS DateTime), 54, 9, 58, 10, 78, CAST(0.188567000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (840, 143, CAST(0x0000A60C00AC4623 AS DateTime), 50, 9, 58, 10, 78, CAST(0.255779000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (841, 143, CAST(0x0000A60C00AC463B AS DateTime), 50, 9, 58, 10, 86, CAST(0.005601000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (842, 143, CAST(0x0000A60C00AC4647 AS DateTime), 50, 9, 58, 10, 78, CAST(0.028005000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (843, 143, CAST(0x0000A60C00AC464B AS DateTime), 50, 9, 58, 10, 80, CAST(0.004968000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (844, 143, CAST(0x0000A60C00AC464F AS DateTime), 50, 9, 58, 10, 80, CAST(0.065150200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (845, 143, CAST(0x0000A60C00AC4653 AS DateTime), 50, 9, 58, 10, 80, CAST(0.000135000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (846, 147, CAST(0x0000A60C00AC4676 AS DateTime), 47, 9, 58, 10, 70, CAST(0.007468000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (847, 147, CAST(0x0000A60C00AC467A AS DateTime), 47, 9, 58, 10, 86, CAST(0.001890300000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (848, 128, CAST(0x0000A60C00AC4A38 AS DateTime), 48, 9, 58, 10, 83, CAST(0.007001000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (849, 128, CAST(0x0000A60C00AC4A44 AS DateTime), 48, 9, 58, 10, 83, CAST(0.014002000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (850, 128, CAST(0x0000A60C00AC4A48 AS DateTime), 48, 9, 58, 10, 78, CAST(0.042006000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (851, 128, CAST(0x0000A60C00AC4A62 AS DateTime), 48, 9, 58, 10, 83, CAST(0.018902700000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (852, 128, CAST(0x0000A60C00AC4A6F AS DateTime), 48, 9, 58, 10, 70, CAST(0.000933500000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (853, 128, CAST(0x0000A60C00AC4A73 AS DateTime), 48, 9, 58, 10, 70, CAST(0.003734000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (854, 128, CAST(0x0000A60C00AC4A77 AS DateTime), 48, 9, 58, 10, 82, CAST(0.007468000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (855, 128, CAST(0x0000A60C00AC4AA0 AS DateTime), 48, 9, 58, 10, 83, CAST(0.012601800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (856, 128, CAST(0x0000A60C00AC4AA3 AS DateTime), 48, 9, 58, 10, 78, CAST(0.007001000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (857, 47, CAST(0x0000A60C00AC4AE5 AS DateTime), 49, 9, 58, 10, 80, CAST(0.000270000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (858, 47, CAST(0x0000A60C00AC4AE9 AS DateTime), 49, 9, 58, 10, 80, CAST(0.000466700000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (859, 47, CAST(0x0000A60C00AC4AED AS DateTime), 49, 9, 58, 10, 80, CAST(0.001750200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (860, 143, CAST(0x0000A60C00AC4B38 AS DateTime), 50, 9, 58, 10, 86, CAST(0.003600000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (861, 143, CAST(0x0000A60C00AC4B54 AS DateTime), 50, 9, 58, 10, 80, CAST(0.004968000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (862, 143, CAST(0x0000A60C00AC4B58 AS DateTime), 50, 9, 58, 10, 80, CAST(0.040617200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (863, 143, CAST(0x0000A60C00AC4B5C AS DateTime), 50, 9, 58, 10, 80, CAST(0.000090000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (864, 128, CAST(0x0000A60C00AC4F44 AS DateTime), 48, 9, 58, 10, 83, CAST(0.051107300000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (865, 128, CAST(0x0000A60C00AC4F51 AS DateTime), 48, 9, 58, 10, 70, CAST(0.017669500000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (866, 128, CAST(0x0000A60C00AC4F55 AS DateTime), 48, 9, 58, 10, 70, CAST(0.000933500000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (867, 128, CAST(0x0000A60C00AC4F58 AS DateTime), 48, 9, 58, 10, 70, CAST(0.001075100000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (868, 128, CAST(0x0000A60C00AC4F5D AS DateTime), 48, 9, 58, 10, 81, CAST(0.003734000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (869, 128, CAST(0x0000A60C00AC4F61 AS DateTime), 48, 9, 58, 10, 82, CAST(0.177298000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (870, 128, CAST(0x0000A60C00AC4F65 AS DateTime), 48, 9, 58, 10, 82, CAST(0.004667200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (871, 128, CAST(0x0000A60C00AC4F69 AS DateTime), 48, 9, 58, 10, 86, CAST(0.001400200000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (872, 128, CAST(0x0000A60C00AC4F6E AS DateTime), 48, 9, 58, 10, 80, CAST(0.019769800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (873, 47, CAST(0x0000A60C00AC4FC7 AS DateTime), 49, 9, 58, 10, 81, CAST(0.002800500000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (874, 47, CAST(0x0000A60C00AC4FCA AS DateTime), 49, 9, 58, 10, 80, CAST(0.000466700000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (875, 47, CAST(0x0000A60C00AC4FCF AS DateTime), 49, 9, 58, 10, 80, CAST(0.001400200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (876, 160, CAST(0x0000A60C00AC4FEE AS DateTime), 54, 9, 58, 10, 78, CAST(0.001920000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (877, 143, CAST(0x0000A60C00AC5032 AS DateTime), 50, 9, 58, 10, 86, CAST(0.004574100000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (878, 143, CAST(0x0000A60C00AC5045 AS DateTime), 50, 9, 58, 10, 80, CAST(0.018164300000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (879, 143, CAST(0x0000A60C00AC5049 AS DateTime), 50, 9, 58, 10, 80, CAST(0.000270000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (880, 147, CAST(0x0000A60C00AC5068 AS DateTime), 47, 9, 58, 10, 70, CAST(0.010501800000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (881, 128, CAST(0x0000A60C00AC5470 AS DateTime), 48, 9, 58, 10, 83, CAST(0.025903700000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (882, 128, CAST(0x0000A60C00AC5494 AS DateTime), 48, 9, 58, 10, 70, CAST(0.005601000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (883, 128, CAST(0x0000A60C00AC5499 AS DateTime), 48, 9, 58, 10, 86, CAST(0.007401000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (884, 128, CAST(0x0000A60C00AC549D AS DateTime), 48, 9, 58, 10, 86, CAST(0.000300000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (885, 160, CAST(0x0000A60C00AC5507 AS DateTime), 54, 9, 58, 10, 78, CAST(0.002880000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (886, 160, CAST(0x0000A60C00AC5520 AS DateTime), 54, 9, 58, 10, 78, CAST(0.009600000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (887, 143, CAST(0x0000A60C00AC5553 AS DateTime), 50, 9, 58, 10, 78, CAST(0.049008600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (888, 143, CAST(0x0000A60C00AC5570 AS DateTime), 50, 9, 58, 10, 82, CAST(0.074678400000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (889, 143, CAST(0x0000A60C00AC5575 AS DateTime), 50, 9, 58, 10, 86, CAST(0.116694000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (890, 143, CAST(0x0000A60C00AC557E AS DateTime), 50, 9, 58, 10, 86, CAST(1.490463900000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (891, 143, CAST(0x0000A60C00AC5582 AS DateTime), 50, 9, 58, 10, 86, CAST(0.008120800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (892, 143, CAST(0x0000A60C00AC5596 AS DateTime), 50, 9, 58, 10, 78, CAST(0.142591700000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (893, 143, CAST(0x0000A60C00AC55AB AS DateTime), 50, 9, 58, 10, 80, CAST(0.028005000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (894, 147, CAST(0x0000A60C00AC55C7 AS DateTime), 47, 9, 58, 10, 70, CAST(0.008401000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (895, 162, CAST(0x0000A60C00AC55CF AS DateTime), 51, 9, 58, 10, 86, CAST(0.011202000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (896, 153, CAST(0x0000A60C00AC3E90 AS DateTime), 49, 9, 57, 15, 97, CAST(0.042068000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (897, 153, CAST(0x0000A60C00AC45AF AS DateTime), 49, 9, 57, 15, 97, CAST(0.410229300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (898, 153, CAST(0x0000A60C00AC45B3 AS DateTime), 49, 9, 57, 15, 97, CAST(0.254819200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (899, 153, CAST(0x0000A60C00AC4AC4 AS DateTime), 49, 9, 57, 15, 97, CAST(1.086477600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (900, 153, CAST(0x0000A60C00AC4AC8 AS DateTime), 49, 9, 57, 15, 97, CAST(0.133013600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (901, 153, CAST(0x0000A60C00AC4FA7 AS DateTime), 49, 9, 57, 15, 97, CAST(0.207681500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (902, 153, CAST(0x0000A60C00AC4FAB AS DateTime), 49, 9, 57, 15, 97, CAST(0.109674500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (903, 153, CAST(0x0000A60C00AC54C8 AS DateTime), 49, 9, 57, 15, 97, CAST(0.001350000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (904, 153, CAST(0x0000A60C00AC54CC AS DateTime), 49, 9, 57, 15, 97, CAST(0.007933900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (905, 153, CAST(0x0000A60C00AC54D0 AS DateTime), 49, 9, 57, 15, 97, CAST(0.019134700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (906, 151, CAST(0x0000A60C00AC3F52 AS DateTime), 49, 10, 81, 25, 135, CAST(0.002400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (907, 157, CAST(0x0000A60C00AC3F56 AS DateTime), 54, 10, 81, 25, 132, CAST(0.072000000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (908, 126, CAST(0x0000A60C00AC4695 AS DateTime), 48, 10, 81, 25, 133, CAST(0.006000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (909, 151, CAST(0x0000A60C00AC46B4 AS DateTime), 49, 10, 81, 25, 134, CAST(0.033600000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (910, 151, CAST(0x0000A60C00AC46B7 AS DateTime), 49, 10, 81, 25, 134, CAST(0.031200000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (911, 126, CAST(0x0000A60C00AC4B8B AS DateTime), 48, 10, 81, 25, 133, CAST(0.016800000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (912, 126, CAST(0x0000A60C00AC4BA0 AS DateTime), 48, 10, 81, 25, 133, CAST(0.010800000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (913, 151, CAST(0x0000A60C00AC4BA4 AS DateTime), 49, 10, 81, 25, 134, CAST(0.216000000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (914, 151, CAST(0x0000A60C00AC4BAC AS DateTime), 49, 10, 81, 25, 134, CAST(0.144000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (915, 151, CAST(0x0000A60C00AC4BBC AS DateTime), 49, 10, 81, 25, 135, CAST(0.002400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (916, 126, CAST(0x0000A60C00AC507B AS DateTime), 48, 10, 81, 25, 133, CAST(0.007200000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (917, 151, CAST(0x0000A60C00AC5098 AS DateTime), 49, 10, 81, 25, 134, CAST(0.079200000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (918, 151, CAST(0x0000A60C00AC509F AS DateTime), 49, 10, 81, 25, 135, CAST(0.602400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (919, 151, CAST(0x0000A60C00AC50A3 AS DateTime), 49, 10, 81, 25, 135, CAST(0.007200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (920, 151, CAST(0x0000A60C00AC50A7 AS DateTime), 49, 10, 81, 25, 135, CAST(0.146400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (921, 151, CAST(0x0000A60C00AC55FA AS DateTime), 49, 10, 81, 25, 134, CAST(0.045600000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (922, 151, CAST(0x0000A60C00AC55FF AS DateTime), 49, 10, 81, 25, 135, CAST(0.153600000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (923, 151, CAST(0x0000A60C00AC5603 AS DateTime), 49, 10, 81, 25, 135, CAST(0.093600000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (924, 143, CAST(0x0000A60C00AC3F5E AS DateTime), 50, 10, 58, 10, 86, CAST(0.002400000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (925, 143, CAST(0x0000A60C00AC3F61 AS DateTime), 50, 10, 58, 10, 80, CAST(0.004800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (926, 128, CAST(0x0000A60C00AC469F AS DateTime), 48, 10, 58, 10, 70, CAST(0.019200000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (927, 128, CAST(0x0000A60C00AC46A2 AS DateTime), 48, 10, 58, 10, 70, CAST(0.002400000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (928, 128, CAST(0x0000A60C00AC46A6 AS DateTime), 48, 10, 58, 10, 81, CAST(0.007200000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (929, 128, CAST(0x0000A60C00AC46AA AS DateTime), 48, 10, 58, 10, 80, CAST(0.004800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (930, 143, CAST(0x0000A60C00AC46BB AS DateTime), 50, 10, 58, 10, 80, CAST(0.016800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (931, 128, CAST(0x0000A60C00AC4B95 AS DateTime), 48, 10, 58, 10, 70, CAST(0.004800000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (932, 128, CAST(0x0000A60C00AC4B98 AS DateTime), 48, 10, 58, 10, 81, CAST(0.020016000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (933, 50, CAST(0x0000A60C00AC4BB0 AS DateTime), 49, 10, 58, 10, 80, CAST(0.000211200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (934, 50, CAST(0x0000A60C00AC4BB4 AS DateTime), 49, 10, 58, 10, 80, CAST(0.004800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (935, 50, CAST(0x0000A60C00AC4BB8 AS DateTime), 49, 10, 58, 10, 80, CAST(0.009600000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (936, 143, CAST(0x0000A60C00AC4BC0 AS DateTime), 50, 10, 58, 10, 78, CAST(0.038400000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (937, 143, CAST(0x0000A60C00AC4BC3 AS DateTime), 50, 10, 58, 10, 80, CAST(0.016800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (938, 128, CAST(0x0000A60C00AC5083 AS DateTime), 48, 10, 58, 10, 82, CAST(0.007200000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (939, 128, CAST(0x0000A60C00AC5087 AS DateTime), 48, 10, 58, 10, 86, CAST(0.002400000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (940, 128, CAST(0x0000A60C00AC508B AS DateTime), 48, 10, 58, 10, 80, CAST(0.026400000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (941, 50, CAST(0x0000A60C00AC509B AS DateTime), 49, 10, 58, 10, 80, CAST(0.009600000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (942, 143, CAST(0x0000A60C00AC50AE AS DateTime), 50, 10, 58, 10, 80, CAST(0.009600000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (943, 128, CAST(0x0000A60C00AC55DB AS DateTime), 48, 10, 58, 10, 70, CAST(0.004800000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (944, 128, CAST(0x0000A60C00AC55DF AS DateTime), 48, 10, 58, 10, 86, CAST(0.004800000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (945, 128, CAST(0x0000A60C00AC55E3 AS DateTime), 48, 10, 58, 10, 80, CAST(0.002400000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (946, 128, CAST(0x0000A60C00AC55E7 AS DateTime), 48, 10, 58, 10, 80, CAST(0.004800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (947, 143, CAST(0x0000A60C00AC5607 AS DateTime), 50, 10, 58, 10, 82, CAST(0.074400000000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (948, 143, CAST(0x0000A60C00AC560A AS DateTime), 50, 10, 58, 10, 86, CAST(0.266400000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (949, 143, CAST(0x0000A60C00AC560E AS DateTime), 50, 10, 58, 10, 80, CAST(0.069600000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (950, 153, CAST(0x0000A60C00AC46AF AS DateTime), 49, 10, 57, 15, 97, CAST(0.278400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (951, 153, CAST(0x0000A60C00AC4BA8 AS DateTime), 49, 10, 57, 15, 97, CAST(0.002400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (952, 153, CAST(0x0000A60C00AC55F2 AS DateTime), 49, 10, 57, 15, 97, CAST(0.002400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (953, 153, CAST(0x0000A60C00AC55F6 AS DateTime), 49, 10, 57, 15, 99, CAST(0.004800000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (954, 127, CAST(0x0000A60C00AC4690 AS DateTime), 48, 10, 58, 23, 125, CAST(0.012000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (955, 127, CAST(0x0000A60C00AC469A AS DateTime), 48, 10, 58, 23, 125, CAST(0.002400000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (956, 127, CAST(0x0000A60C00AC4B88 AS DateTime), 48, 10, 58, 23, 125, CAST(0.024000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (957, 127, CAST(0x0000A60C00AC4B91 AS DateTime), 48, 10, 58, 23, 125, CAST(0.021600000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (958, 127, CAST(0x0000A60C00AC4B9C AS DateTime), 48, 10, 58, 23, 126, CAST(0.038400000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (959, 127, CAST(0x0000A60C00AC5077 AS DateTime), 48, 10, 58, 23, 125, CAST(0.007200000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (960, 127, CAST(0x0000A60C00AC507F AS DateTime), 48, 10, 58, 23, 125, CAST(0.028800000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (961, 127, CAST(0x0000A60C00AC5093 AS DateTime), 48, 10, 58, 23, 125, CAST(0.048000000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (962, 127, CAST(0x0000A60C00AC55D7 AS DateTime), 48, 10, 58, 23, 125, CAST(0.033600000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (963, 127, CAST(0x0000A60C00AC55EB AS DateTime), 48, 10, 58, 23, 125, CAST(0.048000000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (964, 144, CAST(0x0000A60C00AC4216 AS DateTime), 50, 10, 57, 6, 39, CAST(0.016800000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (965, 144, CAST(0x0000A60C00AC4358 AS DateTime), 50, 10, 57, 6, 39, CAST(0.084000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (966, 159, CAST(0x0000A60C00AC50AB AS DateTime), 54, 10, 57, 6, 40, CAST(0.002400000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (967, 142, CAST(0x0000A60C00AC3F65 AS DateTime), 50, 11, 58, 23, 125, CAST(0.024000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (968, 142, CAST(0x0000A60C00AC421B AS DateTime), 50, 11, 58, 23, 125, CAST(0.261600000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (969, 142, CAST(0x0000A60C00AC421F AS DateTime), 50, 11, 58, 23, 125, CAST(0.283200000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (970, 142, CAST(0x0000A60C00AC46C1 AS DateTime), 50, 11, 58, 23, 125, CAST(0.763200000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (971, 142, CAST(0x0000A60C00AC4BC8 AS DateTime), 50, 11, 58, 23, 125, CAST(0.074400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (972, 142, CAST(0x0000A60C00AC50B3 AS DateTime), 50, 11, 58, 23, 125, CAST(0.206400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (973, 142, CAST(0x0000A60C00AC50B8 AS DateTime), 50, 11, 58, 23, 125, CAST(0.004800000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (974, 143, CAST(0x0000A60C00AC3F69 AS DateTime), 50, 11, 58, 10, 82, CAST(0.129600000000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (975, 143, CAST(0x0000A60C00AC46C6 AS DateTime), 50, 11, 58, 10, 80, CAST(0.004800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (976, 127, CAST(0x0000A60C00AC46CA AS DateTime), 48, 12, 58, 23, 125, CAST(0.001905000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (977, 127, CAST(0x0000A60C00AC46D3 AS DateTime), 48, 12, 58, 23, 125, CAST(0.017780000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (978, 127, CAST(0x0000A60C00AC50BC AS DateTime), 48, 12, 58, 23, 125, CAST(0.021590000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (979, 127, CAST(0x0000A60C00AC50C5 AS DateTime), 48, 12, 58, 23, 125, CAST(0.036195000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (980, 127, CAST(0x0000A60C00AC5611 AS DateTime), 48, 12, 58, 23, 125, CAST(0.001270000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (981, 151, CAST(0x0000A60C00AC46D8 AS DateTime), 49, 12, 81, 25, 135, CAST(0.008255000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (982, 151, CAST(0x0000A60C00AC50C8 AS DateTime), 49, 12, 81, 25, 135, CAST(0.001270000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (983, 151, CAST(0x0000A60C00AC50CD AS DateTime), 49, 12, 81, 25, 135, CAST(0.000635000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (984, 151, CAST(0x0000A60C00AC5615 AS DateTime), 49, 12, 81, 25, 135, CAST(0.005080000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (985, 58, CAST(0x0000A60C00AC3F6D AS DateTime), 53, 12, 57, 15, 97, CAST(0.000635000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (986, 58, CAST(0x0000A60C00AC4222 AS DateTime), 53, 12, 57, 15, 97, CAST(0.002540000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (987, 58, CAST(0x0000A60C00AC4BCB AS DateTime), 53, 12, 57, 15, 97, CAST(0.003175000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (988, 58, CAST(0x0000A60C00AC50D0 AS DateTime), 53, 12, 57, 15, 97, CAST(0.005715000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (989, 58, CAST(0x0000A60C00AC561A AS DateTime), 53, 12, 57, 15, 97, CAST(0.001905000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (990, 137, CAST(0x0000A60C00AC4BCF AS DateTime), 52, 12, 57, 6, 41, CAST(0.006350000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (991, 128, CAST(0x0000A60C00AC46CF AS DateTime), 48, 12, 58, 10, 70, CAST(0.000635000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (992, 143, CAST(0x0000A60C00AC4BD3 AS DateTime), 50, 12, 58, 10, 86, CAST(0.000635000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (993, 143, CAST(0x0000A60C00AC4BD7 AS DateTime), 50, 12, 58, 10, 80, CAST(0.000635000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (994, 128, CAST(0x0000A60C00AC50C1 AS DateTime), 48, 12, 58, 10, 70, CAST(0.000635000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (995, 151, CAST(0x0000A60C00AC3F80 AS DateTime), 49, 14, 81, 25, 135, CAST(0.021600000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (996, 141, CAST(0x0000A60C00AC3F90 AS DateTime), 50, 14, 81, 25, 135, CAST(0.184172000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (997, 141, CAST(0x0000A60C00AC4360 AS DateTime), 50, 14, 81, 25, 135, CAST(0.303330000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (998, 151, CAST(0x0000A60C00AC4702 AS DateTime), 49, 14, 81, 25, 135, CAST(0.012000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (999, 151, CAST(0x0000A60C00AC4706 AS DateTime), 49, 14, 81, 25, 135, CAST(0.004800000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1000, 126, CAST(0x0000A60C00AC4BDB AS DateTime), 48, 14, 81, 25, 135, CAST(0.020000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1001, 151, CAST(0x0000A60C00AC4BEB AS DateTime), 49, 14, 81, 25, 135, CAST(0.035333400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1002, 151, CAST(0x0000A60C00AC4BEE AS DateTime), 49, 14, 81, 25, 135, CAST(0.752670000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1003, 141, CAST(0x0000A60C00AC4BFF AS DateTime), 50, 14, 81, 25, 135, CAST(0.105599300000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1004, 151, CAST(0x0000A60C00AC50F8 AS DateTime), 49, 14, 81, 25, 135, CAST(0.005000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1005, 151, CAST(0x0000A60C00AC50FC AS DateTime), 49, 14, 81, 25, 135, CAST(0.001400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1006, 141, CAST(0x0000A60C00AC5106 AS DateTime), 50, 14, 81, 25, 135, CAST(0.133857600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1007, 151, CAST(0x0000A60C00AC562D AS DateTime), 49, 14, 81, 25, 135, CAST(0.041266700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1008, 151, CAST(0x0000A60C00AC5631 AS DateTime), 49, 14, 81, 25, 135, CAST(0.140800000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1009, 157, CAST(0x0000A60C00AC5635 AS DateTime), 54, 14, 81, 25, 135, CAST(0.010400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1010, 141, CAST(0x0000A60C00AC5650 AS DateTime), 50, 14, 81, 25, 135, CAST(0.480722100000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1011, 141, CAST(0x0000A60C00AC5655 AS DateTime), 50, 14, 81, 25, 135, CAST(0.002000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1012, 141, CAST(0x0000A60C00AC5659 AS DateTime), 50, 14, 81, 25, 135, CAST(0.001600000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1013, 152, CAST(0x0000A60C00AC3F75 AS DateTime), 49, 14, 58, 23, 125, CAST(0.224400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1014, 152, CAST(0x0000A60C00AC46F9 AS DateTime), 49, 14, 58, 23, 125, CAST(0.176000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1015, 152, CAST(0x0000A60C00AC4BDF AS DateTime), 49, 14, 58, 23, 125, CAST(0.019200000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1016, 152, CAST(0x0000A60C00AC4BE3 AS DateTime), 49, 14, 58, 23, 125, CAST(0.151200000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1017, 152, CAST(0x0000A60C00AC50EF AS DateTime), 49, 14, 58, 23, 125, CAST(0.188404200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1018, 152, CAST(0x0000A60C00AC562A AS DateTime), 49, 14, 58, 23, 125, CAST(0.137604300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1019, 142, CAST(0x0000A60C00AC5648 AS DateTime), 50, 14, 58, 23, 125, CAST(0.613386000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1020, 128, CAST(0x0000A60C00AC3F70 AS DateTime), 48, 14, 58, 10, 82, CAST(0.001200000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1021, 143, CAST(0x0000A60C00AC3F88 AS DateTime), 50, 14, 58, 10, 82, CAST(0.000750000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1022, 143, CAST(0x0000A60C00AC3F8D AS DateTime), 50, 14, 58, 10, 80, CAST(0.004016700000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1023, 63, CAST(0x0000A60C00AC4226 AS DateTime), 49, 14, 58, 10, 78, CAST(0.015000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1024, 143, CAST(0x0000A60C00AC4266 AS DateTime), 50, 14, 58, 10, 86, CAST(0.060660600000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1025, 143, CAST(0x0000A60C00AC435D AS DateTime), 50, 14, 58, 10, 70, CAST(0.046934400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1026, 128, CAST(0x0000A60C00AC46E1 AS DateTime), 48, 14, 58, 10, 70, CAST(0.010000000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1027, 128, CAST(0x0000A60C00AC46E8 AS DateTime), 48, 14, 58, 10, 70, CAST(0.002000000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1028, 128, CAST(0x0000A60C00AC46ED AS DateTime), 48, 14, 58, 10, 81, CAST(0.006800000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1029, 128, CAST(0x0000A60C00AC46F1 AS DateTime), 48, 14, 58, 10, 82, CAST(0.000800000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1030, 128, CAST(0x0000A60C00AC46F6 AS DateTime), 48, 14, 58, 10, 82, CAST(0.000400000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1031, 63, CAST(0x0000A60C00AC46FE AS DateTime), 49, 14, 58, 10, 80, CAST(0.002400000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1032, 143, CAST(0x0000A60C00AC470F AS DateTime), 50, 14, 58, 10, 82, CAST(0.017333300000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1033, 143, CAST(0x0000A60C00AC4714 AS DateTime), 50, 14, 58, 10, 80, CAST(0.002999900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1034, 63, CAST(0x0000A60C00AC4BE7 AS DateTime), 49, 14, 58, 10, 80, CAST(0.000800000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1035, 143, CAST(0x0000A60C00AC4BF2 AS DateTime), 50, 14, 58, 10, 82, CAST(0.029597100000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1036, 143, CAST(0x0000A60C00AC4BF6 AS DateTime), 50, 14, 58, 10, 85, CAST(0.047952000000000 AS Decimal(20, 15)), 78, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1037, 143, CAST(0x0000A60C00AC4BFA AS DateTime), 50, 14, 58, 10, 80, CAST(0.002666600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1038, 128, CAST(0x0000A60C00AC50D4 AS DateTime), 48, 14, 58, 10, 70, CAST(0.002000000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1039, 128, CAST(0x0000A60C00AC50D8 AS DateTime), 48, 14, 58, 10, 81, CAST(0.040000000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1040, 128, CAST(0x0000A60C00AC50DD AS DateTime), 48, 14, 58, 10, 81, CAST(0.010000000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1041, 128, CAST(0x0000A60C00AC50E0 AS DateTime), 48, 14, 58, 10, 81, CAST(0.009000000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1042, 128, CAST(0x0000A60C00AC50E4 AS DateTime), 48, 14, 58, 10, 82, CAST(0.000800000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1043, 128, CAST(0x0000A60C00AC50E8 AS DateTime), 48, 14, 58, 10, 80, CAST(0.000700000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1044, 63, CAST(0x0000A60C00AC50EB AS DateTime), 49, 14, 58, 10, 78, CAST(0.005000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1045, 63, CAST(0x0000A60C00AC50F3 AS DateTime), 49, 14, 58, 10, 80, CAST(0.002400000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1046, 143, CAST(0x0000A60C00AC50FF AS DateTime), 50, 14, 58, 10, 78, CAST(0.026400000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1047, 143, CAST(0x0000A60C00AC5103 AS DateTime), 50, 14, 58, 10, 80, CAST(0.004000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1048, 128, CAST(0x0000A60C00AC561E AS DateTime), 48, 14, 58, 10, 86, CAST(0.000800000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1049, 63, CAST(0x0000A60C00AC5626 AS DateTime), 49, 14, 58, 10, 78, CAST(0.022000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1050, 143, CAST(0x0000A60C00AC5638 AS DateTime), 50, 14, 58, 10, 82, CAST(0.015000000000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1051, 143, CAST(0x0000A60C00AC563D AS DateTime), 50, 14, 58, 10, 86, CAST(0.235872800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1052, 143, CAST(0x0000A60C00AC5641 AS DateTime), 50, 14, 58, 10, 86, CAST(0.000800000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1053, 143, CAST(0x0000A60C00AC5644 AS DateTime), 50, 14, 58, 10, 78, CAST(0.046400000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1054, 143, CAST(0x0000A60C00AC564C AS DateTime), 50, 14, 58, 10, 80, CAST(0.003200000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1055, 64, CAST(0x0000A60C00AC3F84 AS DateTime), 50, 14, 57, 5, 29, CAST(0.115729200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1056, 64, CAST(0x0000A60C00AC425F AS DateTime), 50, 14, 57, 5, 29, CAST(0.012132900000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1057, 64, CAST(0x0000A60C00AC470C AS DateTime), 50, 14, 57, 5, 29, CAST(0.015866100000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1058, 64, CAST(0x0000A60C00AC5622 AS DateTime), 49, 14, 58, 5, 31, CAST(0.014400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1059, 65, CAST(0x0000A60C00AC3F79 AS DateTime), 49, 14, 57, 6, 43, CAST(0.042400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1060, 149, CAST(0x0000A60C00AC510A AS DateTime), 47, 14, 57, 6, 40, CAST(0.009600000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1061, 149, CAST(0x0000A60C00AC565C AS DateTime), 47, 14, 57, 6, 40, CAST(0.024000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1062, 126, CAST(0x0000A60C00AC3F94 AS DateTime), 48, 15, 81, 25, 134, CAST(1.975200000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1063, 151, CAST(0x0000A60C00AC3F97 AS DateTime), 49, 15, 81, 25, 134, CAST(0.838305600000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1064, 151, CAST(0x0000A60C00AC3F9B AS DateTime), 49, 15, 81, 25, 135, CAST(2.000407500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1065, 151, CAST(0x0000A60C00AC3F9F AS DateTime), 49, 15, 81, 25, 135, CAST(1.425000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1066, 131, CAST(0x0000A60C00AC3FA4 AS DateTime), 53, 15, 81, 25, 133, CAST(0.019048000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1067, 141, CAST(0x0000A60C00AC3FF4 AS DateTime), 50, 15, 81, 25, 135, CAST(1.086494625000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1068, 141, CAST(0x0000A60C00AC3FF9 AS DateTime), 50, 15, 81, 25, 135, CAST(0.066000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1069, 131, CAST(0x0000A60C00AC426A AS DateTime), 53, 15, 81, 25, 133, CAST(0.304768000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1070, 141, CAST(0x0000A60C00AC428A AS DateTime), 50, 15, 81, 25, 135, CAST(0.629740000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1071, 141, CAST(0x0000A60C00AC428F AS DateTime), 50, 15, 81, 25, 135, CAST(0.026400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1072, 141, CAST(0x0000A60C00AC4369 AS DateTime), 50, 15, 81, 25, 135, CAST(0.126000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1073, 126, CAST(0x0000A60C00AC471A AS DateTime), 48, 15, 81, 25, 134, CAST(0.345600000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1074, 151, CAST(0x0000A60C00AC4722 AS DateTime), 49, 15, 81, 25, 134, CAST(1.320000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1075, 151, CAST(0x0000A60C00AC472A AS DateTime), 49, 15, 81, 25, 135, CAST(0.004960400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1076, 151, CAST(0x0000A60C00AC472E AS DateTime), 49, 15, 81, 25, 135, CAST(0.478800000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1077, 157, CAST(0x0000A60C00AC4735 AS DateTime), 54, 15, 81, 25, 135, CAST(0.030208800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1078, 141, CAST(0x0000A60C00AC4771 AS DateTime), 50, 15, 81, 25, 135, CAST(0.207900000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1079, 126, CAST(0x0000A60C00AC4C03 AS DateTime), 48, 15, 81, 25, 134, CAST(0.024000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1080, 151, CAST(0x0000A60C00AC4C07 AS DateTime), 49, 15, 81, 25, 134, CAST(0.047631000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1081, 151, CAST(0x0000A60C00AC4C0C AS DateTime), 49, 15, 81, 25, 134, CAST(0.001200000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1082, 151, CAST(0x0000A60C00AC4C15 AS DateTime), 49, 15, 81, 25, 135, CAST(0.635080000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1083, 151, CAST(0x0000A60C00AC4C18 AS DateTime), 49, 15, 81, 25, 135, CAST(0.457128000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1084, 141, CAST(0x0000A60C00AC4C4F AS DateTime), 50, 15, 81, 25, 135, CAST(0.529200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1085, 141, CAST(0x0000A60C00AC4C54 AS DateTime), 50, 15, 81, 25, 135, CAST(0.105600000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1086, 126, CAST(0x0000A60C00AC510E AS DateTime), 48, 15, 81, 25, 134, CAST(1.237200000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1087, 151, CAST(0x0000A60C00AC5112 AS DateTime), 49, 15, 81, 25, 134, CAST(4.685621200000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1088, 151, CAST(0x0000A60C00AC511E AS DateTime), 49, 15, 81, 25, 135, CAST(0.001240100000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1089, 151, CAST(0x0000A60C00AC5122 AS DateTime), 49, 15, 81, 25, 135, CAST(0.658350000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1090, 151, CAST(0x0000A60C00AC5126 AS DateTime), 49, 15, 81, 25, 135, CAST(0.439985700000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1091, 141, CAST(0x0000A60C00AC5161 AS DateTime), 50, 15, 81, 25, 135, CAST(1.133298000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1092, 141, CAST(0x0000A60C00AC5164 AS DateTime), 50, 15, 81, 25, 135, CAST(0.026400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1093, 126, CAST(0x0000A60C00AC5660 AS DateTime), 48, 15, 81, 25, 134, CAST(1.610400000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1094, 151, CAST(0x0000A60C00AC5664 AS DateTime), 49, 15, 81, 25, 134, CAST(0.550800000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1095, 151, CAST(0x0000A60C00AC5668 AS DateTime), 49, 15, 81, 25, 134, CAST(0.052800000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1096, 151, CAST(0x0000A60C00AC5680 AS DateTime), 49, 15, 81, 25, 135, CAST(0.003800000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1097, 151, CAST(0x0000A60C00AC5684 AS DateTime), 49, 15, 81, 25, 135, CAST(0.006152400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1098, 141, CAST(0x0000A60C00AC56B3 AS DateTime), 50, 15, 81, 25, 135, CAST(0.438660000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1099, 67, CAST(0x0000A60C00AC3FAC AS DateTime), 53, 15, 58, 10, 80, CAST(0.005744800000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1100, 143, CAST(0x0000A60C00AC3FB7 AS DateTime), 50, 15, 58, 10, 81, CAST(0.040320000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1101, 143, CAST(0x0000A60C00AC3FBB AS DateTime), 50, 15, 58, 10, 86, CAST(0.002268000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1102, 143, CAST(0x0000A60C00AC3FBE AS DateTime), 50, 15, 58, 10, 86, CAST(0.003174500000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1103, 143, CAST(0x0000A60C00AC3FC3 AS DateTime), 50, 15, 58, 10, 82, CAST(0.020770200000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1104, 143, CAST(0x0000A60C00AC3FC6 AS DateTime), 50, 15, 58, 10, 86, CAST(0.005040000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1105, 143, CAST(0x0000A60C00AC3FCA AS DateTime), 50, 15, 58, 10, 86, CAST(0.000660000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1106, 143, CAST(0x0000A60C00AC3FD7 AS DateTime), 50, 15, 58, 10, 78, CAST(0.082784000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1107, 143, CAST(0x0000A60C00AC3FE4 AS DateTime), 50, 15, 58, 10, 80, CAST(0.038029406250000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1108, 143, CAST(0x0000A60C00AC3FE8 AS DateTime), 50, 15, 58, 10, 80, CAST(0.114449340000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1109, 143, CAST(0x0000A60C00AC3FEC AS DateTime), 50, 15, 58, 10, 80, CAST(0.012980000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1110, 143, CAST(0x0000A60C00AC3FF0 AS DateTime), 50, 15, 58, 10, 80, CAST(0.009900000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1111, 143, CAST(0x0000A60C00AC3FFE AS DateTime), 50, 15, 58, 10, 80, CAST(0.004340548080000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1112, 67, CAST(0x0000A60C00AC4271 AS DateTime), 53, 15, 58, 10, 80, CAST(0.001510400000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1113, 143, CAST(0x0000A60C00AC427D AS DateTime), 50, 15, 58, 10, 86, CAST(0.084000000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1114, 143, CAST(0x0000A60C00AC4281 AS DateTime), 50, 15, 58, 10, 78, CAST(0.012329752500000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1115, 143, CAST(0x0000A60C00AC4285 AS DateTime), 50, 15, 58, 10, 78, CAST(0.273560000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1116, 147, CAST(0x0000A60C00AC4294 AS DateTime), 47, 15, 58, 10, 70, CAST(0.173874400000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1117, 143, CAST(0x0000A60C00AC4365 AS DateTime), 50, 15, 58, 10, 78, CAST(0.294840000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1118, 128, CAST(0x0000A60C00AC471E AS DateTime), 48, 15, 58, 10, 82, CAST(0.001200000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1119, 160, CAST(0x0000A60C00AC4732 AS DateTime), 54, 15, 58, 10, 86, CAST(0.001344000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1120, 143, CAST(0x0000A60C00AC474B AS DateTime), 50, 15, 58, 10, 81, CAST(0.007150000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1121, 143, CAST(0x0000A60C00AC474F AS DateTime), 50, 15, 58, 10, 86, CAST(0.001071000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1122, 143, CAST(0x0000A60C00AC4753 AS DateTime), 50, 15, 58, 10, 86, CAST(0.090626400000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1123, 143, CAST(0x0000A60C00AC475C AS DateTime), 50, 15, 58, 10, 78, CAST(0.188023500000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1124, 143, CAST(0x0000A60C00AC4764 AS DateTime), 50, 15, 58, 10, 80, CAST(0.136958640000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1125, 143, CAST(0x0000A60C00AC4769 AS DateTime), 50, 15, 58, 10, 80, CAST(0.001879320000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1126, 143, CAST(0x0000A60C00AC476D AS DateTime), 50, 15, 58, 10, 80, CAST(0.002200000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1127, 147, CAST(0x0000A60C00AC4778 AS DateTime), 47, 15, 58, 10, 86, CAST(1.151400000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1128, 143, CAST(0x0000A60C00AC4C28 AS DateTime), 50, 15, 58, 10, 81, CAST(0.009444600000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1129, 143, CAST(0x0000A60C00AC4C2C AS DateTime), 50, 15, 58, 10, 86, CAST(0.045313200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1130, 143, CAST(0x0000A60C00AC4C30 AS DateTime), 50, 15, 58, 10, 86, CAST(0.001269800000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1131, 143, CAST(0x0000A60C00AC4C34 AS DateTime), 50, 15, 58, 10, 82, CAST(0.151056000000000 AS Decimal(20, 15)), 76, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1132, 143, CAST(0x0000A60C00AC4C38 AS DateTime), 50, 15, 58, 10, 86, CAST(0.237600000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1133, 143, CAST(0x0000A60C00AC4C3C AS DateTime), 50, 15, 58, 10, 78, CAST(0.106448762500000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1134, 143, CAST(0x0000A60C00AC4C3F AS DateTime), 50, 15, 58, 10, 80, CAST(0.002649920000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1135, 143, CAST(0x0000A60C00AC4C43 AS DateTime), 50, 15, 58, 10, 80, CAST(0.031292425600000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1136, 143, CAST(0x0000A60C00AC4C47 AS DateTime), 50, 15, 58, 10, 80, CAST(0.003300000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1137, 143, CAST(0x0000A60C00AC4C4B AS DateTime), 50, 15, 58, 10, 80, CAST(0.003628600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1138, 147, CAST(0x0000A60C00AC4C57 AS DateTime), 47, 15, 58, 10, 70, CAST(0.004988200000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1139, 67, CAST(0x0000A60C00AC511B AS DateTime), 49, 15, 58, 10, 80, CAST(0.006350500000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1140, 143, CAST(0x0000A60C00AC513A AS DateTime), 50, 15, 58, 10, 86, CAST(0.135939600000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1141, 143, CAST(0x0000A60C00AC513E AS DateTime), 50, 15, 58, 10, 86, CAST(0.105600000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1142, 143, CAST(0x0000A60C00AC5142 AS DateTime), 50, 15, 58, 10, 85, CAST(0.059400000000000 AS Decimal(20, 15)), 78, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1143, 143, CAST(0x0000A60C00AC5146 AS DateTime), 50, 15, 58, 10, 86, CAST(0.029700000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1144, 143, CAST(0x0000A60C00AC5149 AS DateTime), 50, 15, 58, 10, 78, CAST(0.047520000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1145, 143, CAST(0x0000A60C00AC5152 AS DateTime), 50, 15, 58, 10, 80, CAST(0.005124626250000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1146, 143, CAST(0x0000A60C00AC5155 AS DateTime), 50, 15, 58, 10, 80, CAST(0.214997666250000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1147, 143, CAST(0x0000A60C00AC5159 AS DateTime), 50, 15, 58, 10, 80, CAST(0.002805000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1148, 143, CAST(0x0000A60C00AC515D AS DateTime), 50, 15, 58, 10, 80, CAST(0.003297900000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1149, 162, CAST(0x0000A60C00AC516D AS DateTime), 51, 15, 58, 10, 86, CAST(0.158640000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1150, 67, CAST(0x0000A60C00AC5678 AS DateTime), 49, 15, 58, 10, 80, CAST(0.001425000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1151, 67, CAST(0x0000A60C00AC567C AS DateTime), 49, 15, 58, 10, 80, CAST(0.001425000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1152, 143, CAST(0x0000A60C00AC5690 AS DateTime), 50, 15, 58, 10, 81, CAST(0.042651000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1153, 143, CAST(0x0000A60C00AC5694 AS DateTime), 50, 15, 58, 10, 81, CAST(0.110000000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1154, 143, CAST(0x0000A60C00AC5697 AS DateTime), 50, 15, 58, 10, 86, CAST(0.004200500000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1155, 143, CAST(0x0000A60C00AC569B AS DateTime), 50, 15, 58, 10, 78, CAST(0.003712500000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1156, 143, CAST(0x0000A60C00AC56A8 AS DateTime), 50, 15, 58, 10, 80, CAST(0.040911600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1157, 143, CAST(0x0000A60C00AC56AC AS DateTime), 50, 15, 58, 10, 80, CAST(0.018556480000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1158, 143, CAST(0x0000A60C00AC56B0 AS DateTime), 50, 15, 58, 10, 80, CAST(0.001868600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1159, 147, CAST(0x0000A60C00AC56BA AS DateTime), 47, 15, 58, 10, 86, CAST(0.000950000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1160, 162, CAST(0x0000A60C00AC56BF AS DateTime), 51, 15, 58, 10, 86, CAST(0.190752000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1161, 155, CAST(0x0000A60C00AC566B AS DateTime), 49, 15, 57, 8, 59, CAST(1.825425000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1162, 148, CAST(0x0000A60C00AC4002 AS DateTime), 47, 15, 58, 23, 125, CAST(0.005229800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1163, 152, CAST(0x0000A60C00AC4727 AS DateTime), 49, 15, 58, 23, 125, CAST(0.012571900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1164, 152, CAST(0x0000A60C00AC4C10 AS DateTime), 49, 15, 58, 23, 125, CAST(0.045716000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1165, 152, CAST(0x0000A60C00AC5117 AS DateTime), 49, 15, 58, 23, 125, CAST(0.255290100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1166, 152, CAST(0x0000A60C00AC566F AS DateTime), 49, 15, 58, 23, 125, CAST(0.263114400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1167, 152, CAST(0x0000A60C00AC5674 AS DateTime), 49, 15, 58, 23, 125, CAST(0.580435700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1168, 132, CAST(0x0000A60C00AC3FA8 AS DateTime), 53, 15, 57, 6, 36, CAST(0.003356700000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1169, 132, CAST(0x0000A60C00AC426D AS DateTime), 53, 15, 57, 6, 36, CAST(0.049423900000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1170, 144, CAST(0x0000A60C00AC4276 AS DateTime), 50, 15, 57, 6, 34, CAST(0.005714100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1171, 144, CAST(0x0000A60C00AC427A AS DateTime), 50, 15, 57, 6, 34, CAST(0.016507400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1172, 144, CAST(0x0000A60C00AC4741 AS DateTime), 50, 15, 57, 6, 34, CAST(0.026665800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1173, 144, CAST(0x0000A60C00AC4758 AS DateTime), 50, 15, 57, 6, 37, CAST(0.024659505000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1174, 132, CAST(0x0000A60C00AC4C21 AS DateTime), 53, 15, 57, 6, 37, CAST(0.001118900000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1175, 137, CAST(0x0000A60C00AC4C24 AS DateTime), 52, 15, 57, 6, 36, CAST(0.042840000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1176, 137, CAST(0x0000A60C00AC512E AS DateTime), 52, 15, 57, 6, 36, CAST(0.097020000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1177, 137, CAST(0x0000A60C00AC5688 AS DateTime), 52, 15, 57, 6, 36, CAST(0.152460000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1178, 126, CAST(0x0000A60C00AC4012 AS DateTime), 48, 17, 81, 25, 134, CAST(3.036960000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1179, 126, CAST(0x0000A60C00AC4016 AS DateTime), 48, 17, 81, 25, 134, CAST(1.123200000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1180, 126, CAST(0x0000A60C00AC401B AS DateTime), 48, 17, 81, 25, 132, CAST(0.015000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1181, 151, CAST(0x0000A60C00AC4027 AS DateTime), 49, 17, 81, 25, 134, CAST(0.239976000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1182, 151, CAST(0x0000A60C00AC402A AS DateTime), 49, 17, 81, 25, 134, CAST(1.919808000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1183, 151, CAST(0x0000A60C00AC4032 AS DateTime), 49, 17, 81, 25, 135, CAST(0.043200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1184, 131, CAST(0x0000A60C00AC4036 AS DateTime), 53, 17, 81, 25, 133, CAST(0.691200000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1185, 131, CAST(0x0000A60C00AC403A AS DateTime), 53, 17, 81, 25, 135, CAST(0.028800000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1186, 131, CAST(0x0000A60C00AC403D AS DateTime), 53, 17, 81, 25, 135, CAST(0.007999200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1187, 141, CAST(0x0000A60C00AC405A AS DateTime), 50, 17, 81, 25, 132, CAST(1.316280000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1188, 141, CAST(0x0000A60C00AC405E AS DateTime), 50, 17, 81, 25, 132, CAST(0.187200000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1189, 157, CAST(0x0000A60C00AC429B AS DateTime), 54, 17, 81, 25, 132, CAST(0.063993600000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1190, 131, CAST(0x0000A60C00AC42A0 AS DateTime), 53, 17, 81, 25, 133, CAST(0.648000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1191, 131, CAST(0x0000A60C00AC42A4 AS DateTime), 53, 17, 81, 25, 133, CAST(0.006672000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1192, 141, CAST(0x0000A60C00AC42AD AS DateTime), 50, 17, 81, 25, 132, CAST(0.636753600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1193, 126, CAST(0x0000A60C00AC4372 AS DateTime), 48, 17, 81, 25, 134, CAST(1.864800000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1194, 141, CAST(0x0000A60C00AC4375 AS DateTime), 50, 17, 81, 25, 132, CAST(0.987734400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1195, 126, CAST(0x0000A60C00AC4786 AS DateTime), 48, 17, 81, 25, 134, CAST(0.812520000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1196, 126, CAST(0x0000A60C00AC478A AS DateTime), 48, 17, 81, 25, 134, CAST(0.216000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1197, 151, CAST(0x0000A60C00AC479B AS DateTime), 49, 17, 81, 25, 134, CAST(0.015000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1198, 151, CAST(0x0000A60C00AC479E AS DateTime), 49, 17, 81, 25, 134, CAST(0.367963200000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1199, 151, CAST(0x0000A60C00AC47A2 AS DateTime), 49, 17, 81, 25, 132, CAST(0.144000000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1200, 151, CAST(0x0000A60C00AC47AC AS DateTime), 49, 17, 81, 25, 135, CAST(0.010002000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1201, 151, CAST(0x0000A60C00AC47B0 AS DateTime), 49, 17, 81, 25, 135, CAST(0.208800000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1202, 157, CAST(0x0000A60C00AC47B4 AS DateTime), 54, 17, 81, 25, 132, CAST(1.080000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1203, 157, CAST(0x0000A60C00AC47B8 AS DateTime), 54, 17, 81, 25, 135, CAST(0.048038400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1204, 157, CAST(0x0000A60C00AC47BC AS DateTime), 54, 17, 81, 25, 132, CAST(3.143980800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1205, 157, CAST(0x0000A60C00AC47BF AS DateTime), 54, 17, 81, 25, 132, CAST(0.055994400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1206, 131, CAST(0x0000A60C00AC47C3 AS DateTime), 53, 17, 81, 25, 135, CAST(0.014400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1207, 141, CAST(0x0000A60C00AC47CC AS DateTime), 50, 17, 81, 25, 132, CAST(1.399881600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1208, 141, CAST(0x0000A60C00AC47D0 AS DateTime), 50, 17, 81, 25, 132, CAST(0.999900000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1209, 126, CAST(0x0000A60C00AC4C63 AS DateTime), 48, 17, 81, 25, 134, CAST(0.952380000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1210, 126, CAST(0x0000A60C00AC4C66 AS DateTime), 48, 17, 81, 25, 134, CAST(2.044800000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1211, 126, CAST(0x0000A60C00AC4C6A AS DateTime), 48, 17, 81, 25, 134, CAST(0.014400000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1212, 151, CAST(0x0000A60C00AC4C73 AS DateTime), 49, 17, 81, 25, 134, CAST(0.096000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1213, 151, CAST(0x0000A60C00AC4C77 AS DateTime), 49, 17, 81, 25, 134, CAST(0.063993600000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1214, 151, CAST(0x0000A60C00AC4C7B AS DateTime), 49, 17, 81, 25, 132, CAST(0.187200000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1215, 151, CAST(0x0000A60C00AC4C7E AS DateTime), 49, 17, 81, 25, 135, CAST(7.200000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1216, 151, CAST(0x0000A60C00AC4C82 AS DateTime), 49, 17, 81, 25, 135, CAST(1.199880000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1217, 157, CAST(0x0000A60C00AC4C85 AS DateTime), 54, 17, 81, 25, 132, CAST(0.388800000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1218, 141, CAST(0x0000A60C00AC4C8A AS DateTime), 50, 17, 81, 25, 132, CAST(0.324501600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1219, 141, CAST(0x0000A60C00AC4C8E AS DateTime), 50, 17, 81, 25, 132, CAST(0.527959200000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1220, 126, CAST(0x0000A60C00AC5175 AS DateTime), 48, 17, 81, 25, 134, CAST(7.286040000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1221, 126, CAST(0x0000A60C00AC5179 AS DateTime), 48, 17, 81, 25, 134, CAST(8.496000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1222, 126, CAST(0x0000A60C00AC517C AS DateTime), 48, 17, 81, 25, 134, CAST(0.028800000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1223, 151, CAST(0x0000A60C00AC5188 AS DateTime), 49, 17, 81, 25, 134, CAST(0.024000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1224, 151, CAST(0x0000A60C00AC518D AS DateTime), 49, 17, 81, 25, 132, CAST(0.057600000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1225, 157, CAST(0x0000A60C00AC5191 AS DateTime), 54, 17, 81, 25, 132, CAST(0.053328000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1226, 157, CAST(0x0000A60C00AC5195 AS DateTime), 54, 17, 81, 25, 132, CAST(0.098656800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1227, 157, CAST(0x0000A60C00AC5199 AS DateTime), 54, 17, 81, 25, 132, CAST(0.391960800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1228, 141, CAST(0x0000A60C00AC51A9 AS DateTime), 50, 17, 81, 25, 132, CAST(0.727164000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1229, 141, CAST(0x0000A60C00AC51AD AS DateTime), 50, 17, 81, 25, 132, CAST(0.645360000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1230, 126, CAST(0x0000A60C00AC56C7 AS DateTime), 48, 17, 81, 25, 134, CAST(0.372960000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1231, 126, CAST(0x0000A60C00AC56CB AS DateTime), 48, 17, 81, 25, 134, CAST(3.211200000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1232, 151, CAST(0x0000A60C00AC56CF AS DateTime), 49, 17, 81, 25, 134, CAST(0.003000000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1233, 151, CAST(0x0000A60C00AC56D3 AS DateTime), 49, 17, 81, 25, 135, CAST(13.662460800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1234, 151, CAST(0x0000A60C00AC56D7 AS DateTime), 49, 17, 81, 25, 135, CAST(0.030398400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1235, 151, CAST(0x0000A60C00AC56DA AS DateTime), 49, 17, 81, 25, 135, CAST(0.287971200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1236, 157, CAST(0x0000A60C00AC56DE AS DateTime), 54, 17, 81, 25, 132, CAST(0.405331466400000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1237, 157, CAST(0x0000A60C00AC56E3 AS DateTime), 54, 17, 81, 25, 132, CAST(1.475253230400000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1238, 157, CAST(0x0000A60C00AC56E7 AS DateTime), 54, 17, 81, 25, 132, CAST(0.055994400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1239, 141, CAST(0x0000A60C00AC56F3 AS DateTime), 50, 17, 81, 25, 132, CAST(1.324456800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1240, 141, CAST(0x0000A60C00AC56FF AS DateTime), 50, 17, 81, 25, 132, CAST(3.189326400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1241, 139, CAST(0x0000A60C00AC4049 AS DateTime), 52, 17, 58, 23, 125, CAST(0.199980000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1242, 139, CAST(0x0000A60C00AC404E AS DateTime), 52, 17, 58, 23, 125, CAST(0.031996800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1243, 139, CAST(0x0000A60C00AC4052 AS DateTime), 52, 17, 58, 23, 125, CAST(0.255974400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1244, 139, CAST(0x0000A60C00AC4057 AS DateTime), 52, 17, 58, 23, 125, CAST(0.031996800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1245, 139, CAST(0x0000A60C00AC47C8 AS DateTime), 52, 17, 58, 23, 125, CAST(0.039996000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1246, 139, CAST(0x0000A60C00AC51A5 AS DateTime), 52, 17, 58, 23, 125, CAST(0.023997600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1247, 140, CAST(0x0000A60C00AC4041 AS DateTime), 52, 17, 58, 11, 89, CAST(0.066000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1248, 140, CAST(0x0000A60C00AC4045 AS DateTime), 52, 17, 58, 11, 89, CAST(0.079992000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1249, 140, CAST(0x0000A60C00AC519D AS DateTime), 52, 17, 58, 11, 89, CAST(0.239976000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1250, 140, CAST(0x0000A60C00AC51A1 AS DateTime), 52, 17, 58, 11, 89, CAST(0.003000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1251, 140, CAST(0x0000A60C00AC56EB AS DateTime), 52, 17, 58, 11, 89, CAST(0.139999200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1252, 128, CAST(0x0000A60C00AC401F AS DateTime), 48, 17, 58, 10, 82, CAST(0.008001600000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1253, 128, CAST(0x0000A60C00AC4023 AS DateTime), 48, 17, 58, 10, 82, CAST(0.007999200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1254, 143, CAST(0x0000A60C00AC4062 AS DateTime), 50, 17, 58, 10, 80, CAST(0.014400000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1255, 128, CAST(0x0000A60C00AC4792 AS DateTime), 48, 17, 58, 10, 82, CAST(0.006000000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1256, 143, CAST(0x0000A60C00AC47D4 AS DateTime), 50, 17, 58, 10, 80, CAST(0.007200000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1257, 143, CAST(0x0000A60C00AC4C91 AS DateTime), 50, 17, 58, 10, 80, CAST(0.066720000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1258, 128, CAST(0x0000A60C00AC5184 AS DateTime), 48, 17, 58, 10, 80, CAST(0.015000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1259, 143, CAST(0x0000A60C00AC56F8 AS DateTime), 50, 17, 58, 10, 86, CAST(0.343200000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1260, 143, CAST(0x0000A60C00AC56FB AS DateTime), 50, 17, 58, 10, 86, CAST(0.023997600000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1261, 143, CAST(0x0000A60C00AC5704 AS DateTime), 50, 17, 58, 10, 80, CAST(0.023997600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1262, 147, CAST(0x0000A60C00AC5708 AS DateTime), 47, 17, 58, 10, 70, CAST(0.003999600000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1263, 132, CAST(0x0000A60C00AC42A8 AS DateTime), 53, 17, 57, 6, 39, CAST(0.039000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1264, 137, CAST(0x0000A60C00AC56EF AS DateTime), 52, 17, 57, 6, 41, CAST(0.247975200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1265, 152, CAST(0x0000A60C00AC570B AS DateTime), 49, 18, 58, 23, 127, CAST(0.641842800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1266, 151, CAST(0x0000A60C00AC4066 AS DateTime), 49, 18, 81, 25, 134, CAST(0.534869000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1267, 151, CAST(0x0000A60C00AC47D7 AS DateTime), 49, 18, 81, 25, 134, CAST(0.028151000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1268, 151, CAST(0x0000A60C00AC47DB AS DateTime), 49, 18, 81, 25, 135, CAST(0.011260400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1269, 151, CAST(0x0000A60C00AC4C95 AS DateTime), 49, 18, 81, 25, 134, CAST(0.008445300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1270, 128, CAST(0x0000A60C00AC51B0 AS DateTime), 48, 18, 58, 10, 82, CAST(0.001200000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1271, 126, CAST(0x0000A60C00AC4069 AS DateTime), 48, 20, 81, 25, 134, CAST(0.547946400000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1272, 126, CAST(0x0000A60C00AC4074 AS DateTime), 48, 20, 81, 25, 135, CAST(0.210000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1273, 126, CAST(0x0000A60C00AC4078 AS DateTime), 48, 20, 81, 25, 135, CAST(0.159984000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1274, 151, CAST(0x0000A60C00AC407C AS DateTime), 49, 20, 81, 25, 134, CAST(0.055998000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1275, 151, CAST(0x0000A60C00AC4080 AS DateTime), 49, 20, 81, 25, 135, CAST(0.133851600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1276, 151, CAST(0x0000A60C00AC4084 AS DateTime), 49, 20, 81, 25, 135, CAST(0.075998400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1277, 157, CAST(0x0000A60C00AC408B AS DateTime), 54, 20, 81, 25, 135, CAST(0.053320000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1278, 131, CAST(0x0000A60C00AC4090 AS DateTime), 53, 20, 81, 25, 135, CAST(0.050400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1279, 141, CAST(0x0000A60C00AC4097 AS DateTime), 50, 20, 81, 25, 132, CAST(0.378000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1280, 141, CAST(0x0000A60C00AC409B AS DateTime), 50, 20, 81, 25, 132, CAST(1.020000000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1281, 146, CAST(0x0000A60C00AC40A2 AS DateTime), 47, 20, 81, 25, 135, CAST(0.003200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1282, 131, CAST(0x0000A60C00AC42B2 AS DateTime), 53, 20, 81, 25, 135, CAST(0.007200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1283, 131, CAST(0x0000A60C00AC42B6 AS DateTime), 53, 20, 81, 25, 135, CAST(0.001200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1284, 141, CAST(0x0000A60C00AC42BA AS DateTime), 50, 20, 81, 25, 132, CAST(0.006000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1285, 141, CAST(0x0000A60C00AC42BE AS DateTime), 50, 20, 81, 25, 132, CAST(0.180000000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1286, 141, CAST(0x0000A60C00AC4379 AS DateTime), 50, 20, 81, 25, 132, CAST(0.510000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1287, 126, CAST(0x0000A60C00AC47E0 AS DateTime), 48, 20, 81, 25, 134, CAST(0.245978400000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1288, 151, CAST(0x0000A60C00AC47EC AS DateTime), 49, 20, 81, 25, 135, CAST(0.007466400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1289, 151, CAST(0x0000A60C00AC47EF AS DateTime), 49, 20, 81, 25, 135, CAST(0.025333200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1290, 151, CAST(0x0000A60C00AC47F3 AS DateTime), 49, 20, 81, 25, 135, CAST(0.013332000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1291, 151, CAST(0x0000A60C00AC47F7 AS DateTime), 49, 20, 81, 25, 135, CAST(0.863913600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1292, 131, CAST(0x0000A60C00AC47FB AS DateTime), 53, 20, 81, 25, 135, CAST(0.014400000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1293, 141, CAST(0x0000A60C00AC4804 AS DateTime), 50, 20, 81, 25, 132, CAST(0.174000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1294, 141, CAST(0x0000A60C00AC4807 AS DateTime), 50, 20, 81, 25, 132, CAST(0.096000000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1295, 126, CAST(0x0000A60C00AC4C99 AS DateTime), 48, 20, 81, 25, 134, CAST(0.103996800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1296, 151, CAST(0x0000A60C00AC4CA0 AS DateTime), 49, 20, 81, 25, 135, CAST(0.003733200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1297, 151, CAST(0x0000A60C00AC4CA4 AS DateTime), 49, 20, 81, 25, 135, CAST(0.007665000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1298, 151, CAST(0x0000A60C00AC4CA8 AS DateTime), 49, 20, 81, 25, 135, CAST(0.233985600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1299, 141, CAST(0x0000A60C00AC4CB5 AS DateTime), 50, 20, 81, 25, 132, CAST(0.252000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1300, 141, CAST(0x0000A60C00AC4CB9 AS DateTime), 50, 20, 81, 25, 132, CAST(0.348000000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1301, 126, CAST(0x0000A60C00AC51B5 AS DateTime), 48, 20, 81, 25, 134, CAST(0.801924000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1302, 126, CAST(0x0000A60C00AC51C6 AS DateTime), 48, 20, 81, 25, 135, CAST(0.936000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1303, 151, CAST(0x0000A60C00AC51D0 AS DateTime), 49, 20, 81, 25, 135, CAST(0.059995200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1304, 151, CAST(0x0000A60C00AC51D3 AS DateTime), 49, 20, 81, 25, 135, CAST(0.015998400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1305, 151, CAST(0x0000A60C00AC51D7 AS DateTime), 49, 20, 81, 25, 135, CAST(0.031996800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1306, 131, CAST(0x0000A60C00AC51DC AS DateTime), 53, 20, 81, 25, 135, CAST(0.007200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1307, 141, CAST(0x0000A60C00AC51E3 AS DateTime), 50, 20, 81, 25, 132, CAST(0.312000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1308, 141, CAST(0x0000A60C00AC51E8 AS DateTime), 50, 20, 81, 25, 132, CAST(0.378000000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1309, 126, CAST(0x0000A60C00AC570F AS DateTime), 48, 20, 81, 25, 134, CAST(0.101990400000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1310, 151, CAST(0x0000A60C00AC5717 AS DateTime), 49, 20, 81, 25, 135, CAST(0.082130400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1311, 151, CAST(0x0000A60C00AC571A AS DateTime), 49, 20, 81, 25, 135, CAST(0.103861200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1312, 151, CAST(0x0000A60C00AC571F AS DateTime), 49, 20, 81, 25, 135, CAST(0.006000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1313, 151, CAST(0x0000A60C00AC5722 AS DateTime), 49, 20, 81, 25, 135, CAST(0.031996800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1314, 151, CAST(0x0000A60C00AC5727 AS DateTime), 49, 20, 81, 25, 135, CAST(6.935294400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1315, 151, CAST(0x0000A60C00AC572A AS DateTime), 49, 20, 81, 25, 135, CAST(0.097327000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1316, 141, CAST(0x0000A60C00AC572E AS DateTime), 50, 20, 81, 25, 132, CAST(0.084000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1317, 141, CAST(0x0000A60C00AC573A AS DateTime), 50, 20, 81, 25, 132, CAST(0.192000000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1318, 80, CAST(0x0000A60C00AC437D AS DateTime), 50, 20, 57, 15, 97, CAST(0.399960000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1319, 153, CAST(0x0000A60C00AC47E8 AS DateTime), 49, 20, 57, 15, 97, CAST(0.030660000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1320, 81, CAST(0x0000A60C00AC47E4 AS DateTime), 49, 20, 57, 7, 44, CAST(0.391960800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1321, 128, CAST(0x0000A60C00AC406D AS DateTime), 48, 20, 58, 10, 70, CAST(0.038404800000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1322, 128, CAST(0x0000A60C00AC4070 AS DateTime), 48, 20, 58, 10, 82, CAST(0.008666400000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1323, 143, CAST(0x0000A60C00AC409F AS DateTime), 50, 20, 58, 10, 80, CAST(0.007999200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1324, 128, CAST(0x0000A60C00AC4C9D AS DateTime), 48, 20, 58, 10, 70, CAST(0.025603200000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1325, 128, CAST(0x0000A60C00AC51B9 AS DateTime), 48, 20, 58, 10, 82, CAST(0.002400000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1326, 128, CAST(0x0000A60C00AC51BE AS DateTime), 48, 20, 58, 10, 82, CAST(0.006665000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1327, 128, CAST(0x0000A60C00AC51C2 AS DateTime), 48, 20, 58, 10, 82, CAST(0.047995200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1328, 82, CAST(0x0000A60C00AC51CC AS DateTime), 49, 20, 58, 10, 80, CAST(0.015998400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1329, 143, CAST(0x0000A60C00AC51EB AS DateTime), 50, 20, 58, 10, 80, CAST(0.007999200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1330, 143, CAST(0x0000A60C00AC5732 AS DateTime), 50, 20, 58, 10, 86, CAST(0.075728400000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1331, 143, CAST(0x0000A60C00AC5736 AS DateTime), 50, 20, 58, 10, 86, CAST(0.017329000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1332, 162, CAST(0x0000A60C00AC5742 AS DateTime), 51, 20, 58, 10, 70, CAST(0.004800000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1333, 140, CAST(0x0000A60C00AC4093 AS DateTime), 52, 20, 58, 11, 89, CAST(0.062400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1334, 140, CAST(0x0000A60C00AC47FF AS DateTime), 52, 20, 58, 11, 89, CAST(0.038400000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1335, 140, CAST(0x0000A60C00AC51E0 AS DateTime), 52, 20, 58, 11, 89, CAST(0.069600000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1336, 83, CAST(0x0000A60C00AC5713 AS DateTime), 49, 20, 58, 11, 89, CAST(0.002666000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1337, 129, CAST(0x0000A60C00AC40A7 AS DateTime), 48, 21, 57, 6, 37, CAST(0.001924000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1338, 132, CAST(0x0000A60C00AC40B6 AS DateTime), 53, 21, 57, 6, 40, CAST(0.034925000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1339, 132, CAST(0x0000A60C00AC42C1 AS DateTime), 53, 21, 57, 6, 40, CAST(0.146050000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1340, 129, CAST(0x0000A60C00AC480E AS DateTime), 48, 21, 57, 6, 37, CAST(0.004329000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1341, 129, CAST(0x0000A60C00AC4CBD AS DateTime), 48, 21, 57, 6, 37, CAST(0.012987000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1342, 132, CAST(0x0000A60C00AC4CDB AS DateTime), 53, 21, 57, 6, 40, CAST(0.004445000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1343, 137, CAST(0x0000A60C00AC4CE0 AS DateTime), 52, 21, 57, 6, 41, CAST(0.006364000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1344, 129, CAST(0x0000A60C00AC51F4 AS DateTime), 48, 21, 57, 6, 37, CAST(0.003367000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1345, 132, CAST(0x0000A60C00AC5210 AS DateTime), 53, 21, 57, 6, 40, CAST(0.027940000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1346, 132, CAST(0x0000A60C00AC5759 AS DateTime), 53, 21, 57, 6, 40, CAST(0.006985000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1347, 126, CAST(0x0000A60C00AC40B2 AS DateTime), 48, 21, 81, 25, 135, CAST(0.009107000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1348, 131, CAST(0x0000A60C00AC40BA AS DateTime), 53, 21, 81, 25, 135, CAST(0.000635000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1349, 146, CAST(0x0000A60C00AC40C9 AS DateTime), 47, 21, 81, 25, 135, CAST(0.018415000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1350, 151, CAST(0x0000A60C00AC4822 AS DateTime), 49, 21, 81, 25, 135, CAST(0.100956000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1351, 151, CAST(0x0000A60C00AC4827 AS DateTime), 49, 21, 81, 25, 135, CAST(0.007620000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1352, 146, CAST(0x0000A60C00AC4832 AS DateTime), 47, 21, 81, 25, 135, CAST(0.001905000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1353, 126, CAST(0x0000A60C00AC4CC5 AS DateTime), 48, 21, 81, 25, 135, CAST(0.009107000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1354, 151, CAST(0x0000A60C00AC4CD7 AS DateTime), 49, 21, 81, 25, 135, CAST(0.000561200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1355, 146, CAST(0x0000A60C00AC4CE4 AS DateTime), 47, 21, 81, 25, 135, CAST(0.017780000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1356, 131, CAST(0x0000A60C00AC5214 AS DateTime), 53, 21, 81, 25, 135, CAST(0.040640000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1357, 146, CAST(0x0000A60C00AC5218 AS DateTime), 47, 21, 81, 25, 135, CAST(0.001905000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1358, 151, CAST(0x0000A60C00AC5755 AS DateTime), 49, 21, 81, 25, 135, CAST(0.000636400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1359, 131, CAST(0x0000A60C00AC575D AS DateTime), 53, 21, 81, 25, 135, CAST(0.001905000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1360, 155, CAST(0x0000A60C00AC481A AS DateTime), 49, 21, 57, 8, 59, CAST(0.000561200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1361, 155, CAST(0x0000A60C00AC4CCE AS DateTime), 49, 21, 57, 8, 59, CAST(0.004489600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1362, 155, CAST(0x0000A60C00AC5209 AS DateTime), 49, 21, 57, 8, 59, CAST(0.016836000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1363, 155, CAST(0x0000A60C00AC574E AS DateTime), 49, 21, 57, 8, 59, CAST(0.030866000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1364, 142, CAST(0x0000A60C00AC40C2 AS DateTime), 50, 21, 58, 23, 125, CAST(0.000910800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1365, 142, CAST(0x0000A60C00AC42C6 AS DateTime), 50, 21, 58, 23, 125, CAST(0.000910800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1366, 142, CAST(0x0000A60C00AC4381 AS DateTime), 50, 21, 58, 23, 125, CAST(0.013662000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1367, 142, CAST(0x0000A60C00AC482A AS DateTime), 50, 21, 58, 23, 125, CAST(0.015939000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1368, 88, CAST(0x0000A60C00AC4816 AS DateTime), 49, 21, 57, 7, 46, CAST(0.022785300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1369, 88, CAST(0x0000A60C00AC5203 AS DateTime), 49, 21, 57, 7, 46, CAST(0.006285600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1370, 126, CAST(0x0000A60C00AC40CE AS DateTime), 48, 43, 81, 25, 134, CAST(0.040032000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1371, 126, CAST(0x0000A60C00AC40D5 AS DateTime), 48, 43, 81, 25, 135, CAST(0.426340800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1372, 151, CAST(0x0000A60C00AC40D9 AS DateTime), 49, 43, 81, 25, 135, CAST(0.010008000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1373, 151, CAST(0x0000A60C00AC40DD AS DateTime), 49, 43, 81, 25, 135, CAST(0.020016000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1374, 157, CAST(0x0000A60C00AC40E1 AS DateTime), 54, 43, 81, 25, 135, CAST(0.034027200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1375, 151, CAST(0x0000A60C00AC4842 AS DateTime), 49, 43, 81, 25, 135, CAST(0.073058400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1376, 151, CAST(0x0000A60C00AC4847 AS DateTime), 49, 43, 81, 25, 135, CAST(0.005004000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1377, 151, CAST(0x0000A60C00AC484B AS DateTime), 49, 43, 81, 25, 135, CAST(0.008006400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1378, 151, CAST(0x0000A60C00AC4850 AS DateTime), 49, 43, 81, 25, 135, CAST(0.113745600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1379, 157, CAST(0x0000A60C00AC4854 AS DateTime), 54, 43, 81, 25, 135, CAST(0.120096000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1380, 126, CAST(0x0000A60C00AC4CE8 AS DateTime), 48, 43, 81, 25, 134, CAST(0.160128000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1381, 126, CAST(0x0000A60C00AC4CF5 AS DateTime), 48, 43, 81, 25, 135, CAST(0.002001600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1382, 151, CAST(0x0000A60C00AC4CF9 AS DateTime), 49, 43, 81, 25, 135, CAST(0.009007200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1383, 151, CAST(0x0000A60C00AC4CFE AS DateTime), 49, 43, 81, 25, 135, CAST(0.001000800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1384, 157, CAST(0x0000A60C00AC4D02 AS DateTime), 54, 43, 81, 25, 135, CAST(0.001378800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1385, 151, CAST(0x0000A60C00AC5220 AS DateTime), 49, 43, 81, 25, 135, CAST(0.001000800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1386, 151, CAST(0x0000A60C00AC5225 AS DateTime), 49, 43, 81, 25, 135, CAST(0.006004800000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1387, 146, CAST(0x0000A60C00AC5234 AS DateTime), 47, 43, 81, 25, 135, CAST(0.002001600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1388, 151, CAST(0x0000A60C00AC5769 AS DateTime), 49, 43, 81, 25, 135, CAST(0.002001600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1389, 151, CAST(0x0000A60C00AC576D AS DateTime), 49, 43, 81, 25, 135, CAST(0.002001600000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1390, 151, CAST(0x0000A60C00AC5771 AS DateTime), 49, 43, 81, 25, 135, CAST(0.008996400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1391, 151, CAST(0x0000A60C00AC5775 AS DateTime), 49, 43, 81, 25, 135, CAST(0.015012000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1392, 157, CAST(0x0000A60C00AC577D AS DateTime), 54, 43, 81, 25, 135, CAST(0.544435200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1393, 131, CAST(0x0000A60C00AC5785 AS DateTime), 53, 43, 81, 25, 135, CAST(0.008006400000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1394, 141, CAST(0x0000A60C00AC57A5 AS DateTime), 50, 43, 81, 25, 135, CAST(0.050040000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1395, 128, CAST(0x0000A60C00AC40D1 AS DateTime), 48, 43, 58, 10, 82, CAST(0.001000800000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1396, 143, CAST(0x0000A60C00AC40FC AS DateTime), 50, 43, 58, 10, 80, CAST(0.013010400000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1397, 143, CAST(0x0000A60C00AC4389 AS DateTime), 50, 43, 58, 10, 77, CAST(0.080064000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1398, 128, CAST(0x0000A60C00AC4837 AS DateTime), 48, 43, 58, 10, 70, CAST(0.002001600000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1399, 128, CAST(0x0000A60C00AC483A AS DateTime), 48, 43, 58, 10, 82, CAST(0.004003200000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1400, 143, CAST(0x0000A60C00AC485B AS DateTime), 50, 43, 58, 10, 77, CAST(0.050040000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1401, 143, CAST(0x0000A60C00AC485E AS DateTime), 50, 43, 58, 10, 86, CAST(0.200160000000000 AS Decimal(20, 15)), 82, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1402, 143, CAST(0x0000A60C00AC4862 AS DateTime), 50, 43, 58, 10, 80, CAST(0.006004800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1403, 128, CAST(0x0000A60C00AC4CED AS DateTime), 48, 43, 58, 10, 81, CAST(0.000600000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1404, 128, CAST(0x0000A60C00AC4CF2 AS DateTime), 48, 43, 58, 10, 80, CAST(0.000333600000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1405, 128, CAST(0x0000A60C00AC521C AS DateTime), 48, 43, 58, 10, 82, CAST(0.002001600000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1406, 143, CAST(0x0000A60C00AC5791 AS DateTime), 50, 43, 58, 10, 86, CAST(0.014011200000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1407, 143, CAST(0x0000A60C00AC5795 AS DateTime), 50, 43, 58, 10, 86, CAST(0.002001600000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1408, 143, CAST(0x0000A60C00AC5799 AS DateTime), 50, 43, 58, 10, 86, CAST(0.092044800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1409, 143, CAST(0x0000A60C00AC57A1 AS DateTime), 50, 43, 58, 10, 80, CAST(0.001000800000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1410, 133, CAST(0x0000A60C00AC40E5 AS DateTime), 53, 43, 58, 23, 125, CAST(0.032025600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1411, 142, CAST(0x0000A60C00AC40F1 AS DateTime), 50, 43, 58, 23, 125, CAST(0.004003200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1412, 133, CAST(0x0000A60C00AC42C9 AS DateTime), 53, 43, 58, 23, 125, CAST(0.048038400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1413, 142, CAST(0x0000A60C00AC4857 AS DateTime), 50, 43, 58, 23, 125, CAST(0.003002400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1414, 133, CAST(0x0000A60C00AC4D05 AS DateTime), 53, 43, 58, 23, 125, CAST(0.004003200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1415, 133, CAST(0x0000A60C00AC5229 AS DateTime), 53, 43, 58, 23, 125, CAST(0.009007200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1416, 142, CAST(0x0000A60C00AC5230 AS DateTime), 50, 43, 58, 23, 125, CAST(0.021991200000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1417, 133, CAST(0x0000A60C00AC5781 AS DateTime), 53, 43, 58, 23, 125, CAST(0.003002400000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1418, 142, CAST(0x0000A60C00AC579E AS DateTime), 50, 43, 58, 23, 125, CAST(0.003998400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1419, 92, CAST(0x0000A60C00AC4D09 AS DateTime), 52, 43, 57, 9, 66, CAST(0.050040000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1420, 92, CAST(0x0000A60C00AC5789 AS DateTime), 52, 43, 57, 9, 66, CAST(0.020016000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1421, 93, CAST(0x0000A60C00AC40F4 AS DateTime), 50, 43, 58, 24, 129, CAST(0.015012000000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1422, 93, CAST(0x0000A60C00AC40F8 AS DateTime), 50, 43, 58, 24, 129, CAST(0.050040000000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1423, 151, CAST(0x0000A60C00AC4100 AS DateTime), 49, 22, 81, 25, 135, CAST(0.005934000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1424, 151, CAST(0x0000A60C00AC5241 AS DateTime), 49, 22, 81, 25, 135, CAST(0.083076000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1425, 151, CAST(0x0000A60C00AC57A9 AS DateTime), 49, 22, 81, 25, 135, CAST(0.465162500000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1426, 95, CAST(0x0000A60C00AC4867 AS DateTime), 49, 22, 57, 7, 49, CAST(0.157912600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1427, 95, CAST(0x0000A60C00AC486D AS DateTime), 49, 22, 57, 7, 49, CAST(0.021099200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1428, 95, CAST(0x0000A60C00AC4D12 AS DateTime), 49, 22, 57, 7, 49, CAST(0.025384900000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1429, 95, CAST(0x0000A60C00AC5238 AS DateTime), 49, 22, 57, 7, 49, CAST(0.037582500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1430, 95, CAST(0x0000A60C00AC523C AS DateTime), 49, 22, 57, 7, 45, CAST(0.113489400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1431, 144, CAST(0x0000A60C00AC4104 AS DateTime), 50, 44, 57, 6, 36, CAST(0.081000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1432, 144, CAST(0x0000A60C00AC42D1 AS DateTime), 50, 44, 57, 6, 36, CAST(0.123750000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1433, 144, CAST(0x0000A60C00AC42D5 AS DateTime), 50, 44, 57, 6, 36, CAST(0.003750000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1434, 144, CAST(0x0000A60C00AC438D AS DateTime), 50, 44, 57, 6, 36, CAST(0.006000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1435, 144, CAST(0x0000A60C00AC4391 AS DateTime), 50, 44, 57, 6, 36, CAST(0.165750000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1436, 151, CAST(0x0000A60C00AC4871 AS DateTime), 49, 44, 81, 25, 135, CAST(0.024000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1437, 151, CAST(0x0000A60C00AC4D1A AS DateTime), 49, 44, 81, 25, 135, CAST(0.001500000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1438, 151, CAST(0x0000A60C00AC4D1E AS DateTime), 49, 44, 81, 25, 135, CAST(0.000375000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1439, 151, CAST(0x0000A60C00AC57AC AS DateTime), 49, 44, 81, 25, 135, CAST(0.000750000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1440, 98, CAST(0x0000A60C00AC4D22 AS DateTime), 52, 44, 57, 9, 66, CAST(0.000750000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1441, 98, CAST(0x0000A60C00AC57B1 AS DateTime), 52, 44, 57, 9, 66, CAST(0.010644000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1442, 143, CAST(0x0000A60C00AC4107 AS DateTime), 50, 44, 58, 10, 86, CAST(0.000375600000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1443, 143, CAST(0x0000A60C00AC4878 AS DateTime), 50, 44, 58, 10, 80, CAST(0.001000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1444, 128, CAST(0x0000A60C00AC4D16 AS DateTime), 48, 44, 58, 10, 81, CAST(0.000355500000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1445, 128, CAST(0x0000A60C00AC5245 AS DateTime), 48, 44, 58, 10, 82, CAST(0.002250000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1446, 143, CAST(0x0000A60C00AC57B5 AS DateTime), 50, 44, 58, 10, 86, CAST(0.001875000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1447, 143, CAST(0x0000A60C00AC57BB AS DateTime), 50, 44, 58, 10, 78, CAST(0.000750000000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1448, 100, CAST(0x0000A60C00AC4874 AS DateTime), 52, 44, 57, 7, 48, CAST(0.001875000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1449, 100, CAST(0x0000A60C00AC524A AS DateTime), 52, 44, 57, 7, 48, CAST(0.000750000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1450, 141, CAST(0x0000A60C00AC410B AS DateTime), 50, 24, 81, 25, 132, CAST(0.888388500000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1451, 141, CAST(0x0000A60C00AC410F AS DateTime), 50, 24, 81, 25, 132, CAST(2.521919300000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1452, 141, CAST(0x0000A60C00AC4113 AS DateTime), 50, 24, 81, 25, 132, CAST(0.674092600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1453, 141, CAST(0x0000A60C00AC4117 AS DateTime), 50, 24, 81, 25, 132, CAST(0.066054300000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1454, 141, CAST(0x0000A60C00AC412D AS DateTime), 50, 24, 81, 25, 135, CAST(0.228200000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1455, 141, CAST(0x0000A60C00AC42D9 AS DateTime), 50, 24, 81, 25, 132, CAST(0.650313100000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1456, 141, CAST(0x0000A60C00AC42DD AS DateTime), 50, 24, 81, 25, 132, CAST(0.931535000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1457, 141, CAST(0x0000A60C00AC42E1 AS DateTime), 50, 24, 81, 25, 132, CAST(0.928147600000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1458, 141, CAST(0x0000A60C00AC42E5 AS DateTime), 50, 24, 81, 25, 132, CAST(0.020324400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1459, 141, CAST(0x0000A60C00AC4395 AS DateTime), 50, 24, 81, 25, 132, CAST(2.022008200000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1460, 141, CAST(0x0000A60C00AC4399 AS DateTime), 50, 24, 81, 25, 132, CAST(0.220181000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1461, 141, CAST(0x0000A60C00AC439D AS DateTime), 50, 24, 81, 25, 132, CAST(1.815646400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1462, 141, CAST(0x0000A60C00AC43A1 AS DateTime), 50, 24, 81, 25, 132, CAST(0.049117300000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1463, 141, CAST(0x0000A60C00AC487C AS DateTime), 50, 24, 81, 25, 132, CAST(1.176647600000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1464, 141, CAST(0x0000A60C00AC4880 AS DateTime), 50, 24, 81, 25, 132, CAST(0.091459800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1465, 141, CAST(0x0000A60C00AC4885 AS DateTime), 50, 24, 81, 25, 133, CAST(0.001626000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1466, 141, CAST(0x0000A60C00AC4889 AS DateTime), 50, 24, 81, 25, 133, CAST(0.011382000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1467, 141, CAST(0x0000A60C00AC488D AS DateTime), 50, 24, 81, 25, 132, CAST(0.188000700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1468, 141, CAST(0x0000A60C00AC4891 AS DateTime), 50, 24, 81, 25, 133, CAST(0.006774800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1469, 141, CAST(0x0000A60C00AC4894 AS DateTime), 50, 24, 81, 25, 132, CAST(0.274379400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1470, 141, CAST(0x0000A60C00AC4D26 AS DateTime), 50, 24, 81, 25, 132, CAST(0.008130000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1471, 141, CAST(0x0000A60C00AC4D2E AS DateTime), 50, 24, 81, 25, 133, CAST(0.023711800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1472, 141, CAST(0x0000A60C00AC4D32 AS DateTime), 50, 24, 81, 25, 133, CAST(1.043319200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1473, 141, CAST(0x0000A60C00AC4D36 AS DateTime), 50, 24, 81, 25, 133, CAST(0.013549600000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1474, 141, CAST(0x0000A60C00AC524E AS DateTime), 50, 24, 81, 25, 132, CAST(0.231089100000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1475, 141, CAST(0x0000A60C00AC5252 AS DateTime), 50, 24, 81, 25, 133, CAST(0.094847200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1476, 141, CAST(0x0000A60C00AC5257 AS DateTime), 50, 24, 81, 25, 133, CAST(0.298091200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1477, 141, CAST(0x0000A60C00AC525B AS DateTime), 50, 24, 81, 25, 133, CAST(1.978241600000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1478, 141, CAST(0x0000A60C00AC57C4 AS DateTime), 50, 24, 81, 25, 132, CAST(0.135225200000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1479, 141, CAST(0x0000A60C00AC57C8 AS DateTime), 50, 24, 81, 25, 133, CAST(0.001693700000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1480, 141, CAST(0x0000A60C00AC57CC AS DateTime), 50, 24, 81, 25, 132, CAST(0.016300000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1481, 141, CAST(0x0000A60C00AC57D0 AS DateTime), 50, 24, 81, 25, 132, CAST(0.003260000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1482, 141, CAST(0x0000A60C00AC57D5 AS DateTime), 50, 24, 81, 25, 132, CAST(0.013873800000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1483, 141, CAST(0x0000A60C00AC57E5 AS DateTime), 50, 24, 81, 25, 133, CAST(0.853624800000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1484, 143, CAST(0x0000A60C00AC4125 AS DateTime), 50, 24, 58, 10, 80, CAST(0.003260000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1485, 143, CAST(0x0000A60C00AC412A AS DateTime), 50, 24, 58, 10, 80, CAST(0.000730200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1486, 143, CAST(0x0000A60C00AC4898 AS DateTime), 50, 24, 58, 10, 80, CAST(0.001630000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1487, 143, CAST(0x0000A60C00AC4D3A AS DateTime), 50, 24, 58, 10, 80, CAST(0.001630000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1488, 143, CAST(0x0000A60C00AC525F AS DateTime), 50, 24, 58, 10, 80, CAST(0.000730200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1489, 143, CAST(0x0000A60C00AC5263 AS DateTime), 50, 24, 58, 10, 80, CAST(0.001630000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1490, 143, CAST(0x0000A60C00AC57D9 AS DateTime), 50, 24, 58, 10, 86, CAST(0.017708800000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1491, 143, CAST(0x0000A60C00AC57DD AS DateTime), 50, 24, 58, 10, 86, CAST(0.065851200000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1492, 143, CAST(0x0000A60C00AC57E1 AS DateTime), 50, 24, 58, 10, 86, CAST(0.057050000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1493, 103, CAST(0x0000A60C00AC411B AS DateTime), 50, 24, 58, 24, 129, CAST(0.013008000000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1494, 103, CAST(0x0000A60C00AC4122 AS DateTime), 50, 24, 58, 24, 129, CAST(0.005111400000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1495, 104, CAST(0x0000A60C00AC413A AS DateTime), 47, 27, 57, 15, 97, CAST(0.004800000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1496, 104, CAST(0x0000A60C00AC413E AS DateTime), 47, 27, 57, 15, 97, CAST(0.043934400000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1497, 154, CAST(0x0000A60C00AC4131 AS DateTime), 49, 27, 57, 9, 62, CAST(0.005046300000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1498, 154, CAST(0x0000A60C00AC48A9 AS DateTime), 49, 27, 57, 9, 62, CAST(0.006783900000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1499, 154, CAST(0x0000A60C00AC4D46 AS DateTime), 49, 27, 57, 9, 62, CAST(0.005921300000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1500, 154, CAST(0x0000A60C00AC5274 AS DateTime), 49, 27, 57, 9, 62, CAST(0.017055400000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1501, 154, CAST(0x0000A60C00AC57F4 AS DateTime), 49, 27, 57, 9, 62, CAST(0.012593600000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1502, 106, CAST(0x0000A60C00AC4136 AS DateTime), 49, 27, 57, 16, 103, CAST(0.001686600000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1503, 106, CAST(0x0000A60C00AC48AC AS DateTime), 49, 27, 57, 16, 103, CAST(0.002717300000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1504, 106, CAST(0x0000A60C00AC4D4A AS DateTime), 49, 27, 57, 16, 103, CAST(0.000655900000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1505, 106, CAST(0x0000A60C00AC4D4F AS DateTime), 49, 27, 57, 16, 106, CAST(0.001750000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1506, 106, CAST(0x0000A60C00AC5278 AS DateTime), 49, 27, 57, 16, 101, CAST(0.002399400000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1507, 106, CAST(0x0000A60C00AC527C AS DateTime), 49, 27, 57, 16, 103, CAST(0.005059800000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1508, 106, CAST(0x0000A60C00AC5281 AS DateTime), 49, 27, 57, 16, 106, CAST(0.004500000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1509, 106, CAST(0x0000A60C00AC57F8 AS DateTime), 49, 27, 57, 16, 101, CAST(0.003065900000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1510, 106, CAST(0x0000A60C00AC57FD AS DateTime), 49, 27, 57, 16, 103, CAST(0.001686600000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1511, 107, CAST(0x0000A60C00AC526D AS DateTime), 49, 27, 57, 7, 44, CAST(0.001017000000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1512, 107, CAST(0x0000A60C00AC5270 AS DateTime), 49, 27, 57, 7, 48, CAST(0.001070300000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1513, 108, CAST(0x0000A60C00AC5284 AS DateTime), 49, 27, 81, 139, 138, CAST(0.000905900000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1514, 141, CAST(0x0000A60C00AC414C AS DateTime), 50, 29, 81, 25, 135, CAST(0.777000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1515, 151, CAST(0x0000A60C00AC48B1 AS DateTime), 49, 29, 81, 25, 134, CAST(0.471428100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1516, 126, CAST(0x0000A60C00AC4D53 AS DateTime), 48, 29, 81, 25, 134, CAST(0.012791710200000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1517, 151, CAST(0x0000A60C00AC4D5A AS DateTime), 49, 29, 81, 25, 135, CAST(0.011111200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1518, 126, CAST(0x0000A60C00AC5289 AS DateTime), 48, 29, 81, 25, 134, CAST(0.076750261200000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1519, 131, CAST(0x0000A60C00AC5801 AS DateTime), 53, 29, 81, 25, 133, CAST(0.565752000000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1520, 138, CAST(0x0000A60C00AC4148 AS DateTime), 52, 29, 57, 15, 99, CAST(0.738480000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1521, 138, CAST(0x0000A60C00AC4D5E AS DateTime), 52, 29, 57, 15, 99, CAST(0.017231200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1522, 138, CAST(0x0000A60C00AC5290 AS DateTime), 52, 29, 57, 15, 99, CAST(0.189543200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1523, 138, CAST(0x0000A60C00AC5804 AS DateTime), 52, 29, 57, 15, 99, CAST(0.097233200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1524, 127, CAST(0x0000A60C00AC4143 AS DateTime), 48, 29, 58, 23, 125, CAST(0.468886600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1525, 142, CAST(0x0000A60C00AC42F0 AS DateTime), 50, 29, 58, 23, 125, CAST(0.320141100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1526, 142, CAST(0x0000A60C00AC43A5 AS DateTime), 50, 29, 58, 23, 125, CAST(0.071112000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1527, 142, CAST(0x0000A60C00AC48B8 AS DateTime), 50, 29, 58, 23, 125, CAST(0.032959100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1528, 127, CAST(0x0000A60C00AC4D56 AS DateTime), 48, 29, 58, 23, 125, CAST(0.057142800000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1529, 142, CAST(0x0000A60C00AC4D62 AS DateTime), 50, 29, 58, 23, 125, CAST(0.003555600000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1530, 142, CAST(0x0000A60C00AC5294 AS DateTime), 50, 29, 58, 23, 125, CAST(0.003282400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1531, 142, CAST(0x0000A60C00AC5298 AS DateTime), 50, 29, 58, 23, 125, CAST(0.032000400000000 AS Decimal(20, 15)), 68, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1532, 142, CAST(0x0000A60C00AC580C AS DateTime), 50, 29, 58, 23, 125, CAST(0.005744200000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1533, 112, CAST(0x0000A60C00AC42E8 AS DateTime), 53, 29, 58, 10, 78, CAST(0.007384800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1534, 112, CAST(0x0000A60C00AC48B4 AS DateTime), 49, 29, 58, 10, 80, CAST(0.122232000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1535, 135, CAST(0x0000A60C00AC42EC AS DateTime), 53, 29, 57, 7, 51, CAST(0.020923600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1536, 135, CAST(0x0000A60C00AC528C AS DateTime), 53, 29, 57, 7, 51, CAST(0.011077200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1537, 113, CAST(0x0000A60C00AC5810 AS DateTime), 50, 29, 57, 7, 48, CAST(0.007384800000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1538, 141, CAST(0x0000A60C00AC4154 AS DateTime), 50, 30, 81, 25, 135, CAST(0.100000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1539, 141, CAST(0x0000A60C00AC42F4 AS DateTime), 50, 30, 81, 25, 133, CAST(0.005984100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1540, 141, CAST(0x0000A60C00AC43A9 AS DateTime), 50, 30, 81, 25, 133, CAST(0.019282100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1541, 141, CAST(0x0000A60C00AC48BC AS DateTime), 50, 30, 81, 25, 133, CAST(0.119017100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1542, 141, CAST(0x0000A60C00AC4D66 AS DateTime), 50, 30, 81, 25, 133, CAST(0.057846300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1543, 141, CAST(0x0000A60C00AC529D AS DateTime), 50, 30, 81, 25, 132, CAST(0.017952300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1544, 141, CAST(0x0000A60C00AC5818 AS DateTime), 50, 30, 81, 25, 132, CAST(0.045878100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1545, 115, CAST(0x0000A60C00AC48C0 AS DateTime), 50, 30, 58, 24, 129, CAST(0.004167000000000 AS Decimal(20, 15)), 75, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1546, 140, CAST(0x0000A60C00AC4150 AS DateTime), 52, 30, 58, 11, 89, CAST(0.000997500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1547, 141, CAST(0x0000A60C00AC4297 AS DateTime), 50, 16, 81, 25, 133, CAST(0.109500000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1548, 141, CAST(0x0000A60C00AC436D AS DateTime), 50, 16, 81, 25, 133, CAST(0.030000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1549, 141, CAST(0x0000A60C00AC4781 AS DateTime), 50, 16, 81, 25, 133, CAST(0.159000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1550, 141, CAST(0x0000A60C00AC4C5F AS DateTime), 50, 16, 81, 25, 133, CAST(0.112500000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1551, 141, CAST(0x0000A60C00AC5171 AS DateTime), 50, 16, 81, 25, 132, CAST(0.001500000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1552, 141, CAST(0x0000A60C00AC56C3 AS DateTime), 50, 16, 81, 25, 132, CAST(0.072000000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1553, 118, CAST(0x0000A60C00AC477D AS DateTime), 49, 16, 57, 6, 36, CAST(0.073750000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1554, 129, CAST(0x0000A60C00AC489C AS DateTime), 48, 46, 57, 6, 40, CAST(0.011995200000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1555, 129, CAST(0x0000A60C00AC48A0 AS DateTime), 48, 46, 57, 6, 40, CAST(0.004998000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1556, 129, CAST(0x0000A60C00AC4D3E AS DateTime), 48, 46, 57, 6, 40, CAST(0.007996800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1557, 129, CAST(0x0000A60C00AC4D42 AS DateTime), 48, 46, 57, 6, 40, CAST(0.013994400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1558, 129, CAST(0x0000A60C00AC5269 AS DateTime), 48, 46, 57, 6, 40, CAST(0.007996800000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1559, 129, CAST(0x0000A60C00AC57E9 AS DateTime), 48, 46, 57, 6, 40, CAST(0.000999600000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1560, 143, CAST(0x0000A60C00AC48A4 AS DateTime), 50, 46, 58, 10, 80, CAST(0.006000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1561, 143, CAST(0x0000A60C00AC57F1 AS DateTime), 50, 46, 58, 10, 86, CAST(0.003000000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1562, 151, CAST(0x0000A60C00AC57ED AS DateTime), 49, 46, 81, 25, 135, CAST(0.001999200000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1563, 122, CAST(0x0000A60C00AC581C AS DateTime), 50, 45, 57, 7, 48, CAST(0.136000000000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1564, 126, CAST(0x0000A60C00AC4D6A AS DateTime), 48, 45, 81, 25, 135, CAST(0.056000000000000 AS Decimal(20, 15)), 64, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1565, 128, CAST(0x0000A60C00AC52A0 AS DateTime), 48, 45, 58, 10, 80, CAST(0.016000000000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1566, 143, CAST(0x0000A60C00AC5820 AS DateTime), 50, 45, 58, 10, 86, CAST(0.011430000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1567, 143, CAST(0x0000A60C00AC5387 AS DateTime), 50, 83, 58, 10, 70, CAST(0.004950000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1568, 128, CAST(0x0000A60C00AC40AE AS DateTime), 48, 21, 58, 10, 82, CAST(0.001000500000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1569, 128, CAST(0x0000A60C00AC51F7 AS DateTime), 48, 21, 58, 10, 81, CAST(0.001000500000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1570, 128, CAST(0x0000A60C00AC51FB AS DateTime), 48, 21, 58, 10, 82, CAST(0.001683600000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1571, 128, CAST(0x0000A60C00AC574A AS DateTime), 48, 21, 58, 10, 86, CAST(0.001000500000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1572, 129, CAST(0x0000A60C00AC450D AS DateTime), 48, 8, 57, 6, 37, CAST(0.003999600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1573, 129, CAST(0x0000A60C00AC498A AS DateTime), 48, 4, 57, 6, 40, CAST(0.002666800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1574, 129, CAST(0x0000A60C00AC4A07 AS DateTime), 48, 8, 57, 6, 37, CAST(0.006666000000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1575, 129, CAST(0x0000A60C00AC4F0D AS DateTime), 48, 8, 57, 6, 37, CAST(0.009332400000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1576, 130, CAST(0x0000A60C00AC40AB AS DateTime), 48, 21, 57, 9, 68, CAST(0.002357100000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1577, 130, CAST(0x0000A60C00AC4535 AS DateTime), 48, 9, 57, 9, 62, CAST(0.001166800000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1578, 130, CAST(0x0000A60C00AC458B AS DateTime), 48, 9, 57, 9, 62, CAST(0.046675000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1579, 130, CAST(0x0000A60C00AC458F AS DateTime), 48, 9, 57, 9, 62, CAST(0.013069000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1580, 130, CAST(0x0000A60C00AC478E AS DateTime), 48, 17, 57, 9, 68, CAST(0.023997600000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1581, 130, CAST(0x0000A60C00AC4812 AS DateTime), 48, 21, 57, 9, 68, CAST(0.002357100000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1582, 130, CAST(0x0000A60C00AC4A97 AS DateTime), 48, 9, 57, 9, 62, CAST(0.036406500000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1583, 130, CAST(0x0000A60C00AC4A9B AS DateTime), 48, 9, 57, 9, 62, CAST(0.090549500000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1584, 130, CAST(0x0000A60C00AC4C6F AS DateTime), 48, 17, 57, 9, 68, CAST(0.007999200000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1585, 130, CAST(0x0000A60C00AC4F30 AS DateTime), 48, 9, 57, 9, 62, CAST(0.041421400000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1586, 130, CAST(0x0000A60C00AC4F40 AS DateTime), 48, 9, 57, 9, 62, CAST(0.022404000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1587, 130, CAST(0x0000A60C00AC4F8A AS DateTime), 48, 9, 57, 9, 62, CAST(0.097084000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1588, 130, CAST(0x0000A60C00AC4F8E AS DateTime), 48, 9, 57, 9, 62, CAST(0.012135500000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1589, 130, CAST(0x0000A60C00AC5180 AS DateTime), 48, 17, 57, 9, 68, CAST(0.015998400000000 AS Decimal(20, 15)), 60, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1590, 130, CAST(0x0000A60C00AC546C AS DateTime), 48, 9, 57, 9, 62, CAST(0.013418200000000 AS Decimal(20, 15)), 63, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1591, 130, CAST(0x0000A60C00AC5488 AS DateTime), 48, 9, 57, 9, 62, CAST(0.063478000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1592, 130, CAST(0x0000A60C00AC548D AS DateTime), 48, 9, 57, 9, 62, CAST(0.007468000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1593, 130, CAST(0x0000A60C00AC54AD AS DateTime), 48, 9, 57, 9, 62, CAST(0.861620500000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1594, 134, CAST(0x0000A60C00AC3F59 AS DateTime), 53, 10, 57, 9, 62, CAST(0.023739300000000 AS Decimal(20, 15)), 65, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1595, 135, CAST(0x0000A60C00AC5002 AS DateTime), 53, 9, 57, 7, 48, CAST(0.000180000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1596, 137, CAST(0x0000A60C00AC3D27 AS DateTime), 52, 42, 57, 6, 40, CAST(0.002777600000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1597, 137, CAST(0x0000A60C00AC4CB1 AS DateTime), 52, 20, 57, 6, 40, CAST(0.031665000000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1598, 137, CAST(0x0000A60C00AC4F21 AS DateTime), 52, 8, 57, 6, 41, CAST(0.002666400000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1599, 137, CAST(0x0000A60C00AC578D AS DateTime), 52, 43, 57, 6, 40, CAST(0.015189900000000 AS Decimal(20, 15)), 67, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1600, 139, CAST(0x0000A60C00AC3E30 AS DateTime), 52, 8, 58, 23, 125, CAST(0.026664000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1601, 139, CAST(0x0000A60C00AC4A28 AS DateTime), 52, 8, 58, 23, 125, CAST(0.026664000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1602, 143, CAST(0x0000A60C00AC40BE AS DateTime), 50, 21, 58, 10, 78, CAST(0.003142800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1603, 143, CAST(0x0000A60C00AC482E AS DateTime), 50, 21, 58, 10, 80, CAST(0.000561200000000 AS Decimal(20, 15)), 69, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1604, 143, CAST(0x0000A60C00AC5761 AS DateTime), 50, 21, 58, 10, 86, CAST(0.007273000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1605, 143, CAST(0x0000A60C00AC5765 AS DateTime), 50, 21, 58, 10, 86, CAST(0.001443000000000 AS Decimal(20, 15)), 61, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1606, 145, CAST(0x0000A60C00AC501A AS DateTime), 50, 9, 57, 8, 54, CAST(0.005600800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1607, 145, CAST(0x0000A60C00AC554F AS DateTime), 50, 9, 57, 8, 54, CAST(0.012601800000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1608, 154, CAST(0x0000A60C00AC3E8C AS DateTime), 49, 9, 57, 9, 62, CAST(0.019603500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1609, 154, CAST(0x0000A60C00AC45A3 AS DateTime), 49, 9, 57, 9, 62, CAST(0.102685000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1610, 154, CAST(0x0000A60C00AC45A7 AS DateTime), 49, 9, 57, 9, 62, CAST(0.021001500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1611, 154, CAST(0x0000A60C00AC45AB AS DateTime), 49, 9, 57, 9, 62, CAST(0.047608500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1612, 154, CAST(0x0000A60C00AC4ABB AS DateTime), 49, 9, 57, 9, 62, CAST(0.279553300000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1613, 154, CAST(0x0000A60C00AC4ABF AS DateTime), 49, 9, 57, 9, 62, CAST(0.063478000000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1614, 154, CAST(0x0000A60C00AC4FA0 AS DateTime), 49, 9, 57, 9, 62, CAST(0.047136700000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1615, 154, CAST(0x0000A60C00AC4FA3 AS DateTime), 49, 9, 57, 9, 62, CAST(0.137224500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1616, 154, CAST(0x0000A60C00AC54C1 AS DateTime), 49, 9, 57, 9, 62, CAST(0.183413100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1617, 154, CAST(0x0000A60C00AC54C5 AS DateTime), 49, 9, 57, 9, 62, CAST(0.004667500000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1618, 154, CAST(0x0000A60C00AC5838 AS DateTime), 49, 1, 57, 9, 62, CAST(0.013849100000000 AS Decimal(20, 15)), 66, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1619, 158, CAST(0x0000A60C00AC4CAD AS DateTime), 54, 20, 58, 23, 125, CAST(0.081062400000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1620, 161, CAST(0x0000A60C00AC473A AS DateTime), 54, 15, 58, 22, 118, CAST(0.061523000000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1621, 161, CAST(0x0000A60C00AC512A AS DateTime), 54, 15, 58, 22, 118, CAST(0.002285800000000 AS Decimal(20, 15)), 62, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1622, 163, CAST(0x0000A60C00AC400A AS DateTime), 51, 15, 57, 9, 62, CAST(0.196560000000000 AS Decimal(20, 15)), 70, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1623, 164, CAST(0x0000A60C00AC400E AS DateTime), 51, 15, 57, 7, 49, CAST(0.031500000000000 AS Decimal(20, 15)), 71, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1624, 165, CAST(0x0000A60C00AC51EF AS DateTime), 51, 20, 57, 12, 93, CAST(0.000007999200000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1625, 165, CAST(0x0000A60C00AC573E AS DateTime), 51, 20, 57, 12, 93, CAST(0.006000000000000 AS Decimal(20, 15)), 72, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1626, 166, CAST(0x0000A60C00AC44BE AS DateTime), 51, 4, 81, 139, 138, CAST(0.001422200000000 AS Decimal(20, 15)), 73, 0)
GO
INSERT [dbo].[LARCA20_SmoScopeDetail] ([DetailID], [SmoScopeID], [Fecha], [SmoID], [BuID], [OwnerID], [Lvl2ID], [Lvl3ID], [Volumen], [ReasonID], [Borrado]) VALUES (1627, 166, CAST(0x0000A60C00AC591E AS DateTime), 51, 4, 81, 139, 138, CAST(0.001333300000000 AS Decimal(20, 15)), 74, 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_SmoScopeDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Usuarios] ON 

GO
INSERT [dbo].[LARCA20_Usuarios] ([IdRenglon], [Nombre], [Apellido], [Email], [Telefono], [Usuario], [Clave], [Fecha], [Borrado]) VALUES (1, N'Carlos', N'Perez', N'Carlos@atos.com', N'555', N'jose', N'jose', CAST(0xA6080563 AS SmallDateTime), 1)
GO
INSERT [dbo].[LARCA20_Usuarios] ([IdRenglon], [Nombre], [Apellido], [Email], [Telefono], [Usuario], [Clave], [Fecha], [Borrado]) VALUES (2, N'Juan', N'Fernandez', N'juan@atos.com', N'1122', N'juan', N'juan', CAST(0xA6030407 AS SmallDateTime), 0)
GO
INSERT [dbo].[LARCA20_Usuarios] ([IdRenglon], [Nombre], [Apellido], [Email], [Telefono], [Usuario], [Clave], [Fecha], [Borrado]) VALUES (3, N'Jose', N'Perez', N'jose@pp.com', N'11111', N'jose', N'jose', CAST(0xA6030416 AS SmallDateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[LARCA20_UsuariosRoles] ON 

GO
INSERT [dbo].[LARCA20_UsuariosRoles] ([IdRenglon], [RefIdUsuario], [RefIdRoles], [Borrado]) VALUES (1, 1, 3, 0)
GO
INSERT [dbo].[LARCA20_UsuariosRoles] ([IdRenglon], [RefIdUsuario], [RefIdRoles], [Borrado]) VALUES (2, 2, 1, 0)
GO
INSERT [dbo].[LARCA20_UsuariosRoles] ([IdRenglon], [RefIdUsuario], [RefIdRoles], [Borrado]) VALUES (3, 3, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[LARCA20_UsuariosRoles] OFF
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
