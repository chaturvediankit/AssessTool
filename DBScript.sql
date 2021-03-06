USE [master]
GO
/****** Object:  Database [tech_comparer]    Script Date: 2020-09-25 9:27:11 PM ******/
CREATE DATABASE [tech_comparer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tech_comparer', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\tech_comparer.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tech_comparer_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\tech_comparer_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tech_comparer] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tech_comparer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tech_comparer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tech_comparer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tech_comparer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tech_comparer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tech_comparer] SET ARITHABORT OFF 
GO
ALTER DATABASE [tech_comparer] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [tech_comparer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tech_comparer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tech_comparer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tech_comparer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tech_comparer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tech_comparer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tech_comparer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tech_comparer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tech_comparer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [tech_comparer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tech_comparer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tech_comparer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tech_comparer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tech_comparer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tech_comparer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tech_comparer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tech_comparer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tech_comparer] SET  MULTI_USER 
GO
ALTER DATABASE [tech_comparer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tech_comparer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tech_comparer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tech_comparer] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [tech_comparer]
GO
/****** Object:  Table [dbo].[FactorSectorValue]    Script Date: 2020-09-25 9:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactorSectorValue](
	[FactorSectorValueId] [int] IDENTITY(1,1) NOT NULL,
	[FactorId] [int] NOT NULL,
	[SectorId] [int] NOT NULL,
	[ValueId] [int] NOT NULL,
 CONSTRAINT [PK_FactorSectorValue] PRIMARY KEY CLUSTERED 
(
	[FactorSectorValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Factor]    Script Date: 2020-09-25 9:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Factor](
	[FactorId] [int] IDENTITY(1,1) NOT NULL,
	[FactorDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Factor] PRIMARY KEY CLUSTERED 
(
	[FactorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Sector]    Script Date: 2020-09-25 9:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Sector](
	[SectorId] [int] IDENTITY(1,1) NOT NULL,
	[SectorDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[SectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master_Value]    Script Date: 2020-09-25 9:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master_Value](
	[ValueId] [int] IDENTITY(1,1) NOT NULL,
	[ValueDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Value] PRIMARY KEY CLUSTERED 
(
	[ValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactorSectorValue]  WITH CHECK ADD FOREIGN KEY([FactorId])
REFERENCES [dbo].[Master_Factor] ([FactorId])
GO
ALTER TABLE [dbo].[FactorSectorValue]  WITH CHECK ADD FOREIGN KEY([SectorId])
REFERENCES [dbo].[Master_Sector] ([SectorId])
GO
ALTER TABLE [dbo].[FactorSectorValue]  WITH CHECK ADD FOREIGN KEY([ValueId])
REFERENCES [dbo].[Master_Value] ([ValueId])
GO
/****** Object:  StoredProcedure [dbo].[getFactors]    Script Date: 2020-09-25 9:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFactors] 
AS
BEGIN
	SELECT factorId, factorDescription FROM Master_Factor 	
END
GO
/****** Object:  StoredProcedure [dbo].[getSectors]    Script Date: 2020-09-25 9:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSectors] 
AS
BEGIN
	SELECT sectorId, sectorDescription FROM Master_Sector	
END
GO
/****** Object:  StoredProcedure [dbo].[getValues]    Script Date: 2020-09-25 9:27:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getValues] 
AS
BEGIN
	SELECT valueId, valueDescription FROM Master_Value	
END
GO
USE [master]
GO
ALTER DATABASE [tech_comparer] SET  READ_WRITE 
GO
