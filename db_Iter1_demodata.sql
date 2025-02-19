
GO
/****** Object:  Database [SneakerManagement]    Script Date: 12.02.2025 01:13:49 ******/
CREATE DATABASE [SneakerManagement]

GO
USE [SneakerManagement]
GO
/****** Object:  Table [dbo].[ActivityLog]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Action] [nvarchar](255) NOT NULL,
	[Timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bins]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bins](
	[BinID] [int] IDENTITY(1,1) NOT NULL,
	[ZoneID] [int] NOT NULL,
	[BinName] [nvarchar](100) NOT NULL,
	[Capacity] [int] NOT NULL,
	[CurrentLoad] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[ZoneID] [int] NOT NULL,
	[BinID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[LastUpdated] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockTransfers]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockTransfers](
	[TransferID] [int] IDENTITY(1,1) NOT NULL,
	[FromWarehouseID] [int] NOT NULL,
	[ToWarehouseID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemSettings]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemSettings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Role] [nvarchar](20) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWarehouses]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWarehouses](
	[UserID] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseManagers]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseManagers](
	[ManagerID] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WarehouseZones]    Script Date: 12.02.2025 01:13:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseZones](
	[ZoneID] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[ZoneName] [nvarchar](100) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ZoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bins] ON 

INSERT [dbo].[Bins] ([BinID], [ZoneID], [BinName], [Capacity], [CurrentLoad], [Description], [CreatedAt]) VALUES (1, 1, N'Ngăn 1', 50, 0, N'Ngăn chứa giày Nike', CAST(N'2025-02-11T22:42:50.597' AS DateTime))
INSERT [dbo].[Bins] ([BinID], [ZoneID], [BinName], [Capacity], [CurrentLoad], [Description], [CreatedAt]) VALUES (2, 2, N'Ngăn 2', 60, 0, N'Ngăn chứa giày Adidas', CAST(N'2025-02-11T22:42:50.597' AS DateTime))
INSERT [dbo].[Bins] ([BinID], [ZoneID], [BinName], [Capacity], [CurrentLoad], [Description], [CreatedAt]) VALUES (3, 3, N'Ngăn 3', 40, 0, N'Ngăn chứa giày Puma', CAST(N'2025-02-11T22:42:50.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bins] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Name], [Description], [SKU], [Price], [CreatedAt], [UpdatedAt]) VALUES (1, N'Giày Nike Air Force 1', N'Giày thể thao cổ điển của Nike', N'NK-AF1-001', CAST(2500000.00 AS Decimal(10, 2)), CAST(N'2025-02-11T22:40:12.160' AS DateTime), CAST(N'2025-02-11T22:40:12.160' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [Description], [SKU], [Price], [CreatedAt], [UpdatedAt]) VALUES (2, N'Giày Adidas Ultraboost', N'Giày chạy bộ thoải mái của Adidas', N'AD-UB-002', CAST(3200000.00 AS Decimal(10, 2)), CAST(N'2025-02-11T22:40:12.160' AS DateTime), CAST(N'2025-02-11T22:40:12.160' AS DateTime))
INSERT [dbo].[Products] ([ProductID], [Name], [Description], [SKU], [Price], [CreatedAt], [UpdatedAt]) VALUES (3, N'Giày Puma RS-X', N'Giày sneaker phong cách retro của Puma', N'PM-RSX-003', CAST(2700000.00 AS Decimal(10, 2)), CAST(N'2025-02-11T22:40:12.160' AS DateTime), CAST(N'2025-02-11T22:40:12.160' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([StockID], [ProductID], [WarehouseID], [ZoneID], [BinID], [Quantity], [LastUpdated]) VALUES (3, 1, 1, 1, 1, 50, CAST(N'2025-02-11T22:42:50.597' AS DateTime))
INSERT [dbo].[Stock] ([StockID], [ProductID], [WarehouseID], [ZoneID], [BinID], [Quantity], [LastUpdated]) VALUES (4, 2, 2, 2, 2, 30, CAST(N'2025-02-11T22:42:50.597' AS DateTime))
INSERT [dbo].[Stock] ([StockID], [ProductID], [WarehouseID], [ZoneID], [BinID], [Quantity], [LastUpdated]) VALUES (5, 3, 3, 3, 3, 40, CAST(N'2025-02-11T22:42:50.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (1, N'NguyenVanA', N'password123', N'Admin', CAST(N'2025-02-11T21:37:57.533' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (2, N'TranThiB', N'securepass456', N'Supervisor', CAST(N'2025-02-11T21:37:57.533' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (3, N'LeMinhC', N'letmein789', N'Manager', CAST(N'2025-02-11T21:37:57.533' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (4, N'PhamVanD', N'strongpass321', N'Staff', CAST(N'2025-02-11T21:37:57.533' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (5, N'HoangThiE', N'mypassword999', N'Salesrep', CAST(N'2025-02-11T21:37:57.533' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (6, N'VoMinhF', N'password456', N'Manager', CAST(N'2025-02-11T23:04:09.420' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (7, N'BuiThiG', N'password789', N'Manager', CAST(N'2025-02-11T23:04:09.420' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (8, N'NguyenVanH', N'staffpass123', N'Staff', CAST(N'2025-02-11T23:15:06.980' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Role], [CreatedAt]) VALUES (9, N'TranThiI', N'staffpass456', N'Staff', CAST(N'2025-02-11T23:15:06.980' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserWarehouses] ([UserID], [WarehouseID]) VALUES (4, 2)
INSERT [dbo].[UserWarehouses] ([UserID], [WarehouseID]) VALUES (8, 1)
INSERT [dbo].[UserWarehouses] ([UserID], [WarehouseID]) VALUES (9, 3)
GO
INSERT [dbo].[WarehouseManagers] ([ManagerID], [WarehouseID]) VALUES (3, 1)
INSERT [dbo].[WarehouseManagers] ([ManagerID], [WarehouseID]) VALUES (6, 2)
INSERT [dbo].[WarehouseManagers] ([ManagerID], [WarehouseID]) VALUES (7, 3)
GO
SET IDENTITY_INSERT [dbo].[Warehouses] ON 

INSERT [dbo].[Warehouses] ([WarehouseID], [Name], [Location], [CreatedAt]) VALUES (1, N'Kho Hà Nội', N'123 Đường Nguyễn Trãi, Thanh Xuân, Hà Nội', CAST(N'2025-02-11T22:39:54.970' AS DateTime))
INSERT [dbo].[Warehouses] ([WarehouseID], [Name], [Location], [CreatedAt]) VALUES (2, N'Kho TP Hồ Chí Minh', N'456 Đường Điện Biên Phủ, Quận 3, TP Hồ Chí Minh', CAST(N'2025-02-11T22:39:54.970' AS DateTime))
INSERT [dbo].[Warehouses] ([WarehouseID], [Name], [Location], [CreatedAt]) VALUES (3, N'Kho Đà Nẵng', N'789 Đường Lê Duẩn, Hải Châu, Đà Nẵng', CAST(N'2025-02-11T22:39:54.970' AS DateTime))
SET IDENTITY_INSERT [dbo].[Warehouses] OFF
GO
SET IDENTITY_INSERT [dbo].[WarehouseZones] ON 

INSERT [dbo].[WarehouseZones] ([ZoneID], [WarehouseID], [ZoneName], [Capacity], [Description], [CreatedAt]) VALUES (1, 1, N'Khu A', 100, N'Khu chính của kho Hà Nội', CAST(N'2025-02-11T22:42:50.597' AS DateTime))
INSERT [dbo].[WarehouseZones] ([ZoneID], [WarehouseID], [ZoneName], [Capacity], [Description], [CreatedAt]) VALUES (2, 2, N'Khu B', 120, N'Khu chính của kho TP Hồ Chí Minh', CAST(N'2025-02-11T22:42:50.597' AS DateTime))
INSERT [dbo].[WarehouseZones] ([ZoneID], [WarehouseID], [ZoneName], [Capacity], [Description], [CreatedAt]) VALUES (3, 3, N'Khu C', 90, N'Khu chính của kho Đà Nẵng', CAST(N'2025-02-11T22:42:50.597' AS DateTime))
SET IDENTITY_INSERT [dbo].[WarehouseZones] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Products__CA1ECF0D10DE4706]    Script Date: 12.02.2025 01:13:49 ******/
ALTER TABLE [dbo].[Products] ADD UNIQUE NONCLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E419448866]    Script Date: 12.02.2025 01:13:49 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityLog] ADD  DEFAULT (getdate()) FOR [Timestamp]
GO
ALTER TABLE [dbo].[Bins] ADD  DEFAULT ((0)) FOR [CurrentLoad]
GO
ALTER TABLE [dbo].[Bins] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Stock] ADD  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[StockTransfers] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[SystemSettings] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Warehouses] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[WarehouseZones] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[ActivityLog]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Bins]  WITH CHECK ADD FOREIGN KEY([ZoneID])
REFERENCES [dbo].[WarehouseZones] ([ZoneID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([BinID])
REFERENCES [dbo].[Bins] ([BinID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD FOREIGN KEY([ZoneID])
REFERENCES [dbo].[WarehouseZones] ([ZoneID])
GO
ALTER TABLE [dbo].[StockTransfers]  WITH CHECK ADD FOREIGN KEY([FromWarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[StockTransfers]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[StockTransfers]  WITH CHECK ADD FOREIGN KEY([ToWarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[UserWarehouses]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserWarehouses]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[WarehouseManagers]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[WarehouseManagers]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[WarehouseZones]  WITH CHECK ADD FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouses] ([WarehouseID])
GO
ALTER TABLE [dbo].[StockTransfers]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([Role]='Salesrep' OR [Role]='Staff' OR [Role]='Manager' OR [Role]='Supervisor' OR [Role]='Admin'))
GO
USE [master]
GO
ALTER DATABASE [SneakerManagement] SET  READ_WRITE 
GO
