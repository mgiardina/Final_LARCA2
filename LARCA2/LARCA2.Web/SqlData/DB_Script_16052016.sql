USE [Larca2]
GO
/****** Object:  Table [dbo].[LARCA20_Roles]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Roles] ON
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (1, N'Administrator', 0)
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (2, N'Editor', 0)
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (3, N'Reporter', 0)
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (4, N'MAL Leader', 0)
INSERT [dbo].[LARCA20_Roles] ([IdRenglon], [Descripcion], [Borrado]) VALUES (6, N'DRP Ops Leader', 0)
SET IDENTITY_INSERT [dbo].[LARCA20_Roles] OFF
/****** Object:  Table [dbo].[LARCA20_Responsable]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LARCA20_Recursos]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LARCA20_RcClasification]    Script Date: 05/16/2016 23:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_RcClasification](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Nivel] [nvarchar](10) NULL,
	[Codigo] [nvarchar](10) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Ownership] [nvarchar](5) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_RcClasification] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LARCA20_RcClasification] ON
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (1, N'1', N'1', N'1 Supply Issues', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (2, N'1', N'2', N'2 Business Planning Issues', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (3, N'1', N'3', N'3 Commercial Execution Issue', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (4, N'1', N'7', N'7 Not Analyzed', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (5, N'2', N'1.1', N'1.1 Master Data', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (6, N'2', N'1.2', N'1.2 Supply Planning Execution', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (7, N'2', N'1.3', N'1.3 Quality/Regulatory', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (8, N'2', N'1.4', N'1.4 Material Supply', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (9, N'2', N'1.5', N'1.5 Manufacturing Execution', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (10, N'2', N'1.6', N'1.6 Transport & Warehousing', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (11, N'2', N'1.7', N'1.7 Order Management', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (12, N'2', N'1.8', N'1.8 Other', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (13, N'2', N'1.9', N'1.9 Suppressed Demand-Sup Iss', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (14, N'2', N'1.10', N'1.10 Information /Tech Tools', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (15, N'2', N'2.1', N'2.1 Demand Planning', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (16, N'2', N'2.2', N'2.2 Initiatives Readiness', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (17, N'2', N'2.3', N'2.3 Capacity to Demand Strateg', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (18, N'2', N'2.4', N'2.4 Unplanned or Off-strategy', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (19, N'2', N'2.5', N'2.5 Other', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (20, N'2', N'2.9', N'2.9 Suppressd Demand-Bus Pln', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (21, N'2', N'2.6', N'2.6 Automated Avail Mngmnt', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (22, N'2', N'3.1', N'3.1 Customer Operations', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (23, N'2', N'3.2', N'3.2 Mkt/customer forcast input', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (24, N'2', N'3.3', N'3.3 Communication to customer', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (25, N'2', N'3.4', N'3.4 Cust order out of policy', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (26, N'2', N'3.5', N'3.5 Other', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (27, N'2', N'3.9', N'3.9 Suppressd Demand-Comm Ex', N'', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (28, N'3', N'1.1.1 ', N'1.1.1 SIP Master Data', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (29, N'3', N'1.1.2 ', N'1.1.2 Category Master Data', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (30, N'3', N'1.1.3 ', N'1.1.3 MDO Master Data-2nd lvlDC', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (31, N'3', N'1.1.4 ', N'1.1.4 Order Mngmnt Master Data', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (32, N'3', N'1.1.5 ', N'1.1.5 DRP Master Data', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (33, N'3', N'1.1.6 ', N'1.1.6 Dmnd Pln Sys Master Data', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (34, N'3', N'1.2.1 ', N'1.2.1 Excpt.Mess.not actioned ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (35, N'3', N'1.2.2 ', N'1.2.2 Excpt.Mess.not reviewed ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (36, N'3', N'1.2.3 ', N'1.2.3 SIP SWP         ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (37, N'3', N'1.2.4 ', N'1.2.4 Capacity Planning Error (CSP SWP)              ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (38, N'3', N'1.2.5 ', N'1.2.5 Safety Settng incorrect ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (39, N'3', N'1.2.6 ', N'1.2.6 Phase In/Phase Out (IOL SWP)', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (40, N'3', N'1.2.7 ', N'1.2.7 DRP SWP', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (41, N'3', N'1.2.8 ', N'1.2.8 Site Based DRP process failure ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (42, N'3', N'1.2.9 ', N'1.2.9 Global Planning SWP not followed ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (43, N'3', N'1.2.10', N'1.2.10 Manipulation Feeder Not Available', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (44, N'3', N'1.3.1 ', N'1.3.1 Supplier Quality Manage', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (45, N'3', N'1.3.2 ', N'1.3.2 Manuf Quality - Micro', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (46, N'3', N'1.3.3 ', N'1.3.3 Manuf Quality/Regulatory', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (47, N'3', N'1.3.4 ', N'1.3.4 Manipulation Quality', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (48, N'3', N'1.3.5 ', N'1.3.5 Expired Product', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (49, N'3', N'1.3.6 ', N'1.3.6 Quality Release Exec', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (50, N'3', N'1.3.7 ', N'1.3.7 Product Damage', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (51, N'3', N'1.3.8 ', N'1.3.8 FP Prod/In-prcs. mat. Reg. Req.', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (52, N'3', N'1.3.9 ', N'1.3.9 Supplier - Starting mat. Reg. Req.', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (53, N'3', N'1.3.10', N'1.3.10 Artwork Quality', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (54, N'3', N'1.4.1 ', N'1.4.1 Insuf Supplier Capacity', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (55, N'3', N'1.4.2 ', N'1.4.2 Exc. Mess. not actioned', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (56, N'3', N'1.4.3 ', N'1.4.3 MSM SWP not Followed', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (57, N'3', N'1.4.4 ', N'1.4.4 SLEAs not followed', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (58, N'3', N'1.4.5 ', N'1.4.5 Matl not ordered on time', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (59, N'3', N'1.4.6 ', N'1.4.6 Supplier Execution Mnfg', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (60, N'3', N'1.4.7 ', N'1.4.7 Natural Disaster-Supply', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (61, N'3', N'1.4.8 ', N'1.4.8 Manipulation Materials Not Available', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (62, N'3', N'1.5.1 ', N'1.5.1 Manufact. Execut. MPSA ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (63, N'3', N'1.5.2 ', N'1.5.2 Mnfg Exct Data Integrity', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (64, N'3', N'1.5.3 ', N'1.5.3 Manip.Execut. - MPSA', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (65, N'3', N'1.5.4 ', N'1.5.4 Natural Disaster–No Manf', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (66, N'3', N'1.5.5 ', N'1.5.5 Technical Readiness ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (67, N'3', N'1.5.6 ', N'1.56 Logist/Supp. Readiness ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (68, N'3', N'1.5.7 ', N'1.5.7 Product Comp. not avail', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (69, N'3', N'1.5.8 ', N'1.5.8 Late issue of document.(LAZ/AED)', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (70, N'3', N'1.6.1 ', N'1.6.1 IRA discrepancy ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (71, N'3', N'1.6.2 ', N'1.6.2 Ware.Sys./Process error ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (72, N'3', N'1.6.3 ', N'1.6.3 Outside storage failure ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (73, N'3', N'1.6.4 ', N'1.6.4 Com.iss. -MP/Plant / DC ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (74, N'3', N'1.6.5', N'1.6.5. DC breakdown ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (75, N'3', N'1.6.6 ', N'1.6.6 Inbound haulier Issue  ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (76, N'3', N'1.6.7 ', N'1.6.7 Customs Clearance Delay ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (77, N'3', N'1.6.8 ', N'1.6.8 In-transit LT Incorrect', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (78, N'3', N'1.6.9 ', N'1.6.9 Delay in transit-issue ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (79, N'3', N'1.6.10', N'1.6.10 Stolen Product ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (80, N'3', N'1.6.11', N'1.6.11 Prod.Damage /Transport ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (81, N'3', N'1.6.12', N'1.6.12 Prod.Damaged - Picking ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (82, N'3', N'1.6.13', N'1.6.13 Wrong Product Picked ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (83, N'3', N'1.6.14', N'1.6.14 Paperwork Incomplete ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (84, N'3', N'1.6.15', N'1.6.15 Late Delivery ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (85, N'3', N'1.6.16', N'1.6.16 Cust.Pickup-Truck Size ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (86, N'3', N'1.6.17', N'1.6.17  Shipment Loading Error ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (87, N'3', N'1.6.18', N'1.6.18 Product cut by carrier', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (88, N'3', N'1.6.19', N'1.6.19 Manipulation Feeder Not Delivered', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (89, N'3', N'1.7.1 ', N'1.7.1 Manual Entry Error', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (90, N'3', N'1.7.2 ', N' 1.7.2 Insufficient  Leadtime', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (91, N'3', N'1.7.3 ', N'1.7.3 Systems Error /Interface', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (92, N'3', N'1.7.4 ', N'1.7.4 Delay-New Code or Sub', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (93, N'3', N'1.8.1 ', N'1.8.1 Not covered in 1.0', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (94, N'3', N'1.9.1 ', N'1.9.1 Suppressd Demand-Sup Iss', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (95, N'3', N'1.10.1', N'1.10.1 gATP Functionality', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (96, N'3', N'1.10.2', N'1.10.2 gATP Cuts with Inventory', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (97, N'3', N'2.1.1 ', N'2.1.1   Demand Planning SWP', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (98, N'3', N'2.1.2 ', N'2.1.2 Communication:Demand Planner Error  ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (99, N'3', N'2.1.3 ', N'2.1.3 Wkly demnd mgmnt/cntrl  ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (100, N'3', N'2.1.4 ', N'2.1.4 Sys maint/interface fail', N'DRP', 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (101, N'3', N'2.2.1 ', N'2.2.1 CPS Management', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (102, N'3', N'2.2.2 ', N'2.2.2 CMK underestimated Cnsmr', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (103, N'3', N'2.2.3 ', N'2.2.3 Market Plan chng not com', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (104, N'3', N'2.2.4 ', N'2.2.4 Initiative fore not in', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (105, N'3', N'2.2.5 ', N'2.2.5 Planner human error ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (106, N'3', N'2.2.6 ', N'2.2.6 Artwork Planning', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (107, N'3', N'2.2.7 ', N'2.2.7 Project team Execution', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (108, N'3', N'2.3.1 ', N'2.3.1 Capty to Demand Strategy', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (109, N'3', N'2.3.2 ', N'2.3.2 Planned Capacity Not Realized ', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (110, N'3', N'2.4.1 ', N'2.4.1. P&G Management Decision chg', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (111, N'3', N'2.4.2', N'2.4.2.Unplan demand-price chng', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (112, N'3', N'2.4.3', N'2.4.3 Unplan demand-tax/legal', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (113, N'3', N'2.4.5 ', N'2.4.5 Global BP Process not followed or insufficient strategy', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (114, N'3', N'2.4.6 ', N'2.4.6 Legal changes, artwork invalid', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (115, N'3', N'2.5.1', N'2.5.1. Not covered in 2.0', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (116, N'3', N'2.6.1 ', N'2.6.1 Cut without Advance notice', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (117, N'3', N'2.9.1 ', N'2.9.1 Suppressd Demand-Bus Pln', N'DRP', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (118, N'3', N'3.1.1 ', N'3.1.1Cst ordr out of guideline', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (119, N'3', N'3.1.2 ', N'3.1.2Cust order incorrect prod', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (120, N'3', N'3.1.3 ', N'3.1.3Cst order incorrect price', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (121, N'3', N'3.1.4 ', N'3.1.4 Cst ordr outside of date', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (122, N'3', N'3.1.5 ', N'3.1.5 Space/condition at rcvng', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (123, N'3', N'3.1.6 ', N'3.1.6 Sys malfunction at rcvng', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (124, N'3', N'3.1.7', N'3.1.7. Cust financial status', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (125, N'3', N'3.2.1 ', N'3.2.1 CBD input-Demand/Mkt Pln', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (126, N'3', N'3.2.2 ', N'3.2.2 Cust chng qty post-windo', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (127, N'3', N'3.2.3 ', N'3.2.3 Cust Didn’t Communicate Event  ', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (128, N'3', N'3.2.4 ', N'3.2.4 Unplan demand-cust/compet', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (129, N'3', N'3.3.1 ', N'3.3.1Incorrect prd ordr-PG err', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (130, N'3', N'3.3.2 ', N'3.3.2 Prd over allocatn-PG err', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (131, N'3', N'3.3.3 ', N'3.3.3Prod ord out of ship wind', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (132, N'3', N'3.4.1 ', N'3.4.1  Cust. not execute alloc', N'NA', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (133, N'3', N'3.4.2 ', N'3.4.2 Order exceed prom allot', N'NA', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (134, N'3', N'3.4.3 ', N'3.4.3 Order exceed price allot', N'NA', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (135, N'3', N'3.4.4 ', N'3.4.4 Commercial Issue-Price', N'NA', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (136, N'3', N'3.5.1.', N'3.5.1. Not covered in 3.0', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (137, N'3', N'3.9.1 ', N'3.9.1 Suppressed Demand-Comm Ex', N'MAL', 0)
INSERT [dbo].[LARCA20_RcClasification] ([IdRenglon], [Nivel], [Codigo], [Descripcion], [Ownership], [Borrado]) VALUES (138, N'3', N'7.1.1', N'7.1.1', N'NA', 0)
SET IDENTITY_INSERT [dbo].[LARCA20_RcClasification] OFF
/****** Object:  Table [dbo].[LARCA20_MasterData]    Script Date: 05/16/2016 23:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LARCA20_MasterData](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Data] [nvarchar](10) NULL,
	[DataIni] [nvarchar](100) NULL,
	[DataFin] [nvarchar](50) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_LARCA20_MasterData] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LARCA20_MasterData] ON
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (1, N'BU', N'AP/DO & Body Spray [1102244228]', N'APDO', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (2, N'BU', N'Air Care [1000045986]', N'HOME', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (3, N'BU', N'Baby Wipes [1000045671]', N'BABY', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (4, N'BU', N'Diapers [1000043704]', N'BABY', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (5, N'BU', N'Dish Care [1000013884]', N'HOME', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (6, N'BU', N'Fabric Enhancers [1000013893]', N'FABRIC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (7, N'BU', N'Fem Premium BladeRazor System [1105058174]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (8, N'BU', N'Female Disposable Razor [1105055075]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (9, N'BU', N'Female Hair Care [1000114070]', N'HAIR', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (10, N'BU', N'Female Hair Color Wella [1105048683]', N'HAIR COLOR', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (11, N'BU', N'Female Hair Color [1105050832]', N'HAIR COLOR', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (12, N'BU', N'Female Shave Prep [1105054423]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (13, N'BU', N'Female Skin Care [1105057940]', N'SKIN', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (14, N'BU', N'Feminine Care [1100452728]', N'FEM', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (15, N'BU', N'Laundry [1000013883]', N'FABRIC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (16, N'BU', N'Laxative [1107748156]', N'PHC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (17, N'BU', N'Male Disposable Razor [1105135462]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (18, N'BU', N'Male Fragrance [1105130046]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (19, N'BU', N'Male OthSys/DblEdge BladeRazor [1105134988]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (20, N'BU', N'Male Premium BladeRazor System [1105054374]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (21, N'BU', N'Male Shave Prep [1105054527]', N'SHAVE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (22, N'BU', N'Misc Personal Health Care JV [1107692949]', N'PHC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (23, N'BU', N'Oral Care [1000013890]', N'ORAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (24, N'BU', N'Personal Cleansing [1105054352]', N'PCC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (25, N'BU', N'Personal Tissue [1000243535]', N'FAMILY', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (26, N'BU', N'Primary Major Cells [1103196437]', N'POWER', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (27, N'BU', N'Professional Hair Products [1101392477]', N'SALON', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (28, N'BU', N'Rapid Diagnostics [1102779962]', N'PHC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (29, N'BU', N'Respiratory Care [1000013885]', N'PHC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (30, N'BU', N'Stomach Remedy [1000013894]', N'PHC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (31, N'BU', N'Toilet Tissue [1000243536]', N'FAMILY', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (32, N'BU', N'Towels/Napkins [1000243534]', N'FAMILY', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (33, N'BU', N'Laundry Additives [1000020612]', N'FABRIC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (34, N'BU', N'Surface Care [1000020610]', N'HOME', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (35, N'BU', N'Male Skin Care [1105129464]', N'SKIN', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (36, N'BU', N'Mass Fragrance [1107748059]', N'OTHER', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (37, N'BU', N'Professional Other Products [1101410373]', N'SALON', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (38, N'BU', N'Female Hair Care Wella [1100917946]', N'HAIR', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (39, N'BU', N'Misc Fabric Care [1000202983]', N'FABRIC', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (40, N'BU', N'Specialty Batteries [1108249573]', N'POWER', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (41, N'BU', N'Dental Floss [1108830841]', N'ORAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (42, N'BU', N'Dentifrice [1000013890]', N'ORAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (43, N'BU', N'Manual Oral Care [1108830769]', N'ORAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (44, N'BU', N'Oral Rinse [1108830763]', N'ORAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (45, N'BU', N'Whitening/Sensitivity [1108831139]', N'ORAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (46, N'BU', N'Power Oral Care [1101707400]', N'ORAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (47, N'SMO', N'PERU', N'PERU', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (48, N'SMO', N'ARGENTINA', N'ARGENTINA', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (49, N'SMO', N'BRAZIL', N'BRAZIL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (50, N'SMO', N'MEXICO', N'MEXICO', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (51, N'SMO', N'VENEZUELA', N'VENEZUELA', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (52, N'SMO', N'LADMAR CA & DO', N'LADMAR', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (53, N'SMO', N'COLOMBIA', N'COLOMBIA', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (54, N'SMO', N'CHILE', N'CHILE', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (55, N'SMO', N'LADMAR SOUTH AM', N'LADMAR', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (56, N'SMO', N'LADMAR CARIBBEAN', N'LADMAR', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (57, N'OWNER', N'DRP', N'DRP', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (58, N'OWNER', N'MAL', N'MAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (59, N'OWNER', N'TOTAL', N'TOTAL', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (60, N'REASON', N'L6_02 Material not listed or exclude', N'L6_02', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (61, N'REASON', N'L6_35 WH Loading error', N'L6_35', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (62, N'REASON', N'L6_R5 Cuts due to Avail (LEO)-PG-CFR', N'L6_R5', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (63, N'REASON', N'L6_01 Allot-lack of remain quantity', N'L6_01', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (64, N'REASON', N'L6_58 CustOrder Encoding Error', N'L6_58', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (65, N'REASON', N'L6_05 P&G initiated quantity change', N'L6_05', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (66, N'REASON', N'L6_07P Availabil. problems at deliver', N'L6_07P', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (67, N'REASON', N'L6_11 Billed but prod not delivered', N'L6_11', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (68, N'REASON', N'L6_45 Error during production estima', N'L6_45', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (69, N'REASON', N'L6_49 Rej-Carrier caused prod dama', N'L6_49', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (70, N'REASON', N'L6_08 Lack of prod at pick/plan', N'L6_08', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (71, N'REASON', N'L6_68 Availab.probl - quality issues', N'L6_68', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (72, N'REASON', N'L6_07M Availabil. problems at deliver', N'L6_07M', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (73, N'REASON', N'L6_10 Rej - quality problems', N'L6_10', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (74, N'REASON', N'L6_61 Missing ProdUnits in ShipCases', N'L6_61', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (75, N'REASON', N'L6_48 CBD OE/M Error', N'L6_48', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (76, N'REASON', N'L6_12 Rej-wrong prod/qty delivered', N'L6_12', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (77, N'REASON', N'L6_51 Rej - bar coding error', N'L6_51', 0)
INSERT [dbo].[LARCA20_MasterData] ([IdRenglon], [Data], [DataIni], [DataFin], [Borrado]) VALUES (78, N'REASON', N'L6_34 Truck capacity - Cust transpor', N'L6_34', 0)
SET IDENTITY_INSERT [dbo].[LARCA20_MasterData] OFF
/****** Object:  Table [dbo].[LARCA20_Mailing]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LARCA20_ImputOriginal]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LARCA20_Emails]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Emails] ON
INSERT [dbo].[LARCA20_Emails] ([EmailID], [TipoProceso], [MessageID], [Fecha], [Archivo], [Procesado], [Borrado]) VALUES (6, 1, N'CALjZ=AsrB2AGkX5FqXoirnuUndpnNRYuzV8b7thLsOh10gK-KQ@mail.gmail.com', CAST(0x0000A60801565B5C AS DateTime), N'16May2016_MasterData_291.xlsx', 1, 0)
SET IDENTITY_INSERT [dbo].[LARCA20_Emails] OFF
/****** Object:  Table [dbo].[LARCA20_AuxData]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LARCA20_AuxData] ON
INSERT [dbo].[LARCA20_AuxData] ([RowId], [TopLvl2], [TopLvl3], [XlsRowFrom], [XlsColumnFrom]) VALUES (1, 0, 0, 4, 0)
SET IDENTITY_INSERT [dbo].[LARCA20_AuxData] OFF
/****** Object:  Table [dbo].[LARCA20_Usuarios]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LARCA20_Usuarios] ON
INSERT [dbo].[LARCA20_Usuarios] ([IdRenglon], [Nombre], [Apellido], [Email], [Telefono], [Usuario], [Clave], [Fecha], [Borrado]) VALUES (1, N'Carlos', N'Perez', N'Carlos@atos.com', N'555', N'jose', N'jose', CAST(0xA6080563 AS SmallDateTime), 1)
INSERT [dbo].[LARCA20_Usuarios] ([IdRenglon], [Nombre], [Apellido], [Email], [Telefono], [Usuario], [Clave], [Fecha], [Borrado]) VALUES (2, N'Juan', N'Fernandez', N'juan@atos.com', N'1122', N'juan', N'juan', CAST(0xA6030407 AS SmallDateTime), 0)
INSERT [dbo].[LARCA20_Usuarios] ([IdRenglon], [Nombre], [Apellido], [Email], [Telefono], [Usuario], [Clave], [Fecha], [Borrado]) VALUES (3, N'Jose', N'Perez', N'jose@pp.com', N'11111', N'jose', N'jose', CAST(0xA6030416 AS SmallDateTime), 0)
SET IDENTITY_INSERT [dbo].[LARCA20_Usuarios] OFF
/****** Object:  Table [dbo].[LARCA20_SmoScopeGroup]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LARCA20_SmoScope]    Script Date: 05/16/2016 23:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LARCA20_SmoScope](
	[IdRenglon] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [smalldatetime] NULL,
	[RefIdSMO] [int] NULL,
	[RefIdBU] [int] NULL,
	[RefIdOwner] [int] NULL,
	[RefIdRC] [int] NULL,
	[Problem] [nvarchar](100) NULL,
	[Why1] [nvarchar](100) NULL,
	[Why2] [nvarchar](100) NULL,
	[Why3] [nvarchar](100) NULL,
	[ActionPlan] [nvarchar](100) NULL,
	[RefIdResponsable] [int] NULL,
	[DueDate] [smalldatetime] NULL,
	[O_C] [char](1) NULL,
	[Borrado] [bit] NOT NULL,
 CONSTRAINT [PK_SmoScope] PRIMARY KEY CLUSTERED 
(
	[IdRenglon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LARCA20_UsuariosRoles]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LARCA20_UsuariosRoles] ON
INSERT [dbo].[LARCA20_UsuariosRoles] ([IdRenglon], [RefIdUsuario], [RefIdRoles], [Borrado]) VALUES (1, 1, 3, 0)
INSERT [dbo].[LARCA20_UsuariosRoles] ([IdRenglon], [RefIdUsuario], [RefIdRoles], [Borrado]) VALUES (2, 2, 1, 0)
INSERT [dbo].[LARCA20_UsuariosRoles] ([IdRenglon], [RefIdUsuario], [RefIdRoles], [Borrado]) VALUES (3, 3, 1, 0)
SET IDENTITY_INSERT [dbo].[LARCA20_UsuariosRoles] OFF
/****** Object:  Table [dbo].[LARCA20_RolesRecursos]    Script Date: 05/16/2016 23:42:28 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_LARCA20_ImputOriginal_borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_ImputOriginal] ADD  CONSTRAINT [DF_LARCA20_ImputOriginal_borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_Mailing_borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_Mailing] ADD  CONSTRAINT [DF_LARCA20_Mailing_borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_MasterData_borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_MasterData] ADD  CONSTRAINT [DF_LARCA20_MasterData_borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_RcClasification]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_RcClasification] ADD  CONSTRAINT [DF_LARCA20_RcClasification]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_Recursos_borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_Recursos] ADD  CONSTRAINT [DF_LARCA20_Recursos_borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_Responsable_Borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_Responsable] ADD  CONSTRAINT [DF_LARCA20_Responsable_Borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_Roles_borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_Roles] ADD  CONSTRAINT [DF_LARCA20_Roles_borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_RolesRecursos_borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_RolesRecursos] ADD  CONSTRAINT [DF_LARCA20_RolesRecursos_borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_SmoScope_Borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_SmoScope] ADD  CONSTRAINT [DF_SmoScope_Borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_SmoScopeGroup_Fecha]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_SmoScopeGroup] ADD  CONSTRAINT [DF_LARCA20_SmoScopeGroup_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
/****** Object:  Default [DF_LARCA20_SmoScopeGroup_Borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_SmoScopeGroup] ADD  CONSTRAINT [DF_LARCA20_SmoScopeGroup_Borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  Default [DF_LARCA20_UsuariosRoles_borrado]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_UsuariosRoles] ADD  CONSTRAINT [DF_LARCA20_UsuariosRoles_borrado]  DEFAULT ('N') FOR [Borrado]
GO
/****** Object:  ForeignKey [FK_LARCA20_RolesRecursos_LARCA20_Recursos]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_RolesRecursos]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Recursos] FOREIGN KEY([RefIdRecursos])
REFERENCES [dbo].[LARCA20_Recursos] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_RolesRecursos] CHECK CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Recursos]
GO
/****** Object:  ForeignKey [FK_LARCA20_RolesRecursos_LARCA20_Roles]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_RolesRecursos]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Roles] FOREIGN KEY([RefIdRoles])
REFERENCES [dbo].[LARCA20_Roles] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_RolesRecursos] CHECK CONSTRAINT [FK_LARCA20_RolesRecursos_LARCA20_Roles]
GO
/****** Object:  ForeignKey [FK_LARCA20_UsuariosRoles_LARCA20_Roles]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Roles] FOREIGN KEY([RefIdRoles])
REFERENCES [dbo].[LARCA20_Roles] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_UsuariosRoles] CHECK CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Roles]
GO
/****** Object:  ForeignKey [FK_LARCA20_UsuariosRoles_LARCA20_Usuarios]    Script Date: 05/16/2016 23:42:28 ******/
ALTER TABLE [dbo].[LARCA20_UsuariosRoles]  WITH CHECK ADD  CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Usuarios] FOREIGN KEY([RefIdUsuario])
REFERENCES [dbo].[LARCA20_Usuarios] ([IdRenglon])
GO
ALTER TABLE [dbo].[LARCA20_UsuariosRoles] CHECK CONSTRAINT [FK_LARCA20_UsuariosRoles_LARCA20_Usuarios]
GO
