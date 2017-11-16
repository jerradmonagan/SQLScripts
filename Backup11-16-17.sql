USE [ESC2]
GO
/****** Object:  Table [dbo].[StaffMember]    Script Date: 11/16/2017 11:44:00 AM ******/
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
	[Position] [nchar](50) NULL,
	[CenterID] [int] NULL,
	[DirectorCredentials] [bit] NULL,
	[DCExpiration] [datetime] NULL,
	[CDAInProgress] [bit] NULL,
	[CDAType] [nvarchar](50) NULL,
	[CDAExpiration] [date] NULL,
	[CDARenewalProcess] [nchar](10) NULL,
	[Comments] [nvarchar](150) NULL,
	[Goal] [nchar](10) NULL,
	[MidYear] [nchar](10) NULL,
	[EndYear] [nchar](10) NULL,
	[GoalMet] [bit] NULL,
	[TAndAApp] [nchar](10) NULL,
	[AppApp] [nchar](10) NULL,
	[ClassCompleted] [nchar](10) NULL,
	[ClassPaid] [bit] NULL,
	[RequiredHours] [int] NULL,
	[HoursEarned] [int] NULL,
	[Notes] [nchar](10) NULL,
	[TermDate] [nchar](10) NULL,
 CONSTRAINT [PK__StaffMem__2C1EBDA1C3E4047E] PRIMARY KEY CLUSTERED 
