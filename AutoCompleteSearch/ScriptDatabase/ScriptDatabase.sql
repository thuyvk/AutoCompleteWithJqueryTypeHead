USE [AutoComplateDatabase]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 6/27/2017 4:53:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phones]    Script Date: 6/27/2017 4:53:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Price] [decimal](18, 2) NULL,
	[BrandId] [int] NULL,
 CONSTRAINT [PK_Phones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (1, N'Apple', N'USA Phone')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (2, N'Samsung', N'Korea Phone')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (3, N'Xixaomi', N'China Phone')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (4, N'Oppo', N'China Phone')
INSERT [dbo].[Brands] ([Id], [Name], [Description]) VALUES (5, N'Sony', N'USA Phone')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[Phones] ON 

INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (1, N'Iphone 5 IOS', N'5 inches screen', CAST(200.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (2, N'Iphone 6 IOS 10', N'6 inches screen', CAST(300.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (3, N'Iphone 6 plush IOS 11', N'6.5 inches screen', CAST(400.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (4, N'Samsung Galaxy S7 Android 7', N'5.5 inches screen', CAST(200.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (5, N'Samsung Gallaxy S8 Android 8', N'5.5 inches screen edge', CAST(800.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (6, N'Samsung Gallay J7 Pro Android 7', N'6 inches screen', CAST(400.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (7, N'Redmi Note 4 Android 5', N'5 inches screen', CAST(200.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Phones] ([Id], [Name], [Description], [Price], [BrandId]) VALUES (8, N'Redmi Nod 5 Android 7', N'7 inches screen', CAST(250.00 AS Decimal(18, 2)), 3)
SET IDENTITY_INSERT [dbo].[Phones] OFF
ALTER TABLE [dbo].[Phones]  WITH CHECK ADD  CONSTRAINT [FK_Phones_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Phones] CHECK CONSTRAINT [FK_Phones_Brands]
GO
