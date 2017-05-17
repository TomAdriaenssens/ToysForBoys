USE [master]
GO
/****** Object:  Database [toysforboys]    Script Date: 11/05/2017 13:51:29 ******/
CREATE DATABASE [toysforboys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'toysforboys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\toysforboys.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'toysforboys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\toysforboys_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GOut
ALTER DATABASE [toysforboys] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [toysforboys].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [toysforboys] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [toysforboys] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [toysforboys] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [toysforboys] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [toysforboys] SET ARITHABORT OFF 
GO
ALTER DATABASE [toysforboys] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [toysforboys] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [toysforboys] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [toysforboys] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [toysforboys] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [toysforboys] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [toysforboys] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [toysforboys] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [toysforboys] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [toysforboys] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [toysforboys] SET  ENABLE_BROKER 
GO
ALTER DATABASE [toysforboys] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [toysforboys] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [toysforboys] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [toysforboys] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [toysforboys] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [toysforboys] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [toysforboys] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [toysforboys] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [toysforboys] SET  MULTI_USER 
GO
ALTER DATABASE [toysforboys] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [toysforboys] SET DB_CHAINING OFF 
GO
ALTER DATABASE [toysforboys] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [toysforboys] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [toysforboys]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 11/05/2017 13:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_countries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customers]    Script Date: 11/05/2017 13:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[streetAndNumber] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](15) NULL,
	[postalCode] [nvarchar](15) NULL,
	[countryId] [int] NULL,
	[mail] [nvarchar](50) NULL,

 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderdetails]    Script Date: 11/05/2017 13:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderdetails](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantityOrdered] [int] NULL,
	[priceEach] [numeric](10, 2) NULL,
 CONSTRAINT [PK_orderdetails] PRIMARY KEY CLUSTERED 
(
	[orderId], [productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/05/2017 13:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] NOT NULL,
	[orderDate] [datetime] NULL,
	[requiredDate] [datetime] NULL,
	[shippedDate] [datetime] NULL,
	[comments] [ntext] NULL,
	[customerId] [int] NULL,
	[status] [nvarchar](10) NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productlines]    Script Date: 11/05/2017 13:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productlines](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [ntext] NULL,
 CONSTRAINT [PK_productlines] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 11/05/2017 13:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] NOT NULL,
	[name] [nvarchar](70) NULL,
	[scale] [nvarchar](10) NULL,
	[description] [ntext] NULL,
	[quantityInStock] [int] NULL,
	[quantityInOrder] [int] NULL,
	[buyPrice] [numeric](10, 2) NULL,
	[productlineId] [int] NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

