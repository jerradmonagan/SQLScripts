USE [master]
GO
/****** Object:  Database [ECS]    Script Date: 4/6/2018 11:57:48 AM ******/
CREATE DATABASE [ECS]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ECS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ECS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ECS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ECS] SET ARITHABORT OFF 
GO
ALTER DATABASE [ECS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ECS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ECS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ECS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ECS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ECS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ECS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ECS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ECS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ECS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ECS] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [ECS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ECS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ECS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ECS] SET  MULTI_USER 
GO
ALTER DATABASE [ECS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ECS] SET ENCRYPTION ON
GO
ALTER DATABASE [ECS] SET QUERY_STORE = ON
GO
ALTER DATABASE [ECS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [ECS]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 4/6/2018 11:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Center]    Script Date: 4/6/2018 11:57:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Center](
	[CenterID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[County] [nvarchar](50) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Center] PRIMARY KEY CLUSTERED 
(
	[CenterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[CertCompletion]    Script Date: 4/6/2018 11:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertCompletion](
	[StaffMemberID] [int] NOT NULL,
	[CertificationID] [int] NOT NULL,
	[CertCompletionDate] [date] NULL,
	[CertInProgress] [bit] NULL,
 CONSTRAINT [PK_CertCompletion] PRIMARY KEY CLUSTERED 
(
	[StaffMemberID] ASC,
	[CertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Certification]    Script Date: 4/6/2018 11:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certification](
	[CertificationID] [int] IDENTITY(1,1) NOT NULL,
	[CertName] [nvarchar](50) NULL,
	[CertExpireAmount] [int] NULL,
 CONSTRAINT [PK_Certification] PRIMARY KEY CLUSTERED 
(
	[CertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Config]    Script Date: 4/6/2018 11:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[Pagination] [int] NULL,
	[ContactEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[ECSUser]    Script Date: 4/6/2018 11:57:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ECSUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[AccessLevel] [int] NOT NULL,
	[PasswordHash] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Education]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[EducationID] [int] IDENTITY(1,1) NOT NULL,
	[DegreeAbrv] [nvarchar](50) NULL,
	[DegreeLevel] [nvarchar](50) NULL,
	[DegreeType] [nvarchar](50) NULL,
	[DegreeDetail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Filter]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filter](
	[FilterID] [int] IDENTITY(1,1) NOT NULL,
	[FilterName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[BeginDateOfHire] [date] NULL,
	[Goal] [bit] NULL,
	[MidYear] [bit] NULL,
	[EndYear] [bit] NULL,
	[GoalMet] [bit] NULL,
	[TAndAApp] [bit] NULL,
	[AppApp] [bit] NULL,
	[ClassCompleted] [bit] NULL,
	[ClassPaid] [bit] NULL,
	[RequiredHours] [int] NULL,
	[HoursEarned] [int] NULL,
	[BeginTermDate] [date] NULL,
	[IsInactive] [bit] NULL,
	[CertCompleted] [nvarchar](100) NULL,
	[Position] [nvarchar](100) NULL,
	[EducationLevel] [nvarchar](100) NULL,
	[EducationType] [nvarchar](100) NULL,
	[EducationDetail] [nvarchar](100) NULL,
	[CenterName] [nvarchar](100) NULL,
	[CenterCounty] [nvarchar](100) NULL,
	[CenterRegion] [nvarchar](100) NULL,
	[TimeUntilExpire] [int] NULL,
	[ShouldCheckPositionReq] [bit] NULL,
	[AllowViewOnlyUser] [bit] NULL,
	[EndDateOfHire] [date] NULL,
	[EndTermDate] [date] NULL,
	[RequiredHoursType] [int] NULL,
	[HoursEarnedType] [int] NULL,
 CONSTRAINT [PK_Filter] PRIMARY KEY CLUSTERED 
(
	[FilterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Position]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[PositionID] [int] IDENTITY(1,1) NOT NULL,
	[PositionTitle] [nvarchar](50) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[PositionReq]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionReq](
	[PositionID] [int] NOT NULL,
	[CertificationID] [int] NOT NULL,
 CONSTRAINT [PK_PostionReq] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC,
	[CertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[StaffEducation]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffEducation](
	[StaffMemberID] [int] NOT NULL,
	[EducationID] [int] NOT NULL,
 CONSTRAINT [PK_StaffEducation] PRIMARY KEY CLUSTERED 
(
	[StaffMemberID] ASC,
	[EducationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[StaffMember]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffMember](
	[StaffMemberID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DateOfHire] [date] NULL,
	[CenterID] [int] NULL,
	[DirectorCredentials] [bit] NULL,
	[DCExpiration] [date] NULL,
	[CDAInProgress] [bit] NULL,
	[CDAType] [nvarchar](50) NULL,
	[CDAExpiration] [date] NULL,
	[CDARenewalProcess] [nvarchar](50) NULL,
	[Comments] [nvarchar](150) NULL,
	[Goal] [bit] NULL,
	[MidYear] [bit] NULL,
	[EndYear] [bit] NULL,
	[GoalMet] [bit] NULL,
	[TAndAApp] [bit] NULL,
	[AppApp] [bit] NULL,
	[ClassCompleted] [bit] NULL,
	[ClassPaid] [bit] NULL,
	[RequiredHours] [int] NULL,
	[HoursEarned] [int] NULL,
	[Notes] [nvarchar](200) NULL,
	[TermDate] [date] NULL,
	[IsInactive] [bit] NULL,
 CONSTRAINT [PK__StaffMem__2C1EBDA1C3E4047E] PRIMARY KEY CLUSTERED 
(
	[StaffMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[StaffPosition]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffPosition](
	[StaffMemberID] [int] NOT NULL,
	[PositionID] [int] NOT NULL,
 CONSTRAINT [PK_StaffPosition] PRIMARY KEY CLUSTERED 
(
	[StaffMemberID] ASC,
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 4/6/2018 11:57:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
SET IDENTITY_INSERT [dbo].[Center] ON 

INSERT [dbo].[Center] ([CenterID], [Name], [County], [Region]) VALUES (3, N'Orange Park', N'Clay', N'1A')
INSERT [dbo].[Center] ([CenterID], [Name], [County], [Region]) VALUES (6, N'Middleburg', N'Clay', N'1A')
INSERT [dbo].[Center] ([CenterID], [Name], [County], [Region]) VALUES (7, N'Downtown', N'Duval', N'2B')
SET IDENTITY_INSERT [dbo].[Center] OFF
INSERT [dbo].[CertCompletion] ([StaffMemberID], [CertificationID], [CertCompletionDate], [CertInProgress]) VALUES (6, 9, CAST(N'2018-01-01' AS Date), 1)
INSERT [dbo].[CertCompletion] ([StaffMemberID], [CertificationID], [CertCompletionDate], [CertInProgress]) VALUES (6, 10, CAST(N'2018-03-26' AS Date), 1)
INSERT [dbo].[CertCompletion] ([StaffMemberID], [CertificationID], [CertCompletionDate], [CertInProgress]) VALUES (6, 11, CAST(N'2018-03-14' AS Date), NULL)
INSERT [dbo].[CertCompletion] ([StaffMemberID], [CertificationID], [CertCompletionDate], [CertInProgress]) VALUES (8, 9, CAST(N'2018-03-05' AS Date), NULL)
INSERT [dbo].[CertCompletion] ([StaffMemberID], [CertificationID], [CertCompletionDate], [CertInProgress]) VALUES (11, 9, CAST(N'2018-03-21' AS Date), NULL)
INSERT [dbo].[CertCompletion] ([StaffMemberID], [CertificationID], [CertCompletionDate], [CertInProgress]) VALUES (17, 12, CAST(N'2080-01-01' AS Date), NULL)
INSERT [dbo].[CertCompletion] ([StaffMemberID], [CertificationID], [CertCompletionDate], [CertInProgress]) VALUES (27, 9, CAST(N'2018-03-08' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Certification] ON 

INSERT [dbo].[Certification] ([CertificationID], [CertName], [CertExpireAmount]) VALUES (9, N'CLASS Infant Toddler 2', 11)
INSERT [dbo].[Certification] ([CertificationID], [CertName], [CertExpireAmount]) VALUES (10, N'CDA Infant Todler', 36)
INSERT [dbo].[Certification] ([CertificationID], [CertName], [CertExpireAmount]) VALUES (11, N'Test Cert', 12)
INSERT [dbo].[Certification] ([CertificationID], [CertName], [CertExpireAmount]) VALUES (12, N'DCF Training 30 Day', 1)
SET IDENTITY_INSERT [dbo].[Certification] OFF
SET IDENTITY_INSERT [dbo].[ECSUser] ON 

INSERT [dbo].[ECSUser] ([UserID], [Email], [FirstName], [LastName], [AccessLevel], [PasswordHash]) VALUES (3, N'jmonagan@ecs4kids.org', N'Jerrad', N'Monagan', 1, N'$2b$10$Rvj8E149t1opZyAQky.Y.OJcXqgeAwj8I1z4bxbbHv4cPc5qn8r4S')
INSERT [dbo].[ECSUser] ([UserID], [Email], [FirstName], [LastName], [AccessLevel], [PasswordHash]) VALUES (4, N'ckgiveout@gmail.com', N'Chris', N'Kingdon', 1, N'$2b$10$H1xjY4L8lVkdhQIiYqEK3uft5rie4IYieh65TUFVfFgxhOfToNM4.')
INSERT [dbo].[ECSUser] ([UserID], [Email], [FirstName], [LastName], [AccessLevel], [PasswordHash]) VALUES (6, N'testviewuser@ecs.com', N'Test2', N'User', 2, N'$2b$10$DtXqNWR4pK7UcW7zLG7TFeQMlOaUIUMl/G7lqqfvcH4Lck1BjR/HG')
INSERT [dbo].[ECSUser] ([UserID], [Email], [FirstName], [LastName], [AccessLevel], [PasswordHash]) VALUES (9, N'karthik@ecs.com', N'Karthikeyan', N'Umapathy', 1, N'$2b$10$B1QxKh4eNiNXqhWrfksune8AjNGt7k8.ZIEOP2h50eewHSLvIvFHu')
INSERT [dbo].[ECSUser] ([UserID], [Email], [FirstName], [LastName], [AccessLevel], [PasswordHash]) VALUES (12, N'admin@ecs4kids.org', N'admin', N'account', 1, N'$2b$10$0xm43F2nrH894UNcAAEH4uQf.WA238G9ZsM9u1rH.5PAvoeQOx1qq')
INSERT [dbo].[ECSUser] ([UserID], [Email], [FirstName], [LastName], [AccessLevel], [PasswordHash]) VALUES (13, N'joe@ecs4kids.org', N'joe', N'admin', 2, N'$2b$10$wOqKGLra/sLB3O3oMarJd.HS6bDsads3/wWAPjNHTR7zENBnahDLC')
SET IDENTITY_INSERT [dbo].[ECSUser] OFF
SET IDENTITY_INSERT [dbo].[Education] ON 

INSERT [dbo].[Education] ([EducationID], [DegreeAbrv], [DegreeLevel], [DegreeType], [DegreeDetail]) VALUES (3, N'AS', N'Associates', N'Education', N'Early Childhood')
INSERT [dbo].[Education] ([EducationID], [DegreeAbrv], [DegreeLevel], [DegreeType], [DegreeDetail]) VALUES (14, N'AS', N'Associates', N'Computing', N'Networking')
INSERT [dbo].[Education] ([EducationID], [DegreeAbrv], [DegreeLevel], [DegreeType], [DegreeDetail]) VALUES (15, N'MS', N'Masters', N'Education', N'Early Childhood')
INSERT [dbo].[Education] ([EducationID], [DegreeAbrv], [DegreeLevel], [DegreeType], [DegreeDetail]) VALUES (16, N'AS', N'Associates', N'Education', N'History')
INSERT [dbo].[Education] ([EducationID], [DegreeAbrv], [DegreeLevel], [DegreeType], [DegreeDetail]) VALUES (21, N'MDS', N'Associates', N'beep', N'Computer Science')
INSERT [dbo].[Education] ([EducationID], [DegreeAbrv], [DegreeLevel], [DegreeType], [DegreeDetail]) VALUES (22, N'MDS', N'Masters', N'Education', N'Early Childhood')
INSERT [dbo].[Education] ([EducationID], [DegreeAbrv], [DegreeLevel], [DegreeType], [DegreeDetail]) VALUES (23, N'Ph.D.', N'Doctorate', N'Information Science', N'Web Systems')
SET IDENTITY_INSERT [dbo].[Education] OFF
SET IDENTITY_INSERT [dbo].[Filter] ON 

INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (2, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (3, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (4, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (5, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (6, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (7, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (8, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (9, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (10, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (11, NULL, N'Chris,Bob', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (12, NULL, N'Chris', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (13, NULL, N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'Developer', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Filter] ([FilterID], [FilterName], [FirstName], [LastName], [Email], [BeginDateOfHire], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [BeginTermDate], [IsInactive], [CertCompleted], [Position], [EducationLevel], [EducationType], [EducationDetail], [CenterName], [CenterCounty], [CenterRegion], [TimeUntilExpire], [ShouldCheckPositionReq], [AllowViewOnlyUser], [EndDateOfHire], [EndTermDate], [RequiredHoursType], [HoursEarnedType]) VALUES (14, NULL, N'', N'', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'', N'Developer', N'', N'', N'', N'', N'', N'', NULL, 0, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Filter] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (1, N'LeadTeacher')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (2, N'Hobbit')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (6, N'Wizard')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (7, N'cool guy')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (8, N'testing1')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (9, N'Developer')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (11, N'Center Manager')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (12, N'Teacher')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (13, N'Staff')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (14, N'Teacher New')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (15, N'Another Position')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (17, N'some stuff')
INSERT [dbo].[Position] ([PositionID], [PositionTitle]) VALUES (19, NULL)
SET IDENTITY_INSERT [dbo].[Position] OFF
INSERT [dbo].[PositionReq] ([PositionID], [CertificationID]) VALUES (1, 9)
INSERT [dbo].[PositionReq] ([PositionID], [CertificationID]) VALUES (1, 10)
INSERT [dbo].[PositionReq] ([PositionID], [CertificationID]) VALUES (1, 12)
INSERT [dbo].[PositionReq] ([PositionID], [CertificationID]) VALUES (6, 11)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (6, 15)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (8, 3)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (13, 3)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (21, 14)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (21, 21)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (22, 16)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (27, 22)
INSERT [dbo].[StaffEducation] ([StaffMemberID], [EducationID]) VALUES (27, 23)
SET IDENTITY_INSERT [dbo].[StaffMember] ON 

INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (6, N'Robert', N'Jeffries', N'robbert.jeffries@gmail.com', CAST(N'2018-02-11' AS Date), 3, 0, CAST(N'2018-03-15' AS Date), 1, N'National CDA Infant Toddler', CAST(N'2018-06-01' AS Date), NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1, 21, 0, NULL, CAST(N'2018-02-28' AS Date), 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (8, N'Franklin', N'Bagins', N'franklin.baggins@ecs.com', CAST(N'2018-02-10' AS Date), 3, 0, NULL, 0, NULL, CAST(N'2018-04-06' AS Date), NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 23, 0, NULL, NULL, 1)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (10, N'Will', N'Martin', N'will.martin@ecs.com', CAST(N'2018-02-17' AS Date), 3, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, NULL, NULL, 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (11, N'Shelby', N'Dawson', N'shelbydawson@ecs.com.com', CAST(N'2018-02-03' AS Date), 3, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, NULL, NULL, 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (13, N'Thomas', N'Jefferson', N'thomas.jefferson@ecs.com', CAST(N'2018-02-03' AS Date), 3, 1, CAST(N'2018-02-01' AS Date), 1, N'National CDA Infant Toddler', CAST(N'2018-02-10' AS Date), NULL, N'asdf', 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, N'asfd', CAST(N'2018-02-24' AS Date), 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (15, N'Chris', N'Kingdon', N'chris.kingdon@gmail.com', CAST(N'2018-02-02' AS Date), 3, 0, NULL, 0, N'National CDA Infant Toddler', CAST(N'2018-05-01' AS Date), NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, NULL, 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (17, N'George', N'Bush', N'george.bush@ecs.com', CAST(N'2018-02-03' AS Date), 3, 1, CAST(N'2018-07-19' AS Date), 0, N'National CDA Infant Toddler', CAST(N'2018-05-24' AS Date), NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 40, 0, NULL, NULL, 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (18, N'Abraham', N'Lincoln', N'alincoln@email.com', CAST(N'2018-01-31' AS Date), 3, 1, CAST(N'2018-02-03' AS Date), 0, N'National CDA Infant Toddler', CAST(N'2018-03-21' AS Date), NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, NULL, NULL, 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (21, N'Cam', N'Newton', N'Cnewton@gmail.com', CAST(N'2018-02-27' AS Date), 6, 1, CAST(N'2018-03-20' AS Date), 1, N'CDA 1', CAST(N'2018-04-19' AS Date), N'OK', NULL, 0, 0, 0, 0, 1, 1, 1, 1, 40, 0, NULL, CAST(N'2018-04-13' AS Date), 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (22, N'Paul', N'Simon', N'psimon@ecs4kids.org', CAST(N'2018-03-01' AS Date), 3, 1, CAST(N'2018-04-27' AS Date), 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, 1, 1, 35, 0, NULL, CAST(N'2018-06-15' AS Date), 0)
INSERT [dbo].[StaffMember] ([StaffMemberID], [FirstName], [LastName], [Email], [DateOfHire], [CenterID], [DirectorCredentials], [DCExpiration], [CDAInProgress], [CDAType], [CDAExpiration], [CDARenewalProcess], [Comments], [Goal], [MidYear], [EndYear], [GoalMet], [TAndAApp], [AppApp], [ClassCompleted], [ClassPaid], [RequiredHours], [HoursEarned], [Notes], [TermDate], [IsInactive]) VALUES (27, N'John', N'Doe', N'jd@email.com', CAST(N'2008-02-28' AS Date), 7, 0, NULL, 0, N'NA', NULL, N'NA', N'some comments', 0, 0, 0, 0, 0, 1, 0, 0, 30, 0, N'some notes', CAST(N'2018-03-06' AS Date), 0)
SET IDENTITY_INSERT [dbo].[StaffMember] OFF
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (6, 1)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (8, 1)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (10, 7)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (11, 12)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (13, 6)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (13, 7)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (15, 15)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (17, 8)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (18, 7)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (21, 9)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (22, 11)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (27, 2)
INSERT [dbo].[StaffPosition] ([StaffMemberID], [PositionID]) VALUES (27, 9)
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON 

INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'Diagram_1', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000000200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF1D000000FEFFFFFF04000000050000000600000007000000080000002E0000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C000000FEFFFFFFFEFFFFFF1F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D000000FEFFFFFF2F00000030000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF020000000000000000000000000000000000000000000000000000000000000050011E6B86B5D3010300000080100000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000000000000820A0000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000090000005926000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002B0000005F000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A000000FEFFFFFF2C000000FEFFFFFFFEFFFFFF2F000000300000003100000032000000330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F00000040000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000434000A1E500C05000080290000000F00FFFF4B00000029000000007D0000E5710000555A000020E9000045A5000086C0FFFF97090000DE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C1E0000008C090000009E010000003400A509000007000080010000009E020000008000000C000080536368477269640058020000DEF4FFFF43656E746572202864626F2900003800A50900000700008002000000A0020000008000000D0000805363684772696400762F000048F4FFFF45435355736572202864626F2909000000003800A50900000700008003000000A4020000008000000F00008053636847726964001248000016260000456475636174696F6E202864626F290000009000A50900000700008005000000520000000180000065000080436F6E74726F6C005B4500002F29000052656C6174696F6E736869702027464B5F5374616666456475636174696F6E5F456475636174696F6E202864626F2927206265747765656E2027456475636174696F6E202864626F292720616E6420275374616666456475636174696F6E202864626F292700803F00002800B50100000700008006000000310000006900000002800000436F6E74726F6C003D400000BF28000000008C00A50900000700008008000000520000000180000063000080436F6E74726F6C001A2600002F29000052656C6174696F6E736869702027464B5F5374616666456475636174696F6E5F5374616666202864626F2927206265747765656E202753746166664D656D626572202864626F292720616E6420275374616666456475636174696F6E202864626F29270000002800B50100000700008009000000310000006100000002800000436F6E74726F6C0071210000752B000000008400A5090000070000800A000000620000000180000059000080436F6E74726F6C00570100009505000052656C6174696F6E736869702027464B5F53746166664D656D6265725F43656E746572202864626F2927206265747765656E202743656E746572202864626F292720616E64202753746166664D656D626572202864626F292700000000002800B5010000070000800B000000310000005D00000002800000436F6E74726F6C00CE0900008D10000000003C00A50900000700008007000000A802000000800000110000805363684772696400840300005613000053746166664D656D626572202864626F2900720000003800A5090000070000800D000000A2020000008000000E0000805363684772696400A848000044160000506F736974696F6E202864626F29290000003C00A50900000700008004000000AE0200000080000014000080536368477269640004290000302A00005374616666456475636174696F6E202864626F2900009000A509000007000080120000005A0000000180000067000080436F6E74726F6C001A2600005512000052656C6174696F6E736869702027464B5F5374616666506F736974696F6E5F53746166664D656D626572202864626F2927206265747765656E202753746166664D656D626572202864626F292720616E6420275374616666506F736974696F6E202864626F29273F00002800B50100000700008013000000310000006B00000002800000436F6E74726F6C005E2F0000E511000000008C00A50900000700008014000000520000000180000061000080436F6E74726F6C00D24200004315000052656C6174696F6E736869702027464B5F5374616666506F736974696F6E5F506F736974696F6E202864626F2927206265747765656E2027506F736974696F6E202864626F292720616E6420275374616666506F736974696F6E202864626F292729270000002800B50100000700008015000000310000006500000002800000436F6E74726F6C0071400000D314000000003C00A5090000070000800C000000AC02000000800000130000805363684772696400C62A0000441600005374616666506F736974696F6E202864626F290000003C00A50900000700008016000000AC02000000800000130000805363684772696400DA6100001C3E000043657274696669636174696F6E202864626F290000003400A509000007000080180000009E020000008000000C0000805363684772696400EC5E000048F4FFFF436F6E666967202864626F2900008400A5090000070000802100000052000000018000005B000080436F6E74726F6C00646000009B17000052656C6174696F6E736869702027464B5F506F7374696F6E5265715F506F7374696F6E202864626F2927206265747765656E2027506F736974696F6E202864626F292720616E642027506F736974696F6E526571202864626F29270000002800B50100000700008022000000310000005D00000002800000436F6E74726F6C00C56000002B17000000009000A50900000700008023000000520000000180000066000080436F6E74726F6C00FB6B0000EA38000052656C6174696F6E736869702027464B5F506F7374696F6E5265715F43657274696669636174696F6E202864626F2927206265747765656E202743657274696669636174696F6E202864626F292720616E642027506F736974696F6E526571202864626F2927803F00002800B50100000700008024000000310000006900000002800000436F6E74726F6C00416E0000133C000000003C00A50900000700008020000000A802000000800000110000805363684772696400FC6C00009C180000506F736974696F6E526571202864626F2900000000009400A50900000700008025000000520000000180000069000080436F6E74726F6C001A2600001B3D000052656C6174696F6E736869702027464B5F43657274436F6D706C6574696F6E5F53746166664D656D626572202864626F2927206265747765656E202753746166664D656D626572202864626F292720616E64202743657274436F6D706C6574696F6E202864626F292700000000002800B50100000700008026000000310000006D00000002800000436F6E74726F6C0047220000AB3C000000009800A5090000070000802700000052000000018000006D000080436F6E74726F6C00B35900001B3D000052656C6174696F6E736869702027464B5F43657274436F6D706C6574696F6E5F43657274696669636174696F6E202864626F2927206265747765656E202743657274696669636174696F6E202864626F292720616E64202743657274436F6D706C6574696F6E202864626F2927F0EAFF00002800B50100000700008028000000310000007100000002800000436F6E74726F6C00B7560000AB3C000000003C00A50900000700008017000000AE02000000800000140000805363684772696400383100001C3E000043657274436F6D706C6574696F6E202864626F2900003400A509000007000080290000009E020000008000000C00008053636847726964000ED4FFFF2A12000046696C746572202864626F2900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F5739000002006054ED6A86B5D301020200001048450000000000000000000000000000000000D80100004400610074006100200053006F0075007200630065003D0065006300730031002E00640061007400610062006100730065002E00770069006E0064006F00770073002E006E00650021433412080000006A2200006E130000785634120700000014010000430065006E0074006500720020002800640062006F0029000000723F9E9D1D3F0000803F0000003F0000803FF3F2723F9E9D1D3F0000803F0000803F0000803FF3F2723F9E9D1D3F0000803F000000005102000057020000030000000000000006000000E0FFFFFF00000000FB00000066020000020000000300000005000000E0FFFFFF00000000AA020000CD020000090000000000000006000000E0FFFFFF00000000200000006B03000001000000030000000500000090FFFFFF000000001B0000006E03000000000000030000000500000094FFFFFF00000000B50100007403000006000000030000000500000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000006A2200006E130000000000002D010000070000000C000000070000001C010000BD06000082050000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC030000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000007000000430065006E0074006500720000002143341208000000232900007F150000785634120700000014010000450043005300550073006500720020002800640062006F002900000065722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000232900007F150000000000002D010000080000000C000000070000001C0100000609000062070000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000080000004500430053005500730065007200000021433412080000008E2000000D11000078563412070000001401000045006400750063006100740069006F006E0020002800640062006F0029000000616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000008E2000000D110000000000002D010000070000000C000000070000001C01000046050000FB040000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A00000045006400750063006100740069006F006E00000002000B0012480000C62A0000AE460000C62A00000000000002000000F0F0F000000000000000000000000000000000000100000006000000000000003D400000BF280000FF0F00005801000038000000010000020000FF0F000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611B0046004B005F005300740061006600660045006400750063006100740069006F006E005F0045006400750063006100740069006F006E0002000B0046270000C62A000004290000C62A00000000000002000000F0F0F0000000000000000000000000000000000001000000090000000000000071210000752B0000680D00005801000032000000010000020000680D000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61170046004B005F005300740061006600660045006400750063006100740069006F006E005F005300740061006600660004000B00EE0200004C080000EE020000DE0F0000AC260000DE0F0000AC260000561300000000000002000000F0F0F00000000000000000000000000000000000010000000B00000000000000CE0900008D100000680D0000580100003D000000010000020000680D000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61150046004B005F00530074006100660066004D0065006D006200650072005F00430065006E007400650072002143341208000000C22300007A4C0000785634120700000014010000530074006100660066004D0065006D0062006500720020002800640062006F0029000000656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000C22300007A4C0000000000002D0100000D0000000C000000070000001C010000BC07000028050000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC030000000000000100000088160000A0470000000000001B0000000C00000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C000000530074006100660066004D0065006D0062006500720000002143341208000000E8180000DA0D000078563412070000001401000050006F0073006900740069006F006E0020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000E8180000DA0D0000000000002D0100000D0000000C000000070000001C010000A104000062070000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000050006F0073006900740069006F006E0000002143341208000000AA1D0000780E00007856341207000000140100005300740061006600660045006400750063006100740069006F006E0020002800640062006F002900000044617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000AA1D0000780E0000000000002D010000070000000C000000070000001C010000AE060000DE030000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC030000000000000100000088160000810F000000000000020000000200000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F0000005300740061006600660045006400750063006100740069006F006E00000003000B0046270000EC13000038310000EC13000038310000441600000000000002000000F0F0F000000000000000000000000000000000000100000013000000000000005E2F0000E51100008F100000580100003E0000000100000200008F10000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611C0046004B005F005300740061006600660050006F0073006900740069006F006E005F00530074006100660066004D0065006D0062006500720002000B00A8480000DA160000FE430000DA1600000000000002000000F0F0F0000000000000000000000000000000000001000000150000000000000071400000D3140000BE0D0000580100003D000000010000020000BE0D000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61190046004B005F005300740061006600660050006F0073006900740069006F006E005F0050006F0073006900740069006F006E002143341208000000381900000F0E00007856341207000000140100005300740061006600660050006F0073006900740069006F006E0020002800640062006F00290000000000000000000000088F7B08088F7B08888D7B08888D7B08948D7B08948D7B08A08D7B08A08D7B08AC8D7B08AC8D7B08B88D7B08B88D7B08C48D7B08C48D7B08D08D7B08D08D7B08DC8D7B08DC8D7B08E88D7B08E88D7B08F48D7B08F48D7B08008E7B08008E7B080C8E7B080C8E7B08188E7B08188E7B08248E7B08248E7B08308E7B08308E7B083C8E7B083C8E7B08488E7B08488E7B08548E7B08548E7B08608E7B08608E7B086C8E7B086C8E7B08788E7B08788E7B08848E7B08848E7B08908E7B08908E000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000381900000F0E0000000000002D0100000D0000000C000000070000001C0100000906000062070000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000E0000005300740061006600660050006F0073006900740069006F006E00000021433412080000002229000009230000785634120700000014010000430065007200740069006600690063006100740069006F006E0020002800640062006F002900000000000000300000003F00000000000000000000000000000000000000000000000000714000000000000036400100000000000000913AB0596806008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000A63AC9596907008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AF3A000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000002229000009230000000000002D0100000D0000000C000000070000001C010000F906000037050000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006400000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000E000000430065007200740069006600690063006100740069006F006E00000021433412080000003D260000E915000078563412070000001401000043006F006E0066006900670020002800640062006F00290000000000020000002A0000000400000010000000380000000C000000020000003D0000000E000000100000004200000013000000020000005C00000019000000020000005E0000001A000000100000006700000046000000020000007400000022000000020000007A000000230000001000000090000000FFFFFFFF020000009C000000FFFFFFFF02000000A1000000FFFFFFFF02000000A5000000FFFFFFFF02000000B70000004600000002000000BA0000004700000010000000D90000005000000002000000DF0000005300000002000000E200000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000003D260000E9150000000000002D0100000D0000000C000000070000001C0100000609000062070000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000043006F006E00660069006700000002000B009061000032190000FC6C0000321900000000000002000000F0F0F00000000000000000000000000000000000010000002200000000000000C56000002B170000BB0C0000580100003D000000010000020000BB0C000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61150046004B005F0050006F007300740069006F006E005200650071005F0050006F007300740069006F006E0002000B00926D00001C3E0000926D0000A53B00000000000002000000F0F0F00000000000000000000000000000000000010000002400000000000000416E0000133C0000510F0000580100003D000000010000020000510F000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611B0046004B005F0050006F007300740069006F006E005200650071005F00430065007200740069006600690063006100740069006F006E002143341208000000222900000923000078563412070000001401000050006F0073006900740069006F006E0052006500710020002800640062006F002900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000002229000009230000000000002D0100000D0000000C000000070000001C0100000609000062070000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C00000050006F0073006900740069006F006E00520065007100000002000B0046270000B23E000038310000B23E00000000000002000000F0F0F0000000000000000000000000000000000001000000260000000000000047220000AB3C000005120000580100003E0000000100000200000512000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611D0046004B005F00430065007200740043006F006D0070006C006500740069006F006E005F00530074006100660066004D0065006D0062006500720002000B00DA610000B23E0000DF5A0000B23E00000000000002000000F0F0F00000000000000000000000000000000000010000002800000000000000B7560000AB3C000093110000580100003D0000000100000200009311000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611F0046004B005F00430065007200740043006F006D0070006C006500740069006F006E005F00430065007200740069006600690063006100740069006F006E002143341208000000A729000009230000785634120700000014010000430065007200740043006F006D0070006C006500740069006F006E0020002800640062006F002900000062006F00290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000540000002C0000002C0000002C000000340000000000000000000000A729000009230000000000002D0100000D0000000C000000070000001C0100000609000062070000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F000000430065007200740043006F006D0070006C006500740069006F006E00000021433412080000007A29000053600000785634120700000014010000460069006C0074006500720020002800640062006F00290000000000000000000000000000000000000000000000000004578F6204578F6210578F6210578F6224578F6224578F6230578F6230578F623C578F623C578F6248578F6248578F6254578F6254578F6260578F6260578F626C578F626C578F6278578F6278578F6284578F6284578F6290578F6290578F629C578F629C578F62A8578F62A8578F62B4578F62B4578F62C0578F62C0578F62CC578F62CC578F62E0578F62E0578F62EC578F62EC578F62F8578F62F8578F620C588F620C588F6220588F6220588F6234588F6234588F6248588F624858000000000000000000000000000005000000540000002C0000002C0000002C0000003400000000000000000000007A29000053600000000000002D0100000D0000000C000000070000001C0100000609000062070000760200001B0300002B020000EC040000A1040000C1020000A1040000DC050000FC0300000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000000000001000000391300003403000000000000000000000000000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000007000000460069006C0074006500720000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000001E000000C31E00000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002D0000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002E000000880400000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000004100000012000000000000000C00000086C0FFFF970900000100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003700320035002C0031002C0031003400310030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000030000000300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003300350030002C0031002C0031003200370035002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000040000000400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003800000034002C0030002C003200380034002C0030002C0031003700310030002C0031002C003900390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000050000000500000000000000480000000100010001000000640062006F00000046004B005F005300740061006600660045006400750063006100740069006F006E005F0045006400750063006100740069006F006E0000000000000000000000C402000000000600000006000000050000000800000001548C1188548C110000000000000000AD070000000000070000000700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003900380030002C0031002C0031003300320030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C003100360038003000000008000000080000000000000040000000011F3E1D01000000640062006F00000046004B005F005300740061006600660045006400750063006100740069006F006E005F005300740061006600660000000000000000000000C402000000000900000009000000080000000800000001558C1148558C110000000000000000AD0700000000000A0000000A000000000000003C000000011F3E1D01000000640062006F00000046004B005F00530074006100660066004D0065006D006200650072005F00430065006E0074006500720000000000000000000000C402000000000B0000000B0000000A0000000800000001568C1188568C110000000000000000AD0700000000000C0000000C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003500340035002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000D0000000D00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003100380035002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000001200000012000000000000004A000000014D696301000000640062006F00000046004B005F005300740061006600660050006F0073006900740069006F006E005F00530074006100660066004D0065006D0062006500720000000000000000000000C402000000001300000013000000120000000800000001548C1148548C110000000000000000AD0700000000001400000014000000000000004400000001CABD7201000000640062006F00000046004B005F005300740061006600660050006F0073006900740069006F006E005F0050006F0073006900740069006F006E0000000000000000000000C402000000001500000015000000140000000800000001568C11C8568C110000000000000000AD070000000000160000001600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0031003700380035002C0031002C0031003300330035002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000170000001700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000180000001800000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000200000002000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002100000021000000000000003C000000011F3E1D01000000640062006F00000046004B005F0050006F007300740069006F006E005200650071005F0050006F007300740069006F006E0000000000000000000000C402000000002200000022000000210000000800000001548C1108548C110000000000000000AD070000000000230000002300000000000000480000000100000001000000640062006F00000046004B005F0050006F007300740069006F006E005200650071005F00430065007200740069006600690063006100740069006F006E0000000000000000000000C402000000002400000024000000230000000800000001518C1188518C110000000000000000AD0700000000002500000025000000000000004C0000000100350001000000640062006F00000046004B005F00430065007200740043006F006D0070006C006500740069006F006E005F00530074006100660066004D0065006D0062006500720000000000000000000000C402000000002600000026000000250000000800000001528C1188528C110000000000000000AD07000000000027000000270000000000000050000000014D696301000000640062006F00000046004B005F00430065007200740043006F006D0070006C006500740069006F006E005F00430065007200740069006600690063006100740069006F006E0000000000000000000000C402000000002800000028000000270000000800000001568C1148568C110000000000000000AD070000000000290000002900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000030000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000002D0000000A000000010000000700000001000000760000000500000003000000040000007A00000063000000080000000700000004000000C70000006200000012000000070000000C00000079000000140000002500000007000000170000000B0100008C000000140000000D0000000C0000005200000055000000210000000D000000200000005B0000008A00000023000000160000002000000026000000010000002700000016000000170000008A0000008D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000074003B0049006E0069007400690061006C00200043006100740061006C006F0067003D004500430053003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D00450043005300410064006D0069006E003B004D0075006C007400690070006C00650041006300740069007600650052006500730075006C00740053006500740073003D00460061006C00730065003B0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003D0054007200750065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F002200000000800500140000004400690061006700720061006D005F0031000000000226000E000000460069006C00740065007200000008000000640062006F000000000226001800000050006F0073006900740069006F006E00520065007100000008000000640062006F000000000226000E00000043006F006E00660069006700000008000000640062006F000000000226001E000000430065007200740043006F006D0070006C006500740069006F006E00000008000000640062006F000000000226001C000000430065007200740069006600690063006100740069006F006E00000008000000640062006F000000000226001200000050006F0073006900740069006F006E00000008000000640062006F000000000226001C0000005300740061006600660050006F0073006900740069006F006E00000008000000640062006F0000000002260018000000530074006100660066004D0065006D00620065007200000008000000640062006F000000000226001E0000005300740061006600660045006400750063006100740069006F006E00000008000000640062006F000000000226001400000045006400750063006100740069006F006E00000008000000640062006F00000000022600100000004500430053005500730065007200000008000000640062006F000000000224000E000000430065006E00740065007200000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_principal_name]    Script Date: 4/6/2018 11:57:58 AM ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [dbo].[Center] ADD  CONSTRAINT [DF_Center_Name]  DEFAULT (NULL) FOR [Name]
GO
ALTER TABLE [dbo].[Center] ADD  CONSTRAINT [DF_Center_County]  DEFAULT (NULL) FOR [County]
GO
ALTER TABLE [dbo].[Center] ADD  CONSTRAINT [DF_Center_Region]  DEFAULT (NULL) FOR [Region]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_Email]  DEFAULT (NULL) FOR [Email]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_DateOfHire]  DEFAULT (NULL) FOR [DateOfHire]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_DirectorCredentials]  DEFAULT ((0)) FOR [DirectorCredentials]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_DCExpiration]  DEFAULT (NULL) FOR [DCExpiration]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_CDAInProgress]  DEFAULT ((0)) FOR [CDAInProgress]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_CDAType]  DEFAULT (NULL) FOR [CDAType]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_CDAExpiration]  DEFAULT (NULL) FOR [CDAExpiration]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_CDARenewalProcess]  DEFAULT (NULL) FOR [CDARenewalProcess]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_Comments]  DEFAULT (NULL) FOR [Comments]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_Goal]  DEFAULT (NULL) FOR [Goal]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_MidYear]  DEFAULT (NULL) FOR [MidYear]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_EndYear]  DEFAULT (NULL) FOR [EndYear]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_GoalMet]  DEFAULT ((0)) FOR [GoalMet]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_TAndAApp]  DEFAULT (NULL) FOR [TAndAApp]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_AppApp]  DEFAULT (NULL) FOR [AppApp]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_ClassCompleted]  DEFAULT (NULL) FOR [ClassCompleted]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_ClassPaid]  DEFAULT ((0)) FOR [ClassPaid]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_RequiredHours]  DEFAULT ((0)) FOR [RequiredHours]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_HoursEarned]  DEFAULT ((0)) FOR [HoursEarned]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_Notes]  DEFAULT (NULL) FOR [Notes]
GO
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_TermDate]  DEFAULT (NULL) FOR [TermDate]
GO
ALTER TABLE [dbo].[CertCompletion]  WITH CHECK ADD  CONSTRAINT [FK_CertCompletion_Certification] FOREIGN KEY([CertificationID])
REFERENCES [dbo].[Certification] ([CertificationID])
GO
ALTER TABLE [dbo].[CertCompletion] CHECK CONSTRAINT [FK_CertCompletion_Certification]
GO
ALTER TABLE [dbo].[CertCompletion]  WITH CHECK ADD  CONSTRAINT [FK_CertCompletion_StaffMember] FOREIGN KEY([StaffMemberID])
REFERENCES [dbo].[StaffMember] ([StaffMemberID])
GO
ALTER TABLE [dbo].[CertCompletion] CHECK CONSTRAINT [FK_CertCompletion_StaffMember]
GO
ALTER TABLE [dbo].[PositionReq]  WITH CHECK ADD  CONSTRAINT [FK_PostionReq_Certification] FOREIGN KEY([CertificationID])
REFERENCES [dbo].[Certification] ([CertificationID])
GO
ALTER TABLE [dbo].[PositionReq] CHECK CONSTRAINT [FK_PostionReq_Certification]
GO
ALTER TABLE [dbo].[PositionReq]  WITH CHECK ADD  CONSTRAINT [FK_PostionReq_Postion] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[PositionReq] CHECK CONSTRAINT [FK_PostionReq_Postion]
GO
ALTER TABLE [dbo].[StaffEducation]  WITH CHECK ADD  CONSTRAINT [FK_StaffEducation_Education] FOREIGN KEY([EducationID])
REFERENCES [dbo].[Education] ([EducationID])
GO
ALTER TABLE [dbo].[StaffEducation] CHECK CONSTRAINT [FK_StaffEducation_Education]
GO
ALTER TABLE [dbo].[StaffEducation]  WITH CHECK ADD  CONSTRAINT [FK_StaffEducation_Staff] FOREIGN KEY([StaffMemberID])
REFERENCES [dbo].[StaffMember] ([StaffMemberID])
GO
ALTER TABLE [dbo].[StaffEducation] CHECK CONSTRAINT [FK_StaffEducation_Staff]
GO
ALTER TABLE [dbo].[StaffMember]  WITH CHECK ADD  CONSTRAINT [FK_StaffMember_Center] FOREIGN KEY([CenterID])
REFERENCES [dbo].[Center] ([CenterID])
GO
ALTER TABLE [dbo].[StaffMember] CHECK CONSTRAINT [FK_StaffMember_Center]
GO
ALTER TABLE [dbo].[StaffPosition]  WITH CHECK ADD  CONSTRAINT [FK_StaffPosition_Position] FOREIGN KEY([PositionID])
REFERENCES [dbo].[Position] ([PositionID])
GO
ALTER TABLE [dbo].[StaffPosition] CHECK CONSTRAINT [FK_StaffPosition_Position]
GO
ALTER TABLE [dbo].[StaffPosition]  WITH CHECK ADD  CONSTRAINT [FK_StaffPosition_StaffMember] FOREIGN KEY([StaffMemberID])
REFERENCES [dbo].[StaffMember] ([StaffMemberID])
GO
ALTER TABLE [dbo].[StaffPosition] CHECK CONSTRAINT [FK_StaffPosition_StaffMember]
GO
/****** Object:  StoredProcedure [dbo].[AddNewCenter]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Allows for the retrieval of one center an all its staffmemers by using @CenterId param or no param returns all centers and their respective staffmembers ordered by the centers Region, then name  both ascending



CREATE Procedure [dbo].[AddNewCenter] 
@StaffMemberID int,
@CenterName nvarchar(50) = NULL,
@CenterCounty nvarchar(50)= NULL,
@CenterRegion nvarchar(50)= NULL
as
begin

Declare @CenterID int



Select @CenterID = CenterID from Center where Name = @CenterName


If (@CenterID is null)
begin
Insert into Center(Name,County,Region) values(@CenterName,@CenterCounty,@CenterRegion) 
Select @CenterID = SCOPE_IDENTITY()
end
update StaffMember set centerID=@CenterID  where StaffMemberID=@StaffmemberID
end


GO
/****** Object:  StoredProcedure [dbo].[AddNewEducation]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Allows for the retrieval of one center an all its staffmemers by using @CenterId param or no param returns all centers and their respective staffmembers ordered by the centers Region, then name  both ascending



CREATE Procedure [dbo].[AddNewEducation] 
@StaffMemberID int,
@DegreeAbrv nvarchar(50)= NULL,
@DegreeLevel nvarchar(50)= NULL,
@DegreeType nvarchar(50)= NULL,
@DegreeDetail nvarchar(50)= NULL
as
begin
Declare @EducationID int
Select @EducationID = EducationID from Education where ((DegreeAbrv = @DegreeAbrv) and (DegreeType=@DegreeType))and (DegreeDetail=@DegreeDetail)
If (@EducationID is null)
begin
Insert into Education(DegreeAbrv, DegreeLevel,DegreeType,DegreeDetail) values(@DegreeAbrv, @DegreeLevel,@DegreeType,@DegreeDetail) 
Select @EducationID = SCOPE_IDENTITY()
end
begin 
insert into StaffEducation (StaffMemberID,EducationID) values (@StaffMemberID,@EducationID)
end

end


GO
/****** Object:  StoredProcedure [dbo].[AddNewPosition]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--Inserts new position if position does not exist in table and then adds the positionid and staffmemberid into the junction table



CREATE Procedure [dbo].[AddNewPosition] 
@StaffMemberID int,
@PositionTitle nvarchar(50)

as
begin
Declare @PositionID int
Select @PositionID = PositionID from Position where (PositionTitle = @PositionTitle) 
If (@PositionID is null)
begin
Insert into Position (PositionTitle) values(@PositionTitle) 
Select @PositionID = SCOPE_IDENTITY()
end
begin 
insert into StaffPosition (StaffMemberID,PositionID) values (@StaffMemberID,@PositionID)
end

end



GO
/****** Object:  StoredProcedure [dbo].[AddNewStaffMember]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--@Params as follows @FirstName,@LastName,@Email,@DateOfHire,
--@DirectorCredentials,@DCExpiration,@CDAInProgress,@CDAType,@CDAExpiration,@CDARenewalProcess,@Comments,@Goal,@MidYear,@EndYear,@GoalMet,@TAndAApp,@AppApp,
--@ClassCompleted,@ClassPaid,@RequiredHours,@HoursEarned,@Notes,@TermDate
--All nullable except @FirstName and @LastName


CREATE procedure [dbo].[AddNewStaffMember]
@StaffMemberID int, 
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50)= NULL,
@DateOfHire date= NULL,
@DirectorCredentials bit= NULL,
@DCExpiration date= NULL,
@CDAInProgress bit= False,
@CDAType nvarchar(50)= NULL,
@CDAExpiration date= NULL,
@CDARenewalProcess nvarchar(50)= NULL,
@Comments nvarchar(150)= NULL,
@Goal bit= NULL,
@MidYear bit= NULL,
@EndYear bit= NULL,
@GoalMet bit= False,
@TAndAApp bit= NULL,
@AppApp bit= NULL,
@ClassCompleted bit= NULL,
@ClassPaid bit= False,
@RequiredHours int= NULL,
@HoursEarned int= NULL,
@Notes nvarchar(200)= NULL,
@TermDate date= NULL,
@IsInactive bit =False
as  
begin 


Begin
Insert into StaffMember (FirstName,LastName,Email,DateOfHire,DirectorCredentials,DCExpiration,CDAInProgress,CDAType,CDAExpiration,CDARenewalProcess,Comments,Goal,MidYear,EndYear,GoalMet,TAndAApp,AppApp,ClassCompleted,ClassPaid,RequiredHours,HoursEarned,Notes,
TermDate,IsInactive) output inserted.staffMemberID values(@FirstName,@LastName,@Email,@DateOfHire,@DirectorCredentials,@DCExpiration,@CDAInProgress,@CDAType,@CDAExpiration,@CDARenewalProcess,@Comments,@Goal,@MidYear,@EndYear,@GoalMet,@TAndAApp,@AppApp,@ClassCompleted,@ClassPaid,@RequiredHours,@HoursEarned,@Notes,@TermDate,@IsInactive)
Select @StaffMemberID = SCOPE_IDENTITY()

End


End


GO
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Takes variables @Email,@FirstName,@LastName,@AccessLevel,@PasswordHash  to creates a system user to administer and view staff members


CREATE procedure [dbo].[AddNewUser]
@UserID int =null,
@Email varchar (150),
@FirstName varchar(50)=null,
@LastName varchar(50)=null,
@AccessLevel int,
@Passwordhash varchar(128)

as 

Begin
Insert into ECSUser (Email,FirstName,LastName,AccessLevel,PasswordHash) output inserted.UserID values(@Email,@FirstName,@LastName,@AccessLevel,@PasswordHash)
Select @UserID = SCOPE_IDENTITY()

End



GO
/****** Object:  StoredProcedure [dbo].[AnnualReset]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE Procedure [dbo].[AnnualReset]  
as
begin
update StaffMember Set goal =0, MidYear=0, EndYear=0, GoalMet=0, HoursEarned=0
end


GO
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE Procedure [dbo].[AuthenticateUser]  
@Email varchar(150),
@PasswordHash varchar(128)
as 
begin
Select * FROM ECSUser 
where Email=@Email and PasswordHash = @PasswordHash
end



GO
/****** Object:  StoredProcedure [dbo].[deleteStaffMember]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Deletes the staff members education from the junction table and then deletes the staff member 



CREATE Procedure [dbo].[deleteStaffMember]  
@staffMemberID int
as
begin

begin
delete from StaffEducation where staffMemberID=@staffMemberID
end

begin
delete from StaffPosition where staffMemberID=@staffMemberID
end

begin
delete from CertCompletion where StaffMemberID=@staffMemberID
end

begin
delete from StaffMember where StaffMemberID=@staffMemberID
end


end


GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--deletes the user from the database






CREATE Procedure [dbo].[deleteUser]  
@UserID int
as

if (@UserID != 3)
begin
delete from ECSUser where UserID=@UserID
end





GO
/****** Object:  StoredProcedure [dbo].[GetCenter]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Allows for the retrieval of one center an all its staffmemers by using @CenterId param or no param returns all centers and their respective staffmembers ordered by the centers Region, then name  both ascending



CREATE Procedure [dbo].[GetCenter]  
@CenterID int = NULL
as
begin
Select c.CenterID,c.Name,c.County,c.Region,sm.StaffMemberID,sm.FirstName,sm.LastName,sm.Email,sm.DateofHire, sm.DirectorCredentials,sm.DCExpiration,sm.CDAInProgress,sm.CDAType,sm.CDARenewalProcess,sm.Comments,sm.Goal,sm.MidYear,
sm.EndYear,sm.GoalMet,sm.TAndAApp,sm.AppApp,sm.ClassCompleted,sm.ClassPaid,sm.RequiredHours,sm.HoursEarned,sm.Notes,sm.TermDate, p.PositionID, p.PositionTitle
FROM Center as c
Left OUTER JOIN StaffMember as sm on c.CenterID=sm.CenterID
Left OUTER JOIN StaffPosition as sp on sp.StaffMemberID=sm.StaffMemberID
Left OUTER JOIN Position as p on p.PositionID=sp.PositionID
where sm.CenterID=@CenterID OR ISNULL(@CenterID, '') = ''
order by Region asc , Name asc
end

GO
/****** Object:  StoredProcedure [dbo].[GetEmptyCenters]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[GetEmptyCenters]  
as
begin
select c.CenterID, c.Name, c.County, C.Region from Center as c 
left join StaffMember as sm on sm.CenterID=c.CenterID 
where StaffMemberID is Null
end



GO
/****** Object:  StoredProcedure [dbo].[GetEmptyEducations]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE Procedure [dbo].[GetEmptyEducations]  
as
begin
select e.EducationID, e.DegreeAbrv, e.DegreeLevel, e.DegreeType, e.DegreeDetail from StaffEducation as se 
right join Education as e on se.EducationID=e.EducationID 
where StaffMemberID is Null
end


GO
/****** Object:  StoredProcedure [dbo].[GetEmptyPositions]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[GetEmptyPositions]  
as
begin
select p.PositionID, p.PositionTitle from Position as p
left join StaffPosition as sp on p.PositionID =sp.PositionID
left join PositionReq as pr on p.PositionID =pr.PositionID
where StaffMemberID is null  and CertificationID is null
end




GO
/****** Object:  StoredProcedure [dbo].[GetFilterLists]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[GetFilterLists] 
@StaffMemberID int =NULL
as
begin
SELECT     *, 
												JSON_QUERY((SELECT  c.CenterID,c.Name, c.County,c.Region
									                            FROM Center as c
                                                                WHERE sm.CenterID = c.CenterID
                                                                FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)) AS Center,
                                                JSON_QUERY((SELECT e.EducationID, e.DegreeAbrv, e.DegreeLevel,e.DegreeType, e.DegreeDetail 
                                                                FROM Education as e
																INNER JOIN StaffEducation as se on se.EducationID = e.EducationID
                                                                WHERE sm.StaffMemberID = se.StaffMemberID
                                                                FOR JSON PATH)) AS Education,
												JSON_QUERY((SELECT p.PositionID, p.PositionTitle,(SELECT c.CertificationID, c.CertName, c.CertExpireAmount,cc.CertCompletionDate, cc.CertInProgress
																from Certification as c
																inner join PositionReq as pr on  pr.CertificationID =c.CertificationID and p.PositionID =pr.PositionID
																left JOIN CERTCompletion as cc on cc.CertificationID=c.CertificationID and cc.StaffMemberID =sm.StaffMemberID FOR JSON PATH ) as requiredCerts
																FROM Position as p
																left JOIN StaffPosition as sp on sp.PositionID = p.PositionID
                                                                WHERE sm.StaffMemberID = sp.StaffMemberID
                                                                FOR JSON PATH )) as Position,
												JSON_QUERY((SELECT c.CertificationID as 'Cert.CertificationID',  c.CertName as 'Cert.CertName', c.CertExpireAmount as 'Cert.CertExpireAmount', cc.CertCompletionDate as 'DateCompleted', cc.CertInProgress
																FROM Certification as c
																inner join CertCompletion as cc on c.CertificationID = cc.CertificationID and sm.StaffMemberID = cc.StaffMemberID 																
																WHERE sm.StaffMemberID = cc.StaffMemberID and c.CertificationID = cc.CertificationID
                                                                FOR JSON PATH)) as Cert

FROM  StaffMember as sm 
where sm.StaffMemberID=@StaffMemberID OR ISNULL(@StaffMemberID, '') = ''

end



GO
/****** Object:  StoredProcedure [dbo].[GetKendoLists]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[GetKendoLists]  
as
begin
Select sm.StaffMemberID, sm.FirstName, sm.LastName, sm.Email,sm.DateofHire,sm.DirectorCredentials, sm.DCExpiration, sm.CDAInProgress, sm.CDAType, 
sm.CDAExpiration,sm.CDARenewalProcess,sm.Comments,sm.Goal,sm.MidYear,sm.EndYear,sm.GoalMet,sm.TAndAApp,sm.AppApp,sm.ClassCompleted,sm.ClassPaid, 
sm.RequiredHours,sm.HoursEarned,sm.Notes, sm.TermDate,sm.IsInactive, p.PositionID,p.PositionTitle, c.CenterID,c.Name,c.County,c.Region, e.EducationID,e.DegreeAbrv,  
e.DegreeLevel, e.DegreeType, e.DegreeDetail, cc.CertCompletionDate, cert.CertificationID, cert.CertName, cert.CertExpireAmount, certreqs.CertName as CertReq
FROM StaffMember as sm 
left Outer JOIN StaffPosition as sp on sp.StaffMemberID=sm.StaffMemberID 
left Outer JOIN Position as p on p.PositionID = sp.PositionID 
Left Outer JOIN Center as c on c.CenterID = sm.CenterID 
Left Outer JOIN StaffEducation as se on se.StaffMemberID = sm.StaffMemberID 
Left Outer JOIN Education as e on e.educationID = se.EducationID 
Left Outer JOIN CertCompletion as cc on cc.StaffMemberID = sm.StaffMemberID 
Left Outer JOIN Certification as cert on cert.CertificationID = cc.CertificationID
Left Outer JOIN PositionReq as pr on  pr.PositionID=p.positionID
Left Outer JOIN  Certification as certreqs on pr.CertificationID=certreqs.CertificationID

end




GO
/****** Object:  StoredProcedure [dbo].[GetSelectLists]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetSelectLists]  
as
begin
select c.Name as CenterName, c.County as CenterCounty, c.Region as CenterRegion, e.DegreeLevel as EducationLevel, e.DegreeType as EducationType, e.DegreeDetail as EducationDetail, p.PositionTitle as Position, cert.CertName as CertCompleted
from Center as c
full outer join Education as e on c.CenterID=e.EducationID
full outer join Position as p on c.CenterID=p.PositionID
full outer join Certification as cert on c.CenterID=cert.CertificationID
end




GO
/****** Object:  StoredProcedure [dbo].[GetStaffMember]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--@params are @StaffMemberID

--Allows the user to get a list of StaffMembers with their associated education and centers, use the @StaffMemberID to retrieve just one StaffMember


CREATE Procedure [dbo].[GetStaffMember]  
@StaffMemberID int =NULL
as 
begin
Select sm.StaffMemberID, sm.FirstName, sm.LastName, sm.Email,sm.DateofHire,sm.DirectorCredentials, sm.DCExpiration, sm.CDAInProgress, sm.CDAType, 
sm.CDAExpiration,sm.CDARenewalProcess,sm.Comments,sm.Goal,sm.MidYear,sm.EndYear,sm.GoalMet,sm.TAndAApp,sm.AppApp,sm.ClassCompleted,sm.ClassPaid,
sm.RequiredHours,sm.HoursEarned,sm.Notes, sm.TermDate,sm.IsInactive,p.PositionID,p.PositionTitle, c.CenterID,c.Name,c.County,c.Region, e.EducationID,e.DegreeAbrv,
e.DegreeLevel, e.DegreeType, e.DegreeDetail, cc.CertCompletionDate, cert.CertificationID, cert.CertName, cert.CertExpireAmount
FROM StaffMember as sm
left Outer JOIN StaffPosition as sp on sp.StaffMemberID=sm.StaffMemberID
left Outer JOIN Position as p on p.PositionID=sp.PositionID
Left Outer JOIN Center as c on c.CenterID=sm.CenterID
Left Outer JOIN StaffEducation as se on se.StaffMemberID=sm.StaffMemberID
Left Outer JOIN Education as e on e.educationID=se.EducationID
Left Outer JOIN CertCompletion as cc on cc.StaffMemberID=sm.StaffMemberID
Left Outer JOIN Certification as cert on cert.CertificationID=cc.CertificationID
where sm.StaffMemberID=@StaffMemberID OR ISNULL(@StaffMemberID, '') = ''
order by LastName asc
end

GO
/****** Object:  StoredProcedure [dbo].[RemovePosition]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--Takes the input of staffMemberID and the positionID you want to remove from that staff members and deletes it from the junction table to Disassociate 



CREATE Procedure [dbo].[RemovePosition]  
@staffMemberID int,
@positionID int
as
begin
delete from StaffPosition where staffMemberID=@staffMemberID and positionID=@positionID
end



GO
/****** Object:  StoredProcedure [dbo].[RemoveStaffEducation]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Takes the input of staffMemberID and the educationID you want to remove from that staff members and deletes it from the junction table to dissacciate



CREATE Procedure [dbo].[RemoveStaffEducation]  
@staffMemberID int,
@educationID int
as
begin
delete from StaffEducation where staffMemberID=@staffMemberID and educationID=@educationID
end


GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	

GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	

GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	

GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	

GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	

GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	

GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	

GO
/****** Object:  StoredProcedure [dbo].[UpdateStaffMember]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--@Params as follows @FirstName,@LastName,@Email,@DateOfHire,
--@DirectorCredentials,@DCExpiration,@CDAInProgress,@CDAType,@CDAExpiration,@CDARenewalProcess,@Comments,@Goal,@MidYear,@EndYear,@GoalMet,@TAndAApp,@AppApp,
--@ClassCompleted,@ClassPaid,@RequiredHours,@HoursEarned,@Notes,@TermDate,@IsInactive
--All nullable except @FirstName and @LastName


CREATE procedure [dbo].[UpdateStaffMember] 
@StaffMemberID int, 
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50)= NULL,
@DateOfHire date= NULL,
@DirectorCredentials bit= NULL,
@DCExpiration date= NULL,
@CDAInProgress bit= False,
@CDAType nvarchar(50)= NULL,
@CDAExpiration date= NULL,
@CDARenewalProcess nvarchar(50)= NULL,
@Comments nvarchar(150)= NULL,
@Goal bit= NULL,
@MidYear bit= NULL,
@EndYear bit= NULL,
@GoalMet bit= False,
@TAndAApp bit= NULL,
@AppApp bit= NULL,
@ClassCompleted bit= NULL,
@ClassPaid bit= False,
@RequiredHours int= NULL,
@HoursEarned int= NULL,
@Notes nvarchar(200)= NULL,
@TermDate date= NULL,
@IsInactive bit =False

as  
Begin
Update StaffMember  set FirstName=@FirstName,LastName=@LastName,Email=@Email,DateOfHire=@DateOfHire,DirectorCredentials=@DirectorCredentials,DCExpiration=@DCExpiration,CDAInProgress=@CDAInProgress,CDAType=@CDAType,CDAExpiration=@CDAExpiration,CDARenewalProcess=@CDARenewalProcess,Comments=@Comments,Goal=@Goal,MidYear=@MidYear,EndYear=@EndYear,GoalMet=@GoalMet,TAndAApp=@TAndAApp,AppApp=@AppApp,ClassCompleted=@ClassCompleted,ClassPaid=@ClassPaid,RequiredHours=@RequiredHours,HoursEarned=@HoursEarned,Notes=@Notes,
TermDate=@TermDate, IsInactive=@IsInactive
where StaffMemberID=@StaffmemberID
End





GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 4/6/2018 11:57:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[UpdateUser]
@UserID int, 
@Email varchar(150),
@FirstName varchar(50)=null,
@LastName varchar(50)=null,
@AccessLevel int,
@PasswordHash varchar(128)
as  
Begin
Update ECSUser set Email=@Email,FirstName=@FirstName,LastName=@LastName,AccessLevel=@AccessLevel
where UserID=@UserID 
End






GO
USE [master]
GO
ALTER DATABASE [ECS] SET  READ_WRITE 
GO
