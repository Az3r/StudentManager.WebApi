USE [master]
GO
DROP DATABASE IF EXISTS [StudentManager.Database]
/****** Object:  Database [StudentManager.Database]    Script Date: 8/5/2020 5:20:22 PM ******/
CREATE DATABASE [StudentManager.Database]
GO
USE [StudentManager.Database]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[Account](
	[PersonalInfoId] [char](7) NOT NULL,
	[Password] [varchar](64) NOT NULL,
	[IsActivated] [int] NOT NULL,
 CONSTRAINT [PK__Account__EA7BF0E441FF5BE7] PRIMARY KEY CLUSTERED 
(
	[PersonalInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[Class](
	[ClassId] [char](4) NOT NULL,
	[ClassName] [varchar](10) NOT NULL,
	[RoomId] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[ClassNotification]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[ClassNotification](
	[NotificationId] [int] NOT NULL IDENTITY(1, 1),
	[CreatedOn] [date] NOT NULL,
	[ClassId] [char](4) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Content] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[EnrolledClass]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[EnrolledClass](
	[StudentId] [char](7) NOT NULL,
	[ClassId] [char](4) NOT NULL,
	[AcademicYear] [int] NOT NULL,
 CONSTRAINT [PK_EnrolledClass] PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC,
	[AcademicYear] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Feedback]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [char](11) NOT NULL,
	[StudentId] [char](7) NOT NULL,
	[Semester] [int] NOT NULL,
	[AcademicYear] [int] NOT NULL,
	[Feedback] [nvarchar](100) NOT NULL,
	[Conduct] [char](1) NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
/****** Object:  Table [dbo].[HomeRoom]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[HomeRoom](
	[ClassId] [char](4) NOT NULL,
	[TeacherId] [char](7) NOT NULL,
	[AcademicYear] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonalInfo]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[PersonalInfo](
	[PersonalInfoId] [char](7) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[LastName] [nvarchar](10) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[MiddleName] [nvarchar](10) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [char](10) NOT NULL,
	[IsMale] [bit] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Photo] [varchar](max) NULL,
	[PersonTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonalInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonType]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[PersonType](
	[PersonTypeID] [int] NOT NULL,
	[PersonType] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[Room](
	[RoomId] [char](10) NOT NULL,
	[RoomName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Schedule]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[Schedule](
	[SessionId] [int] NOT NULL,
	[SubjectId] [int] NOT NULL,
	[TeacherId] [char](7) NOT NULL,
	[ClassId] [char](4) NOT NULL,
	[RoomId] [char](10) NOT NULL,
	[Semester] [int] NOT NULL,
	[AcademicYear] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId], [TeacherId], [ClassId], [Semester], [AcademicYear], [DayOfWeek]
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[SchoolRole]    Script Date: 8/5/2020 5:20:23 PM ******/
GO
CREATE TABLE [dbo].[SchoolRole](
	[RoleId] [char](10) NOT NULL,
	[RoleLevel] [int] NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[Score]    Script Date: 8/5/2020 5:20:23 PM ******/
CREATE TABLE [dbo].[Score](
	[SubjectId] [int] NOT NULL,
	[StudentId] [char](7) NOT NULL,
	[Semester] [int] NOT NULL,
	[AcademicYear] [int] NOT NULL,
	[ScoreType] [int] NOT NULL,
	[ScoreValue] [float] NOT NULL,
 CONSTRAINT [PK_Score] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC,
	[StudentId] ASC,
	[Semester] ASC,
	[AcademicYear] ASC,
	[ScoreType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO
/****** Object:  Table [dbo].[Session]    Script Date: 8/5/2020 5:20:23 PM ******/

GO

GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] NOT NULL,
	[BeginTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/5/2020 5:20:23 PM ******/

GO

GO

GO
CREATE TABLE [dbo].[Student](
	[StudentId] [char](7) NOT NULL,
	[PersonTypeID]  AS ((1)) PERSISTED NOT NULL,
	[IsGraduated] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 8/5/2020 5:20:23 PM ******/

GO

GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 8/5/2020 5:20:23 PM ******/

GO

GO

GO
CREATE TABLE [dbo].[Teacher](
	[TeacherId] [char](7) NOT NULL,
	[PersonTypeID]  AS ((2)) PERSISTED NOT NULL,
	[SubjectId] [int] NOT NULL,
	[RoleId] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO
INSERT [dbo].[Account] ([PersonalInfoId], [Password], [IsActivated]) VALUES (N'0000000', N'$2a$10$eRP0RbFLcsteChuydanxlOhGvTE0CGSD2fErdxDG696BtdeKQ0t6K', 1)
INSERT [dbo].[Account] ([PersonalInfoId], [Password], [IsActivated]) VALUES (N'1140713', N'$2a$10$AgqfxYtXwaAT1faGixCltexGr1vY1zot0ZIKD4ntrGxNtzBztEg/S', 1)
INSERT [dbo].[Class] ([ClassId], [ClassName], [RoomId]) VALUES (N'10A1', N'10A1', N'0000000004')
INSERT [dbo].[Class] ([ClassId], [ClassName], [RoomId]) VALUES (N'10A2', N'10A2', N'0000000005')
INSERT [dbo].[Class] ([ClassId], [ClassName], [RoomId]) VALUES (N'11A1', N'11A1', N'0000000006')
INSERT [dbo].[Class] ([ClassId], [ClassName], [RoomId]) VALUES (N'11A2', N'11A2', N'0000000007')
INSERT [dbo].[Class] ([ClassId], [ClassName], [RoomId]) VALUES (N'12A1', N'12A1', N'0000000008')
INSERT [dbo].[Class] ([ClassId], [ClassName], [RoomId]) VALUES (N'12A2', N'12A2', N'0000000009')
INSERT [dbo].[Class] ([ClassId], [ClassName], [RoomId]) VALUES (N'FULL', N'All class', N'0000000000')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0xB1400B00 AS Date), N'12A1', N'Thông báo học vụ', N'Học sinh nhanh chóng đóng tiền học phí học kì 2')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0xB1400B00 AS Date), N'12A2', N'Thông báo học vụ', N'Học sinh nhanh chóng thanh toán tiền học phí học kỳ 2')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0xD0400B00 AS Date), N'11A1', N'Thông báo thi', N'Lịch thi và danh sách thi trên moodle')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0xD0400B00 AS Date), N'12A1', N'Thông báo thi', N'Lịch thi và danh sách thi trên moodle')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0xD0400B00 AS Date), N'12A2', N'Thông báo thi', N'Lịch thi và danh sách thi đã được đăng')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0x1C410B00 AS Date), N'11A2', N'Thông báo thi', N'Lịch thi và danh sách thi đã được đăng')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0x14410B00 AS Date), N'12A1', N'Thông báo số 7', N'Để kỉ niệm ngày thành lập abc, nhà trường xin được thông báo cái xyz')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0x1C410B00 AS Date), N'12A1', N'Thông báo số 8', N'Để thành lập cái xyz, nhà trường xin thông báo cái abc')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0x1F410B00 AS Date), N'12A2', N'Thông báo số 9', N'Để abc cần xyz')
INSERT [dbo].[ClassNotification] ([CreatedOn], [ClassId], [Title], [Content]) VALUES (CAST(0x20410B00 AS Date), N'11A1', N'Thông báo số 10', N'Đây là thông báo số 10 cho lớp 11a1111111111111111111111111111111')
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140715', N'11A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140716', N'11A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140717', N'11A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140718', N'11A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140719', N'11A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140710', N'12A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140711', N'12A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140712', N'12A1', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140713', N'12A2', 2020)
INSERT [dbo].[EnrolledClass] ([StudentId], [ClassId], [AcademicYear]) VALUES (N'1140714', N'12A2', 2020)
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140715', N'1140715', 1, 2020, N'Thua, no comment', N'C')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140716', N'1140716', 1, 2020, N'Em học rất bình thường', N'A')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140717', N'1140717', 1, 2020, N'Em học rất tốt', N'A')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140718', N'1140718', 1, 2020, N'Học được, cần chú ý cách đi đứng', N'C')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140719', N'1140719', 1, 2020, N'Em học rất tốt', N'A')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140715', N'1140715', 2, 2020, N'Feedback test cho số 15', N'C')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140716', N'1140716', 2, 2020, N'Bé học dở', N'A')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140717', N'1140717', 2, 2020, N'Em học rất tốt', N'A')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140718', N'1140718', 2, 2020, N'Gia đình nên quan tâm nhiều hơn', N'C')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140719', N'1140719', 2, 2020, N'Nghịch ngầm', N'B')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140711', N'1140711', 1, 2020, N'Feed back test cho số 11 kỳ 1', N'D')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140712', N'1140712', 1, 2020, N'Feed back test cho số 12 kỳ 1', N'A')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140713', N'1140713', 1, 2020, N'Feed back test cho số 13 kỳ 1', N'C')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'01201140714', N'1140714', 1, 2020, N'Feed back test cho số 14 kỳ 1', N'B')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140711', N'1140711', 2, 2020, N'Feed back test cho số 11 kỳ 2', N'B')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140712', N'1140712', 2, 2020, N'Feed back test cho số 12 kỳ 2', N'C')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140713', N'1140713', 2, 2020, N'Feed back test cho số 13 kỳ 2', N'D')
INSERT [dbo].[Feedback] ([FeedbackId], [StudentId], [Semester], [AcademicYear], [Feedback], [Conduct]) VALUES (N'02201140714', N'1140714', 2, 2020, N'Feed back test cho số 14 kỳ 2', N'A')
INSERT [dbo].[HomeRoom] ([ClassId], [TeacherId], [AcademicYear]) VALUES (N'11A1', N'0000003', 2020)
INSERT [dbo].[HomeRoom] ([ClassId], [TeacherId], [AcademicYear]) VALUES (N'12A1', N'0000001', 2020)
INSERT [dbo].[HomeRoom] ([ClassId], [TeacherId], [AcademicYear]) VALUES (N'12A2', N'0000002', 2020)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000000', N'2/13 Thống Nhất, phường 16, quận Gò Vấp, Tp. HCM', N'Nguyễn', N'Đạo', N'Bá', N'nbdao@gmail.com', N'0923856621', 1, CAST(0x900A0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000001', N'Số 11, đường Hương Lam, Phường Tân Hưng, Quận 7, Tp. HCM', N'Lê', N'Em', N'Văn', N'lvem@gmail.com', N'0902000672', 1, CAST(0x1B190B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000002', N'399/1B, đường số 8, phường 11, quận Gò Vấp, TPHCM', N'Võ', N'Hường', N'Thị Thu', N'vtthuong@gmail.com', N'0902310063', 1, CAST(0xAE120B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000003', N'A50, Đường Số 14, Quận 7, Tp. HCM', N'Văn', N'G', N'Công', N'vcg@gmail.com', N'0902990059', 1, CAST(0x710F0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000004', N'55/6 Đường số 1, P. Tăng Nhơn Phú B, Q.9, TP.HCM', N'Võ', N'Hạnh', N'Văn', N'vvhanh@gmail.com', N'0902900031', 1, CAST(0x9B0A0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000005', N'132 Đường số 65, Tân Phong, Quận 7, Hồ Chí Minh', N'Nguyễn', N'Quân', N'Trung', N'ntquan@gmail.com', N'0381237125', 1, CAST(0x0A150B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000006', N'20, đường số 13, Sông Thao, Tx. Long Khánh,tỉnh Đồng Nai', N'Nguyễn', N'Én', N'Thị', N'nten@gmail.com', N'0381223315', 1, CAST(0xBC130B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000007', N'55/6 Đường số 1, P. Tăng Nhơn Phú B, Q.9, TP.HCM', N'Huỳnh', N'C', N'Thị', N'htc@gmail.com', N'0381231231', 1, CAST(0x0D1A0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000008', N'132 Đường số 65, Tân Phong, Quận 7, Hồ Chí Minh', N'Nguyễn', N'Lượng', N'Văn', N'nvluong@gmail.com', N'0323121211', 1, CAST(0x791C0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000009', N'20, đường số 13, Sông Thao, Tx. Long Khánh,tỉnh Đồng Nai', N'Lê', N'Duyên', N'Trương Mỹ', N'ltmduyen@gmail.com', N'0361251232', 1, CAST(0x961C0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000010', N'2/30, đường Phạm Văn Hai, Phường 13, Quận Tân Bình, Tp. HCM', N'Nguyễn', N'Vinh', N'Trí', N'ntvinh@gmail.com', N'0868459091', 1, CAST(0x5E230B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000011', N'Số 3, đường số 4, phường Linh Xuân, quận Thủ Đức', N'Nguyễn', N'D', N'Trần', N'ntd@gmail.com', N'0902220203', 1, CAST(0x1D1D0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000012', N'Số 11, Đường D1, Phường 25, Quận Bình Thạnh, Tp. HCM', N'Trần', N'Công', N'Văn', N'tvcong@gmail.com', N'0902350115', 1, CAST(0xCA1C0B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'0000013', N'21/70/07 Đường số 9, phường 16, quận Gò Vấp, Tp.HCM', N'Nguyễn', N'Văn', N'', N'nvan@gmail.com', N'0381237125', 1, CAST(0x11190B00 AS Date), NULL, 2)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140710', N'2/13 Thống Nhất, phường 16, quận Gò Vấp, Tp. HCM', N'Nguyễn', N'A', N'Văn', N'nvaaa@gmail.com', N'0123456789', 1, CAST(0x70280B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140711', N'21/70/07 Đường số 9, phường 16, quận Gò Vấp, Tp.HCM', N'Lê', N'Thị', N'', N'lthi@gmail.com', N'0213412312', 0, CAST(0xB3280B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140712', N'Số 11, Đường D1, Phường 25, Quận Bình Thạnh, Tp. HCM', N'Nguyễn', N'Mạnh', N'Đức', N'nmduc@gmail.com', N'0972712312', 1, CAST(0xB1290B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140713', N'Số 3, đường số 4, phường Linh Xuân, quận Thủ Đức', N'Nguyễn', N'An', N'Mạnh', N'nman@gmail.com', N'0987657788', 1, CAST(0x0F290B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140714', N'Số 11, đường Hương Lam, Phường Tân Hưng, Quận 7, Tp. HCM', N'Nguyễn', N'Nghi', N'Thị Minh', N'ntmnghi@gmail.com', N'0912317271', 0, CAST(0x33290B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140715', N'399/1B, đường số 8, phường 11, quận Gò Vấp, TPHCM', N'Hoàng', N'Hằng', N'Thúy', N'hthang@gmail.com', N'0123123412', 0, CAST(0xBD2A0B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140716', N'A50, Đường Số 14, Quận 7, Tp. HCM', N'Nguyễn', N'Tuấn', N'Quốc', N'nqtuan@gmail.com', N'0293123112', 1, CAST(0xDF290B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140717', N'55/6 Đường số 1, P. Tăng Nhơn Phú B, Q.9, TP.HCM', N'Lê', N'Tú', N'Anh', N'latu@gmail.com', N'0192931232', 0, CAST(0x002B0B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140718', N'132 Đường số 65, Tân Phong, Quận 7, Hồ Chí Minh', N'Trần', N'Sen', N'Thị Hồng', N'tthsen@gmail.com', N'0219239123', 0, CAST(0xC82A0B00 AS Date), NULL, 1)
INSERT [dbo].[PersonalInfo] ([PersonalInfoId], [Address], [LastName], [FirstName], [MiddleName], [Email], [PhoneNumber], [IsMale], [Birthday], [Photo], [PersonTypeID]) VALUES (N'1140719', N'20, đường số 13, Sông Thao, Tx. Long Khánh,tỉnh Đồng Nai', N'Nguyễn', N'Trí', N'', N'ntri@gmail.com', N'0219301231', 1, CAST(0x842A0B00 AS Date), NULL, 1)
INSERT [dbo].[PersonType] ([PersonTypeID], [PersonType]) VALUES (1, N'Student')
INSERT [dbo].[PersonType] ([PersonTypeID], [PersonType]) VALUES (2, N'Teacher')
INSERT [dbo].[PersonType] ([PersonTypeID], [PersonType]) VALUES (3, N'Parent')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000000', N'All')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000001', N'A001')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000002', N'A002')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000003', N'A003')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000004', N'A004')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000005', N'A100')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000006', N'A101')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000007', N'A102')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000008', N'A103')
INSERT [dbo].[Room] ([RoomId], [RoomName]) VALUES (N'0000000009', N'A104')
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 1, N'0000000', N'11A1', N'0000000005', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 1, N'0000000', N'11A1', N'0000000005', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 7, N'0000007', N'11A1', N'0000000005', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 7, N'0000007', N'11A1', N'0000000005', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 6, N'0000012', N'11A1', N'0000000005', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 1, N'0000001', N'11A1', N'0000000005', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 3, N'0000003', N'11A1', N'0000000005', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 4, N'0000011', N'11A1', N'0000000005', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 2, N'0000002', N'11A1', N'0000000005', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 2, N'0000002', N'11A1', N'0000000005', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 6, N'0000012', N'11A1', N'0000000005', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 6, N'0000012', N'11A1', N'0000000005', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 1, N'0000001', N'11A1', N'0000000005', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 1, N'0000001', N'11A1', N'0000000005', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 3, N'0000003', N'11A1', N'0000000005', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 4, N'0000011', N'11A1', N'0000000005', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 6, N'0000012', N'11A1', N'0000000005', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 7, N'0000007', N'11A1', N'0000000005', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 1, N'0000001', N'11A1', N'0000000005', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 1, N'0000001', N'11A1', N'0000000005', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (6, 9, N'0000009', N'11A1', N'0000000005', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (7, 6, N'0000012', N'11A1', N'0000000005', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 7, N'0000007', N'12A1', N'0000000002', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 7, N'0000007', N'12A1', N'0000000002', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 8, N'0000008', N'12A1', N'0000000002', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 8, N'0000008', N'12A1', N'0000000002', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 8, N'0000008', N'12A1', N'0000000002', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 6, N'0000006', N'12A1', N'0000000002', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 6, N'0000006', N'12A1', N'0000000002', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 5, N'0000005', N'12A1', N'0000000002', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 5, N'0000005', N'12A1', N'0000000002', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 5, N'0000005', N'12A1', N'0000000002', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 8, N'0000008', N'12A1', N'0000000002', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 1, N'0000000', N'12A1', N'0000000002', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 1, N'0000000', N'12A1', N'0000000002', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 1, N'0000000', N'12A1', N'0000000002', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 1, N'0000000', N'12A1', N'0000000002', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 4, N'0000004', N'12A1', N'0000000002', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 3, N'0000003', N'12A1', N'0000000002', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 3, N'0000003', N'12A1', N'0000000002', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 2, N'0000002', N'12A1', N'0000000002', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 2, N'0000002', N'12A1', N'0000000002', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (7, 9, N'0000009', N'12A1', N'0000000002', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (8, 9, N'0000009', N'12A1', N'0000000002', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 1, N'0000001', N'12A2', N'0000000004', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 1, N'0000001', N'12A2', N'0000000004', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 1, N'0000001', N'12A2', N'0000000004', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 1, N'0000001', N'12A2', N'0000000004', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 6, N'0000006', N'12A2', N'0000000004', 1, 2020, 2)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 2, N'0000002', N'12A2', N'0000000004', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 2, N'0000002', N'12A2', N'0000000004', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 3, N'0000003', N'12A2', N'0000000004', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 3, N'0000003', N'12A2', N'0000000004', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 4, N'0000004', N'12A2', N'0000000004', 1, 2020, 3)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 7, N'0000007', N'12A2', N'0000000004', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 7, N'0000007', N'12A2', N'0000000004', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 7, N'0000007', N'12A2', N'0000000004', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 7, N'0000007', N'12A2', N'0000000004', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 7, N'0000007', N'12A2', N'0000000004', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (1, 5, N'0000005', N'12A2', N'0000000004', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (2, 5, N'0000005', N'12A2', N'0000000004', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (3, 5, N'0000005', N'12A2', N'0000000004', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (4, 6, N'0000006', N'12A2', N'0000000004', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (5, 6, N'0000006', N'12A2', N'0000000004', 1, 2020, 4)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (6, 9, N'0000009', N'12A2', N'0000000004', 1, 2020, 5)
INSERT [dbo].[Schedule] ([SessionId], [SubjectId], [TeacherId], [ClassId], [RoomId], [Semester], [AcademicYear], [DayOfWeek]) VALUES (7, 9, N'0000009', N'12A2', N'0000000004', 1, 2020, 5)
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'0000000000', 0, N'Hiệu trưởng')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'1000000001', 1, N'Phó hiệu trưởng 1')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'1000000002', 1, N'Phó hiệu trưởng 2')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'2000000001', 2, N'Tổng phụ trác')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'2000000002', 2, N'Bí thư đoàn')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'2000000003', 2, N'Phó bí thư đoàn')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'3000000001', 3, N'Thư viện trưởng')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'3000000002', 6, N'Cộng tác viên')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'4000000001', 4, N'Trưởng bộ môn')
INSERT [dbo].[SchoolRole] ([RoleId], [RoleLevel], [RoleName]) VALUES (N'5000000001', 5, N'Giáo viên bộ môn')
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 1, 2020, 4, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 1, 2020, 6, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 2, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 2, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 2, 2020, 5, 7.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140711', 2, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 1, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 1, 2020, 2, 8.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 1, 2020, 6, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 2, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 2, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 2, 2020, 5, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140712', 2, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 1, 2020, 2, 7.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 1, 2020, 3, 8.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 1, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 1, 2020, 5, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 1, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 2, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 2, 2020, 3, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 2, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 2, 2020, 5, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140713', 2, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 1, 2020, 1, 6.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 1, 2020, 2, 9.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 1, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 1, 2020, 6, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 2, 2020, 1, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 2, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 2, 2020, 5, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140714', 2, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 1, 2020, 1, 5.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 1, 2020, 2, 4.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 1, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 1, 2020, 4, 9.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 1, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 2, 2020, 1, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 2, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 2, 2020, 4, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 2, 2020, 5, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140715', 2, 2020, 6, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 1, 2020, 2, 5.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 1, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 1, 2020, 6, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 2, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 2, 2020, 2, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 2, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 2, 2020, 5, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140716', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 1, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 1, 2020, 2, 6.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 1, 2020, 4, 5.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 1, 2020, 5, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 1, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 2, 2020, 1, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 2, 2020, 5, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140717', 2, 2020, 6, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 1, 2020, 1, 4.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 1, 2020, 2, 3.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 1, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 1, 2020, 5, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 1, 2020, 6, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 2, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 2, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 2, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 2, 2020, 5, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140718', 2, 2020, 6, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 1, 2020, 2, 4.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 1, 2020, 4, 3)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 1, 2020, 5, 3.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 2, 2020, 1, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 2, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 2, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 2, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 2, 2020, 5, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (1, N'1140719', 2, 2020, 6, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 1, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 1, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 2, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 2, 2020, 5, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140711', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 1, 2020, 2, 9.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 1, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 1, 2020, 5, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 2, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140712', 2, 2020, 6, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 1, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 1, 2020, 2, 7.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 1, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 1, 2020, 5, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 1, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 2, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 2, 2020, 5, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140713', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 1, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 1, 2020, 2, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 1, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 1, 2020, 5, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 1, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 2, 2020, 1, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 2, 2020, 4, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140714', 2, 2020, 6, 9.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 1, 2020, 2, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 1, 2020, 5, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 1, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 2, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 2, 2020, 3, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140715', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 1, 2020, 2, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 1, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 1, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 1, 2020, 5, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 1, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 2, 2020, 2, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 2, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 2, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 2, 2020, 5, 6.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140716', 2, 2020, 6, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 1, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 1, 2020, 2, 3.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 1, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 1, 2020, 5, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 1, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 2, 2020, 3, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 2, 2020, 5, 7.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140717', 2, 2020, 6, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 1, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 1, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 1, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 1, 2020, 5, 4.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 1, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 2, 2020, 1, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 2, 2020, 2, 5)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 2, 2020, 5, 5.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140718', 2, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 1, 2020, 1, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 1, 2020, 2, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 1, 2020, 4, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 1, 2020, 5, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 1, 2020, 6, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 2, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 2, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 2, 2020, 4, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 2, 2020, 5, 5.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (2, N'1140719', 2, 2020, 6, 3.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 1, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 1, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 2, 2020, 1, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 2, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 2, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140711', 2, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 1, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 1, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 1, 2020, 6, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 2, 2020, 1, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 2, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140712', 2, 2020, 6, 6.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 1, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 1, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 2, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 2, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140713', 2, 2020, 6, 9.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 1, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 1, 2020, 4, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 1, 2020, 6, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 2, 2020, 1, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 2, 2020, 4, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140714', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 1, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 1, 2020, 2, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 1, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 1, 2020, 4, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 1, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 2, 2020, 1, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 2, 2020, 4, 9.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140715', 2, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 1, 2020, 5, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 1, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 2, 2020, 1, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 2, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 2, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 2, 2020, 5, 3.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140716', 2, 2020, 6, 5.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 1, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 1, 2020, 4, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 1, 2020, 5, 4.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 1, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 2, 2020, 1, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 2, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 2, 2020, 4, 8.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 2, 2020, 5, 6.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140717', 2, 2020, 6, 6.6)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 1, 2020, 1, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 1, 2020, 2, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 1, 2020, 3, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 1, 2020, 4, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 1, 2020, 5, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 1, 2020, 6, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 2, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 2, 2020, 2, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 2, 2020, 3, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 2, 2020, 4, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 2, 2020, 5, 3.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140718', 2, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 1, 2020, 2, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 1, 2020, 4, 5.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 1, 2020, 5, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 1, 2020, 6, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 2, 2020, 1, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 2, 2020, 3, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 2, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 2, 2020, 5, 3.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (3, N'1140719', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 1, 2020, 4, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 1, 2020, 6, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 2, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 2, 2020, 4, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140711', 2, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 1, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 1, 2020, 4, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 1, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140712', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 1, 2020, 1, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 1, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 1, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 2, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 2, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 2, 2020, 4, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140713', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 1, 2020, 1, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 1, 2020, 4, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 1, 2020, 6, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 2, 2020, 2, 10)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 2, 2020, 4, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140714', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 1, 2020, 3, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 1, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 1, 2020, 5, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 1, 2020, 6, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 2, 2020, 1, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 2, 2020, 5, 5.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140715', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 1, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 1, 2020, 2, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 1, 2020, 3, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 1, 2020, 4, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 1, 2020, 5, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 1, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 2, 2020, 2, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 2, 2020, 4, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 2, 2020, 5, 5.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140716', 2, 2020, 6, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 1, 2020, 1, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 1, 2020, 4, 9.5)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 1, 2020, 5, 4.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 1, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 2, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 2, 2020, 5, 4.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140717', 2, 2020, 6, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 1, 2020, 1, 3.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 1, 2020, 2, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 1, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 1, 2020, 4, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 1, 2020, 6, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 2, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 2, 2020, 5, 5.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140718', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 1, 2020, 1, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 1, 2020, 2, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 1, 2020, 4, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 1, 2020, 5, 3.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 1, 2020, 6, 6.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 2, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 2, 2020, 4, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (4, N'1140719', 2, 2020, 6, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 1, 2020, 4, 5.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 1, 2020, 6, 6.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 2, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 2, 2020, 3, 7.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 2, 2020, 4, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140711', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 1, 2020, 1, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 1, 2020, 4, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 1, 2020, 6, 6.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 2, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 2, 2020, 3, 9.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140712', 2, 2020, 6, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 1, 2020, 1, 9.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 1, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 1, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 2, 2020, 3, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 2, 2020, 4, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140713', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 1, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 1, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 2, 2020, 1, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 2, 2020, 2, 10)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 2, 2020, 3, 8.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 2, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140714', 2, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 1, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 1, 2020, 5, 4.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 1, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 2, 2020, 2, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 2, 2020, 3, 6.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 2, 2020, 4, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 2, 2020, 5, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140715', 2, 2020, 6, 9.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 1, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 1, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 1, 2020, 3, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 1, 2020, 4, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 1, 2020, 6, 7.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 2, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 2, 2020, 2, 4)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 2, 2020, 3, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 2, 2020, 5, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140716', 2, 2020, 6, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 1, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 1, 2020, 2, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 1, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 1, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 1, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 2, 2020, 1, 6.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 2, 2020, 3, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 2, 2020, 4, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 2, 2020, 5, 6.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140717', 2, 2020, 6, 5.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 1, 2020, 1, 9.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 1, 2020, 2, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 1, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 1, 2020, 6, 7.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 2, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 2, 2020, 3, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 2, 2020, 4, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 2, 2020, 5, 4.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140718', 2, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 1, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 1, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 1, 2020, 5, 3.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 1, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 2, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 2, 2020, 3, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 2, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 2, 2020, 5, 3.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (5, N'1140719', 2, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 1, 2020, 2, 7.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 1, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 1, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 2, 2020, 1, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 2, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140711', 2, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 1, 2020, 2, 9.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 1, 2020, 6, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 2, 2020, 1, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 2, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 2, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140712', 2, 2020, 6, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 1, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 1, 2020, 2, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 1, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 2, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 2, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140713', 2, 2020, 6, 5.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 1, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 1, 2020, 2, 5.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 1, 2020, 4, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 1, 2020, 6, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 2, 2020, 1, 9.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 2, 2020, 2, 10)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 2, 2020, 4, 7.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 2, 2020, 5, 6.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140714', 2, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 1, 2020, 1, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 1, 2020, 2, 8.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 1, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 1, 2020, 6, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 2, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 2, 2020, 3, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140715', 2, 2020, 6, 5.4)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 1, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 1, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 2, 2020, 1, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 2, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 2, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 2, 2020, 5, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140716', 2, 2020, 6, 6.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 1, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 1, 2020, 2, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 1, 2020, 3, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 1, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 1, 2020, 5, 4.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 1, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 2, 2020, 1, 5.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 2, 2020, 3, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 2, 2020, 4, 8.1)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 2, 2020, 5, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140717', 2, 2020, 6, 8.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 1, 2020, 2, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 1, 2020, 5, 5.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 1, 2020, 6, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 2, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 2, 2020, 4, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 2, 2020, 5, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140718', 2, 2020, 6, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 1, 2020, 1, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 1, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 1, 2020, 4, 6.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 1, 2020, 5, 6.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 1, 2020, 6, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 2, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 2, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 2, 2020, 4, 5.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 2, 2020, 5, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (6, N'1140719', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 1, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 2, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 2, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 2, 2020, 5, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140711', 2, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 1, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 2, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140712', 2, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 1, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 1, 2020, 6, 6.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 2, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140713', 2, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 1, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 1, 2020, 6, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 2, 2020, 1, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 2, 2020, 5, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140714', 2, 2020, 6, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 1, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 1, 2020, 4, 8)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 1, 2020, 5, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 1, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 2, 2020, 4, 5.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 2, 2020, 5, 5.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140715', 2, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 1, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 1, 2020, 2, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 1, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 1, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 1, 2020, 5, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 2, 2020, 2, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 2, 2020, 3, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 2, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 2, 2020, 5, 5.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140716', 2, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 1, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 1, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 1, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 1, 2020, 5, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 1, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 2, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 2, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 2, 2020, 3, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 2, 2020, 4, 9.2)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 2, 2020, 5, 4.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140717', 2, 2020, 6, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 1, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 1, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 1, 2020, 5, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 1, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 2, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 2, 2020, 3, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 2, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 2, 2020, 5, 3.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140718', 2, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 1, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 1, 2020, 5, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 1, 2020, 6, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 2, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 2, 2020, 2, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 2, 2020, 3, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 2, 2020, 4, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (7, N'1140719', 2, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 1, 2020, 4, 7.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 1, 2020, 6, 6.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 2, 2020, 1, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 2, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 2, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140711', 2, 2020, 6, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 1, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 1, 2020, 4, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 1, 2020, 6, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 2, 2020, 1, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 2, 2020, 4, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140712', 2, 2020, 6, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 1, 2020, 1, 7.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 1, 2020, 2, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 1, 2020, 4, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 1, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 2, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140713', 2, 2020, 6, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 1, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 1, 2020, 4, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 1, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 2, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 2, 2020, 2, 10)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 2, 2020, 3, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 2, 2020, 4, 5.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 2, 2020, 5, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140714', 2, 2020, 6, 7.9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 1, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 1, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 1, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 1, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 1, 2020, 5, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 2, 2020, 5, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140715', 2, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 1, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 1, 2020, 2, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 1, 2020, 3, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 1, 2020, 4, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 1, 2020, 5, 3.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 1, 2020, 6, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 2, 2020, 1, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 2, 2020, 2, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 2, 2020, 4, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 2, 2020, 5, 3.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140716', 2, 2020, 6, 4.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 1, 2020, 2, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 1, 2020, 3, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 1, 2020, 4, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 1, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 2, 2020, 1, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 2, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 2, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 2, 2020, 5, 4.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140717', 2, 2020, 6, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 1, 2020, 1, 8.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 1, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 1, 2020, 3, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 1, 2020, 4, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 1, 2020, 6, 6.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 2, 2020, 1, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 2, 2020, 2, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 2, 2020, 3, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 2, 2020, 4, 3.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 2, 2020, 5, 3.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140718', 2, 2020, 6, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 1, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 1, 2020, 3, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 1, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 1, 2020, 5, 5.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 1, 2020, 6, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 2, 2020, 1, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 2, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 2, 2020, 4, 6.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 2, 2020, 5, 4.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (8, N'1140719', 2, 2020, 6, 9.9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 1, 2020, 1, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 1, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 1, 2020, 5, 7.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 1, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 2, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 2, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 2, 2020, 4, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 2, 2020, 5, 9.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140711', 2, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 1, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 1, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 1, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 1, 2020, 5, 9.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 2, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 2, 2020, 2, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 2, 2020, 3, 7.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 2, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 2, 2020, 5, 7.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140712', 2, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 1, 2020, 6, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 2, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 2, 2020, 2, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 2, 2020, 3, 8.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 2, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 2, 2020, 5, 8.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140713', 2, 2020, 6, 9)
GO
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 1, 2020, 1, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 1, 2020, 3, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 1, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 1, 2020, 5, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 1, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 2, 2020, 1, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 2, 2020, 2, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 2, 2020, 3, 6.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 2, 2020, 4, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 2, 2020, 5, 9.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140714', 2, 2020, 6, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 1, 2020, 1, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 1, 2020, 4, 6.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 1, 2020, 5, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 1, 2020, 6, 6.4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 2, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 2, 2020, 2, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 2, 2020, 3, 4.8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 2, 2020, 4, 8.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 2, 2020, 5, 5.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140715', 2, 2020, 6, 7.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 1, 2020, 1, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 1, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 1, 2020, 5, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 1, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 2, 2020, 1, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 2, 2020, 2, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 2, 2020, 3, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 2, 2020, 4, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 2, 2020, 5, 8.7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140716', 2, 2020, 6, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 1, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 1, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 1, 2020, 3, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 1, 2020, 4, 9.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 1, 2020, 5, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 2, 2020, 1, 8.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 2, 2020, 2, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 2, 2020, 3, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 2, 2020, 4, 6.3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 2, 2020, 5, 6.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140717', 2, 2020, 6, 9.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 1, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 1, 2020, 2, 3.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 1, 2020, 3, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 1, 2020, 4, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 1, 2020, 5, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 1, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 2, 2020, 1, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 2, 2020, 2, 4.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 2, 2020, 3, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 2, 2020, 4, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 2, 2020, 5, 3.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140718', 2, 2020, 6, 6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 1, 2020, 1, 8)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 1, 2020, 2, 8.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 1, 2020, 3, 5.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 1, 2020, 4, 5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 1, 2020, 5, 3)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 1, 2020, 6, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 2, 2020, 1, 9)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 2, 2020, 2, 7.5)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 2, 2020, 3, 4)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 2, 2020, 4, 7)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 2, 2020, 5, 4.6)
INSERT [dbo].[Score] ([SubjectId], [StudentId], [Semester], [AcademicYear], [ScoreType], [ScoreValue]) VALUES (9, N'1140719', 2, 2020, 6, 6)
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (1, CAST(0x0700D85EAC3A0000 AS Time), CAST(0x070026B2F5400000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (2, CAST(0x07008482A8410000 AS Time), CAST(0x0700D2D5F1470000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (3, CAST(0x0700A8E76F4B0000 AS Time), CAST(0x0700F63AB9510000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (4, CAST(0x0700540B6C520000 AS Time), CAST(0x0700A25EB5580000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (5, CAST(0x0700002F68590000 AS Time), CAST(0x07004E82B15F0000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (6, CAST(0x07002E88DE6A0000 AS Time), CAST(0x07007CDB27710000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (7, CAST(0x0700DAABDA710000 AS Time), CAST(0x070028FF23780000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (8, CAST(0x0700FE10A27B0000 AS Time), CAST(0x07004C64EB810000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (9, CAST(0x0700AA349E820000 AS Time), CAST(0x0700F887E7880000 AS Time))
INSERT [dbo].[Session] ([SessionId], [BeginTime], [EndTime]) VALUES (10, CAST(0x070056589A890000 AS Time), CAST(0x0700A4ABE38F0000 AS Time))

INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140710', 1)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140711', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140712', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140713', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140714', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140715', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140716', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140717', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140718', 0)
INSERT [dbo].[Student] ([StudentId], [IsGraduated]) VALUES (N'1140719', 0)
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (8, N'Đạo đức')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (6, N'Địa lý')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (3, N'Hóa học')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (4, N'Sinh học')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (5, N'Sử')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (9, N'Thể dục')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (1, N'Toán')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (7, N'Văn')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (2, N'Vật lý')
SET IDENTITY_INSERT [dbo].[Subject] OFF

INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000000', 1, N'0000000000')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000001', 1, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000002', 2, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000003', 3, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000004', 4, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000005', 5, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000006', 6, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000007', 7, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000008', 8, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000009', 9, N'4000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000010', 7, N'2000000003')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000011', 4, N'2000000002')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000012', 6, N'2000000001')
INSERT [dbo].[Teacher] ([TeacherId], [SubjectId], [RoleId]) VALUES (N'0000013', 3, N'1000000001')



GO
/****** Object:  Index [People_AltPK]    Script Date: 8/5/2020 5:20:23 PM ******/
ALTER TABLE [dbo].[PersonalInfo] ADD  CONSTRAINT [People_AltPK] UNIQUE NONCLUSTERED 
(
	[PersonalInfoId] ASC,
	[PersonTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


GO
/****** Object:  Index [UQ__Room__6B500B55DAB96D48]    Script Date: 8/5/2020 5:20:23 PM ******/
ALTER TABLE [dbo].[Room] ADD UNIQUE NONCLUSTERED 
(
	[RoomName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


GO
/****** Object:  Index [UK_SubjectName]    Script Date: 8/5/2020 5:20:23 PM ******/
ALTER TABLE [dbo].[Subject] ADD  CONSTRAINT [UK_SubjectName] UNIQUE NONCLUSTERED 
(
	[SubjectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF__Account__IsActiv__5CD6CB2B]  DEFAULT ((1)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[ClassNotification] ADD  DEFAULT ('') FOR [Title]
GO
ALTER TABLE [dbo].[ClassNotification] ADD  DEFAULT ('') FOR [Content]
GO
ALTER TABLE [dbo].[PersonalInfo] ADD  DEFAULT ((0)) FOR [IsMale]
GO
ALTER TABLE [dbo].[Score] ADD  DEFAULT ((-1)) FOR [ScoreValue]
GO
ALTER TABLE [dbo].[Student] ADD  DEFAULT ((0)) FOR [IsGraduated]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_personalinfoid] FOREIGN KEY([PersonalInfoId])
REFERENCES [dbo].[PersonalInfo] ([PersonalInfoId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_personalinfoid]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_Room]
GO
ALTER TABLE [dbo].[ClassNotification]  WITH CHECK ADD  CONSTRAINT [FK_ClassNotification_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassNotification] CHECK CONSTRAINT [FK_ClassNotification_Class]
GO
ALTER TABLE [dbo].[EnrolledClass]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledClass_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnrolledClass] CHECK CONSTRAINT [FK_EnrolledClass_Class]
GO
ALTER TABLE [dbo].[EnrolledClass]  WITH CHECK ADD  CONSTRAINT [FK_EnrolledClass_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnrolledClass] CHECK CONSTRAINT [FK_EnrolledClass_Student]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Student]
GO
ALTER TABLE [dbo].[HomeRoom]  WITH CHECK ADD  CONSTRAINT [FK_HomeRoom_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HomeRoom] CHECK CONSTRAINT [FK_HomeRoom_Class]
GO
ALTER TABLE [dbo].[HomeRoom]  WITH CHECK ADD  CONSTRAINT [FK_HomeRoom_Teacher] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teacher] ([TeacherId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HomeRoom] CHECK CONSTRAINT [FK_HomeRoom_Teacher]
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD FOREIGN KEY([PersonTypeID])
REFERENCES [dbo].[PersonType] ([PersonTypeID])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_SubjectSchedule_Class] FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([ClassId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_SubjectSchedule_Class]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_SubjectSchedule_Session] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_SubjectSchedule_Session]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_SubjectSchedule_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_SubjectSchedule_Subject]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Student]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [FK_Score_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [FK_Score_Subject]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([StudentId], [PersonTypeID])
REFERENCES [dbo].[PersonalInfo] ([PersonalInfoId], [PersonTypeID])
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD FOREIGN KEY([TeacherId], [PersonTypeID])
REFERENCES [dbo].[PersonalInfo] ([PersonalInfoId], [PersonTypeID])
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_SchoolRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[SchoolRole] ([RoleId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_SchoolRole]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([SubjectId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Subject]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [CK_Feedback_FeedbackID] CHECK  ((isnumeric([FeedbackId])=(1)))
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [CK_Feedback_FeedbackID]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [CK_Feedback_HocKi] CHECK  (([Semester]>=(1) AND [Semester]<=(2)))
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [CK_Feedback_HocKi]
GO
ALTER TABLE [dbo].[PersonalInfo]  WITH CHECK ADD  CONSTRAINT [CK_PersonalInfo_Email] CHECK  ((charindex('@gmail.com',[Email])>(0)))
GO
ALTER TABLE [dbo].[PersonalInfo] CHECK CONSTRAINT [CK_PersonalInfo_Email]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [CK_Score_Diem] CHECK  (([ScoreValue]>=(-1) AND [ScoreValue]<=(10)))
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [CK_Score_Diem]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD  CONSTRAINT [CK_Score_HocKi] CHECK  (([Semester]>=(1) AND [Semester]<=(2)))
GO
ALTER TABLE [dbo].[Score] CHECK CONSTRAINT [CK_Score_HocKi]
GO
USE [master]
GO
ALTER DATABASE [StudentManager.Database] SET  READ_WRITE 
GO
