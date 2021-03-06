
GO
/****** Object:  Table [dbo].[Center]    Script Date: 4/18/2018 9:16:23 AM ******/
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
/****** Object:  Table [dbo].[CertCompletion]    Script Date: 4/18/2018 9:16:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CertCompletion](
	[StaffMemberID] [int] NOT NULL,
	[CertificationID] [int] NOT NULL,
	[CertCompletionDate] [date] NULL,
	[CertInProgress] [bit] NOT NULL,
 CONSTRAINT [PK_CertCompletion] PRIMARY KEY CLUSTERED 
(
	[StaffMemberID] ASC,
	[CertificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Certification]    Script Date: 4/18/2018 9:16:23 AM ******/
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
/****** Object:  Table [dbo].[ECSUser]    Script Date: 4/18/2018 9:16:23 AM ******/
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
/****** Object:  Table [dbo].[Education]    Script Date: 4/18/2018 9:16:23 AM ******/
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
/****** Object:  Table [dbo].[Position]    Script Date: 4/18/2018 9:16:23 AM ******/
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
/****** Object:  Table [dbo].[PositionReq]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  Table [dbo].[StaffEducation]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  Table [dbo].[StaffMember]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  Table [dbo].[StaffPosition]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewCenter]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewEducation]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewPosition]    Script Date: 4/18/2018 9:16:24 AM ******/
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
if not exists(select positionId from staffposition where staffmemberID=@staffMemberID and positionID=@PositionID)
begin 
insert into StaffPosition (StaffMemberID,PositionID) values (@StaffMemberID,@PositionID)
end
end
end



GO
/****** Object:  StoredProcedure [dbo].[AddNewStaffMember]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewUser]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AnnualReset]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[AuthenticateUser]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[deleteStaffMember]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetCenter]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetDashBoardLists]    Script Date: 4/18/2018 9:16:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE Procedure [dbo].[GetDashBoardLists] 
@StaffMemberID int =NULL
as
begin
SELECT     StaffMemberID,FirstName,LastName,Email,DateOfHire,Goal,MidYear,EndYear,GoalMet,TAndAApp,ClassCompleted,ClassPaid,RequiredHours,HoursEarned,TermDate,IsInactive,AppApp, 
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
/****** Object:  StoredProcedure [dbo].[GetEmptyCenters]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmptyEducations]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetEmptyPositions]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetSelectLists]    Script Date: 4/18/2018 9:16:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[GetSelectLists]  
as
begin
select c.Name as CenterName, c.County as CenterCounty, c.Region as CenterRegion,e.DegreeAbrv as EducationAbrv, e.DegreeLevel as EducationLevel, e.DegreeType as EducationType, e.DegreeDetail as EducationDetail, p.PositionTitle as Position, cert.CertName as CertCompleted
from Center as c
full outer join Education as e on c.CenterID=e.EducationID
full outer join Position as p on c.CenterID=p.PositionID
full outer join Certification as cert on c.CenterID=cert.CertificationID
end




GO
/****** Object:  StoredProcedure [dbo].[GetStaffMember]    Script Date: 4/18/2018 9:16:24 AM ******/
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
e.DegreeLevel, e.DegreeType, e.DegreeDetail, cc.CertInProgress, cc.CertCompletionDate as DateCompleted, cert.CertificationID, cert.CertName, cert.CertExpireAmount
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
/****** Object:  StoredProcedure [dbo].[RemovePosition]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[RemoveStaffEducation]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SeedDatabase]    Script Date: 4/18/2018 9:16:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Seeds Database with initial information


CREATE Procedure [dbo].[SeedDatabase]  
as
begin
-------------------------------- DCF Certs --------------------------------------------- 
If Not Exists (Select CertName from Certification where CertName like '%DCF Training 30 Day%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('DCF Training 30 Day','1')
END 

If Not Exists (Select CertName from Certification where CertName like '%DCF Training 60 Day%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('DCF Training 60 Day','2')
END

If Not Exists (Select CertName from Certification where CertName like '%DCF Training 90 Day%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('DCF Training 90 Day','3')
END 

If Not Exists (Select CertName from Certification where CertName like '%DCF Director Credential%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('DCF Director Credential','36')
END

If Not Exists (Select CertName from Certification where CertName like '%DCF Staff Credential%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('DCF Staff Credential','36')
END    
----------------------------------- CDA Certs-------------------------------------------
If Not Exists (Select CertName from Certification where CertName like '%CDA PreSchool%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('CDA PreSchool','36')
END 
 
If Not Exists (Select CertName from Certification where CertName like '%CDA Infant Toddler%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('CDA Infant Toddler','36')
END  

If Not Exists (Select CertName from Certification where CertName like '%Family Child Care%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('Family Child Care','36')
END
 
If Not Exists (Select CertName from Certification where CertName like '%Home Visitor%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('Home Visitor','36')
END  
----------------------------------- Class Certs -----------------------------------------
If Not Exists (Select CertName from Certification where CertName like '%Class Pre-K%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('Class Pre-K','12')
END 

If Not Exists (Select CertName from Certification where CertName like '%Class Infant Toddler%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('Class Infant Toddler','12')
END

If Not Exists (Select CertName from Certification where CertName like '%Class Toddler%')
BEGIN
Insert INTO Certification (CertName,CertExpireAmount) values('Class Toddler','12')
END

--------------------------------- Add Positions ----------------------------------------
If Not Exists (Select PositionTitle from Position where PositionTitle like '%Lead Teacher%')
BEGIN
Insert INTO Position (PositionTitle) values('Lead Teacher')
END

If Not Exists (Select PositionTitle from Position where PositionTitle like '%Center Manager%')
BEGIN
Insert INTO Position (PositionTitle) values('Center Manager')
END             
end


GO
/****** Object:  StoredProcedure [dbo].[SetSeedAccount]    Script Date: 4/18/2018 9:16:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Seeds the root account if it does not exist and if it does resets password to default 


CREATE Procedure [dbo].[SetSeedAccount]  
as
begin
If Not Exists (Select Email from ECSUser where Email like '%SeedAdmin@ecs4kids.org%')
BEGIN
Insert INTO ECSUser (Email,FirstName,LastName, AccessLevel, PasswordHash) values('SeedAdmin@ecs4kids.org','Seed','Admin',0,'$2b$10$K9i6CZOX4VBFdwASq8CZv.exP8PNa6HVDDMkvQr/zas1Lh2coztoi')
END
else
BEGIN
update ECSUser set Email= 'SeedAdmin@ecs4kids.org', FirstName= 'Seed', LastName ='Admin',AccessLevel=0,
PasswordHash='$2b$10$K9i6CZOX4VBFdwASq8CZv.exP8PNa6HVDDMkvQr/zas1Lh2coztoi' where Email like '%SeedAdmin@ecs4kids.org%'
END  
End 

GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateStaffMember]    Script Date: 4/18/2018 9:16:24 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 4/18/2018 9:16:24 AM ******/
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






