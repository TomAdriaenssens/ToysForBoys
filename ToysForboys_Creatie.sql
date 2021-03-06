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
INSERT [dbo].[productlines] ( [name], [description]) VALUES ( N'Vintage Cars', N'Tur Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')
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

INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T969 Harley Davidson Ultimate Chopper', N'T:10', N'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 7933, 917, CAST(48.81 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T952 Alpine Renault 1300', N'T:10', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 7305, 778, CAST(98.58 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T996 Moto Guzzi 1100i', N'T:10', N'Tfficial Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 6625, 891, CAST(68.99 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T003 Harley-Davidson Eagle Drag Bike', N'T:10', N'Todel features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand , precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', 5582, 867, CAST(91.02 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T972 Alfa Romeo GTA', N'T:10', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3252, 842, CAST(85.68 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T962 LanciaA Delta 16V', N'T:10', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6791, 726, CAST(103.42 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T968 Ford Mustang', N'T:12', N'Tood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, 834, CAST(95.34 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T001 Ferrari Enzo', N'T:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3619, 815, CAST(95.59 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES (N'T958 Setra Bus', N'T:12', N'Todel features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579, 798, CAST(77.90 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T002 Suzuki XREO', N'T:12', N'Tfficial logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 9997, 883, CAST(66.27 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T969 Corvair Monza', N'T:18', N'T:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', 6906, 799, CAST(89.14 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T968 Dodge Charger', N'T:12', N'T:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, 771, CAST(75.16 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T969 Ford Falcon', N'T:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 1049, 759, CAST(83.05 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T970 Plymouth Hemi Cuda', N'T:12', N'Tery detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', 5663, 802, CAST(31.92 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T957 Chevy Pickup', N'T:12', N'T:12 scale die-cast about 20" long Hood opens, Rubber wheels', 6125, 870, CAST(55.70 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T969 Dodge Charger', N'T:12', N'Tetailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', 7323, 866, CAST(58.73 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T940 Ford Pickup Truck', N'T:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 2613, 806, CAST(58.33 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T993 Mazda RX-7', N'T:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, 886, CAST(83.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T937 Lincoln Berline', N'T:18', N'Teatures opening engine cover, doors, trunk, and fuel filler cap. Color black', 8693, 997, CAST(60.62 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T936 Mercedes-Benz 500K Special Roadster', N'T:18', N'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', 8635, 876, CAST(24.26 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T965 Aston Martin DB5', N'T:18', N'Tie-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, 828, CAST(65.96 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T980s Black Hawk Helicopter', N'T:18', N'T:18 scale replica of actual Army''s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', 5330, 882, CAST(77.27 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T917 Grand Touring Sedan', N'T:18', N'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', 2724, 747, CAST(86.70 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T948 Porsche 356-A Roadster', N'T:18', N'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8826, 837, CAST(53.90 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T995 Honda Civic', N'T:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', 9772, 813, CAST(93.89 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T998 Chrysler Plymouth Prowler', N'T:18', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 4724, 814, CAST(101.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T911 Ford Town Car', N'T:18', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.', 540, 649, CAST(33.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T964 Mercedes Tour Bus', N'T:18', N'Txact replica. 100+ parts. working steering system, original logos', 8258, 892, CAST(74.86 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T932 Model A Ford J-Coupe', N'T:18', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', 9354, 780, CAST(58.48 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T926 Ford Fire Engine', N'T:18', N'Tleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', 2018, 753, CAST(24.92 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T-51-D Mustang', N'T:72', N'Tas retractable wheels and comes with a stand', 992, 800, CAST(49.00 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T936 Harley Davidson El Knucklehead', N'T:18', N'Tntricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', 4357, 763, CAST(24.23 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T928 Mercedes-Benz SSK', N'T:18', N'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', 548, 686, CAST(72.56 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T999 Indy 500 Monte Carlo SS', N'T:18', N'Teatures include opening and closing doors. Color: Red', 8164, 806, CAST(56.76 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T913 Ford Model T Speedster', N'T:18', N'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', 4189, 880, CAST(60.78 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T934 Ford V8 Coupe', N'T:18', N'Throme Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 5649, 807, CAST(34.35 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T999 Yamaha Speed Boat', N'T:18', N'Txact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 4259, 736, CAST(51.61 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T8th Century Vintage Horse Carriage', N'T:18', N'Tand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.  This collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', 5992, 741, CAST(60.74 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T903 Ford Model A', N'T:18', N'Teatures opening trunk,  working steering system', 3913, 607, CAST(68.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T992 Ferrari 360 Spider red', N'T:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8347, 1603, CAST(77.90 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T985 Toyota Supra', N'T:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 7733, 0, CAST(57.01 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Tollectable Wooden Train', N'T:18', N'Tand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', 6450, 673, CAST(67.56 AS Numeric(10, 2)), 5)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T969 Dodge Super Bee', N'T:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 1917, 889, CAST(49.05 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T917 Maxwell Touring Car', N'T:18', N'Teatures Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 7913, 830, CAST(57.54 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T976 Ford Gran Torino', N'T:18', N'Tighly detailed 1976 Ford Gran Torino "Starsky and Hutch" diecast model. Very well constructed and painted in red and white patterns.', 9127, 798, CAST(73.49 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T948 Porsche Type 356 Roadster', N'T:18', N'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.', 8990, 902, CAST(62.16 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T957 Vespa GS150', N'T:18', N'Teatures rotating wheels , working kick stand. Comes with stand.', 7689, 840, CAST(32.95 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T941 Chevrolet Special Deluxe Cabriolet', N'T:18', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', 2378, 787, CAST(64.58 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T970 Triumph Spitfire', N'T:18', N'Teatures include opening and closing doors. Color: White.', 5545, 867, CAST(91.92 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T932 Alfa Romeo 8C2300 Spider Sport', N'T:18', N'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', 6553, 671, CAST(43.26 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T904 Buick Runabout', N'T:18', N'Teatures opening trunk,  working steering system', 8290, 726, CAST(52.66 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T940s Ford truck', N'T:18', N'This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940''s Pick-Up truck is painted in classic dark green color, and features rotating wheels.', 3128, 775, CAST(84.76 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T939 Cadillac Limousine', N'T:18', N'Teatures completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles', 6645, 770, CAST(23.14 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T957 Corvette Convertible', N'T:18', N'T957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.', 1249, 933, CAST(69.93 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T957 Ford Thunderbird', N'T:18', N'This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.', 3209, 591, CAST(34.21 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T970 Chevy Chevelle SS 454', N'T:24', N'This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.', 1005, 676, CAST(49.24 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T970 Dodge Coronet', N'T:24', N'T:24 scale die-cast about 18" long doors open, hood opens and rubber wheels', 4074, 832, CAST(32.37 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T997 BMW R 1100 S', N'T:24', N'Tetailed scale replica with working suspension and constructed from over 70 parts', 7003, 795, CAST(60.86 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T966 Shelby Cobra 427 S/C', N'T:24', N'This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it''s own display case.', 8197, 828, CAST(29.18 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T928 British Royal Navy Airplane', N'T:24', N'Tfficial logos and insignias', 3627, 822, CAST(66.74 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T939 Chevrolet Deluxe Coupe', N'T:24', N'This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.', 7332, 771, CAST(22.57 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T960 BSA Gold Star DBD34', N'T:24', N'Tetailed scale replica with working suspension and constructed from over 70 parts', 15, 890, CAST(37.32 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T8th century schooner', N'T:24', N'Tll wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.', 1898, 713, CAST(82.34 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T938 Cadillac V-16 Presidential Limousine', N'T:24', N'This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.', 2847, 768, CAST(20.61 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T962 Volkswagen Microbus', N'T:24', N'This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.', 2327, 740, CAST(61.34 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T982 Ducati 900 Monster', N'T:24', N'Teatures two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 6840, 856, CAST(47.10 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T949 Jaguar XK 120', N'T:24', N'Trecision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 2350, 791, CAST(47.25 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T958 Chevy Corvette Limited Edition', N'T:24', N'The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.', 2542, 810, CAST(15.91 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T900s Vintage Bi-Plane', N'T:24', N'Tand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.', 5942, 820, CAST(34.25 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T952 Citroen-15CV', N'T:24', N'Trecision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.', 1452, 705, CAST(72.82 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T982 Lamborghini Diablo', N'T:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7723, 777, CAST(16.24 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T912 Ford Model T Delivery Wagon', N'T:24', N'This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.', 9173, 722, CAST(46.91 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T969 Chevrolet Camaro Z28', N'T:24', N'T969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.', 4695, 719, CAST(50.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T971 Alpine Renault 1600s', N'T:24', N'This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7995, 870, CAST(38.58 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T937 Horch 930V Limousine', N'T:24', N'Teatures opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', 2902, 768, CAST(26.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T002 Chevy Corvette', N'T:24', N'The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.', 9446, 757, CAST(62.11 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T940 Ford Delivery Sedan', N'T:24', N'Throme Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.', 6621, 640, CAST(48.64 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T956 Porsche 356A Coupe', N'T:18', N'Teatures include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6600, 925, CAST(98.30 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Torsair F4U ( Bird Cage)', N'T:24', N'Tas retractable wheels and comes with a stand. Official logos and insignias.', 6812, 897, CAST(29.34 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T936 Mercedes Benz 500k Roadster', N'T:24', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.', 2081, 635, CAST(21.75 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T992 Porsche Cayenne Turbo Silver', N'T:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 6582, 747, CAST(69.78 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T936 Chrysler Airflow', N'T:24', N'Teatures opening trunk,  working steering system. Color dark green.', 4710, 878, CAST(57.46 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T900s Vintage Tri-Plane', N'T:24', N'Tand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.', 2756, 801, CAST(36.23 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T961 Chevrolet Impala', N'T:18', N'This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.', 7869, 888, CAST(32.33 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T980’s GM Manhattan Express', N'T:32', N'This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.', 5099, 706, CAST(53.93 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T997 BMW F650 ST', N'T:32', N'Teatures official die-struck logos and baked enamel finish. Comes with stand.', 178, 863, CAST(66.92 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T982 Ducati 996 R', N'T:32', N'Teatures rotating wheels , working kick stand. Comes with stand.', 9241, 801, CAST(24.14 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T954 Greyhound Scenicruiser', N'T:32', N'Todel features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos', 2874, 809, CAST(25.98 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T950''s Chicago Surface Lines Streetcar', N'T:32', N'This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 8601, 722, CAST(26.72 AS Numeric(10, 2)), 5)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T996 Peterbilt 379 Stake Bed with Outrigger', N'T:32', N'This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab', 814, 827, CAST(33.61 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T928 Ford Phaeton Deluxe', N'T:32', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system', 136, 825, CAST(33.02 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T974 Ducati 350 Mk3 Desmo', N'T:32', N'This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 3341, 796, CAST(56.13 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T930 Buick Marquette Phaeton', N'T:50', N'Teatures opening trunk,  working steering system', 7062, 929, CAST(27.06 AS Numeric(10, 2)), 7)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Tiamond T620 Semi-Skirted Tanker', N'T:50', N'This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.', 1016, 836, CAST(68.29 AS Numeric(10, 2)), 6)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T962 City of Detroit Streetcar', N'T:50', N'This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 1645, 853, CAST(37.49 AS Numeric(10, 2)), 5)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T002 Yamaha YZR M1', N'T:50', N'Teatures rotating wheels , working kick stand. Comes with stand.', 600, 888, CAST(34.17 AS Numeric(10, 2)), 2)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'The Schooner Bluenose', N'T:700', N'Tll wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras. The schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.', 1897, 595, CAST(34.00 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Tmerican Airlines: B767-300', N'T:700', N'Txact replia with official logos and insignias and retractable wheels', 5841, 830, CAST(51.15 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'The Mayflower', N'T:700', N'Teasures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches wide All wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.', 737, 698, CAST(43.30 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'TMS Bounty', N'T:700', N'Teasures 30 inches Long x 27 1/2 inches High x 4 3/4 inches wide.  Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 3501, 757, CAST(39.83 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Tmerica West Airlines B757-200', N'T:700', N'Tfficial logos and insignias. Working steering system. Rotating jet engines', 9653, 808, CAST(68.80 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'The USS Constitution Ship', N'T:700', N'Tll wood with canvas sails. Measures 31 1/2" Length x 22 3/8" High x 8 1/4" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.', 7083, 791, CAST(33.97 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T982 Camaro Z28', N'T:18', N'Teatures include opening and closing doors. Color: White.  Measures approximately 9 1/2" Long.', 6934, 727, CAST(46.53 AS Numeric(10, 2)), 1)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'TTA: B757-300', N'T:700', N'Txact replia with official logos and insignias and retractable wheels', 7106, 871, CAST(59.33 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'T/A 18 Hornet 1/72', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 551, 890, CAST(54.40 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'The Titanic', N'T:700', N'Tompleted model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', 1956, 765, CAST(51.09 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'The Queen Mary', N'T:700', N'Txact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 5088, 700, CAST(53.63 AS Numeric(10, 2)), 4)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Tmerican Airlines: MD-11S', N'T:700', N'Tolished finish. Exact replia with official logos and insignias and retractable wheels', 8820, 927, CAST(36.27 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Toeing X-32A JSF', N'T:72', N'T0" Wingspan with retractable landing gears.Comes with pilot', 4857, 756, CAST(32.77 AS Numeric(10, 2)), 3)
INSERT [dbo].[products] ( [name], [scale], [description], [quantityInStock], [quantityInOrder], [buyPrice], [productlineId]) VALUES ( N'Tont Yacht', N'T:72', N'Teasures 38 inches Long x 33 3/4 inches High. Includes a stand. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', 414, 742, CAST(33.30 AS Numeric(10, 2)), 4)
GO

INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x000092F900000000 AS DateTime), CAST(0x0000930000000000 AS DateTime), NULL, NULL, 86, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x000092FC00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, N'Theck on availability.', 8, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x000092FD00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, NULL, 28, N'TAITING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x0000931000000000 AS DateTime), CAST(0x0000931900000000 AS DateTime), NULL, NULL, 5, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x0000931200000000 AS DateTime), CAST(0x0000931B00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x0000931D00000000 AS DateTime), CAST(0x0000932700000000 AS DateTime), NULL, NULL, 13, N'TANCELLED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x0000932300000000 AS DateTime), CAST(0x0000932A00000000 AS DateTime), NULL, NULL, 57, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x0000932A00000000 AS DateTime), CAST(0x0000933100000000 AS DateTime), NULL, N'Tifficult to negotiate with customer. We need more marketing materials', 10, N'TAITING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES (CAST(0x0000933100000000 AS DateTime), CAST(0x0000933A00000000 AS DateTime), NULL, NULL, 92, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000933800000000 AS DateTime), CAST(0x0000934100000000 AS DateTime), NULL, N'Tustomer requested that FedEx Ground is used for this shipping', 116, N'TAITING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000934000000000 AS DateTime), CAST(0x0000934600000000 AS DateTime), CAST(0x0000934200000000 AS DateTime), NULL, 30, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000934700000000 AS DateTime), CAST(0x0000934D00000000 AS DateTime), NULL, NULL, 9, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000934600000000 AS DateTime), CAST(0x0000935000000000 AS DateTime), CAST(0x0000934B00000000 AS DateTime), NULL, 12, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000934800000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), CAST(0x0000934900000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000934E00000000 AS DateTime), CAST(0x0000935400000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), NULL, 24, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000935100000000 AS DateTime), CAST(0x0000935900000000 AS DateTime), NULL, NULL, 99, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000935800000000 AS DateTime), CAST(0x0000936000000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), NULL, 90, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000935D00000000 AS DateTime), CAST(0x0000936500000000 AS DateTime), NULL, NULL, 15, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000936200000000 AS DateTime), CAST(0x0000936A00000000 AS DateTime), NULL, N'Tustomer has worked with some of our vendors in the past and is aware of their MSRP', 40, N'TAITING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000936900000000 AS DateTime), CAST(0x0000937000000000 AS DateTime), NULL, NULL, 91, N'TANCELLED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000937200000000 AS DateTime), CAST(0x0000937800000000 AS DateTime), NULL, NULL, 81, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000937300000000 AS DateTime), CAST(0x0000937B00000000 AS DateTime), NULL, NULL, 80, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000937F00000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, NULL, 1, N'TANCELLED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000938000000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, N'Tustomer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 2, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000938700000000 AS DateTime), CAST(0x0000939100000000 AS DateTime), NULL, NULL, 107, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000938D00000000 AS DateTime), CAST(0x0000939300000000 AS DateTime), NULL, N'Tustomer requested special shippment. The instructions were passed along to the warehouse', 16, N'TAITING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000939000000000 AS DateTime), CAST(0x0000939600000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000939600000000 AS DateTime), CAST(0x0000939C00000000 AS DateTime), NULL, NULL, 71, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A200000000 AS DateTime), NULL, NULL, 32, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A300000000 AS DateTime), NULL, NULL, 101, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093A300000000 AS DateTime), CAST(0x000093A900000000 AS DateTime), NULL, NULL, 70, N'TAITING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093A500000000 AS DateTime), CAST(0x000093AC00000000 AS DateTime), NULL, NULL, 11, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093A900000000 AS DateTime), CAST(0x000093B200000000 AS DateTime), NULL, NULL, 51, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093AA00000000 AS DateTime), CAST(0x000093B400000000 AS DateTime), CAST(0x000093AB00000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093AC00000000 AS DateTime), CAST(0x000093B600000000 AS DateTime), CAST(0x000093AE00000000 AS DateTime), NULL, 48, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093B200000000 AS DateTime), CAST(0x000093BC00000000 AS DateTime), NULL, NULL, 81, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093AF00000000 AS DateTime), CAST(0x000093B800000000 AS DateTime), NULL, NULL, 115, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093C000000000 AS DateTime), CAST(0x000093C900000000 AS DateTime), CAST(0x000093C600000000 AS DateTime), NULL, 18, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093C800000000 AS DateTime), CAST(0x000093D000000000 AS DateTime), NULL, NULL, 74, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093CF00000000 AS DateTime), CAST(0x000093D700000000 AS DateTime), CAST(0x000093D400000000 AS DateTime), NULL, 6, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093D100000000 AS DateTime), CAST(0x000093D900000000 AS DateTime), NULL, N'Tan we deliver the new Ford Mustang models by end-of-quarter?', 68, N'TROCESSING')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093D400000000 AS DateTime), CAST(0x000093DC00000000 AS DateTime), CAST(0x000093D500000000 AS DateTime), NULL, 90, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093E000000000 AS DateTime), CAST(0x000093E800000000 AS DateTime), CAST(0x000093E600000000 AS DateTime), NULL, 36, N'THIPPED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093E900000000 AS DateTime), CAST(0x000093F300000000 AS DateTime), NULL, NULL, 101, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093EB00000000 AS DateTime), CAST(0x000093F200000000 AS DateTime), NULL, NULL, 89, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093F200000000 AS DateTime), CAST(0x000093F800000000 AS DateTime), NULL, NULL, 101, N'TESOLVED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093F900000000 AS DateTime), CAST(0x0000940100000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 15, N'TISPUTED')
INSERT [dbo].[orders] ( [orderDate], [requiredDate], [shippedDate], [comments], [customerId], [status]) VALUES ( CAST(0x000093FB00000000 AS DateTime), CAST(0x0000940400000000 AS DateTime), NULL, NULL, 65, N'TESOLVED')
Go

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
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (21, 1, 34, CAST(86.13 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (22, 7, 42, CAST(155.66 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (23, 21, 26, CAST(120.71 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (24, 23, 21, CAST(153.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (25, 2, 38, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (26, 8, 46, CAST(193.25 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (27, 39, 41, CAST(120.20 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (28, 5, 33, CAST(123.76 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (29, 37, 40, CAST(68.82 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (30, 22, 21, CAST(141.92 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (31, 105, 36, CAST(80.00 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (32, 31, 49, CAST(80.26 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (33, 1, 41, CAST(90.92 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (34, 7, 42, CAST(173.17 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (35, 18, 25, CAST(117.48 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (36, 21, 44, CAST(115.73 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (37, 23, 33, CAST(149.60 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (38, 2, 37, CAST(186.44 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (39, 15, 21, CAST(114.95 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (40, 8, 33, CAST(166.24 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (41, 5, 49, CAST(133.28 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (42, 91, 20, CAST(56.41 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (43, 1, 45, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (44, 47, 47, CAST(60.30 AS Numeric(10, 2)))
INSERT [dbo].[orderdetails] ([orderId], [productId], [quantityOrdered], [priceEach]) VALUES (45, 7, 48, CAST(161.49 AS Numeric(10, 2)))
Go

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