INSERT [dbo].[countries] ([id], [name]) VALUES (2, N'Austria')
INSERT [dbo].[countries] ([id], [name]) VALUES (3, N'Belgium')
INSERT [dbo].[countries] ([id], [name]) VALUES (4, N'Canada')
INSERT [dbo].[countries] ([id], [name]) VALUES (5, N'Denmark')
INSERT [dbo].[countries] ([id], [name]) VALUES (6, N'Finland')
INSERT [dbo].[countries] ([id], [name]) VALUES (7, N'France')
INSERT [dbo].[countries] ([id], [name]) VALUES (8, N'Germany')
INSERT [dbo].[countries] ([id], [name]) VALUES (9, N'Hong Kong')
INSERT [dbo].[countries] ([id], [name]) VALUES (10, N'Ireland')
INSERT [dbo].[countries] ([id], [name]) VALUES (11, N'Israel')
INSERT [dbo].[countries] ([id], [name]) VALUES (12, N'Italy')
INSERT [dbo].[countries] ([id], [name]) VALUES (13, N'Japan')
INSERT [dbo].[countries] ([id], [name]) VALUES (14, N'Netherlands')
INSERT [dbo].[countries] ([id], [name]) VALUES (15, N'New Zealand')
INSERT [dbo].[countries] ([id], [name]) VALUES (16, N'Norway  ')
INSERT [dbo].[countries] ([id], [name]) VALUES (17, N'Philippines')
INSERT [dbo].[countries] ([id], [name]) VALUES (18, N'Poland')
INSERT [dbo].[countries] ([id], [name]) VALUES (19, N'Portugal')
INSERT [dbo].[countries] ([id], [name]) VALUES (20, N'Russia')
INSERT [dbo].[countries] ([id], [name]) VALUES (21, N'Singapore')
INSERT [dbo].[countries] ([id], [name]) VALUES (22, N'South Africa')
INSERT [dbo].[countries] ([id], [name]) VALUES (23, N'Spain')
INSERT [dbo].[countries] ([id], [name]) VALUES (24, N'Sweden')
INSERT [dbo].[countries] ([id], [name]) VALUES (25, N'Switzerland')
INSERT [dbo].[countries] ([id], [name]) VALUES (26, N'UK')
INSERT [dbo].[countries] ([id], [name]) VALUES (27, N'USA')
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (1, N'Ttelier graphique', N'T4, rue Royale', N'Tantes', NULL, N'T4000', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (2, N'Tignal Gift Stores', N'T489 Strong St.', N'Tas Vegas', N'TV', N'T3030', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (4, N'Ta Rochelle Gifts', N'T7, rue des Cinquante Otages', N'Tantes', NULL, N'T4000', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (5, N'Taane Mini Imports', N'Trling Skakkes gate 78', N'Ttavern', NULL, N'T110', 16)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (6, N'Tini Gifts Distributors Ltd.', N'T677 Strong St.', N'Tan Rafael', N'TA', N'T7562', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (7, N'Tavel & Zbyszek Co', N'Tl. Filtrowa 68', N'Tarszawa', NULL, N'T1-012', 18)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (8, N'Tlauer See Auto, Co.', N'Tyonerstr. 34', N'Trankfurt', NULL, N'T0528', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (9, N'Tini Wheels Co.', N'T557 North Pendale Street', N'Tan Francisco', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (10, N'Tand of Toys Inc.', N'T97 Long Airport Avenue', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (11, N'Turo+ Shopping Channel', N'T/ Moralzarzal, 86', N'Tadrid', NULL, N'T8034', 23)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (12, N'Tolvo Model Replicas, Co', N'Terguvsvägen  8', N'Tuleå', NULL, N'T-958 22', 24)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (13, N'Tanish Wholesale Imports', N'Tinbæltet 34', N'Tobenhavn', NULL, N'T734', 5)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (14, N'Taveley & Henriot, Co.', N'T, rue du Commerce', N'Tyon', NULL, N'T9004', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (15, N'Tragon Souveniers, Ltd.', N'Tronz Sok.', N'Tingapore', NULL, N'T79903', 21)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (16, N'Tuscle Machine Inc', N'T092 Furth Circle', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (17, N'Tiecast Classics Inc.', N'T586 Pompton St.', N'Tllentown', N'TA', N'T0267', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (18, N'Technics Stores Inc.', N'T408 Furth Circle', N'Turlingame', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (19, N'Tandji Gifts& Co', N'T06 Linden Road Sandown', N'Tingapore', NULL, N'T69045', 21)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (20, N'Terkku Gifts', N'Trehmen St. 121', N'Tergen', NULL, N'T 5804', 16)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (21, N'Tmerican Souvenirs Inc', N'T49 Spinnaker Dr.', N'Tew Haven', N'TT', N'T7823', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (22, N'Torto Imports Co.', N'Tstrada da saúde n. 58', N'Tisboa', NULL, N'T756', 19)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (23, N'Taedalus Designs Imports', N'T84, chaussée de Tournai', N'Tille', NULL, N'T9000', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (24, N'Ta Corne D''abondance, Co.', N'T65, boulevard Charonne', N'Taris', NULL, N'T5012', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (25, N'Tambridge Collectables Co.', N'T658 Baden Av.', N'Tambridge', N'TA', N'T1247', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (26, N'Tift Depot Inc.', N'T5593 South Bay Ln.', N'Tridgewater', N'TT', N'T7562', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (27, N'Tsaka Souveniers Co.', N'T-6-20 Dojima', N'Tita-ku', N'Tsaka', N'T530-0003', 13)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (28, N'Titachrome Inc.', N'T678 Kingston Rd.', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (29, N'Toys of Finland, Co.', N'Teskuskatu 45', N'Telsinki', NULL, N'T1240', 6)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (30, N'TV Stores, Co.', N'Tauntleroy Circus', N'Tanchester', NULL, N'TC2 5NT', 26)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (31, N'Tlover Collections, Co.', N'T5 Maiden Lane', N'Tublin', NULL, N'T', 10)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (32, N'Tuto-Moto Classics Inc.', N'T6780 Pompton St.', N'Trickhaven', N'TA', N'T8339', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (33, N'TK Collectables, Ltd.', N'T2, Berkeley Gardens Blvd', N'Tiverpool', NULL, N'TX1 6LT', 26)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (34, N'Tanadian Gift Exchange Network', N'T900 Oak St.', N'Tancouver', N'TC', N'T3F 2K1', 4)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (35, N'Tnline Mini Collectables', N'T635 Spinnaker Dr.', N'Trickhaven', N'TA', N'T8339', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (36, N'Toys4GrownUps.com', N'T8934 Hillside Dr.', N'Tasadena', N'TA', N'T0003', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (37, N'Tsian Shopping Network, Co', N'Tuntec Tower Three', N'Tingapore', NULL, N'T38988', 21)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (38, N'Tini Caravy', N'T4, place Kléber', N'Ttrasbourg', NULL, N'T7000', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (39, N'Ting Kong Collectables, Co.', N'Tank of China Tower', N'Tentral Hong Kong', NULL, NULL, 9)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (40, N'Tnaco Distributors', N'Tambla de Cataluña, 23', N'Tarcelona', NULL, N'T8022', 23)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (41, N'Toards & Toys Co.', N'T097 Douglas Av.', N'Tlendale', N'TA', N'T2561', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (42, N'Tatürlich Autos', N'Taucherstraße 10', N'Tunewalde', NULL, N'T1307', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (43, N'Teintze Collectables', N'Tmagsloget 45', N'Trhus', NULL, N'T200', 5)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (44, N'Tuébec Home Shopping Network', N'T3 rue St. Laurent', N'Tontréal', N'Tuébec', N'T1J 1C3', 4)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (45, N'TNG Resellers', N'Tran Vía, 1', N'Tadrid', NULL, N'T8001', 23)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (46, N'Tollectable Mini Designs Co.', N'T61 Furth Circle', N'Tan Diego', N'TA', N'T1217', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (47, N'Tiftsbymail.co.uk', N'Tarden House', N'Towes', N'Tsle of Wight', N'TO31 7PJ', 26)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (48, N'Tlpha Cognac', N'T rue Alsace-Lorraine', N'Toulouse', NULL, N'T1000', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (49, N'Tessner Shopping Network', N'Tagazinweg 7', N'Trankfurt', NULL, N'T0528', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (50, N'Tmica Models & Co.', N'Tia Monte Bianco 34', N'Torino', NULL, N'T0100', 12)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (51, N'Tyon Souveniers', N'T7 rue du Colonel Pierre Avia', N'Taris', NULL, N'T5508', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (52, N'Tuto Associés & Cie.', N'T7, avenue de l''Europe', N'Tersailles', NULL, N'T8000', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (53, N'Toms Spezialitäten, Ltd', N'Tehrheimerstr. 369', N'Töln', NULL, N'T0739', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (54, N'Toyal Canadian Collectables, Ltd.', N'T3 Tsawassen Blvd.', N'Tsawassen', N'TC', N'T2F 8M4', 4)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (55, N'Tranken Gifts, Co', N'Terliner Platz 43', N'Tünchen', NULL, N'T0805', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (57, N'Tovelli Gifts', N'Tia Ludovico il Moro 22', N'Tergamo', NULL, N'T4100', 12)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (59, N'Tarta''s Replicas Co.', N'T9323 Spinnaker Dr.', N'Tambridge', N'TA', N'T1247', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (60, N'TG&E Collectables', N'Tte des Arsenaux 41 ', N'Tribourg', NULL, N'T700', 25)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (61, N'Tida Sport, Ltd', N'Trenzacherweg 237', N'Tenève', NULL, N'T203', 25)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (62, N'Torway Gifts By Mail, Co.', N'Trammensveien 126A', N'Tslo', NULL, N'T 0106', 16)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (63, N'Tchuyler Imports', N'Tingsfordweg 151', N'Tmsterdam', NULL, N'T043 GR', 14)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (64, N'Ter Hund Imports', N'Tbere Str. 57', N'Terlin', NULL, N'T2209', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (65, N'Tulu Toy Supplies, Inc.', N'Torikatu 38', N'Tulu', NULL, N'T0110', 6)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (66, N'Tetit Auto', N'Tue Joseph-Bens 532', N'Truxelles', NULL, N'T-1180', 3)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (67, N'Tini Classics', N'T758 North Pendale Street', N'Thite Plains', N'TY', N'T4067', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (68, N'Tini Creations Ltd.', N'T575 Hillside Dr.', N'Tew Bedford', N'TA', N'T0553', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (69, N'Torporate Gift Ideas Co.', N'T734 Strong St.', N'Tan Francisco', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (70, N'Town Under Souveniers, Inc', N'T62-164 Grafton Road', N'Tuckland  ', NULL, NULL, 15)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (71, N'Ttylish Desk Decors, Co.', N'T5 King George', N'Tondon', NULL, N'TX3 6FW', 26)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (72, N'Tekni Collectables Inc.', N'T476 Moss Rd.', N'Tewark', N'TJ', N'T4019', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (74, N'Tuominen Souveniers', N'Toftware Engineering Center', N'Tspoo', NULL, N'TIN-02271', 6)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (75, N'Tramer Spezialitäten, Ltd', N'Taubelstr. 90', N'Trandenburg', NULL, N'T4776', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (76, N'Tlassic Gift Ideas, Inc', N'T82 First Street', N'Thiladelphia', N'TA', N'T1270', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (77, N'TAF Imports', N'Terchants House', N'Tadrid', NULL, N'T8023', 23)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (78, N'Ten ''R'' US Retailers, Ltd.', N'T047 Douglas Av.', N'Tos Angeles', N'TA', N'T1003', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (79, N'Tsian Treasures, Inc.', N'T Johnstown Road', N'Tork', N'To. Cork', NULL, 10)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (80, N'Tarseille Mini Autos', N'T2, rue des Bouchers', N'Tarseille', NULL, N'T3008', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (81, N'Teims Collectables', N'T9 rue de l''Abbaye', N'Teims', NULL, N'T1100', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (82, N'TAR Distributors, Co', N'T250 Pretorius Street', N'Tatfield', N'Tretoria', N'T028', 22)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (83, N'TiftsForHim.com', N'T99 Great North Road', N'Tuckland', NULL, NULL, 15)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (84, N'Tommission Auto', N'Tuisenstr. 48', N'Tünster', NULL, N'T4087', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (85, N'Tifts4AllAges.com', N'T616 Spinnaker Dr.', N'Toston', N'TA', N'T1003', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (86, N'Tnline Diecast Creations Co.', N'T304 Long Airport Avenue', N'Tashua', N'TH', N'T2005', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (87, N'Tisboa Souveniers, Inc', N'Tardim das rosas n. 32', N'Tisboa', NULL, N'T675', 19)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (88, N'Trecious Collectables', N'Tauptstr. 29', N'Tern', NULL, N'T012', 25)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (89, N'Tollectables For Less Inc.', N'T825 Douglas Av.', N'Trickhaven', N'TA', N'T8339', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (90, N'Toyale Belge', N'Toulevard Tirou, 255', N'Tharleroi', NULL, N'T-6000', 3)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (91, N'Talzburg Collectables', N'Teislweg 14', N'Talzburg', NULL, N'T020', 2)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (92, N'Truz & Sons Co.', N'T5 McCallum Street', N'Takati City', NULL, N'T227 MM', 17)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (93, N'T''ordine Souveniers', N'Ttrada Provinciale 124', N'Teggio Emilia', NULL, N'T2100', 12)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (94, N'Tokyo Collectables, Ltd', N'T-2-8 Roppongi', N'Tinato-ku', N'Tokyo', N'T06-0032', 13)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (95, N'Tuto Canal+ Petit', N'T5, rue Lauriston', N'Taris', NULL, N'T5016', 7)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (96, N'Ttuttgart Collectable Exchange', N'Tdenauerallee 900', N'Ttuttgart', NULL, N'T0563', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (97, N'Txtreme Desk Decorations, Ltd', N'T01 Lambton Quay', N'Tellington', NULL, NULL, 15)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (98, N'Tavarian Collectables Imports, Co.', N'Tansastr. 15', N'Tunich', NULL, N'T0686', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (99, N'Tlassic Legends Inc.', N'T905 Pompton St.', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (100, N'Teuer Online Stores, Inc', N'Teerstr. 22', N'Teipzig', NULL, N'T4179', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (101, N'Tift Ideas Corp.', N'T440 Pompton St.', N'Tlendale', N'TT', N'T7561', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (102, N'Tcandinavian Gift Ideas', N'Tkergatan 24', N'Träcke', NULL, N'T-844 67', 24)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (103, N'The Sharp Gifts Warehouse', N'T086 Ingle Ln.', N'Tan Jose', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (104, N'Tini Auto Werke', N'Tirchgasse 6', N'Traz', NULL, N'T010', 2)
GO
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (105, N'Tuper Scale Inc.', N'T67 North Pendale Street', N'Tew Haven', N'TT', N'T7823', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (106, N'Ticroscale Inc.', N'T290 North Pendale Street', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (107, N'Torrida Auto Replicas, Ltd', N'T/ Araquil, 67', N'Tadrid', NULL, N'T8023', 23)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (108, N'Tarburg Exchange', N'Talserweg 21', N'Tachen', NULL, N'T2066', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (109, N'TunGiftIdeas.com', N'T785 First Street', N'Tew Bedford', N'TA', N'T0553', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (110, N'Tnton Designs, Ltd.', N'T/ Gobelas, 19-1 Urb. La Florida', N'Tadrid', NULL, N'T8023', 23)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (112, N'Trau da Collezione', N'T0093 Cologno Monzese', N'Tilan', NULL, NULL, 12)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (113, N'Test Coast Collectables Co.', N'T675 Furth Circle', N'Turbank', N'TA', N'T4019', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (114, N'Tit Vergnügen & Co.', N'Torsterstr. 57', N'Tannheim', NULL, N'T8306', 8)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (115, N'Tremlin Collectables, Co.', N'T Pobedy Square', N'Taint Petersburg', NULL, N'T96143', 20)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (116, N'Taanan Stores, Inc', N'T Hagalim Blv.', N'Terzlia', NULL, N'T7625', 11)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (117, N'Tberia Gift Imports, Corp.', N'T/ Romero, 33', N'Tevilla', NULL, N'T1101', 23)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (118, N'Totor Mint Distributors Inc.', N'T1328 Douglas Av.', N'Thiladelphia', N'TA', N'T1270', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (119, N'Tignal Collectibles Ltd.', N'T793 Furth Circle', N'Trisbane', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (120, N'Touble Decker Gift Stores, Ltd', N'T20 Hanover Sq.', N'Tondon', NULL, N'TA1 1DP', 26)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (121, N'Tiecast Collectables', N'T251 Ingle Ln.', N'Toston', N'TA', N'T1003', 27)
INSERT [dbo].[customers] ([id], [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (122, N'Telly''s Gift Shop', N'Trenales 1938 3''A''', N'Tuckland  ', NULL, NULL, 15)
GO
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (1, 23, 30, CAST(136.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (2, 29, 25, CAST(108.06 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (3, 19, 39, CAST(95.55 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (4, 2, 26, CAST(214.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (5, 11, 34, CAST(131.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (6, 5, 50, CAST(127.84 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (7, 22, 36, CAST(134.04 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (8, 1, 30, CAST(81.35 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (9, 7, 33, CAST(165.38 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (10, 18, 26, CAST(117.48 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (11, 21, 37, CAST(118.22 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (12, 19, 33, CAST(87.33 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (13, 2, 29, CAST(197.16 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (14, 9, 21, CAST(121.64 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (15, 6, 31, CAST(128.53 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (16, 15, 46, CAST(111.39 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (17, 89, 27, CAST(60.28 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (18, 8, 33, CAST(195.33 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (19, 106, 36, CAST(86.15 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (20, 5, 46, CAST(112.88 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (22, 1, 34, CAST(86.13 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 7, 42, CAST(155.66 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (24, 21, 26, CAST(120.71 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 23, 21, CAST(153.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 2, 38, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 8, 46, CAST(193.25 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (29, 39, 41, CAST(120.20 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 5, 33, CAST(123.76 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (31, 37, 40, CAST(68.82 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 22, 21, CAST(141.92 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (33, 105, 36, CAST(80.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 31, 49, CAST(80.26 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 1, 41, CAST(90.92 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 7, 42, CAST(173.17 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (37, 18, 25, CAST(117.48 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (38, 21, 44, CAST(115.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 23, 33, CAST(149.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 2, 37, CAST(186.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 15, 21, CAST(114.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 8, 33, CAST(166.24 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 5, 49, CAST(133.28 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (45, 91, 20, CAST(56.41 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (46, 1, 45, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (47, 47, 47, CAST(60.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (48, 7, 48, CAST(161.49 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (50, 19, 50, CAST(87.33 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (51, 2, 45, CAST(182.16 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (52, 15, 24, CAST(114.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (54, 8, 20, CAST(201.57 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (55, 72, 31, CAST(75.23 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (56, 5, 32, CAST(129.20 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (57, 93, 20, CAST(43.64 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (58, 31, 33, CAST(69.27 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (59, 62, 22, CAST(67.79 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (60, 1, 49, CAST(81.35 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (61, 12, 46, CAST(96.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (62, 18, 28, CAST(121.72 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (63, 19, 48, CAST(87.33 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (64, 2, 21, CAST(212.16 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (65, 6, 21, CAST(143.31 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (66, 8, 44, CAST(168.32 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (67, 39, 43, CAST(136.59 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (68, 5, 44, CAST(123.76 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (69, 1, 36, CAST(94.74 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (71, 12, 47, CAST(116.27 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (72, 18, 35, CAST(134.46 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (73, 21, 42, CAST(109.51 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (74, 19, 43, CAST(101.71 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (76, 6, 33, CAST(119.67 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (77, 8, 33, CAST(166.24 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (78, 39, 23, CAST(113.37 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (79, 5, 24, CAST(131.92 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (80, 31, 24, CAST(82.79 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (81, 1, 29, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (82, 7, 27, CAST(155.66 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (83, 19, 25, CAST(83.22 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (84, 2, 23, CAST(180.01 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (85, 15, 37, CAST(105.47 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (86, 8, 21, CAST(195.33 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (87, 5, 26, CAST(108.80 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (88, 31, 45, CAST(70.12 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (89, 1, 48, CAST(95.70 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (90, 10, 28, CAST(138.57 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (91, 66, 42, CAST(58.87 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (92, 7, 21, CAST(155.66 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (93, 16, 27, CAST(99.04 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (95, 2, 42, CAST(203.59 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (96, 15, 49, CAST(118.50 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (97, 8, 47, CAST(203.64 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (98, 5, 45, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (99, 22, 42, CAST(149.81 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (100, 93, 29, CAST(37.97 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (101, 31, 28, CAST(74.34 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (102, 1, 22, CAST(82.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (103, 47, 30, CAST(55.33 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (104, 7, 20, CAST(161.49 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (105, 18, 42, CAST(114.65 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (106, 19, 36, CAST(98.63 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (107, 2, 47, CAST(203.59 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (108, 6, 31, CAST(125.58 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (109, 8, 46, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (110, 5, 39, CAST(129.20 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (111, 3, 23, CAST(112.99 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (112, 1, 41, CAST(90.92 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (113, 12, 39, CAST(99.82 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (114, 50, 38, CAST(84.67 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (115, 23, 30, CAST(166.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (116, 2, 35, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (117, 9, 43, CAST(133.94 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (118, 6, 48, CAST(132.97 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (119, 28, 22, CAST(110.46 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (120, 15, 48, CAST(94.80 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (121, 8, 32, CAST(189.10 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (122, 39, 33, CAST(133.86 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (123, 5, 49, CAST(133.28 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (125, 10, 43, CAST(141.58 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (126, 7, 27, CAST(157.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (127, 21, 38, CAST(108.26 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (128, 19, 25, CAST(85.27 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (129, 2, 29, CAST(214.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (130, 6, 50, CAST(138.88 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (131, 11, 43, CAST(128.42 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (132, 8, 42, CAST(193.25 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (133, 39, 22, CAST(133.86 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (134, 72, 40, CAST(70.81 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (135, 5, 48, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (136, 31, 24, CAST(81.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (137, 3, 22, CAST(105.86 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (138, 1, 23, CAST(91.87 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (139, 7, 28, CAST(161.49 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (140, 16, 21, CAST(100.19 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (141, 18, 41, CAST(125.97 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (142, 21, 21, CAST(119.46 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (143, 80, 46, CAST(36.52 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (144, 29, 47, CAST(111.87 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (145, 19, 40, CAST(99.66 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (146, 2, 34, CAST(195.01 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (147, 15, 46, CAST(99.54 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (148, 8, 44, CAST(195.33 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (149, 5, 20, CAST(126.48 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (150, 48, 46, CAST(88.93 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (151, 22, 45, CAST(148.23 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (152, 1, 59, CAST(93.79 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (153, 43, 20, CAST(74.78 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (154, 7, 24, CAST(157.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (155, 23, 49, CAST(137.70 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (156, 33, 24, CAST(135.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (157, 19, 34, CAST(93.49 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (158, 35, 50, CAST(92.19 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (159, 2, 32, CAST(177.87 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (160, 6, 26, CAST(121.15 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (161, 8, 46, CAST(180.79 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (162, 5, 27, CAST(116.96 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (163, 22, 49, CAST(157.69 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (164, 1, 34, CAST(89.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (165, 47, 48, CAST(58.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (167, 7, 44, CAST(188.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (168, 55, 36, CAST(71.27 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (169, 19, 49, CAST(93.49 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (170, 36, 32, CAST(57.46 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (172, 15, 31, CAST(99.54 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (173, 8, 35, CAST(187.02 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (174, 5, 30, CAST(136.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (175, 22, 41, CAST(129.31 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (176, 1, 45, CAST(81.35 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (177, 7, 50, CAST(184.84 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (178, 16, 28, CAST(93.28 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (179, 18, 34, CAST(114.65 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (180, 55, 26, CAST(68.42 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (181, 2, 34, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (182, 6, 44, CAST(132.97 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (183, 8, 41, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (184, 5, 25, CAST(130.56 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (185, 22, 45, CAST(137.19 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (186, 1, 36, CAST(95.70 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (187, 47, 38, CAST(51.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (188, 7, 21, CAST(190.68 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (189, 21, 20, CAST(120.71 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (190, 19, 38, CAST(92.47 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (191, 44, 26, CAST(80.36 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (192, 2, 37, CAST(210.01 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (193, 15, 21, CAST(94.80 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (194, 8, 46, CAST(187.02 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (195, 107, 45, CAST(98.32 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (196, 5, 24, CAST(136.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (197, 22, 36, CAST(146.65 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (198, 31, 25, CAST(81.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (199, 3, 39, CAST(105.86 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (200, 1, 23, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (201, 7, 33, CAST(184.84 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (202, 18, 37, CAST(114.65 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (203, 23, 43, CAST(166.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (204, 27, 46, CAST(56.91 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (205, 2, 47, CAST(201.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (206, 6, 38, CAST(130.01 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (207, 8, 31, CAST(182.86 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (208, 5, 22, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (209, 3, 34, CAST(115.37 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (210, 1, 41, CAST(94.74 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (211, 7, 33, CAST(165.38 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (212, 21, 29, CAST(124.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (213, 2, 48, CAST(214.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (214, 6, 40, CAST(141.83 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (215, 8, 38, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (216, 51, 36, CAST(78.12 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (217, 5, 33, CAST(126.48 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (218, 83, 35, CAST(69.55 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (219, 1, 46, CAST(84.22 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (220, 10, 30, CAST(134.05 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (221, 7, 31, CAST(184.84 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (222, 16, 24, CAST(105.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (223, 2, 40, CAST(180.01 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (224, 44, 33, CAST(88.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (225, 11, 27, CAST(148.06 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (226, 5, 47, CAST(111.52 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (227, 42, 32, CAST(94.79 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (228, 22, 25, CAST(154.54 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (229, 48, 34, CAST(104.81 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (230, 1, 42, CAST(80.39 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (231, 45, 37, CAST(136.70 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (232, 18, 46, CAST(120.31 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (233, 19, 46, CAST(89.38 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (234, 2, 26, CAST(188.58 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (235, 6, 26, CAST(130.01 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (236, 68, 33, CAST(32.88 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (237, 8, 33, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (238, 5, 25, CAST(131.92 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (239, 22, 41, CAST(137.19 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (240, 3, 40, CAST(117.75 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (241, 62, 55, CAST(62.46 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (242, 1, 41, CAST(84.22 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (244, 21, 36, CAST(109.51 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (245, 23, 45, CAST(168.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (246, 64, 43, CAST(38.98 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (247, 19, 42, CAST(88.36 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (249, 8, 48, CAST(207.80 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (250, 13, 26, CAST(166.10 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (251, 5, 26, CAST(110.16 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (252, 22, 39, CAST(143.50 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (253, 100, 23, CAST(75.13 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (254, 31, 27, CAST(71.81 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (255, 1, 42, CAST(84.22 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (256, 45, 23, CAST(117.59 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (257, 18, 43, CAST(120.31 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (258, 2, 32, CAST(199.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (259, 11, 49, CAST(129.93 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (260, 5, 48, CAST(122.40 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (261, 22, 50, CAST(126.15 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (263, 4, 22, CAST(182.04 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (264, 7, 33, CAST(180.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (265, 87, 48, CAST(38.22 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (266, 18, 30, CAST(116.06 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (267, 25, 34, CAST(116.65 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (268, 21, 49, CAST(105.77 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (269, 67, 40, CAST(73.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (270, 2, 41, CAST(195.01 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (272, 8, 32, CAST(178.71 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (273, 11, 40, CAST(146.55 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (274, 5, 39, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (276, 1, 21, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (277, 12, 35, CAST(98.65 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (278, 14, 24, CAST(65.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (279, 21, 34, CAST(121.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (280, 23, 39, CAST(156.40 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (281, 19, 27, CAST(88.36 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (282, 2, 36, CAST(182.16 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (283, 8, 34, CAST(166.24 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (284, 28, 27, CAST(119.05 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (285, 5, 34, CAST(129.20 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (286, 77, 37, CAST(78.83 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (287, 22, 25, CAST(130.88 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (288, 86, 44, CAST(79.91 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (289, 1, 42, CAST(80.39 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (290, 7, 26, CAST(182.90 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (291, 18, 36, CAST(117.48 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (293, 36, 37, CAST(61.21 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (294, 11, 35, CAST(145.04 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (295, 40, 22, CAST(135.47 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (296, 5, 32, CAST(125.12 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (297, 13, 33, CAST(155.72 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (298, 99, 32, CAST(69.29 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (299, 22, 33, CAST(130.88 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (300, 1, 40, CAST(77.52 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (301, 5, 64, CAST(134.64 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (302, 31, 42, CAST(75.19 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (303, 3, 45, CAST(118.94 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (304, 1, 24, CAST(85.17 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (305, 7, 64, CAST(163.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (306, 16, 97, CAST(115.16 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (307, 18, 61, CAST(124.56 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (308, 21, 59, CAST(114.48 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (309, 80, 15, CAST(41.03 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (310, 29, 6, CAST(104.25 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (311, 19, 65, CAST(99.66 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (312, 2, 23, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (313, 15, 54, CAST(100.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (314, 8, 36, CAST(201.57 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (315, 5, 49, CAST(114.24 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (317, 22, 24, CAST(129.31 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (318, 1, 66, CAST(79.43 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (319, 43, 16, CAST(70.76 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (320, 7, 12, CAST(182.90 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (322, 33, 35, CAST(167.06 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (323, 19, 51, CAST(91.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (324, 35, 10, CAST(89.15 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (325, 2, 50, CAST(201.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (326, 6, 38, CAST(131.49 AS Numeric(10, 2)))
GO
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (1, CAST(0x000092F900000000 AS DateTime), CAST(0x0000930000000000 AS DateTime), NULL, NULL, 86, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (2, CAST(0x000092FC00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, N'Theck on availability.', 8, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (3, CAST(0x000092FD00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, NULL, 28, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (4, CAST(0x0000931000000000 AS DateTime), CAST(0x0000931900000000 AS DateTime), NULL, NULL, 5, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (5, CAST(0x0000931200000000 AS DateTime), CAST(0x0000931B00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (6, CAST(0x0000931D00000000 AS DateTime), CAST(0x0000932700000000 AS DateTime), NULL, NULL, 13, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (7, CAST(0x0000932300000000 AS DateTime), CAST(0x0000932A00000000 AS DateTime), NULL, NULL, 57, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (8, CAST(0x0000932A00000000 AS DateTime), CAST(0x0000933100000000 AS DateTime), NULL, N'Tifficult to negotiate with customer. We need more marketing materials', 10, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (9, CAST(0x0000933100000000 AS DateTime), CAST(0x0000933A00000000 AS DateTime), NULL, NULL, 92, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (10, CAST(0x0000933800000000 AS DateTime), CAST(0x0000934100000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 118, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (11, CAST(0x0000934000000000 AS DateTime), CAST(0x0000934600000000 AS DateTime), CAST(0x0000934200000000 AS DateTime), NULL, 30, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (12, CAST(0x0000934700000000 AS DateTime), CAST(0x0000934D00000000 AS DateTime), NULL, NULL, 9, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (13, CAST(0x0000934600000000 AS DateTime), CAST(0x0000935000000000 AS DateTime), CAST(0x0000934B00000000 AS DateTime), NULL, 12, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (14, CAST(0x0000934800000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), CAST(0x0000934900000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (15, CAST(0x0000934E00000000 AS DateTime), CAST(0x0000935400000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), NULL, 24, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (16, CAST(0x0000935100000000 AS DateTime), CAST(0x0000935900000000 AS DateTime), NULL, NULL, 99, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (17, CAST(0x0000935800000000 AS DateTime), CAST(0x0000936000000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), NULL, 90, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (18, CAST(0x0000935D00000000 AS DateTime), CAST(0x0000936500000000 AS DateTime), NULL, NULL, 15, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (19, CAST(0x0000936200000000 AS DateTime), CAST(0x0000936A00000000 AS DateTime), NULL, N'Tustomer has worked with some of our vendors in the past and is aware of their MSRP', 40, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (20, CAST(0x0000936900000000 AS DateTime), CAST(0x0000937000000000 AS DateTime), NULL, NULL, 91, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (22, CAST(0x0000937200000000 AS DateTime), CAST(0x0000937800000000 AS DateTime), NULL, NULL, 81, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (23, CAST(0x0000937300000000 AS DateTime), CAST(0x0000937B00000000 AS DateTime), NULL, NULL, 80, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (24, CAST(0x0000937F00000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, NULL, 1, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (25, CAST(0x0000938000000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, N'Tustomer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 2, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (27, CAST(0x0000938700000000 AS DateTime), CAST(0x0000939100000000 AS DateTime), NULL, NULL, 107, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (28, CAST(0x0000938D00000000 AS DateTime), CAST(0x0000939300000000 AS DateTime), NULL, N'Tustomer requested special shippment. The instructions were passed along to the warehouse', 16, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (29, CAST(0x0000939000000000 AS DateTime), CAST(0x0000939600000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (30, CAST(0x0000939600000000 AS DateTime), CAST(0x0000939C00000000 AS DateTime), NULL, NULL, 71, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (31, CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A200000000 AS DateTime), NULL, NULL, 32, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (32, CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A300000000 AS DateTime), NULL, NULL, 101, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (33, CAST(0x000093A300000000 AS DateTime), CAST(0x000093A900000000 AS DateTime), NULL, NULL, 70, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (34, CAST(0x000093A500000000 AS DateTime), CAST(0x000093AC00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (35, CAST(0x000093A900000000 AS DateTime), CAST(0x000093B200000000 AS DateTime), NULL, NULL, 51, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (36, CAST(0x000093AA00000000 AS DateTime), CAST(0x000093B400000000 AS DateTime), CAST(0x000093AB00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (37, CAST(0x000093AC00000000 AS DateTime), CAST(0x000093B600000000 AS DateTime), CAST(0x000093AE00000000 AS DateTime), NULL, 48, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (38, CAST(0x000093B200000000 AS DateTime), CAST(0x000093BC00000000 AS DateTime), NULL, NULL, 81, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (39, CAST(0x000093AF00000000 AS DateTime), CAST(0x000093B800000000 AS DateTime), NULL, NULL, 122, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (41, CAST(0x000093C000000000 AS DateTime), CAST(0x000093C900000000 AS DateTime), CAST(0x000093C600000000 AS DateTime), NULL, 18, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (42, CAST(0x000093C800000000 AS DateTime), CAST(0x000093D000000000 AS DateTime), NULL, NULL, 74, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (43, CAST(0x000093CF00000000 AS DateTime), CAST(0x000093D700000000 AS DateTime), CAST(0x000093D400000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (44, CAST(0x000093D100000000 AS DateTime), CAST(0x000093D900000000 AS DateTime), NULL, N'Tan we deliver the new Ford Mustang models by end-of-quarter?', 68, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (45, CAST(0x000093D400000000 AS DateTime), CAST(0x000093DC00000000 AS DateTime), CAST(0x000093D500000000 AS DateTime), NULL, 90, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (46, CAST(0x000093E000000000 AS DateTime), CAST(0x000093E800000000 AS DateTime), CAST(0x000093E600000000 AS DateTime), NULL, 36, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (47, CAST(0x000093E900000000 AS DateTime), CAST(0x000093F300000000 AS DateTime), NULL, NULL, 101, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (48, CAST(0x000093EB00000000 AS DateTime), CAST(0x000093F200000000 AS DateTime), NULL, NULL, 89, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (50, CAST(0x000093F200000000 AS DateTime), CAST(0x000093F800000000 AS DateTime), NULL, NULL, 119, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (51, CAST(0x000093F900000000 AS DateTime), CAST(0x0000940100000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 15, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (52, CAST(0x000093FB00000000 AS DateTime), CAST(0x0000940400000000 AS DateTime), NULL, NULL, 65, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (54, CAST(0x0000940200000000 AS DateTime), CAST(0x0000940900000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (55, CAST(0x0000940600000000 AS DateTime), CAST(0x0000941000000000 AS DateTime), NULL, NULL, 41, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (56, CAST(0x0000940A00000000 AS DateTime), CAST(0x0000941100000000 AS DateTime), NULL, NULL, 29, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (57, CAST(0x0000940C00000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (58, CAST(0x0000940D00000000 AS DateTime), CAST(0x0000941300000000 AS DateTime), NULL, NULL, 112, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (59, CAST(0x0000940E00000000 AS DateTime), CAST(0x0000941600000000 AS DateTime), NULL, NULL, 5, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (60, CAST(0x0000940E00000000 AS DateTime), CAST(0x0000941700000000 AS DateTime), NULL, NULL, 69, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (61, CAST(0x0000940F00000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), NULL, 78, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (62, CAST(0x0000941500000000 AS DateTime), CAST(0x0000941D00000000 AS DateTime), NULL, NULL, 43, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (63, CAST(0x0000941600000000 AS DateTime), CAST(0x0000941E00000000 AS DateTime), NULL, NULL, 69, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (64, CAST(0x0000941800000000 AS DateTime), CAST(0x0000941F00000000 AS DateTime), NULL, NULL, 99, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (65, CAST(0x0000941900000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), NULL, N'This order was disputed, but resolved on 11/1/2003; Customer doesn''t like the colors and precision of the models.', 104, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (66, CAST(0x0000941A00000000 AS DateTime), CAST(0x0000942300000000 AS DateTime), NULL, N'This order was on hold because customers''s credit limit had been exceeded. Order will ship when payment is received', 15, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (67, CAST(0x0000941900000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), NULL, NULL, 109, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (68, CAST(0x0000941B00000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), CAST(0x0000941600000000 AS DateTime), NULL, 102, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (69, CAST(0x0000942000000000 AS DateTime), CAST(0x0000942600000000 AS DateTime), CAST(0x0000942400000000 AS DateTime), NULL, 18, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (71, CAST(0x0000942700000000 AS DateTime), CAST(0x0000942F00000000 AS DateTime), NULL, NULL, 104, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (72, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943000000000 AS DateTime), NULL, NULL, 44, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (73, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943100000000 AS DateTime), NULL, NULL, 26, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (74, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943200000000 AS DateTime), NULL, N'Tautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 57, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (76, CAST(0x0000942900000000 AS DateTime), CAST(0x0000943100000000 AS DateTime), NULL, NULL, 71, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (77, CAST(0x0000942900000000 AS DateTime), CAST(0x0000943200000000 AS DateTime), NULL, NULL, 93, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (78, CAST(0x0000942A00000000 AS DateTime), CAST(0x0000943400000000 AS DateTime), NULL, NULL, 77, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (79, CAST(0x0000942B00000000 AS DateTime), CAST(0x0000943300000000 AS DateTime), CAST(0x0000942D00000000 AS DateTime), NULL, 48, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (80, CAST(0x0000942E00000000 AS DateTime), CAST(0x0000943400000000 AS DateTime), NULL, N'Tustomer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.', 122, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (81, CAST(0x0000942E00000000 AS DateTime), CAST(0x0000943600000000 AS DateTime), NULL, NULL, 23, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (82, CAST(0x0000942F00000000 AS DateTime), CAST(0x0000943600000000 AS DateTime), NULL, NULL, 20, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (83, CAST(0x0000942F00000000 AS DateTime), CAST(0x0000943800000000 AS DateTime), CAST(0x0000943500000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (84, CAST(0x0000943000000000 AS DateTime), CAST(0x0000943900000000 AS DateTime), NULL, N'Te need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 76, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (85, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943900000000 AS DateTime), NULL, NULL, 117, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (86, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943800000000 AS DateTime), NULL, NULL, 68, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (87, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943700000000 AS DateTime), CAST(0x0000943500000000 AS DateTime), NULL, 120, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (88, CAST(0x0000943200000000 AS DateTime), CAST(0x0000943B00000000 AS DateTime), NULL, NULL, 39, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (89, CAST(0x0000943500000000 AS DateTime), CAST(0x0000943D00000000 AS DateTime), NULL, NULL, 20, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (90, CAST(0x0000943500000000 AS DateTime), CAST(0x0000943C00000000 AS DateTime), CAST(0x0000943B00000000 AS DateTime), NULL, 36, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (91, CAST(0x0000943600000000 AS DateTime), CAST(0x0000944000000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (92, CAST(0x0000943700000000 AS DateTime), CAST(0x0000944100000000 AS DateTime), NULL, N'Te must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 53, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (93, CAST(0x0000943700000000 AS DateTime), CAST(0x0000944000000000 AS DateTime), NULL, NULL, 86, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (95, CAST(0x0000943C00000000 AS DateTime), CAST(0x0000944300000000 AS DateTime), NULL, NULL, 14, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (96, CAST(0x0000943C00000000 AS DateTime), CAST(0x0000944200000000 AS DateTime), NULL, NULL, 67, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (97, CAST(0x0000943D00000000 AS DateTime), CAST(0x0000944400000000 AS DateTime), NULL, NULL, 105, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (98, CAST(0x0000943D00000000 AS DateTime), CAST(0x0000944300000000 AS DateTime), NULL, N'Tustomer inquired about remote controlled models and gold models.', 40, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (99, CAST(0x0000943E00000000 AS DateTime), CAST(0x0000944700000000 AS DateTime), NULL, NULL, 92, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (100, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944B00000000 AS DateTime), NULL, NULL, 113, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (101, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, NULL, 39, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (102, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944C00000000 AS DateTime), NULL, NULL, 9, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (103, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, NULL, 83, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (104, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944C00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (105, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944B00000000 AS DateTime), NULL, NULL, 16, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (106, CAST(0x0000944400000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, N'TI need all the information I can get on our competitors.', 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (107, CAST(0x0000944600000000 AS DateTime), CAST(0x0000944E00000000 AS DateTime), NULL, N'Tan we renegotiate this one?', 34, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (108, CAST(0x0000944A00000000 AS DateTime), CAST(0x0000945200000000 AS DateTime), NULL, N'Theck on availability.', 121, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (109, CAST(0x0000946200000000 AS DateTime), CAST(0x0000946B00000000 AS DateTime), NULL, NULL, 14, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (110, CAST(0x0000946900000000 AS DateTime), CAST(0x0000946F00000000 AS DateTime), CAST(0x0000946C00000000 AS DateTime), NULL, 78, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (111, CAST(0x0000946C00000000 AS DateTime), CAST(0x0000947600000000 AS DateTime), NULL, NULL, 27, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (112, CAST(0x0000946F00000000 AS DateTime), CAST(0x0000947900000000 AS DateTime), NULL, NULL, 95, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (113, CAST(0x0000947000000000 AS DateTime), CAST(0x0000947800000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (114, CAST(0x0000947600000000 AS DateTime), CAST(0x0000947C00000000 AS DateTime), CAST(0x0000947B00000000 AS DateTime), NULL, 120, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (115, CAST(0x0000947A00000000 AS DateTime), CAST(0x0000948300000000 AS DateTime), NULL, NULL, 107, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (116, CAST(0x0000947D00000000 AS DateTime), CAST(0x0000948700000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 113, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (117, CAST(0x0000948100000000 AS DateTime), CAST(0x0000948900000000 AS DateTime), NULL, NULL, 52, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (118, CAST(0x0000948300000000 AS DateTime), CAST(0x0000948D00000000 AS DateTime), NULL, NULL, 19, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (119, CAST(0x0000948800000000 AS DateTime), CAST(0x0000948F00000000 AS DateTime), NULL, N'Tustomer requested that ad materials (such as posters, pamphlets) be included in the shippment', 112, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (120, CAST(0x0000948900000000 AS DateTime), CAST(0x0000949000000000 AS DateTime), NULL, NULL, 119, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (121, CAST(0x0000948B00000000 AS DateTime), CAST(0x0000949200000000 AS DateTime), NULL, NULL, 31, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (122, CAST(0x0000949100000000 AS DateTime), CAST(0x0000949900000000 AS DateTime), CAST(0x0000949200000000 AS DateTime), NULL, 66, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (123, CAST(0x0000949200000000 AS DateTime), CAST(0x0000949A00000000 AS DateTime), NULL, NULL, 46, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (125, CAST(0x0000949400000000 AS DateTime), CAST(0x0000949E00000000 AS DateTime), NULL, N'Tustomer has worked with some of our vendors in the past and is aware of their MSRP', 23, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (126, CAST(0x0000949500000000 AS DateTime), CAST(0x0000949D00000000 AS DateTime), NULL, NULL, 61, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (127, CAST(0x0000949900000000 AS DateTime), CAST(0x000094A200000000 AS DateTime), NULL, NULL, 46, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (128, CAST(0x0000949E00000000 AS DateTime), CAST(0x000094A800000000 AS DateTime), NULL, NULL, 14, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (129, CAST(0x000094A600000000 AS DateTime), CAST(0x000094AE00000000 AS DateTime), NULL, NULL, 25, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (130, CAST(0x000094A700000000 AS DateTime), CAST(0x000094B000000000 AS DateTime), CAST(0x000094A800000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (131, CAST(0x000094AB00000000 AS DateTime), CAST(0x000094B400000000 AS DateTime), NULL, N'Tustomer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 8, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (132, CAST(0x000094AF00000000 AS DateTime), CAST(0x000094B600000000 AS DateTime), NULL, NULL, 77, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (133, CAST(0x000094B000000000 AS DateTime), CAST(0x000094BA00000000 AS DateTime), NULL, NULL, 47, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (134, CAST(0x000094B900000000 AS DateTime), CAST(0x000094BF00000000 AS DateTime), CAST(0x000094BD00000000 AS DateTime), NULL, 72, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (135, CAST(0x000094BA00000000 AS DateTime), CAST(0x000094C000000000 AS DateTime), NULL, NULL, 97, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (136, CAST(0x000094BD00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), CAST(0x000094C100000000 AS DateTime), NULL, 54, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (137, CAST(0x000094BE00000000 AS DateTime), CAST(0x000094C600000000 AS DateTime), NULL, NULL, 118, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (138, CAST(0x000094C000000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), NULL, NULL, 28, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (139, CAST(0x000094C400000000 AS DateTime), CAST(0x000094CB00000000 AS DateTime), NULL, NULL, 13, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (140, CAST(0x000094C700000000 AS DateTime), CAST(0x000094D000000000 AS DateTime), NULL, NULL, 65, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (141, CAST(0x000094C800000000 AS DateTime), CAST(0x000094CF00000000 AS DateTime), NULL, NULL, 27, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (142, CAST(0x000094C800000000 AS DateTime), CAST(0x000094CF00000000 AS DateTime), NULL, NULL, 38, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (143, CAST(0x000094CF00000000 AS DateTime), CAST(0x000094D700000000 AS DateTime), NULL, N'Tustomer is interested in buying more Ferrari models', 106, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (144, CAST(0x000094D500000000 AS DateTime), CAST(0x000094DC00000000 AS DateTime), NULL, NULL, 121, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (145, CAST(0x000094D800000000 AS DateTime), CAST(0x000094E200000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (146, CAST(0x000094DD00000000 AS DateTime), CAST(0x000094E500000000 AS DateTime), NULL, NULL, 105, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (147, CAST(0x000094DE00000000 AS DateTime), CAST(0x000094E600000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (148, CAST(0x000094DE00000000 AS DateTime), CAST(0x000094E400000000 AS DateTime), NULL, NULL, 74, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (149, CAST(0x000094E000000000 AS DateTime), CAST(0x000094E700000000 AS DateTime), NULL, N'Trder was mistakenly placed. The warehouse noticed the lack of documentation.', 10, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (150, CAST(0x000094E100000000 AS DateTime), CAST(0x000094EA00000000 AS DateTime), NULL, N'Tan we deliver the new Ford Mustang models by end-of-quarter?', 25, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (151, CAST(0x000094E400000000 AS DateTime), CAST(0x000094EC00000000 AS DateTime), NULL, NULL, 103, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (152, CAST(0x000094EB00000000 AS DateTime), CAST(0x000094F100000000 AS DateTime), CAST(0x000094F100000000 AS DateTime), NULL, 72, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (153, CAST(0x000094F300000000 AS DateTime), CAST(0x000094FC00000000 AS DateTime), NULL, NULL, 95, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (154, CAST(0x000094F900000000 AS DateTime), CAST(0x0000950100000000 AS DateTime), NULL, N'Tustomer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.', 33, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (155, CAST(0x000094FB00000000 AS DateTime), CAST(0x0000950500000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 70, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (156, CAST(0x000094FC00000000 AS DateTime), CAST(0x0000950400000000 AS DateTime), NULL, NULL, 38, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (157, CAST(0x0000950000000000 AS DateTime), CAST(0x0000950800000000 AS DateTime), NULL, NULL, 13, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (158, CAST(0x0000950600000000 AS DateTime), CAST(0x0000951000000000 AS DateTime), NULL, NULL, 103, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (159, CAST(0x0000950700000000 AS DateTime), CAST(0x0000951100000000 AS DateTime), NULL, NULL, 94, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (160, CAST(0x0000950700000000 AS DateTime), CAST(0x0000950E00000000 AS DateTime), NULL, NULL, 19, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (161, CAST(0x0000950800000000 AS DateTime), CAST(0x0000950E00000000 AS DateTime), NULL, N'Tustomer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.', 83, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (162, CAST(0x0000950900000000 AS DateTime), CAST(0x0000951100000000 AS DateTime), NULL, NULL, 44, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (163, CAST(0x0000951000000000 AS DateTime), CAST(0x0000951700000000 AS DateTime), NULL, N'This customer found a better offer from one of our competitors. Will call back to renegotiate.', 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (164, CAST(0x0000951400000000 AS DateTime), CAST(0x0000951A00000000 AS DateTime), NULL, NULL, 26, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (165, CAST(0x0000951600000000 AS DateTime), CAST(0x0000951C00000000 AS DateTime), NULL, N'Tustomer will send a truck to our local warehouse on 7/1/2004', 85, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (167, CAST(0x0000951C00000000 AS DateTime), CAST(0x0000952400000000 AS DateTime), NULL, NULL, 93, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (168, CAST(0x0000951D00000000 AS DateTime), CAST(0x0000952700000000 AS DateTime), NULL, NULL, 16, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (169, CAST(0x0000952200000000 AS DateTime), CAST(0x0000952800000000 AS DateTime), NULL, NULL, 97, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (170, CAST(0x0000952600000000 AS DateTime), CAST(0x0000952C00000000 AS DateTime), NULL, NULL, 91, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (172, CAST(0x0000952A00000000 AS DateTime), CAST(0x0000953300000000 AS DateTime), CAST(0x0000952D00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (173, CAST(0x0000952A00000000 AS DateTime), CAST(0x0000953000000000 AS DateTime), NULL, NULL, 17, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (174, CAST(0x0000952B00000000 AS DateTime), CAST(0x0000953200000000 AS DateTime), CAST(0x0000952C00000000 AS DateTime), NULL, 66, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (175, CAST(0x0000952B00000000 AS DateTime), CAST(0x0000953300000000 AS DateTime), NULL, NULL, 89, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (176, CAST(0x0000952D00000000 AS DateTime), CAST(0x0000953700000000 AS DateTime), NULL, NULL, 4, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (177, CAST(0x0000953700000000 AS DateTime), CAST(0x0000954000000000 AS DateTime), NULL, NULL, 35, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (178, CAST(0x0000953900000000 AS DateTime), CAST(0x0000954100000000 AS DateTime), NULL, NULL, 15, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (179, CAST(0x0000953B00000000 AS DateTime), CAST(0x0000954500000000 AS DateTime), NULL, NULL, 2, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (180, CAST(0x0000953E00000000 AS DateTime), CAST(0x0000954800000000 AS DateTime), NULL, N'Tautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (181, CAST(0x0000954600000000 AS DateTime), CAST(0x0000955000000000 AS DateTime), NULL, NULL, 50, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (182, CAST(0x0000954800000000 AS DateTime), CAST(0x0000955100000000 AS DateTime), NULL, NULL, 17, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (183, CAST(0x0000954900000000 AS DateTime), CAST(0x0000954F00000000 AS DateTime), CAST(0x0000954B00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (184, CAST(0x0000954900000000 AS DateTime), CAST(0x0000955300000000 AS DateTime), CAST(0x0000954C00000000 AS DateTime), NULL, 54, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (185, CAST(0x0000954A00000000 AS DateTime), CAST(0x0000955200000000 AS DateTime), NULL, N'Tustom shipping instructions sent to warehouse', 62, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (186, CAST(0x0000955000000000 AS DateTime), CAST(0x0000955800000000 AS DateTime), NULL, NULL, 59, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (187, CAST(0x0000955100000000 AS DateTime), CAST(0x0000955A00000000 AS DateTime), CAST(0x0000955500000000 AS DateTime), NULL, 24, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (188, CAST(0x0000955300000000 AS DateTime), CAST(0x0000955A00000000 AS DateTime), NULL, NULL, 61, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (189, CAST(0x0000955500000000 AS DateTime), CAST(0x0000955F00000000 AS DateTime), NULL, NULL, 19, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (190, CAST(0x0000955700000000 AS DateTime), CAST(0x0000956100000000 AS DateTime), NULL, N'Te need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 20, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (191, CAST(0x0000955B00000000 AS DateTime), CAST(0x0000956300000000 AS DateTime), NULL, NULL, 32, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (192, CAST(0x0000955C00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), CAST(0x0000956200000000 AS DateTime), NULL, 102, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (193, CAST(0x0000955C00000000 AS DateTime), CAST(0x0000956600000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 10, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (194, CAST(0x0000955D00000000 AS DateTime), CAST(0x0000956600000000 AS DateTime), NULL, NULL, 50, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (195, CAST(0x0000955E00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), NULL, NULL, 35, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (196, CAST(0x0000955E00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 85, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (197, CAST(0x0000956300000000 AS DateTime), CAST(0x0000956A00000000 AS DateTime), NULL, NULL, 98, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (198, CAST(0x0000956400000000 AS DateTime), CAST(0x0000956A00000000 AS DateTime), NULL, N'Te must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 31, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (199, CAST(0x0000956F00000000 AS DateTime), CAST(0x0000957700000000 AS DateTime), NULL, NULL, 1, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (200, CAST(0x0000957200000000 AS DateTime), CAST(0x0000957C00000000 AS DateTime), NULL, NULL, 29, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (201, CAST(0x0000940800000000 AS DateTime), CAST(0x0000941100000000 AS DateTime), NULL, NULL, 8, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (202, CAST(0x0000940900000000 AS DateTime), CAST(0x0000941300000000 AS DateTime), NULL, NULL, 62, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (203, CAST(0x0000940A00000000 AS DateTime), CAST(0x0000941400000000 AS DateTime), NULL, NULL, 33, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (204, CAST(0x0000957800000000 AS DateTime), CAST(0x0000958000000000 AS DateTime), NULL, N'Tustomer inquired about remote controlled models and gold models.', 117, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (205, CAST(0x0000957D00000000 AS DateTime), CAST(0x0000958600000000 AS DateTime), NULL, NULL, 52, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (206, CAST(0x0000957F00000000 AS DateTime), CAST(0x0000958800000000 AS DateTime), NULL, N'Theck on availability.', 59, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (207, CAST(0x0000958000000000 AS DateTime), CAST(0x0000958700000000 AS DateTime), CAST(0x0000958300000000 AS DateTime), NULL, 30, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (208, CAST(0x0000958000000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, NULL, 76, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (209, CAST(0x0000958100000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 67, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (210, CAST(0x0000958100000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, NULL, 5, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (211, CAST(0x0000958200000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, NULL, 53, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (212, CAST(0x0000958200000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, N'Tifficult to negotiate with customer. We need more marketing materials', 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (213, CAST(0x0000958700000000 AS DateTime), CAST(0x0000958D00000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (214, CAST(0x0000958800000000 AS DateTime), CAST(0x0000958E00000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 34, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (215, CAST(0x0000958800000000 AS DateTime), CAST(0x0000959200000000 AS DateTime), NULL, NULL, 43, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (216, CAST(0x0000958F00000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, NULL, 4, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (217, CAST(0x0000959200000000 AS DateTime), CAST(0x0000959A00000000 AS DateTime), NULL, N'Tustomer requested that ad materials (such as posters, pamphlets) be included in the shippment', 47, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (218, CAST(0x0000959300000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, 18, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (219, CAST(0x0000959300000000 AS DateTime), CAST(0x0000959A00000000 AS DateTime), NULL, NULL, 17, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (220, CAST(0x0000959400000000 AS DateTime), CAST(0x0000959C00000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 106, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (221, CAST(0x0000959400000000 AS DateTime), CAST(0x0000959E00000000 AS DateTime), CAST(0x0000959800000000 AS DateTime), NULL, 12, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (222, CAST(0x0000959500000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, NULL, 109, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (223, CAST(0x0000959500000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, N'Tustomer has worked with some of our vendors in the past and is aware of their MSRP', 86, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (224, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, NULL, 8, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (225, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959C00000000 AS DateTime), NULL, NULL, 28, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (226, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959E00000000 AS DateTime), NULL, NULL, 5, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (227, CAST(0x0000959A00000000 AS DateTime), CAST(0x000095A100000000 AS DateTime), CAST(0x0000959B00000000 AS DateTime), NULL, 12, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (228, CAST(0x0000959B00000000 AS DateTime), CAST(0x000095A400000000 AS DateTime), NULL, N'Trder was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don''t match what was discussed.', 13, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (229, CAST(0x0000959D00000000 AS DateTime), CAST(0x000095A600000000 AS DateTime), NULL, N'Tustomer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 57, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (230, CAST(0x000095A000000000 AS DateTime), CAST(0x000095A900000000 AS DateTime), NULL, NULL, 10, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (231, CAST(0x000095A100000000 AS DateTime), CAST(0x000095AA00000000 AS DateTime), NULL, NULL, 92, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (232, CAST(0x000095A200000000 AS DateTime), CAST(0x000095A800000000 AS DateTime), NULL, N'Tustomer requested special shippment. The instructions were passed along to the warehouse', 118, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (233, CAST(0x000095A200000000 AS DateTime), CAST(0x000095AA00000000 AS DateTime), CAST(0x000095A300000000 AS DateTime), NULL, 30, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (234, CAST(0x000095A300000000 AS DateTime), CAST(0x000095AC00000000 AS DateTime), NULL, NULL, 9, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (235, CAST(0x000095A400000000 AS DateTime), CAST(0x000095AD00000000 AS DateTime), CAST(0x000095A400000000 AS DateTime), NULL, 12, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (236, CAST(0x000095A400000000 AS DateTime), CAST(0x000095AE00000000 AS DateTime), CAST(0x000095A800000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (237, CAST(0x000095A500000000 AS DateTime), CAST(0x000095AB00000000 AS DateTime), CAST(0x000095A900000000 AS DateTime), NULL, 24, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (238, CAST(0x000095A600000000 AS DateTime), CAST(0x000095AF00000000 AS DateTime), NULL, NULL, 99, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (239, CAST(0x000095A700000000 AS DateTime), CAST(0x000095B100000000 AS DateTime), CAST(0x000095AC00000000 AS DateTime), NULL, 90, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (240, CAST(0x000095A800000000 AS DateTime), CAST(0x000095AF00000000 AS DateTime), NULL, NULL, 94, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (241, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, N'Tustomer is interested in buying more Ferrari models', 40, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (242, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 91, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (244, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 81, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (245, CAST(0x000095AA00000000 AS DateTime), CAST(0x000095B100000000 AS DateTime), NULL, NULL, 80, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (246, CAST(0x000095AA00000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 1, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (247, CAST(0x000095AE00000000 AS DateTime), CAST(0x000095B400000000 AS DateTime), NULL, NULL, 2, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (249, CAST(0x0000959200000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, NULL, 107, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (250, CAST(0x000095B000000000 AS DateTime), CAST(0x000095B600000000 AS DateTime), NULL, NULL, 16, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (251, CAST(0x000095B100000000 AS DateTime), CAST(0x000095B700000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (252, CAST(0x000095B200000000 AS DateTime), CAST(0x000095BA00000000 AS DateTime), NULL, NULL, 71, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (253, CAST(0x000095B200000000 AS DateTime), CAST(0x000095BB00000000 AS DateTime), NULL, NULL, 32, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (254, CAST(0x000095B300000000 AS DateTime), CAST(0x000095BA00000000 AS DateTime), NULL, NULL, 101, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (255, CAST(0x000095B300000000 AS DateTime), CAST(0x000095B900000000 AS DateTime), NULL, NULL, 70, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (256, CAST(0x000095B600000000 AS DateTime), CAST(0x000095BD00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (257, CAST(0x000095B800000000 AS DateTime), CAST(0x000095BE00000000 AS DateTime), NULL, NULL, 51, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (258, CAST(0x000095B900000000 AS DateTime), CAST(0x000095BF00000000 AS DateTime), CAST(0x000095BD00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (259, CAST(0x000095B900000000 AS DateTime), CAST(0x000095BF00000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (260, CAST(0x000095BE00000000 AS DateTime), CAST(0x000095C600000000 AS DateTime), NULL, NULL, 81, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (261, CAST(0x000095BF00000000 AS DateTime), CAST(0x000095C500000000 AS DateTime), NULL, NULL, 122, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (263, CAST(0x000095D300000000 AS DateTime), CAST(0x000095DE00000000 AS DateTime), CAST(0x000095D800000000 AS DateTime), NULL, 18, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (264, CAST(0x000095D400000000 AS DateTime), CAST(0x000095DA00000000 AS DateTime), NULL, NULL, 74, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (265, CAST(0x000095D400000000 AS DateTime), CAST(0x000095DF00000000 AS DateTime), NULL, NULL, 80, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (266, CAST(0x000095D500000000 AS DateTime), CAST(0x000095E000000000 AS DateTime), NULL, NULL, 68, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (267, CAST(0x000095D800000000 AS DateTime), CAST(0x000095E100000000 AS DateTime), CAST(0x000095DA00000000 AS DateTime), NULL, 90, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (268, CAST(0x000095DA00000000 AS DateTime), CAST(0x000095E300000000 AS DateTime), CAST(0x000095DE00000000 AS DateTime), NULL, 36, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (269, CAST(0x000095E100000000 AS DateTime), CAST(0x000095E900000000 AS DateTime), CAST(0x000095E600000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (270, CAST(0x000095E200000000 AS DateTime), CAST(0x000095EA00000000 AS DateTime), NULL, NULL, 89, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (272, CAST(0x000095E500000000 AS DateTime), CAST(0x000095F000000000 AS DateTime), CAST(0x000095E700000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (273, CAST(0x000095E800000000 AS DateTime), CAST(0x000095F200000000 AS DateTime), NULL, NULL, 94, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (274, CAST(0x000095ED00000000 AS DateTime), CAST(0x000095F500000000 AS DateTime), NULL, NULL, 65, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (276, CAST(0x000095F000000000 AS DateTime), CAST(0x000095F700000000 AS DateTime), NULL, NULL, 4, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (277, CAST(0x000095F500000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 41, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (278, CAST(0x000095F600000000 AS DateTime), CAST(0x0000960200000000 AS DateTime), NULL, N'Tautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 29, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (279, CAST(0x000095F700000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (280, CAST(0x000095F700000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (281, CAST(0x000095FD00000000 AS DateTime), CAST(0x0000960500000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (282, CAST(0x000095FE00000000 AS DateTime), CAST(0x0000960600000000 AS DateTime), NULL, NULL, 69, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (283, CAST(0x000095FE00000000 AS DateTime), CAST(0x0000960400000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (284, CAST(0x0000960300000000 AS DateTime), CAST(0x0000960B00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (285, CAST(0x0000960400000000 AS DateTime), CAST(0x0000960F00000000 AS DateTime), NULL, NULL, 69, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (286, CAST(0x0000960900000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), CAST(0x0000960A00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (287, CAST(0x0000960A00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), NULL, N'Tisputed then Resolved on 3/15/2005. Customer doesn''t like the craftsmaship of the models.', 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (288, CAST(0x0000960B00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), NULL, N'Te need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 15, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (289, CAST(0x0000960C00000000 AS DateTime), CAST(0x0000961400000000 AS DateTime), NULL, NULL, 109, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (290, CAST(0x0000960C00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), CAST(0x0000961100000000 AS DateTime), NULL, 102, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (291, CAST(0x0000960D00000000 AS DateTime), CAST(0x0000961400000000 AS DateTime), CAST(0x0000961000000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (293, CAST(0x0000961300000000 AS DateTime), CAST(0x0000961B00000000 AS DateTime), NULL, NULL, 104, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (294, CAST(0x0000961400000000 AS DateTime), CAST(0x0000961F00000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 70, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (295, CAST(0x0000961800000000 AS DateTime), CAST(0x0000962200000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (296, CAST(0x0000961A00000000 AS DateTime), CAST(0x0000962100000000 AS DateTime), NULL, N'Te must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 51, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (297, CAST(0x0000962000000000 AS DateTime), CAST(0x0000962A00000000 AS DateTime), CAST(0x0000962500000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (298, CAST(0x0000962500000000 AS DateTime), CAST(0x0000963100000000 AS DateTime), CAST(0x0000962900000000 AS DateTime), NULL, 48, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (299, CAST(0x0000962700000000 AS DateTime), CAST(0x0000963100000000 AS DateTime), NULL, NULL, 81, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (300, CAST(0x0000962900000000 AS DateTime), CAST(0x0000963400000000 AS DateTime), NULL, NULL, 122, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (301, CAST(0x0000962900000000 AS DateTime), CAST(0x0000963300000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 103, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (302, CAST(0x0000962B00000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), CAST(0x0000962A00000000 AS DateTime), NULL, 72, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (303, CAST(0x0000962F00000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), NULL, NULL, 95, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (304, CAST(0x0000963000000000 AS DateTime), CAST(0x0000963A00000000 AS DateTime), NULL, NULL, 33, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (305, CAST(0x0000963000000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), NULL, NULL, 70, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (306, CAST(0x0000963600000000 AS DateTime), CAST(0x0000964000000000 AS DateTime), NULL, NULL, 38, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (307, CAST(0x0000963700000000 AS DateTime), CAST(0x0000964100000000 AS DateTime), NULL, N'Tustomer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.', 13, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (308, CAST(0x0000963E00000000 AS DateTime), CAST(0x0000964A00000000 AS DateTime), NULL, N'Tustomer credit limit exceeded. Will ship when a payment is received.', 103, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (309, CAST(0x0000963E00000000 AS DateTime), CAST(0x0000964500000000 AS DateTime), NULL, NULL, 94, N'TAITING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (310, CAST(0x0000963F00000000 AS DateTime), CAST(0x0000964B00000000 AS DateTime), NULL, NULL, 19, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (311, CAST(0x0000964500000000 AS DateTime), CAST(0x0000965000000000 AS DateTime), NULL, NULL, 83, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (312, CAST(0x0000964700000000 AS DateTime), CAST(0x0000964E00000000 AS DateTime), NULL, NULL, 44, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (313, CAST(0x0000964900000000 AS DateTime), CAST(0x0000965300000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (314, CAST(0x0000964B00000000 AS DateTime), CAST(0x0000965400000000 AS DateTime), NULL, N'Tustomer requested that DHL is used for this shipping', 26, N'TROCESSING')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (315, CAST(0x0000964C00000000 AS DateTime), CAST(0x0000965300000000 AS DateTime), NULL, N'Tustomer credit limit exceeded. Will ship when a payment is received.', 85, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (317, CAST(0x0000965000000000 AS DateTime), CAST(0x0000965600000000 AS DateTime), NULL, NULL, 93, N'TISPUTED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (318, CAST(0x0000965300000000 AS DateTime), CAST(0x0000965900000000 AS DateTime), NULL, N'Tustomer doesn''t like the colors and precision of the models.', 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (319, CAST(0x0000965600000000 AS DateTime), CAST(0x0000965E00000000 AS DateTime), NULL, NULL, 97, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (320, CAST(0x0000965700000000 AS DateTime), CAST(0x0000966200000000 AS DateTime), NULL, NULL, 91, N'TANCELLED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (322, CAST(0x0000966300000000 AS DateTime), CAST(0x0000966B00000000 AS DateTime), CAST(0x0000962B00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (323, CAST(0x0000966400000000 AS DateTime), CAST(0x0000967000000000 AS DateTime), NULL, NULL, 17, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (324, CAST(0x0000966400000000 AS DateTime), CAST(0x0000966A00000000 AS DateTime), CAST(0x0000962C00000000 AS DateTime), NULL, 66, N'THIPPED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (325, CAST(0x0000966500000000 AS DateTime), CAST(0x0000966D00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ([id], [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (326, CAST(0x0000966500000000 AS DateTime), CAST(0x0000966C00000000 AS DateTime), NULL, NULL, 4, N'TAITING')
INSERT [dbo].[productlines] ([id], [name], [description]) VALUES (1, N'Tlassic Cars', N'Tttention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')
INSERT [dbo].[productlines] ([id], [name], [description]) VALUES (2, N'Totorcycles', N'Tur motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.')
INSERT [dbo].[productlines] ([id], [name], [description]) VALUES (3, N'Tlanes', N'Tnique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.')
INSERT [dbo].[productlines] ([id], [name], [description]) VALUES (4, N'Thips', N'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.')
INSERT [dbo].[productlines] ([id], [name], [description]) VALUES (5, N'Trains', N'Todel trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.')
INSERT [dbo].[productlines] ([id], [name], [description]) VALUES (6, N'Trucks and Buses', N'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.')
INSERT [dbo].[productlines] ([id], [name], [description]) VALUES (7, N'Tintage Cars', N'Tur Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (1, N'T969 Harley Davidson Ultimate Chopper', N'T:10', N'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 7933, 917, CAST(48.81 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (2, N'T952 Alpine Renault 1300', N'T:10', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 7305, 778, CAST(98.58 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (3, N'T996 Moto Guzzi 1100i', N'T:10', N'Tfficial Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 6625, 891, CAST(68.99 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (4, N'T003 Harley-Davidson Eagle Drag Bike', N'T:10', N'Todel features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand
, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', 5582, 867, CAST(91.02 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (5, N'T972 Alfa Romeo GTA', N'T:10', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3252, 842, CAST(85.68 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (6, N'T962 LanciaA Delta 16V', N'T:10', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6791, 726, CAST(103.42 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (7, N'T968 Ford Mustang', N'T:12', N'Tood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, 834, CAST(95.34 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (8, N'T001 Ferrari Enzo', N'T:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3619, 815, CAST(95.59 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (9, N'T958 Setra Bus', N'T:12', N'Todel features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579, 798, CAST(77.90 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (10, N'T002 Suzuki XREO', N'T:12', N'Tfficial logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 9997, 883, CAST(66.27 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (11, N'T969 Corvair Monza', N'T:18', N'T:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', 6906, 799, CAST(89.14 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (12, N'T968 Dodge Charger', N'T:12', N'T:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, 771, CAST(75.16 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (13, N'T969 Ford Falcon', N'T:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 1049, 759, CAST(83.05 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (14, N'T970 Plymouth Hemi Cuda', N'T:12', N'Tery detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', 5663, 802, CAST(31.92 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (15, N'T957 Chevy Pickup', N'T:12', N'T:12 scale die-cast about 20" long Hood opens, Rubber wheels', 6125, 870, CAST(55.70 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (16, N'T969 Dodge Charger', N'T:12', N'Tetailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', 7323, 866, CAST(58.73 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (17, N'T940 Ford Pickup Truck', N'T:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 2613, 806, CAST(58.33 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (18, N'T993 Mazda RX-7', N'T:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, 886, CAST(83.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (19, N'T937 Lincoln Berline', N'T:18', N'Teatures opening engine cover, doors, trunk, and fuel filler cap. Color black', 8693, 997, CAST(60.62 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (20, N'T936 Mercedes-Benz 500K Special Roadster', N'T:18', N'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', 8635, 876, CAST(24.26 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (21, N'T965 Aston Martin DB5', N'T:18', N'Tie-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, 828, CAST(65.96 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (22, N'T980s Black Hawk Helicopter', N'T:18', N'T:18 scale replica of actual Army''s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', 5330, 882, CAST(77.27 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (23, N'T917 Grand Touring Sedan', N'T:18', N'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', 2724, 747, CAST(86.70 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (24, N'T948 Porsche 356-A Roadster', N'T:18', N'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8826, 837, CAST(53.90 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (25, N'T995 Honda Civic', N'T:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', 9772, 813, CAST(93.89 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (26, N'T998 Chrysler Plymouth Prowler', N'T:18', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 4724, 814, CAST(101.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (27, N'T911 Ford Town Car', N'T:18', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.', 540, 649, CAST(33.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (28, N'T964 Mercedes Tour Bus', N'T:18', N'Txact replica. 100+ parts. working steering system, original logos', 8258, 892, CAST(74.86 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (29, N'T932 Model A Ford J-Coupe', N'T:18', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', 9354, 780, CAST(58.48 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (30, N'T926 Ford Fire Engine', N'T:18', N'Tleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', 2018, 753, CAST(24.92 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (31, N'T-51-D Mustang', N'T:72', N'Tas retractable wheels and comes with a stand', 992, 800, CAST(49.00 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (32, N'T936 Harley Davidson El Knucklehead', N'T:18', N'Tntricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', 4357, 763, CAST(24.23 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (33, N'T928 Mercedes-Benz SSK', N'T:18', N'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', 548, 686, CAST(72.56 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (34, N'T999 Indy 500 Monte Carlo SS', N'T:18', N'Teatures include opening and closing doors. Color: Red', 8164, 806, CAST(56.76 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (35, N'T913 Ford Model T Speedster', N'T:18', N'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', 4189, 880, CAST(60.78 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (36, N'T934 Ford V8 Coupe', N'T:18', N'Throme Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 5649, 807, CAST(34.35 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (37, N'T999 Yamaha Speed Boat', N'T:18', N'Txact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 4259, 736, CAST(51.61 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (38, N'T8th Century Vintage Horse Carriage', N'T:18', N'Tand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.

This collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', 5992, 741, CAST(60.74 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (39, N'T903 Ford Model A', N'T:18', N'Teatures opening trunk,  working steering system', 3913, 607, CAST(68.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (40, N'T992 Ferrari 360 Spider red', N'T:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8347, 1603, CAST(77.90 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (41, N'T985 Toyota Supra', N'T:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 7733, 0, CAST(57.01 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (42, N'Tollectable Wooden Train', N'T:18', N'Tand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', 6450, 673, CAST(67.56 AS Numeric(10, 2)), 5)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (43, N'T969 Dodge Super Bee', N'T:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 1917, 889, CAST(49.05 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (44, N'T917 Maxwell Touring Car', N'T:18', N'Teatures Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 7913, 830, CAST(57.54 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (45, N'T976 Ford Gran Torino', N'T:18', N'Tighly detailed 1976 Ford Gran Torino "Starsky and Hutch" diecast model. Very well constructed and painted in red and white patterns.', 9127, 798, CAST(73.49 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (46, N'T948 Porsche Type 356 Roadster', N'T:18', N'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.', 8990, 902, CAST(62.16 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (47, N'T957 Vespa GS150', N'T:18', N'Teatures rotating wheels , working kick stand. Comes with stand.', 7689, 840, CAST(32.95 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (48, N'T941 Chevrolet Special Deluxe Cabriolet', N'T:18', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', 2378, 787, CAST(64.58 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (49, N'T970 Triumph Spitfire', N'T:18', N'Teatures include opening and closing doors. Color: White.', 5545, 867, CAST(91.92 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (50, N'T932 Alfa Romeo 8C2300 Spider Sport', N'T:18', N'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', 6553, 671, CAST(43.26 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (51, N'T904 Buick Runabout', N'T:18', N'Teatures opening trunk,  working steering system', 8290, 726, CAST(52.66 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (52, N'T940s Ford truck', N'T:18', N'This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940''s Pick-Up truck is painted in classic dark green color, and features rotating wheels.', 3128, 775, CAST(84.76 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (53, N'T939 Cadillac Limousine', N'T:18', N'Teatures completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles', 6645, 770, CAST(23.14 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (54, N'T957 Corvette Convertible', N'T:18', N'T957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.', 1249, 933, CAST(69.93 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (55, N'T957 Ford Thunderbird', N'T:18', N'This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.', 3209, 591, CAST(34.21 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (56, N'T970 Chevy Chevelle SS 454', N'T:24', N'This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.', 1005, 676, CAST(49.24 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (57, N'T970 Dodge Coronet', N'T:24', N'T:24 scale die-cast about 18" long doors open, hood opens and rubber wheels', 4074, 832, CAST(32.37 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (58, N'T997 BMW R 1100 S', N'T:24', N'Tetailed scale replica with working suspension and constructed from over 70 parts', 7003, 795, CAST(60.86 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (59, N'T966 Shelby Cobra 427 S/C', N'T:24', N'This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it''s own display case.', 8197, 828, CAST(29.18 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (60, N'T928 British Royal Navy Airplane', N'T:24', N'Tfficial logos and insignias', 3627, 822, CAST(66.74 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (61, N'T939 Chevrolet Deluxe Coupe', N'T:24', N'This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.', 7332, 771, CAST(22.57 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (62, N'T960 BSA Gold Star DBD34', N'T:24', N'Tetailed scale replica with working suspension and constructed from over 70 parts', 15, 890, CAST(37.32 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (63, N'T8th century schooner', N'T:24', N'Tll wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.', 1898, 713, CAST(82.34 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (64, N'T938 Cadillac V-16 Presidential Limousine', N'T:24', N'This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.', 2847, 768, CAST(20.61 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (65, N'T962 Volkswagen Microbus', N'T:24', N'This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.', 2327, 740, CAST(61.34 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (66, N'T982 Ducati 900 Monster', N'T:24', N'Teatures two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 6840, 856, CAST(47.10 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (67, N'T949 Jaguar XK 120', N'T:24', N'Trecision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 2350, 791, CAST(47.25 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (68, N'T958 Chevy Corvette Limited Edition', N'T:24', N'The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.', 2542, 810, CAST(15.91 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (69, N'T900s Vintage Bi-Plane', N'T:24', N'Tand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.', 5942, 820, CAST(34.25 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (70, N'T952 Citroen-15CV', N'T:24', N'Trecision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.', 1452, 705, CAST(72.82 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (71, N'T982 Lamborghini Diablo', N'T:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7723, 777, CAST(16.24 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (72, N'T912 Ford Model T Delivery Wagon', N'T:24', N'This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.', 9173, 722, CAST(46.91 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (73, N'T969 Chevrolet Camaro Z28', N'T:24', N'T969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.', 4695, 719, CAST(50.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (74, N'T971 Alpine Renault 1600s', N'T:24', N'This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7995, 870, CAST(38.58 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (75, N'T937 Horch 930V Limousine', N'T:24', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', 2902, 768, CAST(26.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (76, N'T002 Chevy Corvette', N'T:24', N'The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.', 9446, 757, CAST(62.11 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (77, N'T940 Ford Delivery Sedan', N'T:24', N'Throme Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.', 6621, 640, CAST(48.64 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (78, N'T956 Porsche 356A Coupe', N'T:18', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6600, 925, CAST(98.30 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (79, N'Torsair F4U ( Bird Cage)', N'T:24', N'Tas retractable wheels and comes with a stand. Official logos and insignias.', 6812, 897, CAST(29.34 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (80, N'T936 Mercedes Benz 500k Roadster', N'T:24', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.', 2081, 635, CAST(21.75 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (81, N'T992 Porsche Cayenne Turbo Silver', N'T:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 6582, 747, CAST(69.78 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (82, N'T936 Chrysler Airflow', N'T:24', N'Teatures opening trunk,  working steering system. Color dark green.', 4710, 878, CAST(57.46 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (83, N'T900s Vintage Tri-Plane', N'T:24', N'Tand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.', 2756, 801, CAST(36.23 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (84, N'T961 Chevrolet Impala', N'T:18', N'This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.', 7869, 888, CAST(32.33 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (85, N'T980’s GM Manhattan Express', N'T:32', N'This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.', 5099, 706, CAST(53.93 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (86, N'T997 BMW F650 ST', N'T:32', N'Teatures official die-struck logos and baked enamel finish. Comes with stand.', 178, 863, CAST(66.92 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (87, N'T982 Ducati 996 R', N'T:32', N'Teatures rotating wheels , working kick stand. Comes with stand.', 9241, 801, CAST(24.14 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (88, N'T954 Greyhound Scenicruiser', N'T:32', N'Todel features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos', 2874, 809, CAST(25.98 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (89, N'T950''s Chicago Surface Lines Streetcar', N'T:32', N'This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 8601, 722, CAST(26.72 AS Numeric(10, 2)), 5)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (90, N'T996 Peterbilt 379 Stake Bed with Outrigger', N'T:32', N'This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab', 814, 827, CAST(33.61 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (91, N'T928 Ford Phaeton Deluxe', N'T:32', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system', 136, 825, CAST(33.02 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (92, N'T974 Ducati 350 Mk3 Desmo', N'T:32', N'This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 3341, 796, CAST(56.13 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (93, N'T930 Buick Marquette Phaeton', N'T:50', N'Teatures opening trunk,  working steering system', 7062, 929, CAST(27.06 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (94, N'Tiamond T620 Semi-Skirted Tanker', N'T:50', N'This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.', 1016, 836, CAST(68.29 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (95, N'T962 City of Detroit Streetcar', N'T:50', N'This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 1645, 853, CAST(37.49 AS Numeric(10, 2)), 5)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (96, N'T002 Yamaha YZR M1', N'T:50', N'Teatures rotating wheels , working kick stand. Comes with stand.', 600, 888, CAST(34.17 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (97, N'The Schooner Bluenose', N'T:700', N'Tll wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.
The schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.', 1897, 595, CAST(34.00 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (98, N'Tmerican Airlines: B767-300', N'T:700', N'Txact replia with official logos and insignias and retractable wheels', 5841, 830, CAST(51.15 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (99, N'The Mayflower', N'T:700', N'Teasures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches wide
All wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.', 737, 698, CAST(43.30 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (100, N'TMS Bounty', N'T:700', N'Teasures 30 inches Long x 27 1/2 inches High x 4 3/4 inches wide. 
Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 3501, 757, CAST(39.83 AS Numeric(10, 2)), 4)
GO
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (101, N'Tmerica West Airlines B757-200', N'T:700', N'Tfficial logos and insignias. Working steering system. Rotating jet engines', 9653, 808, CAST(68.80 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (102, N'The USS Constitution Ship', N'T:700', N'Tll wood with canvas sails. Measures 31 1/2" Length x 22 3/8" High x 8 1/4" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.', 7083, 791, CAST(33.97 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (103, N'T982 Camaro Z28', N'T:18', N'Teatures include opening and closing doors. Color: White.  Measures approximately 9 1/2" Long.', 6934, 727, CAST(46.53 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (104, N'TTA: B757-300', N'T:700', N'Txact replia with official logos and insignias and retractable wheels', 7106, 871, CAST(59.33 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (105, N'T/A 18 Hornet 1/72', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 551, 890, CAST(54.40 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (106, N'The Titanic', N'T:700', N'Tompleted model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', 1956, 765, CAST(51.09 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (107, N'The Queen Mary', N'T:700', N'Txact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 5088, 700, CAST(53.63 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (108, N'Tmerican Airlines: MD-11S', N'T:700', N'Tolished finish. Exact replia with official logos and insignias and retractable wheels', 8820, 927, CAST(36.27 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (109, N'Toeing X-32A JSF', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 4857, 756, CAST(32.77 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ([id], [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (110, N'Tont Yacht', N'T:72', N'Teasures 38 inches Long x 33 3/4 inches High. Includes a stand. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', 414, 742, CAST(33.30 AS Numeric(10, 2)), 4)


ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_countries] FOREIGN KEY([countryId])
REFERENCES [dbo].[countries] ([id])
GO

ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_countries]
GO

ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_products] FOREIGN KEY([productId])
REFERENCES [dbo].[products] ([id])
GO

ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_products]
GO


ALTER TABLE [dbo].[orderdetails]  WITH CHECK ADD  CONSTRAINT [FK_orderdetails_orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[orders] ([id])
GO

ALTER TABLE [dbo].[orderdetails] CHECK CONSTRAINT [FK_orderdetails_orders]
GO

ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[customers] ([id])
GO

ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers]
GO

ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_productlines] FOREIGN KEY([productlineId])
REFERENCES [dbo].[productlines] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_productlines]
GO
USE [master]
GO
ALTER DATABASE [toysforboys] SET  READ_WRITE 
GO
