USE [master]
GO
/****** Object:  Database [BaseDB]    Script Date: 2020/03/04 15:32:33 ******/
CREATE DATABASE [BaseDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BaseDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BaseDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseDB] SET  MULTI_USER 
GO
ALTER DATABASE [BaseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaseDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseDB] SET QUERY_STORE = OFF
GO
USE [BaseDB]
GO
/****** Object:  Table [dbo].[ACCOUNT]    Script Date: 2020/03/04 15:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNT](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[Sex] [int] NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[LastTimeLogin] [datetime] NULL,
	[Status] [int] NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Mobile] [varchar](20) NULL,
	[GroupRoleID] [uniqueidentifier] NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTROL]    Script Date: 2020/03/04 15:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTROL](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[Icon] [varchar](200) NULL,
	[CreateBy] [uniqueidentifier] NOT NULL,
	[CreareDate] [datetime] NOT NULL,
	[UpdateBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlg] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUP_ROLE]    Script Date: 2020/03/04 15:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUP_ROLE](
	[ID] [nchar](10) NULL,
	[Name] [nchar](10) NULL,
	[CreateBy] [uniqueidentifier] NOT NULL,
	[CreareDate] [datetime] NOT NULL,
	[UpdateBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlg] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 2020/03/04 15:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[ID] [uniqueidentifier] NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Url] [varchar](50) NOT NULL,
	[Icon] [varchar](200) NULL,
	[ParentID] [uniqueidentifier] NULL,
	[CreateBy] [uniqueidentifier] NOT NULL,
	[CreareDate] [datetime] NOT NULL,
	[UpdateBy] [uniqueidentifier] NULL,
	[UpdateDate] [datetime] NULL,
	[DeleteFlg] [bit] NOT NULL,
 CONSTRAINT [PK_MENU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 2020/03/04 15:32:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[ID] [uniqueidentifier] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[ItemID] [uniqueidentifier] NOT NULL,
	[GruopRoleID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: chưa active ; 1: active ; 2 : đã khóa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ACCOUNT', @level2type=N'COLUMN',@level2name=N'Status'
GO
USE [master]
GO
ALTER DATABASE [BaseDB] SET  READ_WRITE 
GO
