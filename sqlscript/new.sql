USE [Vuz]
GO
/****** Object:  Table [dbo].[Abiturient]    Script Date: 29.05.2024 13:04:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abiturient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](150) NOT NULL,
	[GenderName] [nvarchar](50) NOT NULL,
	[Nationality] [nchar](32) NULL,
	[BirthDate] [date] NULL,
	[BirthPlace] [nchar](50) NULL,
	[RegistrationtAddress] [nchar](120) NULL,
	[ActualAddress] [nchar](120) NULL,
	[Education] [nchar](999) NULL,
	[Familia] [nchar](100) NULL,
	[Imya] [nchar](100) NULL,
	[Otch] [nchar](100) NULL,
	[FatherFio] [nchar](100) NULL,
	[FatherJobPlace] [nchar](100) NULL,
	[FatherJobPosition] [nchar](30) NULL,
	[MotherFio] [nchar](100) NULL,
	[MotherJobPlace] [nchar](100) NULL,
	[MotherJobPosition] [nchar](30) NULL,
	[FatherTelepthone] [nvarchar](50) NULL,
	[MotherTelephone] [nvarchar](50) NULL,
	[MotherAdress] [nvarchar](150) NULL,
	[FatherAdress] [nvarchar](120) NULL,
 CONSTRAINT [PK_Abiturient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcademicRanks]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicRanks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AcademicRanks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FacultyName] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostGraduate]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostGraduate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_PostGraduate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScientificDirections]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScientificDirections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DirectionName] [nvarchar](50) NOT NULL,
	[FacultyId] [int] NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_ScientificDirections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScientificTopics]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScientificTopics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[TeacherId] [int] NULL,
 CONSTRAINT [PK_ScientificTopics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](150) NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[Children] [int] NULL,
	[GenderId] [nvarchar](50) NOT NULL,
	[Age] [int] NULL,
	[FacultyId] [int] NULL,
	[Nationality] [nchar](32) NULL,
	[BirthDate] [date] NULL,
	[BirthPlace] [nchar](50) NULL,
	[RegistrationtAddress] [nchar](120) NULL,
	[ActualAddress] [nchar](120) NULL,
	[Education] [nchar](999) NULL,
	[Familia] [nchar](100) NULL,
	[Imya] [nchar](100) NULL,
	[Otch] [nchar](100) NULL,
	[FatherFio] [nchar](100) NULL,
	[FatherJobPlace] [nchar](100) NULL,
	[FatherJobPosition] [nchar](30) NULL,
	[MotherFio] [nchar](100) NULL,
	[MotherJobPlace] [nchar](100) NULL,
	[MotherJobPosition] [nchar](30) NULL,
	[FatherTelepthone] [nvarchar](50) NULL,
	[MotherTelephone] [nvarchar](50) NULL,
	[MotherAdress] [nvarchar](150) NULL,
	[FatherAdress] [nvarchar](120) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](150) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[AcademicRanksId] [int] NOT NULL,
	[CountChildren] [int] NOT NULL,
	[GenderId] [nvarchar](50) NOT NULL,
	[Salary] [int] NOT NULL,
	[Aspirant] [nchar](10) NOT NULL,
	[ScWordks] [nvarchar](max) NOT NULL,
	[ScTopicsId] [int] NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.05.2024 13:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Id_Role] [int] NOT NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'IT')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([Id], [FacultyName], [DepartmentId]) VALUES (1, N'prog', 1)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Teacher')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'EdPart')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (1002, N'Колпакова', N'15С', 1, N'М', 16, 1, N' Российская Федерация           ', CAST(N'2004-02-03' AS Date), N'Россия, Нижегородская область г. Арзамас          ', N'Россия Нижегородская область г. Арзамас ул. Красной
Милиции д. 41                                                     ', N'Россия Нижегородская область Арзамасский район р.п.
Выездное ул. 1 Мая д. 51А                                          ', N'муниципальное бюджетное
общеобразовательное учреждение Выездновская средняя школа Арзамасского района
Нижегородской области. 9 классов дата окончания 16.06.2020 года                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ', N'Колпакова                                                                                           ', N'Наталья                                                                                             ', N'Евгеньвена                                                                                          ', N'Колпаков Евгений Алексеевич                                                                         ', N'ИП Праздничков                                                                                      ', N'Слесарь                       ', N'Колпакова Любовь Валерьевна                                                                         ', N'Домохозяйка                                                                                         ', NULL, N' 89524488560', N'89524488595', N'Россия Нижегородская область г. Арзамас ул. Красной Милиции д. 41', N'Россия Нижегородская область
Арзамасский район р.п. Выездное ул. 1 Мая
д. 51')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Login], [Password], [Id_Role], [image]) VALUES (1, N'1', N'1', 1, N'fd')
INSERT [dbo].[Users] ([Id], [Login], [Password], [Id_Role], [image]) VALUES (2, N'3', N'3', 3, N'fd')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Faculty]  WITH CHECK ADD  CONSTRAINT [FK_Faculty_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Faculty] CHECK CONSTRAINT [FK_Faculty_Department]
GO
ALTER TABLE [dbo].[PostGraduate]  WITH CHECK ADD  CONSTRAINT [FK_PostGraduate_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[PostGraduate] CHECK CONSTRAINT [FK_PostGraduate_Department]
GO
ALTER TABLE [dbo].[ScientificDirections]  WITH CHECK ADD  CONSTRAINT [FK_ScientificDirections_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([Id])
GO
ALTER TABLE [dbo].[ScientificDirections] CHECK CONSTRAINT [FK_ScientificDirections_Faculty]
GO
ALTER TABLE [dbo].[ScientificDirections]  WITH CHECK ADD  CONSTRAINT [FK_ScientificDirections_Teachers] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[ScientificDirections] CHECK CONSTRAINT [FK_ScientificDirections_Teachers]
GO
ALTER TABLE [dbo].[ScientificTopics]  WITH CHECK ADD  CONSTRAINT [FK_ScientificTopics_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[ScientificTopics] CHECK CONSTRAINT [FK_ScientificTopics_Department]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Faculty]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_AcademicRanks] FOREIGN KEY([AcademicRanksId])
REFERENCES [dbo].[AcademicRanks] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_AcademicRanks]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Department]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_ScientificTopics] FOREIGN KEY([ScTopicsId])
REFERENCES [dbo].[ScientificTopics] ([Id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_ScientificTopics]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Id_Role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
