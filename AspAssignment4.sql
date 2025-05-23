USE [master]
GO
/****** Object:  Database [AspAssignment4]    Script Date: 2025-04-08 4:18:15 PM ******/
CREATE DATABASE [AspAssignment4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AspAssignment4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AspAssignment4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AspAssignment4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AspAssignment4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AspAssignment4] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AspAssignment4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AspAssignment4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AspAssignment4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AspAssignment4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AspAssignment4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AspAssignment4] SET ARITHABORT OFF 
GO
ALTER DATABASE [AspAssignment4] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AspAssignment4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AspAssignment4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AspAssignment4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AspAssignment4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AspAssignment4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AspAssignment4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AspAssignment4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AspAssignment4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AspAssignment4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AspAssignment4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AspAssignment4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AspAssignment4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AspAssignment4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AspAssignment4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AspAssignment4] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [AspAssignment4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AspAssignment4] SET RECOVERY FULL 
GO
ALTER DATABASE [AspAssignment4] SET  MULTI_USER 
GO
ALTER DATABASE [AspAssignment4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AspAssignment4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AspAssignment4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AspAssignment4] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AspAssignment4] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AspAssignment4] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AspAssignment4', N'ON'
GO
ALTER DATABASE [AspAssignment4] SET QUERY_STORE = ON
GO
ALTER DATABASE [AspAssignment4] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AspAssignment4]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2025-04-08 4:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2025-04-08 4:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[YearPublished] [int] NOT NULL,
	[Genre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borrowing]    Script Date: 2025-04-08 4:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrowing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[BorrowerId] [int] NOT NULL,
	[IsReturned] [bit] NOT NULL,
 CONSTRAINT [PK_Borrowing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader]    Script Date: 2025-04-08 4:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Reader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250407213447_Initial Migration', N'9.0.3')
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Name], [Author], [YearPublished], [Genre]) VALUES (1, N'1984', N'George Orwell', 1949, N'Dystopian')
INSERT [dbo].[Book] ([Id], [Name], [Author], [YearPublished], [Genre]) VALUES (2, N'To Kill a Mockingbird', N'Harper Lee', 1960, N'Classic')
INSERT [dbo].[Book] ([Id], [Name], [Author], [YearPublished], [Genre]) VALUES (3, N'The Hobbit', N'J.R.R. Tolkien', 1937, N'Fantasy')
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Borrowing] ON 

INSERT [dbo].[Borrowing] ([Id], [BookId], [BorrowerId], [IsReturned]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Borrowing] ([Id], [BookId], [BorrowerId], [IsReturned]) VALUES (2, 2, 2, 0)
INSERT [dbo].[Borrowing] ([Id], [BookId], [BorrowerId], [IsReturned]) VALUES (3, 3, 3, 1)
SET IDENTITY_INSERT [dbo].[Borrowing] OFF
GO
SET IDENTITY_INSERT [dbo].[Reader] ON 

INSERT [dbo].[Reader] ([Id], [Name], [Email], [PhoneNumber], [Address]) VALUES (1, N'Alice Johnson', N'alice@example.com', N'123-456-7890', N'123 Maple Street')
INSERT [dbo].[Reader] ([Id], [Name], [Email], [PhoneNumber], [Address]) VALUES (2, N'Bob Smith', N'bob@example.com', N'987-654-3210', N'456 Oak Avenue')
INSERT [dbo].[Reader] ([Id], [Name], [Email], [PhoneNumber], [Address]) VALUES (3, N'Carol Lee', N'carol@example.com', N'555-555-5555', N'789 Pine Road')
SET IDENTITY_INSERT [dbo].[Reader] OFF
GO
/****** Object:  Index [IX_Borrowing_BookId]    Script Date: 2025-04-08 4:18:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_Borrowing_BookId] ON [dbo].[Borrowing]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Borrowing_BorrowerId]    Script Date: 2025-04-08 4:18:15 PM ******/
CREATE NONCLUSTERED INDEX [IX_Borrowing_BorrowerId] ON [dbo].[Borrowing]
(
	[BorrowerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Borrowing]  WITH CHECK ADD  CONSTRAINT [FK_Borrowing_Book_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Borrowing] CHECK CONSTRAINT [FK_Borrowing_Book_BookId]
GO
ALTER TABLE [dbo].[Borrowing]  WITH CHECK ADD  CONSTRAINT [FK_Borrowing_Reader_BorrowerId] FOREIGN KEY([BorrowerId])
REFERENCES [dbo].[Reader] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Borrowing] CHECK CONSTRAINT [FK_Borrowing_Reader_BorrowerId]
GO
USE [master]
GO
ALTER DATABASE [AspAssignment4] SET  READ_WRITE 
GO
