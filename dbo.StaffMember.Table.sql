USE [ESC2]
GO
/****** Object:  Table [dbo].[StaffMember]    Script Date: 10/18/2017 8:49:28 AM ******/
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
	[CDAType] [nchar](10) NULL,
	[CDAExpiration] [date] NULL,
	[CDARenewalProcess] [nchar](10) NULL,
	[Degree] [nchar](10) NULL,
	[Comments] [nchar](10) NULL,
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
PRIMARY KEY CLUSTERED 
(
	[StaffMemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
ALTER TABLE [dbo].[StaffMember]  WITH CHECK ADD  CONSTRAINT [FK_StaffMember_Center] FOREIGN KEY([CenterID])
REFERENCES [dbo].[Center] ([CenterID])
GO
ALTER TABLE [dbo].[StaffMember] CHECK CONSTRAINT [FK_StaffMember_Center]
GO