(
	[StaffMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  View [dbo].[CDA Report 2]    Script Date: 11/16/2017 11:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CDA Report 2] as
SELECT StaffMemberID, FirstName,LastName, CDAExpiration
FROM dbo.StaffMember
WHERE CDAExpiration is not NULL

GO
/****** Object:  Table [dbo].[Education]    Script Date: 11/16/2017 11:44:05 AM ******/
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
/****** Object:  View [dbo].[CDA Report]    Script Date: 11/16/2017 11:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CDA Report] as
SELECT StaffMember.StaffMemberID, StaffMember.FirstName,LastName, StaffMember.CDAExpiration, Education.DegreeAbrv,Education.DegreeLevel 
FROM dbo.StaffMember
INNER JOIN Education on Education.StaffMemberID=StaffMember.StaffMemberID
WHERE CDAExpiration is not NULL
GO
/****** Object:  View [dbo].[Default Report]    Script Date: 11/16/2017 11:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Default Report] as
SELECT StaffMember.StaffMemberID, StaffMember.FirstName,StaffMember.LastName, StaffMember.Email,StaffMember.DateOfHire, StaffMember.Position,StaffMember.CDAType, StaffMember.CDAExpiration, Education.DegreeAbrv,Education.DegreeLevel 
FROM dbo.StaffMember
INNER JOIN Education on Education.StaffMemberID=StaffMember.StaffMemberID
WHERE CDAExpiration is not NULL

GO
/****** Object:  Table [dbo].[Center]    Script Date: 11/16/2017 11:44:06 AM ******/
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
/****** Object:  Table [dbo].[StaffEducation]    Script Date: 11/16/2017 11:44:06 AM ******/
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
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 11/16/2017 11:44:06 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON),
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

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
ALTER TABLE [dbo].[StaffMember] ADD  CONSTRAINT [DF_StaffMember_Position]  DEFAULT (NULL) FOR [Position]
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
/****** Object:  StoredProcedure [dbo].[AddNewStaffMember]    Script Date: 11/16/2017 11:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--@Params as follows @CenterName,@CenterCounty,@CenterRegion,@DegreeAbrv,@DegreeLevel,@DegreeType,@DegreeDetail,@FirstName,@LastName,@Email,@DateOfHire,@Position,
--@DirectorCredentials,@DCExpiration,@CDAInProgress,@CDAType,@CDAExpiration,@CDARenewalProcess,@Comments,@Goal,@MidYear,@EndYear,@GoalMet,@TAndAApp,@AppApp,
--@ClassCompleted,@ClassPaid,@RequiredHours,@HoursEarned,@Notes,@TermDate
--All nullable except @FirstName and @LastName

--Allows the user to Add a new staff member with every available option, procedure will check @CenterID against @CenterName, @EducationID against @DegreeAbbrv and @DegreeType
--@StaffMemberId against @FirstName and LastName to see if item already exist iin the databse  

CREATE procedure [dbo].[AddNewStaffMember]  
@CenterName nvarchar(50) = NULL,
@CenterCounty nvarchar(50)= NULL,
@CenterRegion nvarchar(50)= NULL,
@DegreeAbrv nvarchar(50)= NULL,
@DegreeLevel nvarchar(50)= NULL,
@DegreeType nvarchar(50)= NULL,
@DegreeDetail nvarchar(50)= NULL,
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email nvarchar(50)= NULL,
@DateOfHire date= NULL,
@Position nchar(50)= NULL,
@DirectorCredentials bit= NULL,
@DCExpiration datetime= NULL,
@CDAInProgress bit= NULL,
@CDAType nvarchar(50)= NULL,
@CDAExpiration date= NULL,
@CDARenewalProcess nchar(10)= NULL,
@Comments nvarchar(150)= NULL,
@Goal nchar(10)= NULL,
@MidYear nchar(10)= NULL,
@EndYear nchar(10)= NULL,
@GoalMet bit= NULL,
@TAndAApp nchar(10)= NULL,
@AppApp nchar(10)= NULL,
@ClassCompleted nchar(10)= NULL,
@ClassPaid bit= NULL,
@RequiredHours int= NULL,
@HoursEarned int= NULL,
@Notes nchar(10)= NULL,
@TermDate nchar(10)= NULL

as  
begin 
Declare @CenterID int
Declare @EducationID int
Declare @StaffMemberID int


Begin
Select @CenterID = CenterID from Center where Name = @CenterName
Select @EducationID = EducationID from Education where (DegreeAbrv = @DegreeAbrv) and (DegreeType=@DegreeType)
Select @StaffMemberID = StaffMemberID from StaffMember where (FirstName=@FirstName) and (LastName=@LastName)
end

If (@CenterID is null)
begin
Insert into Center(Name,County,Region) values(@CenterName,@CenterCounty,@CenterRegion) 
Select @CenterID = SCOPE_IDENTITY()
end

If (@EducationID is null)
begin
Insert into Education(DegreeAbrv, DegreeLevel,DegreeType,DegreeDetail) values(@DegreeAbrv, @DegreeLevel,@DegreeType,@DegreeDetail) 
Select @EducationID = SCOPE_IDENTITY()
end

If (@StaffMemberID is null)
Begin
Insert into StaffMember (FirstName,LastName,Email,DateOfHire,Position,CenterID,DirectorCredentials,DCExpiration,CDAInProgress,CDAType,CDAExpiration,CDARenewalProcess,Comments,Goal,MidYear,EndYear,GoalMet,TAndAApp,AppApp,ClassCompleted,ClassPaid,RequiredHours,HoursEarned,Notes,
TermDate)values(@FirstName,@LastName,@Email,@DateOfHire,@Position,@CenterID,@DirectorCredentials,@DCExpiration,@CDAInProgress,@CDAType,@CDAExpiration,@CDARenewalProcess,@Comments,@Goal,@MidYear,@EndYear,@GoalMet,@TAndAApp,@AppApp,@ClassCompleted,@ClassPaid,@RequiredHours,@HoursEarned,@Notes,@TermDate)
Select @StaffMemberID = SCOPE_IDENTITY()
End



begin 
insert into StaffEducation (StaffMemberID,EducationID) values (@StaffMemberID,@EducationID)
end
End

GO
/****** Object:  StoredProcedure [dbo].[GetCenter]    Script Date: 11/16/2017 11:44:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--Allows for the retrieval of one center an all its staffmemers by using @CenterId param or no param returns all centers and their respective staffmembers ordered by the centers Region, then name  both ascending



CREATE Procedure [dbo].[GetCenter]  
@CenterID int = NULL
as
begin
Select * ,c.Name as [CenterName], c.County as[CenterCounty],c.Region as[CenterRegion]
FROM Center as c
Left OUTER JOIN StaffMember as sm on c.CenterID=sm.CenterID
Left OUTER JOIN StaffEducation as se on se.StaffMemberID=sm.StaffMemberID
Left OUTER JOIN Education as e on e.educationID=se.EducationID
where sm.CenterID=@CenterID OR ISNULL(@CenterID, '') = ''
order by Region asc , Name asc
end
GO
/****** Object:  StoredProcedure [dbo].[GetStaffMember]    Script Date: 11/16/2017 11:44:06 AM ******/
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
Select *, c.Name as [CenterName], c.County as[CenterCounty],c.Region as[CenterRegion]
FROM StaffMember as sm
Left Outer JOIN Center as c on c.CenterID=sm.CenterID
Left Outer JOIN StaffEducation as se on se.StaffMemberID=sm.StaffMemberID
Left Outer JOIN Education as e on e.educationID=se.EducationID
where sm.StaffMemberID=@StaffMemberID OR ISNULL(@StaffMemberID, '') = ''
end
GO
