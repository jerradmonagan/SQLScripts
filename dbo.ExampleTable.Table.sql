USE [ESC2]
GO
/****** Object:  Table [dbo].[ExampleTable]    Script Date: 10/18/2017 8:49:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExampleTable](
	[ExampleModelID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [varchar](50) NOT NULL,
	[Lastname] [varchar](50) NOT NULL,
	[DoB] [date] NOT NULL,
	[DoesntExistInModel] [varchar](50) NULL,
 CONSTRAINT [PK_ExampleTable] PRIMARY KEY CLUSTERED 
(
	[ExampleModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
