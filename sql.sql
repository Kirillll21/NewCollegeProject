USE [Vuz]
GO
/****** Object:  Table [dbo].[Abiturient]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[AcademicRanks]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[Faculty]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[PostGraduate]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[ScientificDirections]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[ScientificTopics]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[Students]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[Teachers]    Script Date: 16.06.2024 17:33:08 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 16.06.2024 17:33:08 ******/
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

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Teacher')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Teacher')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'EdPart')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2003, N'КолпаковаНатальяИванова', N'17С', NULL, N'Ж', NULL, NULL, N'Российская Федерация            ', CAST(N'2004-02-03' AS Date), N' Россия, Нижегородская область г. Арзамас         ', N'Россия Нижегородская область г. Арзамас ул. Красной                                                                     ', N'Россия Нижегородская область г. Арзамас ул. Красной                                                                     ', N' муниципальное бюджетное                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ', N'Иванова                                                                                             ', N'Ивана                                                                                               ', N'Иванована                                                                                           ', N'Колпаков Евгений Алексеевич                                                                         ', N'П Праздничков                                                                                       ', N'Слесарь                       ', N'Колпакова Любовь Валерьевна                                                                         ', N'Рикор Элекстроникс                                                                                  ', N'Домохозяйка                   ', N'89524488560 ', N'89524488595', N'Россия Нижегородская область г. ', N'Россия Нижегородская область ')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2004, N'ЦыгановаАленаРомановна', N'15С', NULL, N'Ж', NULL, NULL, N'РФ                              ', CAST(N'2005-01-05' AS Date), N'Арзамас                                           ', N'г. Арзамас, пр-кт Ленина, д. 137, кв 27                                                                                 ', N'г. Арзамас, пр-кт Ленина, д. 137, кв 27                                                                                 ', N'МБОУ СШ №2 г. Арзамас 9 классов                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        ', N'Цыганова                                                                                            ', N'Алена                                                                                               ', N'Романовна                                                                                           ', N'Цыганов Роман Александрович                                                                         ', N'МЧС России                                                                                          ', N'Мастер-пожарный               ', N'Цыганова Мария Владимировна                                                                         ', N'АО АПЗ                                                                                              ', N'Монтажник                     ', N'', N'89087313209', N'пр-кт Ленина, д. 137, кв 27', N'')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2005, N'БеловаКсенияСергеевна', N'15С', NULL, N'Ж', NULL, NULL, N'РФ                              ', CAST(N'2003-09-24' AS Date), N'Арзамас, Нижегородскя обл.                        ', N'– г. Арзамас, ул. Национальный порядок, д. 6, кв 19                                                                     ', N'г. Арзамас, ул. Березина, д.22 к.2, кв. 21                                                                              ', N'МБОУ СШ №3  г. Арзамас  9 классов                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Белова                                                                                              ', N'Ксения                                                                                              ', N'Сергеевна                                                                                           ', N'Белов Сергей Валентинович                                                                           ', N'МОВО по городу Арзамасу                                                                             ', N'Полицейский водитель          ', N'Белова Наталья Александровна                                                                        ', N'ОАО «РикорЭлектроникс»                                                                              ', N'Специалист по продажам        ', N'89202978782', N'89200580823', N'Арзамас, ул. Березина, д.22 к.2, кв. 21', N'Арзамас, ул. Березина, д.22 к.2, кв. 21')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2006, N'ВасильевМихаилАндрей', N'15С', NULL, N'М', NULL, NULL, N'РФ                              ', CAST(N'2004-02-16' AS Date), N'г. Барнаул                                        ', N'г. Барнаул, ул. Георгия Исакова, д. 124, кв 55                                                                          ', N'г. Арзамас, ул. Зеленая, д 18, кв 100                                                                                   ', N'МБОУ СШ №13 г. Арзамас  9 классов                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Васильев                                                                                            ', N'Михаил                                                                                              ', N'Андрей                                                                                              ', N'Васильев Андрей Борисович                                                                           ', N'АО «АМЗ»                                                                                            ', N'Начальник IT отдела           ', N'Васильева Ольга Николаевна                                                                          ', N'АО «АМЗ»                                                                                            ', N'Оформитель ОД                 ', N' 89108977742', N' 8977444106', N'г. Арзамас, ул. Зеленая, д 18, кв 100. ', N'г. Арзамас, ул. Зеленая, д 18, кв 100')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2007, N'ВасянинаЕленаСергеевна', N'15С', NULL, N'Ж', NULL, NULL, N'РФ                              ', CAST(N'2004-06-09' AS Date), N'рп. Мухтолово, Ардатовский р-н, Ниж. Обл.         ', N'рп. Мухтолово, ул. Школьная, д 26                                                                                       ', N'рп. Мухтолово, ул. Школьная, д 26                                                                                       ', N'МБОУ Мухтоловская СШ №1  9 классов                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ', N'Васянина                                                                                            ', N'Елена                                                                                               ', N'Сергеевна                                                                                           ', N'                                                                                                    ', N'                                                                                                    ', N'                              ', N'Васянина Людмила Павловна                                                                           ', N'Мухтоловскя спецодежда                                                                              ', N'Швея                          ', N'', N'89524650082', N'рп. Мухтолово, ул. Школьная, д 26', N'')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2008, N'ВеселоваАнастасияСергеевна', N'22С', NULL, N'Ж', NULL, NULL, N'РФ                              ', CAST(N'2003-09-02' AS Date), N'Саров                                             ', N'г. Саров, пр-кт. Музрукова, д. 18, кв. 49                                                                               ', N'г. Саров, пр-кт. Музрукова, д. 18, кв. 49                                                                               ', N'МБОУ СШ №5 г. Саров 11 классов                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Веселова                                                                                            ', N'Анастасия                                                                                           ', N'Сергеевна                                                                                           ', N'Веселов Сергей Григорьевич                                                                          ', N'ФГУП РФЯЦ ВНИИФ завод 1                                                                             ', N'Каменщик                      ', N'Манджова Светлана Владимировна                                                                      ', N'ФГУП РФЯЦ ВНИИФ СТИП                                                                                ', N'Повар                         ', N'', N'', N'г. Саров, пр-кт. Музрукова, д. 18, кв. 49', N'г. Саров, пр-кт. Музрукова, д. 18, кв. 49')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2009, N'ВилковаАленаСергеевна', N'15С', NULL, N'Ж', NULL, NULL, N'РФ                              ', CAST(N'2004-04-02' AS Date), N'с. Полховский майдан вознесенского района         ', N'с. Полховский майдан вознесенского района, ул. Новая, д 33                                                              ', N'с. Полховский майдан вознесенского района, ул. Новая, д 33                                                              ', N'Полх-Майдановская СШ 9 классов                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Вилкова                                                                                             ', N'Алена                                                                                               ', N'Сергеевна                                                                                           ', N'Вилков Сергей Михайлович                                                                            ', N'                                                                                                    ', N'Неработающий                  ', N'Вилкова Нина Владимировна                                                                           ', N'                                                                                                    ', N'Вилкова                       ', N'', N'', N'с. Полховский майдан вознесенского района, ул. Новая, д 33', N'с. Полховский майдан вознесенского района, ул. Новая, д 33')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2010, N'ГладковаМаринаИгоревна', N'15C', NULL, N'Ж', NULL, NULL, N'РФ                              ', CAST(N'2004-05-14' AS Date), N'с. Суворово, Дивеевский р-н                       ', N'г. Саров, ул. Силкина, д 2, кв 68                                                                                       ', N'г. Саров, ул. Силкина, д 2, кв 68                                                                                       ', N'МБОУ СШ №14 г.Сарова 9 классов                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', N'Гладкова                                                                                            ', N'Марина                                                                                              ', N'Игоревна                                                                                            ', N'Гладков Игорь Валентинович                                                                          ', N'ООО «Автоцентр»                                                                                     ', N'Автослесарь                   ', N'Гладкова Юлия Сергеевна                                                                             ', N'ООО «Алкеон»                                                                                        ', N'Продавец-кассир               ', N'', N'', N'г. Саров, ул. Силкина, д 2, кв 68', N'г. Саров, ул. Силкина, д 2, кв 68')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2011, N'БеловКириллАлександрович', N'', NULL, N'мужской', NULL, NULL, N'РФ                              ', CAST(N'2007-05-24' AS Date), N'г. Арзамас                                        ', N'Нижегородская область, г. Арзамас, ул. Лесная, д. 28, кв. 2                                                             ', N'Нижегородская область, г. Арзамас, ул. Лесная, д. 28, кв. 2                                                             ', N'9 классов МБОУ СШ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      ', N'Белов                                                                                               ', N'Кирилл                                                                                              ', N'Александрович                                                                                       ', N'                                                                                                    ', N'                                                                                                    ', N'                              ', N'Белова Наталья Алексеевна                                                                           ', N'                                                                                                    ', N'                              ', N'', N'89043922902', N'Нижегородская область, г. Арзамас, ул. Лесная, д. 28, кв. 2', N'')
INSERT [dbo].[Students] ([Id], [FIO], [GroupName], [Children], [GenderId], [Age], [FacultyId], [Nationality], [BirthDate], [BirthPlace], [RegistrationtAddress], [ActualAddress], [Education], [Familia], [Imya], [Otch], [FatherFio], [FatherJobPlace], [FatherJobPosition], [MotherFio], [MotherJobPlace], [MotherJobPosition], [FatherTelepthone], [MotherTelephone], [MotherAdress], [FatherAdress]) VALUES (2012, N'КозловВладиславАлександрович', N'16 П', NULL, N'мужской', NULL, NULL, N'РФ                              ', CAST(N'2007-11-01' AS Date), N'                                                  ', N'                                                                                                                        ', N'Нижегородская область, г. Арзамас, ул Комрнавтов, д.43                                                                  ', N'9 клссов МБОУ СШ 12                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ', N'Козлов                                                                                              ', N'Владислав                                                                                           ', N'Александрович                                                                                       ', N'                                                                                                    ', N'                                                                                                    ', N'                              ', N'Козлова Светлана Александровна                                                                      ', N'                                                                                                    ', N'                              ', N'', N'89103974806', N'Нижегородская область, г. Арзамас, ул Комрнавтов, д.43', N'Нижегородская область, г. Арзамас, ул Комрнавтов, д.43')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Login], [Password], [Id_Role], [image]) VALUES (1, N'1', N'1', 1, N'fd')
INSERT [dbo].[Users] ([Id], [Login], [Password], [Id_Role], [image]) VALUES (2, N'3', N'3', 3, N'fd')
INSERT [dbo].[Users] ([Id], [Login], [Password], [Id_Role], [image]) VALUES (3, N'2', N'2', 2, N'21')
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
