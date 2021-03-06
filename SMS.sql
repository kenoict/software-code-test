USE [master]
GO
/****** Object:  Database [SMS]    Script Date: 08/01/2021 5:21:24 pm ******/
CREATE DATABASE [SMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SMS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SMS] SET  MULTI_USER 
GO
ALTER DATABASE [SMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SMS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SMS] SET QUERY_STORE = OFF
GO
USE [SMS]
GO
/****** Object:  Table [dbo].[ClassInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](15) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_ClassInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassRoutine]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRoutine](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DayID] [int] NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NOT NULL,
	[SectionID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_ClassRoutine] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CurriculumDetails]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurriculumDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_CurriculumDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DayInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_DayInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NoticeInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NoticeInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Text] [nvarchar](1500) NOT NULL,
	[SectionID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
 CONSTRAINT [PK_NoticeInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[HalfYearly] [decimal](3, 2) NOT NULL,
	[Yearly] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_ResultInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nchar](2) NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[TimeEnd] [datetime] NOT NULL,
	[RoomNo] [nvarchar](15) NOT NULL,
	[ClassID] [int] NOT NULL,
	[Capacity] [int] NOT NULL,
 CONSTRAINT [PK_SectionInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[FatherName] [nvarchar](250) NOT NULL,
	[MotherName] [nvarchar](250) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[ContactNo] [decimal](11, 0) NOT NULL,
	[SectionID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
 CONSTRAINT [PK_StudentInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [int] NOT NULL,
 CONSTRAINT [PK_SubjectInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherInfo]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FatherName] [nvarchar](50) NOT NULL,
	[MotherName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[ContactNo] [decimal](11, 0) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Skills] [nvarchar](250) NOT NULL,
	[AssignSubID] [int] NOT NULL,
 CONSTRAINT [PK_TeacherInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCredential]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCredential](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[StudentID] [int] NULL,
	[TeacherID] [int] NULL,
 CONSTRAINT [PK_UserCredential_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 08/01/2021 5:21:25 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ClassInfo] ON 

INSERT [dbo].[ClassInfo] ([ID], [Title], [Year]) VALUES (1002, N'6', 2018)
INSERT [dbo].[ClassInfo] ([ID], [Title], [Year]) VALUES (1003, N'7', 2019)
INSERT [dbo].[ClassInfo] ([ID], [Title], [Year]) VALUES (1004, N'8', 2019)
INSERT [dbo].[ClassInfo] ([ID], [Title], [Year]) VALUES (1005, N'9', 2019)
INSERT [dbo].[ClassInfo] ([ID], [Title], [Year]) VALUES (1006, N'6', 2019)
INSERT [dbo].[ClassInfo] ([ID], [Title], [Year]) VALUES (1007, N'10', 2019)
SET IDENTITY_INSERT [dbo].[ClassInfo] OFF
SET IDENTITY_INSERT [dbo].[ClassRoutine] ON 

INSERT [dbo].[ClassRoutine] ([ID], [DayID], [TimeStart], [TimeEnd], [SectionID], [TeacherID], [SubjectID]) VALUES (3, 1, CAST(N'2019-05-01T20:21:00.000' AS DateTime), CAST(N'2019-05-01T13:21:00.000' AS DateTime), 3, 2, 4)
INSERT [dbo].[ClassRoutine] ([ID], [DayID], [TimeStart], [TimeEnd], [SectionID], [TeacherID], [SubjectID]) VALUES (5, 2, CAST(N'2019-05-02T11:03:00.000' AS DateTime), CAST(N'2019-05-02T12:03:00.000' AS DateTime), 8, 4, 3)
INSERT [dbo].[ClassRoutine] ([ID], [DayID], [TimeStart], [TimeEnd], [SectionID], [TeacherID], [SubjectID]) VALUES (6, 3, CAST(N'2019-05-02T12:03:00.000' AS DateTime), CAST(N'2019-05-02T13:03:00.000' AS DateTime), 8, 2, 4)
INSERT [dbo].[ClassRoutine] ([ID], [DayID], [TimeStart], [TimeEnd], [SectionID], [TeacherID], [SubjectID]) VALUES (7, 3, CAST(N'2019-05-02T10:03:00.000' AS DateTime), CAST(N'2019-05-02T11:03:00.000' AS DateTime), 8, 5, 2)
INSERT [dbo].[ClassRoutine] ([ID], [DayID], [TimeStart], [TimeEnd], [SectionID], [TeacherID], [SubjectID]) VALUES (8, 5, CAST(N'2019-05-02T11:03:00.000' AS DateTime), CAST(N'2019-05-02T12:03:00.000' AS DateTime), 8, 6, 1002)
INSERT [dbo].[ClassRoutine] ([ID], [DayID], [TimeStart], [TimeEnd], [SectionID], [TeacherID], [SubjectID]) VALUES (9, 4, CAST(N'2019-05-02T11:03:00.000' AS DateTime), CAST(N'2019-05-02T12:03:00.000' AS DateTime), 8, 4, 3)
INSERT [dbo].[ClassRoutine] ([ID], [DayID], [TimeStart], [TimeEnd], [SectionID], [TeacherID], [SubjectID]) VALUES (10, 2, CAST(N'2019-05-02T12:03:00.000' AS DateTime), CAST(N'2019-05-02T13:03:00.000' AS DateTime), 8, 5, 2)
SET IDENTITY_INSERT [dbo].[ClassRoutine] OFF
SET IDENTITY_INSERT [dbo].[CurriculumDetails] ON 

INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (7, 1002, 2)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (8, 1002, 4)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (9, 1002, 3)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (1004, 1003, 2)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (1005, 1003, 3)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (1006, 1003, 4)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (1007, 1003, 1002)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (1008, 1006, 2)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (1009, 1006, 3)
INSERT [dbo].[CurriculumDetails] ([ID], [ClassID], [SubjectID]) VALUES (1010, 1006, 4)
SET IDENTITY_INSERT [dbo].[CurriculumDetails] OFF
SET IDENTITY_INSERT [dbo].[DayInfo] ON 

INSERT [dbo].[DayInfo] ([ID], [Title]) VALUES (1, N'Saturday')
INSERT [dbo].[DayInfo] ([ID], [Title]) VALUES (2, N'Sunday')
INSERT [dbo].[DayInfo] ([ID], [Title]) VALUES (3, N'Monday')
INSERT [dbo].[DayInfo] ([ID], [Title]) VALUES (4, N'Tuesday')
INSERT [dbo].[DayInfo] ([ID], [Title]) VALUES (5, N'Wednesday')
INSERT [dbo].[DayInfo] ([ID], [Title]) VALUES (6, N'Thursday')
SET IDENTITY_INSERT [dbo].[DayInfo] OFF
SET IDENTITY_INSERT [dbo].[NoticeInfo] ON 

INSERT [dbo].[NoticeInfo] ([ID], [Title], [Text], [SectionID], [OwnerID]) VALUES (3, N'hi', N'congratulations', 3, 6)
INSERT [dbo].[NoticeInfo] ([ID], [Title], [Text], [SectionID], [OwnerID]) VALUES (4, N'Makeup class', N'test', 8, 15)
SET IDENTITY_INSERT [dbo].[NoticeInfo] OFF
SET IDENTITY_INSERT [dbo].[SectionInfo] ON 

INSERT [dbo].[SectionInfo] ([ID], [Title], [TimeStart], [TimeEnd], [RoomNo], [ClassID], [Capacity]) VALUES (3, N'A ', CAST(N'2019-04-30T08:00:00.000' AS DateTime), CAST(N'2019-04-30T11:00:00.000' AS DateTime), N'1101', 1002, 40)
INSERT [dbo].[SectionInfo] ([ID], [Title], [TimeStart], [TimeEnd], [RoomNo], [ClassID], [Capacity]) VALUES (4, N'B ', CAST(N'2019-04-30T08:00:00.000' AS DateTime), CAST(N'2019-04-30T11:00:00.000' AS DateTime), N'1102', 1002, 40)
INSERT [dbo].[SectionInfo] ([ID], [Title], [TimeStart], [TimeEnd], [RoomNo], [ClassID], [Capacity]) VALUES (5, N'A ', CAST(N'2019-05-01T08:00:00.000' AS DateTime), CAST(N'2019-05-01T12:00:00.000' AS DateTime), N'1104', 1003, 40)
INSERT [dbo].[SectionInfo] ([ID], [Title], [TimeStart], [TimeEnd], [RoomNo], [ClassID], [Capacity]) VALUES (6, N'B ', CAST(N'2019-05-02T10:30:00.000' AS DateTime), CAST(N'2019-05-02T13:33:00.000' AS DateTime), N'1102', 1006, 40)
INSERT [dbo].[SectionInfo] ([ID], [Title], [TimeStart], [TimeEnd], [RoomNo], [ClassID], [Capacity]) VALUES (7, N'A ', CAST(N'2019-05-02T09:57:00.000' AS DateTime), CAST(N'2019-05-02T10:57:00.000' AS DateTime), N'1235', 1006, 40)
INSERT [dbo].[SectionInfo] ([ID], [Title], [TimeStart], [TimeEnd], [RoomNo], [ClassID], [Capacity]) VALUES (8, N'B ', CAST(N'2019-05-02T11:02:00.000' AS DateTime), CAST(N'2019-05-02T12:02:00.000' AS DateTime), N'1234', 1003, 40)
SET IDENTITY_INSERT [dbo].[SectionInfo] OFF
SET IDENTITY_INSERT [dbo].[StudentInfo] ON 

INSERT [dbo].[StudentInfo] ([ID], [Name], [Address], [FatherName], [MotherName], [DateOfBirth], [ContactNo], [SectionID], [ClassID]) VALUES (6, N'deba', N'nazipur', N'sud', N'sab', CAST(N'2004-06-16' AS Date), CAST(1111111111 AS Decimal(11, 0)), 3, 1002)
INSERT [dbo].[StudentInfo] ([ID], [Name], [Address], [FatherName], [MotherName], [DateOfBirth], [ContactNo], [SectionID], [ClassID]) VALUES (9, N'pol', N'fsdfsd', N'dfsdf', N'dfdf', CAST(N'2004-06-16' AS Date), CAST(1111111111 AS Decimal(11, 0)), 4, 1002)
INSERT [dbo].[StudentInfo] ([ID], [Name], [Address], [FatherName], [MotherName], [DateOfBirth], [ContactNo], [SectionID], [ClassID]) VALUES (11, N'Habib', N'kuril', N'Rashidul', N'Nurunnaher', CAST(N'2004-06-16' AS Date), CAST(1739103140 AS Decimal(11, 0)), 5, 1003)
INSERT [dbo].[StudentInfo] ([ID], [Name], [Address], [FatherName], [MotherName], [DateOfBirth], [ContactNo], [SectionID], [ClassID]) VALUES (12, N'xyz', N'jkdjfks', N'kdfjdkfj', N'jdfkjd', CAST(N'2004-06-16' AS Date), CAST(1234567895 AS Decimal(11, 0)), 8, 1003)
SET IDENTITY_INSERT [dbo].[StudentInfo] OFF
SET IDENTITY_INSERT [dbo].[SubjectInfo] ON 

INSERT [dbo].[SubjectInfo] ([ID], [Name], [Code]) VALUES (2, N'Bangla', 111)
INSERT [dbo].[SubjectInfo] ([ID], [Name], [Code]) VALUES (3, N'English', 202)
INSERT [dbo].[SubjectInfo] ([ID], [Name], [Code]) VALUES (4, N'Math', 301)
INSERT [dbo].[SubjectInfo] ([ID], [Name], [Code]) VALUES (1002, N'General Science', 321)
SET IDENTITY_INSERT [dbo].[SubjectInfo] OFF
SET IDENTITY_INSERT [dbo].[TeacherInfo] ON 

INSERT [dbo].[TeacherInfo] ([ID], [Name], [FatherName], [MotherName], [Address], [ContactNo], [DateOfBirth], [Skills], [AssignSubID]) VALUES (2, N'Jahid', N'bbmjbcjb', N'hsbcbbschb', N'Dhaka', CAST(1222222222 AS Decimal(11, 0)), CAST(N'1990-05-29' AS Date), N'C#, Java', 4)
INSERT [dbo].[TeacherInfo] ([ID], [Name], [FatherName], [MotherName], [Address], [ContactNo], [DateOfBirth], [Skills], [AssignSubID]) VALUES (4, N'polok', N'xzy', N'fjdk', N'kdcks', CAST(1234567891 AS Decimal(11, 0)), CAST(N'1990-05-29' AS Date), N'BScSE', 3)
INSERT [dbo].[TeacherInfo] ([ID], [Name], [FatherName], [MotherName], [Address], [ContactNo], [DateOfBirth], [Skills], [AssignSubID]) VALUES (5, N'sujon', N'kndkf', N'kljdklf', N'kljvkdlv', CAST(1234569872 AS Decimal(11, 0)), CAST(N'1990-05-29' AS Date), N'ssc', 2)
INSERT [dbo].[TeacherInfo] ([ID], [Name], [FatherName], [MotherName], [Address], [ContactNo], [DateOfBirth], [Skills], [AssignSubID]) VALUES (6, N'onim', N'jdkfj', N'kfdjfgkdj', N'rkjdkf', CAST(1469871236 AS Decimal(11, 0)), CAST(N'1990-05-29' AS Date), N'hsc', 1002)
SET IDENTITY_INSERT [dbo].[TeacherInfo] OFF
SET IDENTITY_INSERT [dbo].[UserCredential] ON 

INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (1, N'deba', N'1234', 1, NULL, NULL)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (3, N'S-6', N'12345', 2, 6, NULL)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (4, N'S-9', N'12345', 2, 9, NULL)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (6, N'T-2', N'12345', 3, NULL, 2)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (9, N'S-11', N'12345', 2, 11, NULL)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (10, N'Habib', N'123456', 1, NULL, NULL)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (11, N'ahsan', N'1234', 1, NULL, NULL)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (12, N'sariful', N'1111', 1, NULL, NULL)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (13, N'T-4', N'12345', 3, NULL, 4)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (14, N'T-5', N'12345', 3, NULL, 5)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (15, N'T-6', N'12345', 3, NULL, 6)
INSERT [dbo].[UserCredential] ([ID], [Username], [Password], [UserTypeID], [StudentID], [TeacherID]) VALUES (16, N'S-12', N'12345', 2, 12, NULL)
SET IDENTITY_INSERT [dbo].[UserCredential] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Title]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([ID], [Title]) VALUES (2, N'Student')
INSERT [dbo].[UserType] ([ID], [Title]) VALUES (3, N'Teacher')
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[ResultInfo] ADD  CONSTRAINT [DF_ResultInfo_HalfYearly]  DEFAULT ((0)) FOR [HalfYearly]
GO
ALTER TABLE [dbo].[ResultInfo] ADD  CONSTRAINT [DF_ResultInfo_Yearly]  DEFAULT ((0)) FOR [Yearly]
GO
ALTER TABLE [dbo].[ClassRoutine]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoutine_DayInfo] FOREIGN KEY([DayID])
REFERENCES [dbo].[DayInfo] ([ID])
GO
ALTER TABLE [dbo].[ClassRoutine] CHECK CONSTRAINT [FK_ClassRoutine_DayInfo]
GO
ALTER TABLE [dbo].[ClassRoutine]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoutine_SectionInfo] FOREIGN KEY([SectionID])
REFERENCES [dbo].[SectionInfo] ([ID])
GO
ALTER TABLE [dbo].[ClassRoutine] CHECK CONSTRAINT [FK_ClassRoutine_SectionInfo]
GO
ALTER TABLE [dbo].[ClassRoutine]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoutine_SubjectInfo] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectInfo] ([ID])
GO
ALTER TABLE [dbo].[ClassRoutine] CHECK CONSTRAINT [FK_ClassRoutine_SubjectInfo]
GO
ALTER TABLE [dbo].[ClassRoutine]  WITH CHECK ADD  CONSTRAINT [FK_ClassRoutine_TeacherInfo] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TeacherInfo] ([ID])
GO
ALTER TABLE [dbo].[ClassRoutine] CHECK CONSTRAINT [FK_ClassRoutine_TeacherInfo]
GO
ALTER TABLE [dbo].[CurriculumDetails]  WITH CHECK ADD  CONSTRAINT [FK_CurriculumDetails_ClassInfo] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassInfo] ([ID])
GO
ALTER TABLE [dbo].[CurriculumDetails] CHECK CONSTRAINT [FK_CurriculumDetails_ClassInfo]
GO
ALTER TABLE [dbo].[CurriculumDetails]  WITH CHECK ADD  CONSTRAINT [FK_CurriculumDetails_SubjectInfo] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectInfo] ([ID])
GO
ALTER TABLE [dbo].[CurriculumDetails] CHECK CONSTRAINT [FK_CurriculumDetails_SubjectInfo]
GO
ALTER TABLE [dbo].[NoticeInfo]  WITH CHECK ADD  CONSTRAINT [FK_NoticeInfo_SectionInfo] FOREIGN KEY([SectionID])
REFERENCES [dbo].[SectionInfo] ([ID])
GO
ALTER TABLE [dbo].[NoticeInfo] CHECK CONSTRAINT [FK_NoticeInfo_SectionInfo]
GO
ALTER TABLE [dbo].[NoticeInfo]  WITH CHECK ADD  CONSTRAINT [FK_NoticeInfo_UserCredential] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[UserCredential] ([ID])
GO
ALTER TABLE [dbo].[NoticeInfo] CHECK CONSTRAINT [FK_NoticeInfo_UserCredential]
GO
ALTER TABLE [dbo].[ResultInfo]  WITH CHECK ADD  CONSTRAINT [FK_ResultInfo_CurriculumDetails] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectInfo] ([ID])
GO
ALTER TABLE [dbo].[ResultInfo] CHECK CONSTRAINT [FK_ResultInfo_CurriculumDetails]
GO
ALTER TABLE [dbo].[ResultInfo]  WITH CHECK ADD  CONSTRAINT [FK_ResultInfo_StudentInfo] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentInfo] ([ID])
GO
ALTER TABLE [dbo].[ResultInfo] CHECK CONSTRAINT [FK_ResultInfo_StudentInfo]
GO
ALTER TABLE [dbo].[SectionInfo]  WITH CHECK ADD  CONSTRAINT [FK_SectionInfo_ClassInfo] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassInfo] ([ID])
GO
ALTER TABLE [dbo].[SectionInfo] CHECK CONSTRAINT [FK_SectionInfo_ClassInfo]
GO
ALTER TABLE [dbo].[StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_StudentInfo_ClassInfo] FOREIGN KEY([ClassID])
REFERENCES [dbo].[ClassInfo] ([ID])
GO
ALTER TABLE [dbo].[StudentInfo] CHECK CONSTRAINT [FK_StudentInfo_ClassInfo]
GO
ALTER TABLE [dbo].[StudentInfo]  WITH CHECK ADD  CONSTRAINT [FK_StudentInfo_SectionInfo] FOREIGN KEY([SectionID])
REFERENCES [dbo].[SectionInfo] ([ID])
GO
ALTER TABLE [dbo].[StudentInfo] CHECK CONSTRAINT [FK_StudentInfo_SectionInfo]
GO
ALTER TABLE [dbo].[TeacherInfo]  WITH CHECK ADD  CONSTRAINT [FK_TeacherInfo_SubjectInfo] FOREIGN KEY([AssignSubID])
REFERENCES [dbo].[SubjectInfo] ([ID])
GO
ALTER TABLE [dbo].[TeacherInfo] CHECK CONSTRAINT [FK_TeacherInfo_SubjectInfo]
GO
ALTER TABLE [dbo].[UserCredential]  WITH CHECK ADD  CONSTRAINT [FK_UserCredential_StudentInfo] FOREIGN KEY([StudentID])
REFERENCES [dbo].[StudentInfo] ([ID])
GO
ALTER TABLE [dbo].[UserCredential] CHECK CONSTRAINT [FK_UserCredential_StudentInfo]
GO
ALTER TABLE [dbo].[UserCredential]  WITH CHECK ADD  CONSTRAINT [FK_UserCredential_TeacherInfo] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[TeacherInfo] ([ID])
GO
ALTER TABLE [dbo].[UserCredential] CHECK CONSTRAINT [FK_UserCredential_TeacherInfo]
GO
ALTER TABLE [dbo].[UserCredential]  WITH CHECK ADD  CONSTRAINT [FK_UserType_UserCredential] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([ID])
GO
ALTER TABLE [dbo].[UserCredential] CHECK CONSTRAINT [FK_UserType_UserCredential]
GO
USE [master]
GO
ALTER DATABASE [SMS] SET  READ_WRITE 
GO
