USE [master]
GO
/****** Object:  Database [Bashudhanra_DB]    Script Date: 12/2/2019 12:18:00 PM ******/
CREATE DATABASE [Bashudhanra_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bashudhanra_DB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bashudhanra_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Bashudhanra_DB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Bashudhanra_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Bashudhanra_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bashudhanra_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bashudhanra_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Bashudhanra_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bashudhanra_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bashudhanra_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bashudhanra_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bashudhanra_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bashudhanra_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Bashudhanra_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bashudhanra_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bashudhanra_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bashudhanra_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Bashudhanra_DB]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllBlocks]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllBlocks]
AS
BEGIN
SELECT * FROM tbl_Block
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllLevel]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllLevel]
AS
BEGIN
SELECT * FROM tbl_Level
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllShopInfo]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllShopInfo]
@ShopName NVARCHAR(50)
AS
BEGIN
SELECT * FROM ShopDetailS_View WHERE ShopName LIKE '%'+@ShopName+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllShops]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAllShops]
AS
BEGIN
SELECT * FROM tbl_Shop
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveShop]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveShop]
@ShopName NVARCHAR(50),
@Contact NVARCHAR(50),
@LabelId INT,
@BlockId INT
AS
BEGIN
INSERT INTO tbl_Shop VALUES(@ShopName,@Contact,@LabelId,@BlockId)
END
GO
/****** Object:  Table [dbo].[tbl_Block]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Block](
	[BlockId] [int] IDENTITY(1,1) NOT NULL,
	[BlockLevel] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Block] PRIMARY KEY CLUSTERED 
(
	[BlockId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Level]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Level](
	[LevelId] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Level] PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Shop]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Shop](
	[ShopId] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[LabelId] [int] NOT NULL,
	[BlockId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ShopDetailS_View]    Script Date: 12/2/2019 12:18:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ShopDetailS_View]
AS
SELECT SH.ShopName,SH.Contact,L.LevelName,B.BlockLevel
FROM tbl_Shop AS SH
JOIN tbl_Level AS L
ON SH.LabelId = L.LevelId
JOIN tbl_Block AS B
ON B.BlockId = SH.BlockId
GO
SET IDENTITY_INSERT [dbo].[tbl_Block] ON 

GO
INSERT [dbo].[tbl_Block] ([BlockId], [BlockLevel]) VALUES (1, N'Block-A')
GO
INSERT [dbo].[tbl_Block] ([BlockId], [BlockLevel]) VALUES (2, N'Block-B')
GO
INSERT [dbo].[tbl_Block] ([BlockId], [BlockLevel]) VALUES (3, N'Block-C')
GO
INSERT [dbo].[tbl_Block] ([BlockId], [BlockLevel]) VALUES (4, N'Block-D')
GO
SET IDENTITY_INSERT [dbo].[tbl_Block] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Level] ON 

GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (1, N'Level-1')
GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (2, N'Level-2')
GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (3, N'Level-3')
GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (4, N'Level-4')
GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (5, N'Level-5')
GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (6, N'Level-6')
GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (7, N'Level-7')
GO
INSERT [dbo].[tbl_Level] ([LevelId], [LevelName]) VALUES (8, N'Level-8')
GO
SET IDENTITY_INSERT [dbo].[tbl_Level] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Shop] ON 

GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (3, N'Reges', N'01643322899', 2, 3)
GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (4, N'Inglorious', N'0165895566', 2, 2)
GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (5, N'Koopar', N'016325899', 3, 3)
GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (7, N'Casio Shop', N'25965522', 2, 2)
GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (8, N'Cloth Shop', N'2596325', 5, 3)
GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (10, N'Rado', N'2598566', 8, 3)
GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (11, N'Daraz', N'589965', 2, 3)
GO
INSERT [dbo].[tbl_Shop] ([ShopId], [ShopName], [Contact], [LabelId], [BlockId]) VALUES (12, N'Shop Bd', N'25899', 4, 2)
GO
SET IDENTITY_INSERT [dbo].[tbl_Shop] OFF
GO
/****** Object:  Index [IX_tbl_Shop]    Script Date: 12/2/2019 12:18:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tbl_Shop] ON [dbo].[tbl_Shop]
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Shop]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Shop_tbl_Block] FOREIGN KEY([BlockId])
REFERENCES [dbo].[tbl_Block] ([BlockId])
GO
ALTER TABLE [dbo].[tbl_Shop] CHECK CONSTRAINT [FK_tbl_Shop_tbl_Block]
GO
ALTER TABLE [dbo].[tbl_Shop]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Shop_tbl_Level] FOREIGN KEY([LabelId])
REFERENCES [dbo].[tbl_Level] ([LevelId])
GO
ALTER TABLE [dbo].[tbl_Shop] CHECK CONSTRAINT [FK_tbl_Shop_tbl_Level]
GO
USE [master]
GO
ALTER DATABASE [Bashudhanra_DB] SET  READ_WRITE 
GO
