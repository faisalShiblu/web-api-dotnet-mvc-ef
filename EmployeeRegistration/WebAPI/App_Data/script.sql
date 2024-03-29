USE [master]
GO
/****** Object:  Database [EventScheduler]    Script Date: 6/3/2019 8:27:27 PM ******/
CREATE DATABASE [EventScheduler]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventScheduler', FILENAME = N'C:\Users\Admin\Database\EventScheduler.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventScheduler_log', FILENAME = N'C:\Users\Admin\Database\EventScheduler_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EventScheduler] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventScheduler].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventScheduler] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventScheduler] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventScheduler] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventScheduler] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventScheduler] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventScheduler] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventScheduler] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventScheduler] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventScheduler] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventScheduler] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventScheduler] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventScheduler] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventScheduler] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventScheduler] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventScheduler] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EventScheduler] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventScheduler] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventScheduler] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventScheduler] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventScheduler] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventScheduler] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventScheduler] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventScheduler] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EventScheduler] SET  MULTI_USER 
GO
ALTER DATABASE [EventScheduler] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventScheduler] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventScheduler] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventScheduler] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventScheduler] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EventScheduler] SET QUERY_STORE = OFF
GO
USE [EventScheduler]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [EventScheduler]
GO
/****** Object:  Table [dbo].[EmployeeOne]    Script Date: 6/3/2019 8:27:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeOne](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Position] [nvarchar](64) NULL,
	[Age] [int] NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_EmployeeOne] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 6/3/2019 8:27:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailID] [nvarchar](128) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nchar](10) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 6/3/2019 8:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](400) NULL,
	[Start] [datetime] NOT NULL,
	[End] [datetime] NULL,
	[ThemeColour] [nvarchar](16) NULL,
	[IsFullDay] [bit] NOT NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteUsers]    Script Date: 6/3/2019 8:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[DOB] [datetime] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_SiteUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 6/3/2019 8:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EmployeeOne] ON 

INSERT [dbo].[EmployeeOne] ([EmployeeID], [Name], [Position], [Age], [Salary]) VALUES (1, N'faisal', N'ceo', 25, 12500)
SET IDENTITY_INSERT [dbo].[EmployeeOne] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1, N'faisal', N'alam', N'mail@faisal.com', N'ctg', N'bd        ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (2, N'ali ', N'fitlur', N'mm@gmail.com', N'dk', N'bd        ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1002, N'abul2', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1003, N'abul2', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1004, N'abulda', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1005, N'abual', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1006, N'abuFl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1007, N'abuASDFl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1008, N'abuASDFl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1009, N'abuGl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1010, N'abusfl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1011, N'abusdl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1012, N'abuffl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1013, N'abufl', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1014, N'abul', N'smal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1015, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1016, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1017, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1018, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1019, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1020, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1021, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1022, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1023, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1024, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1025, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1026, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1027, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1028, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1029, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1030, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1031, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1032, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1033, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1034, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1035, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1036, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1037, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1038, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1039, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1040, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1041, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1042, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1043, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1044, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1045, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1046, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1047, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1048, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [EmailID], [City], [Country]) VALUES (1049, N'abul', N'mal', N'mm@mm.com', N'abc', N'cba       ')
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([EventID], [Subject], [Description], [Start], [End], [ThemeColour], [IsFullDay]) VALUES (2, N'birthday', N'birthday', CAST(N'2019-01-10T00:00:00.000' AS DateTime), CAST(N'2019-01-10T12:10:00.000' AS DateTime), N'red', 0)
INSERT [dbo].[Events] ([EventID], [Subject], [Description], [Start], [End], [ThemeColour], [IsFullDay]) VALUES (1003, N'122', N'12123132132', CAST(N'2019-05-27T00:00:00.000' AS DateTime), CAST(N'2019-05-28T00:00:00.000' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[SiteUsers] ON 

INSERT [dbo].[SiteUsers] ([ID], [FirstName], [LastName], [DOB], [RoleID]) VALUES (1, N'Ali', N'Mortuza', CAST(N'2001-12-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[SiteUsers] ([ID], [FirstName], [LastName], [DOB], [RoleID]) VALUES (2, N'Bali vv', N' m', CAST(N'2000-10-10T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[SiteUsers] ([ID], [FirstName], [LastName], [DOB], [RoleID]) VALUES (1002, N'kkk', N'kkk', CAST(N'2001-10-01T00:00:00.000' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[SiteUsers] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([ID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRoles] ([ID], [RoleName]) VALUES (3, N'User')
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserRoles]    Script Date: 6/3/2019 8:27:29 PM ******/
ALTER TABLE [dbo].[UserRoles] ADD  CONSTRAINT [IX_UserRoles] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [EventScheduler] SET  READ_WRITE 
GO
