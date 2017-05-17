USE [master]
GO
/****** Object:  Database [toysforboys]    Script Date: 11/05/2017 13:51:29 ******/
CREATE DATABASE [toysforboys]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'toysforboys', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\toysforboys.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'toysforboys_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\toysforboys_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
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
	[id] [int] NOT NULL IDENTITY(2,1),
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_countries]  PRIMARY KEY CLUSTERED 
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
	[id] [int] NOT NULL IDENTITY(1,1),
	[name] [nvarchar](50) NULL,
	[streetAndNumber] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](15) NULL,
	[postalCode] [nvarchar](15) NULL,
	[countryId] [int] NULL,
	[email] [nvarchar](50) NULL,

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
	[id] [int] NOT NULL IDENTITY(1,1),
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
	[id] [int] NOT NULL IDENTITY(1,1),
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
	[id] [int] NOT NULL IDENTITY(1,1),
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

INSERT [dbo].[countries] ([name]) VALUES (N'Austria')
INSERT [dbo].[countries] ([name]) VALUES (N'Belgium')
INSERT [dbo].[countries] ([name]) VALUES (N'Canada')
INSERT [dbo].[countries] ([name]) VALUES (N'Denmark')
INSERT [dbo].[countries] ([name]) VALUES (N'Finland')
INSERT [dbo].[countries] ([name]) VALUES (N'France')
INSERT [dbo].[countries] ([name]) VALUES (N'Germany')
INSERT [dbo].[countries] ([name]) VALUES (N'Hong Kong')
INSERT [dbo].[countries] ([name]) VALUES ( N'Ireland')
INSERT [dbo].[countries] ([name]) VALUES ( N'Israel')
INSERT [dbo].[countries] ([name]) VALUES ( N'Italy')
INSERT [dbo].[countries] ([name]) VALUES ( N'Japan')
INSERT [dbo].[countries] ([name]) VALUES ( N'Netherlands')
INSERT [dbo].[countries] ([name]) VALUES ( N'New Zealand')
INSERT [dbo].[countries] ([name]) VALUES ( N'Norway  ')
INSERT [dbo].[countries] ([name]) VALUES ( N'Philippines')
INSERT [dbo].[countries] ([name]) VALUES ( N'Poland')
INSERT [dbo].[countries] ([name]) VALUES ( N'Portugal')
INSERT [dbo].[countries] ([name]) VALUES ( N'Russia')
INSERT [dbo].[countries] ([name]) VALUES ( N'Singapore')
INSERT [dbo].[countries] ([name]) VALUES ( N'South Africa')
INSERT [dbo].[countries] ([name]) VALUES ( N'Spain')
INSERT [dbo].[countries] ([name]) VALUES ( N'Sweden')
INSERT [dbo].[countries] ([name]) VALUES ( N'Switzerland')
INSERT [dbo].[countries] ([name]) VALUES ( N'UK')
INSERT [dbo].[countries] ([name]) VALUES ( N'USA')
GO

INSERT [dbo].[productlines] ( [name], [description]) VALUES ( N'Tlassic Cars', N'Tttention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')
INSERT [dbo].[productlines] ( [name], [description]) VALUES ( N'Totorcycles', N'Tur motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.')
INSERT [dbo].[productlines] ( [name], [description]) VALUES ( N'Tlanes', N'Tnique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.')
INSERT [dbo].[productlines] ( [name], [description]) VALUES ( N'Thips', N'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.')
INSERT [dbo].[productlines] ( [name], [description]) VALUES ( N'Trains', N'Todel trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.')
INSERT [dbo].[productlines] ( [name], [description]) VALUES ( N'Trucks and Buses', N'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.')
GO


INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tignal Gift Stores', N'T489 Strong St.', N'Tas Vegas', N'TV', N'T3030', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Ta Rochelle Gifts', N'T7, rue des Cinquante Otages', N'Tantes', NULL, N'T4000', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Taane Mini Imports', N'Trling Skakkes gate 78', N'Ttavern', NULL, N'T110', 16)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tini Gifts Distributors Ltd.', N'T677 Strong St.', N'Tan Rafael', N'TA', N'T7562', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tavel & Zbyszek Co', N'Tl. Filtrowa 68', N'Tarszawa', NULL, N'T1-012', 18)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tlauer See Auto, Co.', N'Tyonerstr. 34', N'Trankfurt', NULL, N'T0528', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tini Wheels Co.', N'T557 North Pendale Street', N'Tan Francisco', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tand of Toys Inc.', N'T97 Long Airport Avenue', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Turo+ Shopping Channel', N'T/ Moralzarzal, 86', N'Tadrid', NULL, N'T8034', 23)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tolvo Model Replicas, Co', N'Terguvsvägen  8', N'Tuleå', NULL, N'T-958 22', 24)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tanish Wholesale Imports', N'Tinbæltet 34', N'Tobenhavn', NULL, N'T734', 5)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Taveley & Henriot, Co.', N'T, rue du Commerce', N'Tyon', NULL, N'T9004', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tragon Souveniers, Ltd.', N'Tronz Sok.', N'Tingapore', NULL, N'T79903', 21)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tuscle Machine Inc', N'T092 Furth Circle', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tiecast Classics Inc.', N'T586 Pompton St.', N'Tllentown', N'TA', N'T0267', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Technics Stores Inc.', N'T408 Furth Circle', N'Turlingame', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tandji Gifts& Co', N'T06 Linden Road Sandown', N'Tingapore', NULL, N'T69045', 21)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Terkku Gifts', N'Trehmen St. 121', N'Tergen', NULL, N'T 5804', 16)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tmerican Souvenirs Inc', N'T49 Spinnaker Dr.', N'Tew Haven', N'TT', N'T7823', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Torto Imports Co.', N'Tstrada da saúde n. 58', N'Tisboa', NULL, N'T756', 19)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Taedalus Designs Imports', N'T84, chaussée de Tournai', N'Tille', NULL, N'T9000', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Ta Corne D''abondance, Co.', N'T65, boulevard Charonne', N'Taris', NULL, N'T5012', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tambridge Collectables Co.', N'T658 Baden Av.', N'Tambridge', N'TA', N'T1247', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tift Depot Inc.', N'T5593 South Bay Ln.', N'Tridgewater', N'TT', N'T7562', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tsaka Souveniers Co.', N'T-6-20 Dojima', N'Tita-ku', N'Tsaka', N'T530-0003', 13)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Titachrome Inc.', N'T678 Kingston Rd.', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Toys of Finland, Co.', N'Teskuskatu 45', N'Telsinki', NULL, N'T1240', 6)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'TV Stores, Co.', N'Tauntleroy Circus', N'Tanchester', NULL, N'TC2 5NT', 26)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tlover Collections, Co.', N'T5 Maiden Lane', N'Tublin', NULL, N'T', 10)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tuto-Moto Classics Inc.', N'T6780 Pompton St.', N'Trickhaven', N'TA', N'T8339', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'TK Collectables, Ltd.', N'T2, Berkeley Gardens Blvd', N'Tiverpool', NULL, N'TX1 6LT', 26)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tanadian Gift Exchange Network', N'T900 Oak St.', N'Tancouver', N'TC', N'T3F 2K1', 4)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tnline Mini Collectables', N'T635 Spinnaker Dr.', N'Trickhaven', N'TA', N'T8339', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Toys4GrownUps.com', N'T8934 Hillside Dr.', N'Tasadena', N'TA', N'T0003', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tsian Shopping Network, Co', N'Tuntec Tower Three', N'Tingapore', NULL, N'T38988', 21)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tini Caravy', N'T4, place Kléber', N'Ttrasbourg', NULL, N'T7000', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Ting Kong Collectables, Co.', N'Tank of China Tower', N'Tentral Hong Kong', NULL, NULL, 9)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tnaco Distributors', N'Tambla de Cataluña, 23', N'Tarcelona', NULL, N'T8022', 23)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Toards & Toys Co.', N'T097 Douglas Av.', N'Tlendale', N'TA', N'T2561', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tatürlich Autos', N'Taucherstraße 10', N'Tunewalde', NULL, N'T1307', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Teintze Collectables', N'Tmagsloget 45', N'Trhus', NULL, N'T200', 5)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tuébec Home Shopping Network', N'T3 rue St. Laurent', N'Tontréal', N'Tuébec', N'T1J 1C3', 4)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'TNG Resellers', N'Tran Vía, 1', N'Tadrid', NULL, N'T8001', 23)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tollectable Mini Designs Co.', N'T61 Furth Circle', N'Tan Diego', N'TA', N'T1217', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tiftsbymail.co.uk', N'Tarden House', N'Towes', N'Tsle of Wight', N'TO31 7PJ', 26)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tlpha Cognac', N'T rue Alsace-Lorraine', N'Toulouse', NULL, N'T1000', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tessner Shopping Network', N'Tagazinweg 7', N'Trankfurt', NULL, N'T0528', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tmica Models & Co.', N'Tia Monte Bianco 34', N'Torino', NULL, N'T0100', 12)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tyon Souveniers', N'T7 rue du Colonel Pierre Avia', N'Taris', NULL, N'T5508', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tuto Associés & Cie.', N'T7, avenue de l''Europe', N'Tersailles', NULL, N'T8000', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Toms Spezialitäten, Ltd', N'Tehrheimerstr. 369', N'Töln', NULL, N'T0739', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Toyal Canadian Collectables, Ltd.', N'T3 Tsawassen Blvd.', N'Tsawassen', N'TC', N'T2F 8M4', 4)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tranken Gifts, Co', N'Terliner Platz 43', N'Tünchen', NULL, N'T0805', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tovelli Gifts', N'Tia Ludovico il Moro 22', N'Tergamo', NULL, N'T4100', 12)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tarta''s Replicas Co.', N'T9323 Spinnaker Dr.', N'Tambridge', N'TA', N'T1247', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'TG&E Collectables', N'Tte des Arsenaux 41 ', N'Tribourg', NULL, N'T700', 25)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tida Sport, Ltd', N'Trenzacherweg 237', N'Tenève', NULL, N'T203', 25)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Torway Gifts By Mail, Co.', N'Trammensveien 126A', N'Tslo', NULL, N'T 0106', 16)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tchuyler Imports', N'Tingsfordweg 151', N'Tmsterdam', NULL, N'T043 GR', 14)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Ter Hund Imports', N'Tbere Str. 57', N'Terlin', NULL, N'T2209', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tulu Toy Supplies, Inc.', N'Torikatu 38', N'Tulu', NULL, N'T0110', 6)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tetit Auto', N'Tue Joseph-Bens 532', N'Truxelles', NULL, N'T-1180', 3)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tini Classics', N'T758 North Pendale Street', N'Thite Plains', N'TY', N'T4067', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tini Creations Ltd.', N'T575 Hillside Dr.', N'Tew Bedford', N'TA', N'T0553', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Torporate Gift Ideas Co.', N'T734 Strong St.', N'Tan Francisco', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Town Under Souveniers, Inc', N'T62-164 Grafton Road', N'Tuckland  ', NULL, NULL, 15)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Ttylish Desk Decors, Co.', N'T5 King George', N'Tondon', NULL, N'TX3 6FW', 26)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tekni Collectables Inc.', N'T476 Moss Rd.', N'Tewark', N'TJ', N'T4019', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tuominen Souveniers', N'Toftware Engineering Center', N'Tspoo', NULL, N'TIN-02271', 6)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tramer Spezialitäten, Ltd', N'Taubelstr. 90', N'Trandenburg', NULL, N'T4776', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tlassic Gift Ideas, Inc', N'T82 First Street', N'Thiladelphia', N'TA', N'T1270', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'TAF Imports', N'Terchants House', N'Tadrid', NULL, N'T8023', 23)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Ten ''R'' US Retailers, Ltd.', N'T047 Douglas Av.', N'Tos Angeles', N'TA', N'T1003', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tsian Treasures, Inc.', N'T Johnstown Road', N'Tork', N'To. Cork', NULL, 10)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tarseille Mini Autos', N'T2, rue des Bouchers', N'Tarseille', NULL, N'T3008', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Teims Collectables', N'T9 rue de l''Abbaye', N'Teims', NULL, N'T1100', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'TAR Distributors, Co', N'T250 Pretorius Street', N'Tatfield', N'Tretoria', N'T028', 22)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'TiftsForHim.com', N'T99 Great North Road', N'Tuckland', NULL, NULL, 15)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tommission Auto', N'Tuisenstr. 48', N'Tünster', NULL, N'T4087', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tifts4AllAges.com', N'T616 Spinnaker Dr.', N'Toston', N'TA', N'T1003', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tnline Diecast Creations Co.', N'T304 Long Airport Avenue', N'Tashua', N'TH', N'T2005', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tisboa Souveniers, Inc', N'Tardim das rosas n. 32', N'Tisboa', NULL, N'T675', 19)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Trecious Collectables', N'Tauptstr. 29', N'Tern', NULL, N'T012', 25)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tollectables For Less Inc.', N'T825 Douglas Av.', N'Trickhaven', N'TA', N'T8339', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Toyale Belge', N'Toulevard Tirou, 255', N'Tharleroi', NULL, N'T-6000', 3)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Talzburg Collectables', N'Teislweg 14', N'Talzburg', NULL, N'T020', 2)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Truz & Sons Co.', N'T5 McCallum Street', N'Takati City', NULL, N'T227 MM', 17)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'T''ordine Souveniers', N'Ttrada Provinciale 124', N'Teggio Emilia', NULL, N'T2100', 12)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tokyo Collectables, Ltd', N'T-2-8 Roppongi', N'Tinato-ku', N'Tokyo', N'T06-0032', 13)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tuto Canal+ Petit', N'T5, rue Lauriston', N'Taris', NULL, N'T5016', 7)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Ttuttgart Collectable Exchange', N'Tdenauerallee 900', N'Ttuttgart', NULL, N'T0563', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Txtreme Desk Decorations, Ltd', N'T01 Lambton Quay', N'Tellington', NULL, NULL, 15)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tavarian Collectables Imports, Co.', N'Tansastr. 15', N'Tunich', NULL, N'T0686', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES (N'Tlassic Legends Inc.', N'T905 Pompton St.', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Teuer Online Stores, Inc', N'Teerstr. 22', N'Teipzig', NULL, N'T4179', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tift Ideas Corp.', N'T440 Pompton St.', N'Tlendale', N'TT', N'T7561', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tcandinavian Gift Ideas', N'Tkergatan 24', N'Träcke', NULL, N'T-844 67', 24)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'The Sharp Gifts Warehouse', N'T086 Ingle Ln.', N'Tan Jose', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tini Auto Werke', N'Tirchgasse 6', N'Traz', NULL, N'T010', 2)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tuper Scale Inc.', N'T67 North Pendale Street', N'Tew Haven', N'TT', N'T7823', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Ticroscale Inc.', N'T290 North Pendale Street', N'TYC', N'TY', N'T0022', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Torrida Auto Replicas, Ltd', N'T/ Araquil, 67', N'Tadrid', NULL, N'T8023', 23)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tarburg Exchange', N'Talserweg 21', N'Tachen', NULL, N'T2066', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'TunGiftIdeas.com', N'T785 First Street', N'Tew Bedford', N'TA', N'T0553', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tnton Designs, Ltd.', N'T/ Gobelas, 19-1 Urb. La Florida', N'Tadrid', NULL, N'T8023', 23)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Trau da Collezione', N'T0093 Cologno Monzese', N'Tilan', NULL, NULL, 12)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Test Coast Collectables Co.', N'T675 Furth Circle', N'Turbank', N'TA', N'T4019', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tit Vergnügen & Co.', N'Torsterstr. 57', N'Tannheim', NULL, N'T8306', 8)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tremlin Collectables, Co.', N'T Pobedy Square', N'Taint Petersburg', NULL, N'T96143', 20)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Taanan Stores, Inc', N'T Hagalim Blv.', N'Terzlia', NULL, N'T7625', 11)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tberia Gift Imports, Corp.', N'T/ Romero, 33', N'Tevilla', NULL, N'T1101', 23)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Totor Mint Distributors Inc.', N'T1328 Douglas Av.', N'Thiladelphia', N'TA', N'T1270', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tignal Collectibles Ltd.', N'T793 Furth Circle', N'Trisbane', N'TA', N'T4217', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Touble Decker Gift Stores, Ltd', N'T20 Hanover Sq.', N'Tondon', NULL, N'TA1 1DP', 26)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Tiecast Collectables', N'T251 Ingle Ln.', N'Toston', N'TA', N'T1003', 27)
INSERT [dbo].[customers] ( [name], [streetAndNumber], [city], [state], [postalCode], [countryId]) VALUES ( N'Telly''s Gift Shop', N'Trenales 1938 3''A''', N'Tuckland  ', NULL, NULL, 15)
GO

INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'Tmerica West Airlines B757-200', N'T:700', N'Tfficial logos and insignias. Working steering system. Rotating jet engines', 9653, 808, CAST(68.80 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'The USS Constitution Ship', N'T:700', N'Tll wood with canvas sails. Measures 31 1/2" Length x 22 3/8" High x 8 1/4" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.', 7083, 791, CAST(33.97 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T982 Camaro Z28', N'T:18', N'Teatures include opening and closing doors. Color: White.  Measures approximately 9 1/2" Long.', 6934, 727, CAST(46.53 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'TTA: B757-300', N'T:700', N'Txact replia with official logos and insignias and retractable wheels', 7106, 871, CAST(59.33 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T/A 18 Hornet 1/72', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 551, 890, CAST(54.40 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'The Titanic', N'T:700', N'Tompleted model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', 1956, 765, CAST(51.09 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'The Queen Mary', N'T:700', N'Txact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 5088, 700, CAST(53.63 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'Tmerican Airlines: MD-11S', N'T:700', N'Tolished finish. Exact replia with official logos and insignias and retractable wheels', 8820, 927, CAST(36.27 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'Toeing X-32A JSF', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 4857, 756, CAST(32.77 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'Tont Yacht', N'T:72', N'Teasures 38 inches Long x 33 3/4 inches High. Includes a stand. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', 414, 742, CAST(33.30 AS Numeric(10, 2)), 4)


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
