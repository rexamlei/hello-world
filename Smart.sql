Use
Smart
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_Customer](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Account] [nvarchar](50) NOT NULL,
	[Customer_Pwd] [nvarchar](50) NOT NULL,
	[Customer_Age] [int] NOT NULL,
	[Customer_Phone] [nvarchar](50) NULL,
	[Customer_Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Customer_Phone] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Customer_Email] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_CustomerAddress]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_CustomerAddress](
	[CustomerAddress_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Customer_Address] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerAddress_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_DetailsType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_DetailsType](
	[DTID] [int] IDENTITY(1,1) NOT NULL,
	[DTName] [nvarchar](50) NOT NULL,
	[DTTableName] [nvarchar](50) NOT NULL,
	[DTBeizu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DTID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_Level1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_Level1](
	[Level1_ID] [int] IDENTITY(1,1) NOT NULL,
	[Level1_Name] [nvarchar](50) NOT NULL,
	[Level1_Desc] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Level1_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Level1_Name] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_Order](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_number] [nchar](10) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[CustomerAddress_ID] [int] NOT NULL,
	[Pay_from] [nchar](10) NOT NULL,
	[Is_send] [bit] NULL,
	[Is_pay] [bit] NULL,
	[Pay_time] [datetime] NOT NULL,
 CONSTRAINT [PK__T_Order__0EA330E9] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__T_Order__0F975522] UNIQUE NONCLUSTERED 
(
	[Order_number] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_ShoppingCart]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_ShoppingCart](
	[ShoppingItem_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Ware_ID] [int] NOT NULL,
	[Ware_Qty] [int] NOT NULL,
	[Ware_Sum] [float] NULL,
	[Order_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoppingItem_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_Level3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_Level3](
	[Level3_ID] [int] IDENTITY(1,1) NOT NULL,
	[Level3_Name] [nvarchar](50) NOT NULL,
	[Level3_Desc] [nvarchar](500) NULL,
	[Level2_ID] [int] NULL,
	[Level1_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Level3_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Level3_Name] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_Ware]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_Ware](
	[Ware_id] [int] IDENTITY(1,1) NOT NULL,
	[Ware_number] [nchar](10) NOT NULL,
	[Ware_name] [nvarchar](200) NOT NULL,
	[Ware_weight] [nchar](10) NOT NULL,
	[Ware_stock] [int] NULL,
	[Ware_level3] [int] NOT NULL,
	[Ware_price] [float] NULL,
	[Extent_ID] [int] NULL,
	[Ware_image] [nvarchar](50) NULL,
	[DetailsType_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Ware_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Ware_number] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[T_Level2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[T_Level2](
	[Level2_ID] [int] IDENTITY(1,1) NOT NULL,
	[Level2_Name] [nvarchar](50) NOT NULL,
	[Level2_Desc] [nvarchar](500) NULL,
	[Level1_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Level2_ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Level2_Name] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[QueryCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[QueryCustomer] 
(@c_account nvarchar(50),@c_pwd nvarchar(50))
AS
BEGIN
	SET NOCOUNT ON;
	SELECT customer_id from T_Customer where customer_account=@c_account and customer_pwd=@c_pwd;
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sq_select2_id]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'--存储过程2
CREATE PROCEDURE [dbo].[sq_select2_id] 
	@Ware_ID int
as
BEGIN
	SET NOCOUNT ON;
   select * from T_Ware where Ware_ID=@Ware_ID 
END
' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_waredetails]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[v_waredetails]
as
select Ware_ID,Ware_Number,Ware_Stock,
Ware_Name,Ware_Weight,Ware_Price,Ware_Image,
Level3_Name,Level2_Name
from T_Level3 inner join 
T_Level2 on T_Level3.Level2_ID=T_Level2.Level2_ID inner join
T_Ware on T_Level3.Level3_ID=T_Ware.Ware_Level3' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_Level1_b2]'))
EXEC dbo.sp_executesql @statement = N'
--视图
create View [dbo].[v_Level1_b2]
as 
select a.Level2_ID,a.Level1_ID,b.Level1_Name,a.Level2_Name
from T_Level2 a inner join T_Level1 b
on a.Level1_ID=b.Level1_ID' 
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Order__Custome__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Order]'))
ALTER TABLE [dbo].[T_Order]  WITH CHECK ADD  CONSTRAINT [FK__T_Order__Custome__1920BF5C] FOREIGN KEY([CustomerAddress_ID])
REFERENCES [dbo].[T_CustomerAddress] ([CustomerAddress_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_T_Order_T_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Order]'))
ALTER TABLE [dbo].[T_Order]  WITH CHECK ADD  CONSTRAINT [FK_T_Order_T_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[T_Customer] ([Customer_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Shoppin__Custo__1B0907CE]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_ShoppingCart]'))
ALTER TABLE [dbo].[T_ShoppingCart]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[T_Customer] ([Customer_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Shoppin__Custo__1FCDBCEB]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_ShoppingCart]'))
ALTER TABLE [dbo].[T_ShoppingCart]  WITH CHECK ADD FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[T_Customer] ([Customer_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Shoppin__Order__182C9B23]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_ShoppingCart]'))
ALTER TABLE [dbo].[T_ShoppingCart]  WITH CHECK ADD  CONSTRAINT [FK__T_Shoppin__Order__182C9B23] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[T_Order] ([Order_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Level3__Level1__1920BF5C]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Level3]'))
ALTER TABLE [dbo].[T_Level3]  WITH CHECK ADD FOREIGN KEY([Level1_ID])
REFERENCES [dbo].[T_Level1] ([Level1_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Level3__Level1__1DE57479]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Level3]'))
ALTER TABLE [dbo].[T_Level3]  WITH CHECK ADD FOREIGN KEY([Level1_ID])
REFERENCES [dbo].[T_Level1] ([Level1_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Level3__Level2__1A14E395]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Level3]'))
ALTER TABLE [dbo].[T_Level3]  WITH CHECK ADD FOREIGN KEY([Level2_ID])
REFERENCES [dbo].[T_Level2] ([Level2_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Level3__Level2__1ED998B2]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Level3]'))
ALTER TABLE [dbo].[T_Level3]  WITH CHECK ADD FOREIGN KEY([Level2_ID])
REFERENCES [dbo].[T_Level2] ([Level2_ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Ware__DetailsT__182C9B23]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Ware]'))
ALTER TABLE [dbo].[T_Ware]  WITH CHECK ADD FOREIGN KEY([DetailsType_ID])
REFERENCES [dbo].[T_DetailsType] ([DTID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Ware__DetailsT__1CF15040]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Ware]'))
ALTER TABLE [dbo].[T_Ware]  WITH CHECK ADD FOREIGN KEY([DetailsType_ID])
REFERENCES [dbo].[T_DetailsType] ([DTID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__T_Level2__Level1__20C1E124]') AND parent_object_id = OBJECT_ID(N'[dbo].[T_Level2]'))
ALTER TABLE [dbo].[T_Level2]  WITH CHECK ADD FOREIGN KEY([Level1_ID])
REFERENCES [dbo].[T_Level1] ([Level1_ID])
