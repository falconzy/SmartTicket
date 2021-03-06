USE [master]
GO
/****** Object:  Database [webzy]    Script Date: 07/14/2013 00:55:33 ******/
CREATE DATABASE [webzy] ON  PRIMARY 
( NAME = N'webzy', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\webzy.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'webzy_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\webzy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [webzy] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webzy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webzy] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [webzy] SET ANSI_NULLS OFF
GO
ALTER DATABASE [webzy] SET ANSI_PADDING OFF
GO
ALTER DATABASE [webzy] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [webzy] SET ARITHABORT OFF
GO
ALTER DATABASE [webzy] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [webzy] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [webzy] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [webzy] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [webzy] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [webzy] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [webzy] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [webzy] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [webzy] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [webzy] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [webzy] SET  DISABLE_BROKER
GO
ALTER DATABASE [webzy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [webzy] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [webzy] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [webzy] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [webzy] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [webzy] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [webzy] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [webzy] SET  READ_WRITE
GO
ALTER DATABASE [webzy] SET RECOVERY SIMPLE
GO
ALTER DATABASE [webzy] SET  MULTI_USER
GO
ALTER DATABASE [webzy] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [webzy] SET DB_CHAINING OFF
GO
USE [webzy]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[RoleRightLog]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[GroupLog]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[Group]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[CountryLog]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[Right]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[UserGroupLog]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[WebUserRoleLog]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[WebUserLog]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[RoleLog]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  Table [dbo].[WebUser]    Script Date: 07/14/2013 00:55:35 ******/
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
/****** Object:  View [dbo].[GroupView]    Script Date: 07/14/2013 00:55:36 ******/
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
/****** Object:  Table [dbo].[RoleRight]    Script Date: 07/14/2013 00:55:36 ******/
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
/****** Object:  Table [dbo].[WebUserRole]    Script Date: 07/14/2013 00:55:36 ******/
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
/****** Object:  Table [dbo].[UserGroup]    Script Date: 07/14/2013 00:55:36 ******/
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
/****** Object:  View [dbo].[WebUserView]    Script Date: 07/14/2013 00:55:36 ******/
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
/****** Object:  View [dbo].[UserRightsView]    Script Date: 07/14/2013 00:55:36 ******/
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
/****** Object:  ForeignKey [FK_Role_Status]    Script Date: 07/14/2013 00:55:35 ******/
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Status] FOREIGN KEY([StatusFk])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Status]
GO
/****** Object:  ForeignKey [FK_WebUser_Status]    Script Date: 07/14/2013 00:55:35 ******/
ALTER TABLE [dbo].[WebUser]  WITH CHECK ADD  CONSTRAINT [FK_WebUser_Status] FOREIGN KEY([StatusFk])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[WebUser] CHECK CONSTRAINT [FK_WebUser_Status]
GO
/****** Object:  ForeignKey [FK_RoleRight_Right]    Script Date: 07/14/2013 00:55:36 ******/
ALTER TABLE [dbo].[RoleRight]  WITH CHECK ADD  CONSTRAINT [FK_RoleRight_Right] FOREIGN KEY([RightFk])
REFERENCES [dbo].[Right] ([Id])
GO
ALTER TABLE [dbo].[RoleRight] CHECK CONSTRAINT [FK_RoleRight_Right]
GO
/****** Object:  ForeignKey [FK_RoleRight_Role]    Script Date: 07/14/2013 00:55:36 ******/
ALTER TABLE [dbo].[RoleRight]  WITH CHECK ADD  CONSTRAINT [FK_RoleRight_Role] FOREIGN KEY([RoleFk])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[RoleRight] CHECK CONSTRAINT [FK_RoleRight_Role]
GO
/****** Object:  ForeignKey [FK_WebUserRole_WebUser]    Script Date: 07/14/2013 00:55:36 ******/
ALTER TABLE [dbo].[WebUserRole]  WITH CHECK ADD  CONSTRAINT [FK_WebUserRole_WebUser] FOREIGN KEY([WebUserFk])
REFERENCES [dbo].[WebUser] ([Id])
GO
ALTER TABLE [dbo].[WebUserRole] CHECK CONSTRAINT [FK_WebUserRole_WebUser]
GO
/****** Object:  ForeignKey [FK_WebUserRole_WebUserRole]    Script Date: 07/14/2013 00:55:36 ******/
ALTER TABLE [dbo].[WebUserRole]  WITH CHECK ADD  CONSTRAINT [FK_WebUserRole_WebUserRole] FOREIGN KEY([RoleFk])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[WebUserRole] CHECK CONSTRAINT [FK_WebUserRole_WebUserRole]
GO
/****** Object:  ForeignKey [FK_UserGroup_Group]    Script Date: 07/14/2013 00:55:36 ******/
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_Group] FOREIGN KEY([GroupFk])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_Group]
GO
/****** Object:  ForeignKey [FK_UserGroup_WebUser]    Script Date: 07/14/2013 00:55:36 ******/
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_UserGroup_WebUser] FOREIGN KEY([UserFk])
REFERENCES [dbo].[WebUser] ([Id])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_UserGroup_WebUser]
GO
