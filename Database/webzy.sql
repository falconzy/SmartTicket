USE [webzy]
GO
/****** Object:  Table [dbo].[TicketResolutionType]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketResolutionType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResolutionTypeName] [varchar](50) NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_TicketResolutionType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketReportMethod]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketReportMethod](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MethodName] [varchar](50) NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_TicketReportMethod] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketPriority]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketPriority](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PriorityName] [varchar](50) NOT NULL,
	[SLA] [decimal](4, 1) NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketNo] [varchar](50) NOT NULL,
	[TicketOwner] [varchar](50) NOT NULL,
	[NotifyOwner] [bit] NOT NULL,
	[AssignTosUer] [int] NULL,
	[AssignTosGroup] [int] NULL,
	[TicketType] [varchar](50) NOT NULL,
	[Priority] [varchar](50) NOT NULL,
	[ReportMethod] [varchar](50) NOT NULL,
	[FileUpload] [bit] NOT NULL,
	[Customer] [varchar](250) NOT NULL,
	[ContactPerson] [varchar](50) NOT NULL,
	[NotifyContact] [bit] NOT NULL,
	[ContactNo] [varchar](250) NULL,
	[ContactEmail] [varchar](250) NULL,
	[SiteName] [varchar](250) NOT NULL,
	[SiteAddress] [varchar](500) NULL,
	[TicketDetails] [varchar](8000) NOT NULL,
	[TicketStatus] [varchar](50) NOT NULL,
	[OnSite] [bit] NOT NULL,
	[Comment] [varchar](8000) NULL,
	[Duration] [int] NOT NULL,
	[Resolution] [varchar](8000) NULL,
	[Subscribers] [varchar](500) NULL,
	[AdditionField1] [varchar](250) NULL,
	[AdditionField2] [varchar](250) NULL,
	[AdditionField3] [varchar](250) NULL,
	[AdditionField4] [varchar](250) NULL,
	[AdditionField5] [varchar](250) NULL,
	[RecordingId] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[Remark] [varchar](8000) NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_TicketLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketClassificationName]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketClassificationName](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassificationName] [varchar](50) NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_TicketClassificationName] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[Remark] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Status] ([Id], [StatusName], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Active', NULL, NULL, NULL)
INSERT [dbo].[Status] ([Id], [StatusName], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Inactive', NULL, NULL, NULL)
/****** Object:  Table [dbo].[GroupLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[ViewAbleByCustomer] [bit] NOT NULL,
	[EmailAccount] [varchar](250) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_GroupLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Group]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
	[ViewAbleByCustomer] [bit] NOT NULL,
	[EmailAccount] [varchar](250) NULL,
	[StatusFk] [int] NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON
INSERT [dbo].[Group] ([Id], [GroupName], [ViewAbleByCustomer], [EmailAccount], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Admin', 1, N'', 1, N'Admin Group', N'Admin', NULL)
SET IDENTITY_INSERT [dbo].[Group] OFF
/****** Object:  Table [dbo].[CountryLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CountryCode] [int] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CountryLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
	[CountryCode] [int] NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON
INSERT [dbo].[Country] ([Id], [CountryName], [CountryCode], [ModifiedBy], [ModifiedOn]) VALUES (1, N'Singapore', 65, NULL, NULL)
INSERT [dbo].[Country] ([Id], [CountryName], [CountryCode], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Malaysia', 60, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Country] OFF
/****** Object:  Table [dbo].[ContactPersonLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactPersonLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](250) NULL,
	[Name] [varchar](250) NULL,
	[HPNumber] [varchar](50) NULL,
	[OfficeNumber] [varchar](50) NULL,
	[EmailAddress] [varchar](200) NULL,
	[Status] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_ContactPersonLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Remark] [varchar](250) NULL,
	[Status] [varchar](50) NULL,
	[CreatedBy] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerLog] ON
INSERT [dbo].[CustomerLog] ([Id], [Name], [Remark], [Status], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (1, N'lynda.com', NULL, N'Active', N'admin', N'admin', NULL)
INSERT [dbo].[CustomerLog] ([Id], [Name], [Remark], [Status], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Google', NULL, N'Active', N'admin', N'admin', NULL)
INSERT [dbo].[CustomerLog] ([Id], [Name], [Remark], [Status], [CreatedBy], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Hewlett-Packard Singapore (Sales) Pte. Ltd', NULL, N'Active', N'admin', N'admin', NULL)
SET IDENTITY_INSERT [dbo].[CustomerLog] OFF
/****** Object:  Table [dbo].[SiteLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SiteLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](250) NULL,
	[Country] [varchar](250) NULL,
	[SiteName] [varchar](250) NULL,
	[Address] [varchar](500) NULL,
	[Status] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_SiteLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SiteLog] ON
INSERT [dbo].[SiteLog] ([Id], [CustomerName], [Country], [SiteName], [Address], [Status], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, N'lynda.com', N'Malaysia', N'', N'Fowler Avenue Farnborough Hampshire GU14 7JF', N'Active', NULL, N'admin', CAST(0x0000A1FD013D2879 AS DateTime))
INSERT [dbo].[SiteLog] ([Id], [CustomerName], [Country], [SiteName], [Address], [Status], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Google', N'Malaysia', N'Google Bangkok', N'Level 29 The Offices at Centralworld 999/9 Rama Rd Pathumwan Bangkok 10330', N'Active', NULL, N'admin', CAST(0x0000A1FD013E65BA AS DateTime))
INSERT [dbo].[SiteLog] ([Id], [CustomerName], [Country], [SiteName], [Address], [Status], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Google', N'Singapore', N'Google Kuala Lumpur', N'Level 36 Menara Citibank 165 Jalan Ampang 50450 Kuala Lumpur Centre', N'Active', NULL, N'admin', CAST(0x0000A1FD013E65C4 AS DateTime))
INSERT [dbo].[SiteLog] ([Id], [CustomerName], [Country], [SiteName], [Address], [Status], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (4, N'Google', N'Singapore', N'Singapore', N'Google Asia Pacific Pte. Ltd. 8 Marina View Asia Square 1 #30-01 Singapore 018960', N'Active', NULL, N'admin', CAST(0x0000A1FD013E65CC AS DateTime))
INSERT [dbo].[SiteLog] ([Id], [CustomerName], [Country], [SiteName], [Address], [Status], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (5, N'Hewlett-Packard Singapore (Sales) Pte. Ltd', N'Malaysia', N'', N'450 Alexandra Road Singapore 119960', N'Active', NULL, N'admin', CAST(0x0000A1FD013FE1A0 AS DateTime))
SET IDENTITY_INSERT [dbo].[SiteLog] OFF
/****** Object:  Table [dbo].[RoleRightLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleRightLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[RightsName] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_RoleRightLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketType]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_TicketType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TicketStatus]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TicketStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_TicketStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Right]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Right](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Priority] [int] NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Right] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Right] ON
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, N'UserView', 0, N'User', N'Allow to View User Role Rights', NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (2, N'UserAdd', 1, N'User', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (3, N'UserEditOwn', 2, N'User', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (4, N'UserEditAll', 3, N'User', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (5, N'RoleView', 0, N'Role', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (6, N'RoleAdd', 1, N'Role', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (7, N'RoleEdit', 2, N'Role', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (8, N'GroupView', 0, N'Group', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (9, N'GroupAdd', 1, N'Group', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (10, N'GroupEdit', 2, N'Group', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (11, N'CustomerView', 0, N'Customer', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (12, N'CustomerAdd', 1, N'Customer', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (13, N'CustomerEdit', 2, N'Customer', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (14, N'ModuleView', 0, N'ModuleRights1', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (15, N'ModuleAdd', 1, N'ModuleRights1', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (16, N'ModuleEdit', 2, N'ModuleRights1', NULL, NULL)
INSERT [dbo].[Right] ([Id], [Name], [Priority], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (17, N'ReportView', 0, N'Report', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Right] OFF
/****** Object:  Table [dbo].[LDAPSetting]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LDAPSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [varchar](250) NOT NULL,
	[LDAPAddress] [varchar](250) NOT NULL,
	[Remark] [varchar](500) NULL,
	[ModifyBy] [varchar](250) NULL,
	[ModifyOn] [datetime] NULL,
 CONSTRAINT [PK_LDAPSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[Status] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_RoleLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserGroupLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroupLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[GroupName] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_UserGroupLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WebUserRoleLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WebUserRoleLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebUserName] [varchar](500) NULL,
	[RoleName] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_WebUserRoleLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WebUserLog]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WebUserLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NULL,
	[LoginId] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[EmailAddress] [varchar](500) NULL,
	[ContactNumber] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_WebUserLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WebUser]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WebUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[LoginId] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[EmailAddress] [varchar](500) NULL,
	[ContactNumber] [varchar](50) NULL,
	[StatusFk] [int] NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_WebUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[WebUser] ON
INSERT [dbo].[WebUser] ([Id], [Name], [LoginId], [Password], [EmailAddress], [ContactNumber], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, N'admin', N'admin', N'GLO+3slMng4=', N'admin@webzy.com', N'', 1, N'', N'Admin', NULL)
SET IDENTITY_INSERT [dbo].[WebUser] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[StatusFk] [int] NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([Id], [Name], [Description], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, N'admin', N'admin group', 1, N'admin user group with full rights', N'Admin', CAST(0x0000A1F9015B1D0A AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  View [dbo].[GroupView]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GroupView]
AS
SELECT dbo.[Group].Id, dbo.[Group].GroupName, dbo.[Group].ViewAbleByCustomer, dbo.[Group].EmailAccount, dbo.Status.StatusName AS Status
FROM  dbo.[Group] LEFT OUTER JOIN
               dbo.Status ON dbo.[Group].StatusFk = dbo.Status.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Group"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 146
               Right = 264
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 7
               Left = 312
               Bottom = 146
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 2136
         Width = 1716
         Width = 2100
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GroupView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GroupView'
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketNo] [varchar](50) NOT NULL,
	[ReceivedTime] [datetime] NOT NULL,
	[ResponseTime] [datetime] NULL,
	[TicketOwnerFk] [int] NOT NULL,
	[NotifyOwner] [bit] NOT NULL,
	[AssignTosUerFk] [int] NULL,
	[AssigntoGroupFk] [int] NULL,
	[TicketTypeFk] [int] NOT NULL,
	[PriorityFk] [int] NOT NULL,
	[TicketClassificationFk] [int] NOT NULL,
	[ReportMethodFk] [int] NOT NULL,
	[ContactPerson] [varchar](250) NOT NULL,
	[ContactNo] [varchar](50) NULL,
	[ContactEmail] [varchar](250) NULL,
	[NotifyCustomer] [bit] NOT NULL,
	[SiteName] [varchar](250) NULL,
	[SiteAddress] [varchar](500) NULL,
	[CustomerFk] [int] NULL,
	[TicketDetails] [varchar](8000) NOT NULL,
	[TicketStatusFk] [int] NOT NULL,
	[ResolutionFk] [int] NULL,
	[Resolution] [varchar](8000) NULL,
	[FileUpload] [bit] NOT NULL,
	[OnSite] [bit] NOT NULL,
	[TicketClosed] [bit] NOT NULL,
	[KIVDuration] [int] NULL,
	[TicketDuration] [int] NOT NULL,
	[Comment] [varchar](8000) NULL,
	[Escalation] [varchar](50) NULL,
	[Subscribers] [varchar](500) NULL,
	[AdditionField1] [varchar](250) NULL,
	[AdditionField2] [varchar](250) NULL,
	[AdditionField3] [varchar](250) NULL,
	[AdditionField4] [varchar](250) NULL,
	[AdditionField5] [varchar](250) NULL,
	[CreatedByFk] [int] NOT NULL,
	[Remark] [varchar](8000) NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Tickets] UNIQUE NONCLUSTERED 
(
	[TicketNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Remark] [varchar](250) NULL,
	[StatusFk] [int] NULL,
	[CreatedByFk] [int] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([Id], [Name], [Remark], [StatusFk], [CreatedByFk], [ModifiedBy], [ModifiedOn]) VALUES (1, N'lynda.com', NULL, 1, 1, N'admin', CAST(0x0000A1FD013D2809 AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Remark], [StatusFk], [CreatedByFk], [ModifiedBy], [ModifiedOn]) VALUES (2, N'Google', NULL, 1, 1, N'admin', CAST(0x0000A1FD013E6591 AS DateTime))
INSERT [dbo].[Customer] ([Id], [Name], [Remark], [StatusFk], [CreatedByFk], [ModifiedBy], [ModifiedOn]) VALUES (3, N'Hewlett-Packard Singapore (Sales) Pte. Ltd', NULL, 1, 1, N'admin', CAST(0x0000A1FD013FE199 AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  Table [dbo].[FileUpload]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileUpload](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketFk] [int] NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Path] [varchar](150) NOT NULL,
	[Remarks] [varchar](500) NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_FileUpload] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketFk] [int] NULL,
	[TicketNo] [varchar](250) NULL,
	[UID] [varchar](250) NULL,
	[ReceivedTime] [datetime] NOT NULL,
	[ToAddress] [varchar](500) NOT NULL,
	[FromAddress] [varchar](500) NOT NULL,
	[CCAddress] [varchar](500) NULL,
	[Subject] [varchar](500) NULL,
	[EmailContent] [varchar](8000) NULL,
	[EmailLocation] [varchar](250) NULL,
	[Attachment] [bit] NOT NULL,
	[Ignore] [bit] NULL,
	[Remark] [varchar](500) NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_IncomingEmail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleRight]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleRight](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleFk] [int] NULL,
	[RightFk] [int] NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifedOn] [datetime] NULL,
 CONSTRAINT [PK_RoleRight] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RoleRight] ON
INSERT [dbo].[RoleRight] ([Id], [RoleFk], [RightFk], [Remark], [ModifiedBy], [ModifedOn]) VALUES (1, 1, 4, NULL, N'Admin', NULL)
INSERT [dbo].[RoleRight] ([Id], [RoleFk], [RightFk], [Remark], [ModifiedBy], [ModifedOn]) VALUES (2, 1, 7, NULL, N'Admin', NULL)
INSERT [dbo].[RoleRight] ([Id], [RoleFk], [RightFk], [Remark], [ModifiedBy], [ModifedOn]) VALUES (3, 1, 10, NULL, N'Admin', NULL)
INSERT [dbo].[RoleRight] ([Id], [RoleFk], [RightFk], [Remark], [ModifiedBy], [ModifedOn]) VALUES (4, 1, 13, NULL, N'Admin', NULL)
INSERT [dbo].[RoleRight] ([Id], [RoleFk], [RightFk], [Remark], [ModifiedBy], [ModifedOn]) VALUES (5, 1, 16, NULL, N'Admin', NULL)
INSERT [dbo].[RoleRight] ([Id], [RoleFk], [RightFk], [Remark], [ModifiedBy], [ModifedOn]) VALUES (6, 1, 17, NULL, N'Admin', NULL)
SET IDENTITY_INSERT [dbo].[RoleRight] OFF
/****** Object:  Table [dbo].[WebUserRole]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WebUserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WebUserFk] [int] NULL,
	[RoleFk] [int] NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_WebUserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[WebUserRole] ON
INSERT [dbo].[WebUserRole] ([Id], [WebUserFk], [RoleFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[WebUserRole] OFF
/****** Object:  Table [dbo].[UserGroup]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserFk] [int] NOT NULL,
	[GroupFk] [int] NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_UserGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserGroup] ON
INSERT [dbo].[UserGroup] ([Id], [UserFk], [GroupFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserGroup] OFF
/****** Object:  View [dbo].[WebUserView]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WebUserView]
AS
SELECT     dbo.WebUser.Id, dbo.WebUser.Name, dbo.WebUser.LoginId, dbo.WebUser.EmailAddress, dbo.WebUser.ContactNumber, dbo.Status.StatusName AS Status, 
                      dbo.Role.Name AS RoleName, dbo.[Group].GroupName, dbo.WebUser.Remark
FROM         dbo.WebUserRole INNER JOIN
                      dbo.Role ON dbo.WebUserRole.RoleFk = dbo.Role.Id RIGHT OUTER JOIN
                      dbo.WebUser INNER JOIN
                      dbo.Status ON dbo.WebUser.StatusFk = dbo.Status.Id ON dbo.WebUserRole.WebUserFk = dbo.WebUser.Id LEFT OUTER JOIN
                      dbo.[Group] INNER JOIN
                      dbo.UserGroup ON dbo.[Group].Id = dbo.UserGroup.GroupFk ON dbo.WebUser.Id = dbo.UserGroup.UserFk
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[5] 2[5] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "WebUserRole"
            Begin Extent = 
               Top = 264
               Left = 381
               Bottom = 383
               Right = 541
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 234
               Left = 17
               Bottom = 353
               Right = 177
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WebUser"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 180
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 135
               Left = 540
               Bottom = 302
               Right = 700
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Group"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 125
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserGroup"
            Begin Extent = 
               Top = 9
               Left = 515
               Bottom = 128
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WebUserView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WebUserView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'WebUserView'
GO
/****** Object:  View [dbo].[UserRightsView]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UserRightsView]
AS
SELECT dbo.WebUser.Id, dbo.WebUser.Name, dbo.Role.Name AS Role, dbo.[Right].Name AS Rights, dbo.[Right].Priority, dbo.WebUser.LoginId
FROM  dbo.WebUserRole INNER JOIN
               dbo.WebUser ON dbo.WebUserRole.WebUserFk = dbo.WebUser.Id INNER JOIN
               dbo.RoleRight INNER JOIN
               dbo.[Right] ON dbo.RoleRight.RightFk = dbo.[Right].Id INNER JOIN
               dbo.Role ON dbo.RoleRight.RoleFk = dbo.Role.Id ON dbo.WebUserRole.RoleFk = dbo.Role.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[6] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "WebUserRole"
            Begin Extent = 
               Top = 21
               Left = 243
               Bottom = 140
               Right = 403
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WebUser"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "RoleRight"
            Begin Extent = 
               Top = 6
               Left = 636
               Bottom = 125
               Right = 796
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Right"
            Begin Extent = 
               Top = 131
               Left = 48
               Bottom = 270
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 6
               Left = 438
               Bottom = 125
               Right = 598
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Ta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserRightsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ble = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserRightsView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserRightsView'
GO
/****** Object:  Table [dbo].[Site]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Site](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFk] [int] NOT NULL,
	[CountryFk] [int] NULL,
	[SiteName] [varchar](250) NOT NULL,
	[Address] [varchar](500) NOT NULL,
	[StatusFk] [int] NOT NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Site] ON
INSERT [dbo].[Site] ([Id], [CustomerFk], [CountryFk], [SiteName], [Address], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (1, 1, 2, N'', N'Fowler Avenue Farnborough Hampshire GU14 7JF', 1, NULL, N'admin', CAST(0x0000A1FD013D284D AS DateTime))
INSERT [dbo].[Site] ([Id], [CustomerFk], [CountryFk], [SiteName], [Address], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (2, 2, 2, N'Google Bangkok', N'Level 29 The Offices at Centralworld 999/9 Rama Rd Pathumwan Bangkok 10330', 1, NULL, N'admin', CAST(0x0000A1FD013E65A3 AS DateTime))
INSERT [dbo].[Site] ([Id], [CustomerFk], [CountryFk], [SiteName], [Address], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (3, 2, 1, N'Google Kuala Lumpur', N'Level 36 Menara Citibank 165 Jalan Ampang 50450 Kuala Lumpur Centre', 1, NULL, N'admin', CAST(0x0000A1FD013E65C1 AS DateTime))
INSERT [dbo].[Site] ([Id], [CustomerFk], [CountryFk], [SiteName], [Address], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (4, 2, 1, N'Singapore', N'Google Asia Pacific Pte. Ltd. 8 Marina View Asia Square 1 #30-01 Singapore 018960', 1, NULL, N'admin', CAST(0x0000A1FD013E65C9 AS DateTime))
INSERT [dbo].[Site] ([Id], [CustomerFk], [CountryFk], [SiteName], [Address], [StatusFk], [Remark], [ModifiedBy], [ModifiedOn]) VALUES (5, 3, 2, N'', N'450 Alexandra Road Singapore 119960', 1, NULL, N'admin', CAST(0x0000A1FD013FE19D AS DateTime))
SET IDENTITY_INSERT [dbo].[Site] OFF
/****** Object:  Table [dbo].[EmailAttachment]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailAttachment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IncomeEmailFk] [int] NULL,
	[FileName] [varchar](500) NULL,
	[FileLocation] [varchar](500) NULL,
	[ModifiedBy] [varchar](250) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_IncomingAttachment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CustomerView]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CustomerView]
AS
SELECT     dbo.Customer.Name AS CustomerName, dbo.Customer.StatusFk AS CustomerStatusId, dbo.Customer.Id AS CustomerId, dbo.WebUser.Name AS CreatedBy, 
                      dbo.Customer.ModifiedBy, dbo.Customer.ModifiedOn, dbo.Status.StatusName AS CustomerStatus
FROM         dbo.Customer INNER JOIN
                      dbo.Status ON dbo.Customer.StatusFk = dbo.Status.Id INNER JOIN
                      dbo.WebUser ON dbo.Customer.CreatedByFk = dbo.WebUser.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[67] 4[2] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 165
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 28
               Left = 503
               Bottom = 147
               Right = 663
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WebUser"
            Begin Extent = 
               Top = 164
               Left = 358
               Bottom = 283
               Right = 522
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CustomerView'
GO
/****** Object:  Table [dbo].[ContactPerson]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactPerson](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerFk] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[HPNumber] [varchar](50) NULL,
	[OfficeNumber] [varchar](50) NULL,
	[EmailAddress] [varchar](200) NULL,
	[StatusFk] [int] NULL,
	[Remark] [varchar](250) NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactPerson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SiteView]    Script Date: 07/19/2013 23:45:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SiteView]
AS
SELECT     dbo.Site.Id AS SiteId, dbo.Site.SiteName, dbo.Site.Address AS SiteAddress, dbo.Site.StatusFk AS SiteStatusId, dbo.Status.StatusName AS SiteStatus, 
                      dbo.Customer.Name AS CustomerName, dbo.Country.CountryName AS Country, dbo.Site.CountryFk, dbo.Customer.Id AS CustomerId
FROM         dbo.Site INNER JOIN
                      dbo.Customer ON dbo.Site.CustomerFk = dbo.Customer.Id INNER JOIN
                      dbo.Status ON dbo.Site.StatusFk = dbo.Status.Id INNER JOIN
                      dbo.Country ON dbo.Site.CountryFk = dbo.Country.Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[13] 2[24] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Site"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 171
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Customer"
            Begin Extent = 
               Top = 106
               Left = 466
               Bottom = 225
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 130
               Left = 254
               Bottom = 249
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Country"
            Begin Extent = 
               Top = 6
               Left = 632
               Bottom = 125
               Right = 792
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SiteView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SiteView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SiteView'
GO
/****** Object:  ForeignKey [FK_ContactPerson_Customer]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[ContactPerson]  WITH CHECK ADD  CONSTRAINT [FK_ContactPerson_Customer] FOREIGN KEY([CustomerFk])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[ContactPerson] CHECK CONSTRAINT [FK_ContactPerson_Customer]
GO
/****** Object:  ForeignKey [FK_ContactPerson_Status]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[ContactPerson]  WITH CHECK ADD  CONSTRAINT [FK_ContactPerson_Status] FOREIGN KEY([StatusFk])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[ContactPerson] CHECK CONSTRAINT [FK_ContactPerson_Status]
GO
/****** Object:  ForeignKey [FK_Customer_Status]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Status] FOREIGN KEY([StatusFk])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Status]
GO
/****** Object:  ForeignKey [FK_Customer_WebUser]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_WebUser] FOREIGN KEY([CreatedByFk])
REFERENCES [dbo].[WebUser] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_WebUser]
GO
/****** Object:  ForeignKey [FK_IncomingAttachment_IncomingEmail]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[EmailAttachment]  WITH CHECK ADD  CONSTRAINT [FK_IncomingAttachment_IncomingEmail] FOREIGN KEY([IncomeEmailFk])
REFERENCES [dbo].[Emails] ([Id])
GO
ALTER TABLE [dbo].[EmailAttachment] CHECK CONSTRAINT [FK_IncomingAttachment_IncomingEmail]
GO
/****** Object:  ForeignKey [FK_IncomingEmail_Tickets]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_IncomingEmail_Tickets] FOREIGN KEY([TicketFk])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_IncomingEmail_Tickets]
GO
/****** Object:  ForeignKey [FK_FileUpload_Ticket]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[FileUpload]  WITH CHECK ADD  CONSTRAINT [FK_FileUpload_Ticket] FOREIGN KEY([TicketFk])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[FileUpload] CHECK CONSTRAINT [FK_FileUpload_Ticket]
GO
/****** Object:  ForeignKey [FK_Role_Status]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Status] FOREIGN KEY([StatusFk])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Status]
GO
/****** Object:  ForeignKey [FK_RoleRight_Right]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[RoleRight]  WITH CHECK ADD  CONSTRAINT [FK_RoleRight_Right] FOREIGN KEY([RightFk])
REFERENCES [dbo].[Right] ([Id])
GO
ALTER TABLE [dbo].[RoleRight] CHECK CONSTRAINT [FK_RoleRight_Right]
GO
/****** Object:  ForeignKey [FK_RoleRight_Role]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[RoleRight]  WITH CHECK ADD  CONSTRAINT [FK_RoleRight_Role] FOREIGN KEY([RoleFk])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleRight] CHECK CONSTRAINT [FK_RoleRight_Role]
GO
/****** Object:  ForeignKey [FK_Site_Country]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_Country] FOREIGN KEY([CountryFk])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_Country]
GO
/****** Object:  ForeignKey [FK_Site_Customer]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_Customer] FOREIGN KEY([CustomerFk])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_Customer]
GO
/****** Object:  ForeignKey [FK_Site_Status]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Site]  WITH CHECK ADD  CONSTRAINT [FK_Site_Status] FOREIGN KEY([StatusFk])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Site] CHECK CONSTRAINT [FK_Site_Status]
GO
/****** Object:  ForeignKey [FK_Tickets_Group]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_Group] FOREIGN KEY([AssigntoGroupFk])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_Group]
GO
/****** Object:  ForeignKey [FK_Tickets_ReportMethod]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_ReportMethod] FOREIGN KEY([ReportMethodFk])
REFERENCES [dbo].[TicketReportMethod] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_ReportMethod]
GO
/****** Object:  ForeignKey [FK_Tickets_TicketClassfication]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketClassfication] FOREIGN KEY([TicketClassificationFk])
REFERENCES [dbo].[TicketClassificationName] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketClassfication]
GO
/****** Object:  ForeignKey [FK_Tickets_TicketPriority]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketPriority] FOREIGN KEY([PriorityFk])
REFERENCES [dbo].[TicketPriority] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketPriority]
GO
/****** Object:  ForeignKey [FK_Tickets_TicketResolution]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketResolution] FOREIGN KEY([ResolutionFk])
REFERENCES [dbo].[TicketResolutionType] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketResolution]
GO
/****** Object:  ForeignKey [FK_Tickets_TicketStatus]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketStatus] FOREIGN KEY([TicketStatusFk])
REFERENCES [dbo].[TicketStatus] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketStatus]
GO
/****** Object:  ForeignKey [FK_Tickets_TicketType]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketType] FOREIGN KEY([TicketTypeFk])
REFERENCES [dbo].[TicketType] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketType]
GO
/****** Object:  ForeignKey [FK_UserGroup_Group]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_Group] FOREIGN KEY([GroupFk])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_Group]
GO
/****** Object:  ForeignKey [FK_UserGroup_WebUser]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_WebUser] FOREIGN KEY([UserFk])
REFERENCES [dbo].[WebUser] ([Id])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_WebUser]
GO
/****** Object:  ForeignKey [FK_WebUser_Status]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[WebUser]  WITH CHECK ADD  CONSTRAINT [FK_WebUser_Status] FOREIGN KEY([StatusFk])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[WebUser] CHECK CONSTRAINT [FK_WebUser_Status]
GO
/****** Object:  ForeignKey [FK_WebUserRole_WebUser]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[WebUserRole]  WITH CHECK ADD  CONSTRAINT [FK_WebUserRole_WebUser] FOREIGN KEY([WebUserFk])
REFERENCES [dbo].[WebUser] ([Id])
GO
ALTER TABLE [dbo].[WebUserRole] CHECK CONSTRAINT [FK_WebUserRole_WebUser]
GO
/****** Object:  ForeignKey [FK_WebUserRole_WebUserRole]    Script Date: 07/19/2013 23:45:41 ******/
ALTER TABLE [dbo].[WebUserRole]  WITH CHECK ADD  CONSTRAINT [FK_WebUserRole_WebUserRole] FOREIGN KEY([RoleFk])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[WebUserRole] CHECK CONSTRAINT [FK_WebUserRole_WebUserRole]
GO
