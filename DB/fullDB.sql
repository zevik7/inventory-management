USE [master]
GO
/****** Object:  Database [inventoryManagement]    Script Date: 11/30/2021 8:27:47 PM ******/
CREATE DATABASE [inventoryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'inventoryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\inventoryManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'inventoryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\inventoryManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [inventoryManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [inventoryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [inventoryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [inventoryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [inventoryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [inventoryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [inventoryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [inventoryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [inventoryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [inventoryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [inventoryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [inventoryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [inventoryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [inventoryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [inventoryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [inventoryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [inventoryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [inventoryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [inventoryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [inventoryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [inventoryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [inventoryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [inventoryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [inventoryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [inventoryManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [inventoryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [inventoryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [inventoryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [inventoryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [inventoryManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [inventoryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [inventoryManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'inventoryManagement', N'ON'
GO
ALTER DATABASE [inventoryManagement] SET QUERY_STORE = OFF
GO
USE [inventoryManagement]
GO
/****** Object:  Table [dbo].[admins]    Script Date: 11/30/2021 8:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admins](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/30/2021 8:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NULL,
 CONSTRAINT [PK__categori__3213E83F55460B77] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 11/30/2021 8:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[address] [nvarchar](400) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__customer__3213E83FDFE9BF16] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 11/30/2021 8:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[address] [nvarchar](400) NOT NULL,
	[birthday] [datetime] NOT NULL,
 CONSTRAINT [PK__employee__3213E83FC56DC7EE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__employee__B43B145F9815308B] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goods]    Script Date: 11/30/2021 8:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goods](
	[id] [bigint] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[category_id] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
	[price_in] [decimal](18, 0) NOT NULL,
	[price_out] [decimal](18, 0) NOT NULL,
	[image_url] [nvarchar](200) NULL,
	[note] [nvarchar](400) NULL,
 CONSTRAINT [PK__goods__3213E83FE16A62F5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 11/30/2021 8:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [bigint] NOT NULL,
	[order_id] [bigint] NOT NULL,
	[good_id] [bigint] NOT NULL,
	[quantity] [int] NOT NULL,
	[price_unit] [decimal](18, 0) NOT NULL,
	[discount] [tinyint] NOT NULL,
 CONSTRAINT [PK__order_de__3213E83F730CD029] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/30/2021 8:27:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [bigint] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[employee_id] [bigint] NOT NULL,
	[customer_id] [bigint] NOT NULL,
 CONSTRAINT [PK__orders__3213E83F6496B074] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[goods]  WITH CHECK ADD  CONSTRAINT [FK__goods__category___38996AB5] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[goods] CHECK CONSTRAINT [FK__goods__category___38996AB5]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK__order_det__good___4222D4EF] FOREIGN KEY([good_id])
REFERENCES [dbo].[goods] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK__order_det__good___4222D4EF]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK_order_details_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK_order_details_order]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__customer__3E52440B] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__customer__3E52440B]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__employee__3D5E1FD2] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__employee__3D5E1FD2]
GO
USE [master]
GO
ALTER DATABASE [inventoryManagement] SET  READ_WRITE 
GO
