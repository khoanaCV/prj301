USE [master]
GO
/****** Object:  Database [Wish]    Script Date: 9/11/2021 3:56:24 PM ******/
CREATE DATABASE [Wish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Wish', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Wish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Wish_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Wish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Wish] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Wish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Wish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Wish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Wish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Wish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Wish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Wish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Wish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Wish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Wish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Wish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Wish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Wish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Wish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Wish] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Wish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Wish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Wish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Wish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Wish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Wish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Wish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Wish] SET RECOVERY FULL 
GO
ALTER DATABASE [Wish] SET  MULTI_USER 
GO
ALTER DATABASE [Wish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Wish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Wish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Wish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Wish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Wish] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Wish', N'ON'
GO
ALTER DATABASE [Wish] SET QUERY_STORE = OFF
GO
USE [Wish]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/11/2021 3:56:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[isSell] [int] NULL,
	[isAdmin] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 9/11/2021 3:56:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[uid] [int] NULL,
	[oid] [int] NULL,
	[ordered] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/11/2021 3:56:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/11/2021 3:56:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[oid] [int] IDENTITY(1,1) NOT NULL,
	[pid] [int] NOT NULL,
	[amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 9/11/2021 3:56:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sell_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (36, N'nguoidung1', N'1234', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (37, N'khoa', N'123', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (38, N'hung', N'1234', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (39, N'admin', N'123', 1, 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (40, N'minh', N'1234', 1, 0)
INSERT [dbo].[Account] ([uID], [user], [pass], [isSell], [isAdmin]) VALUES (41, N'khoa2', N'123', 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Cart] ([uid], [oid], [ordered]) VALUES (40, 2065, 1)
INSERT [dbo].[Cart] ([uid], [oid], [ordered]) VALUES (37, 2063, 1)
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'Điếu Tre/Trúc')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'Điếu Quế')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'Điếu Bát')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'Điếu Đồng')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (1, 10, 2)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (3, 1, 2)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (1053, 3, 2)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2051, 5, 4)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2054, 2, 2)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2055, 3, 1)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2056, 13, 1)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2057, 2, 4)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2058, 5, 5)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2059, 17, 7)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2060, 2, 3)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2063, 25, 4)
INSERT [dbo].[Order] ([oid], [pid], [amount]) VALUES (2065, 24, 6)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (24, N'ĐIẾU TRÚC RỪNG BỌC ĐỒNG', N'https://hstatic.net/779/1000135779/1/2016/11-15/ed926c50e958433db3da3eb538d7163a_master.jpg', 42.0000, N'', N'Điếu được làm thủ công gia truyền, 100% tự nhiên, không dùng sơn, màu bản chất. Kêu như AK bắn liên thanh, hút ngon. Điếu càng hút lâu càng bóng đẹp', 1, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (25, N'ĐIẾU TRE HUN CAO CẤP', N'	https://product.hstatic.net/1000135779/product/22.4_master.jpg', 54.0000, NULL, NULL, 1, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (26, N'ĐIẾU TRE ĐẦU RẮN', N'https://product.hstatic.net/1000135779/product/13339604_990753307645158_1493273442311301891_n_master.jpg', 55.0000, N'Trong các nền văn hóa phương Đông, Rắn biểu tượng cho sự sống, cho vật tổ của tộc người, biểu tượng của nước và lửa, sự hủy diệt và tái sinh, sự linh hoạt thụ động, quyết đoán và đa nghi', N'Lô Điếu râu tuyệt đẹp đã chính thức xuất  xưởng, ống tre thẳng đẹp, chất tre đanh và cứng cáp. sản phẩm đã được ngâm luộc với vỏ và lá cây cùng các kỹ thuật dân gian gia truyền 100% không hoá chất công nghiệp, có lợi cho sức khoẻ người dùng. 

Điếu bọc đồng dầy 2 đầu, chân nỏ bằng gỗ mun hoặc hương, hoa văn đồng trạm khắc tinh xảo, tiếng nỏ kêu vang như ngựa hý rừng sâu, hút êm khói, thơm thuốc và phê sâu dịu ngọt. Cùng một loại thuốc nhưng hút điếu này cảm giác ngon hơn hẳn.

sản phẩm thích hợp làm quà tặng cho sếp, người thân, thắt chặt tình bằng hữu, dùng trang trí phòng khách, nhà hàng, làm chủ đề bình luận cho quan khách. ', 1, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (27, N'ĐIẾU TRE TRÚC BỀN ĐẸP', N'https://product.hstatic.net/1000135779/product/12799133_1698915007019876_6017076236854992096_n_master.jpg', 17.0000, NULL, N'Đây là dòng sản phẩm được dùng nhiều nhất vì giá cả phải chăng và chất lượng miễn chê', 1, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (28, N'ĐIẾU CÀY TRÚC ĐEN', N'https://product.hstatic.net/1000135779/product/18033352_301887913565347_334784801239858223_n_master.jpg', 37.0000, NULL, N'Thiết kế và chế tạo ĐIẾU CÀY thủ công truyền thống, Lên mầu tự nhiên, thích hợp để dùng hoặc làm quà tặng biếu sếp, người thân. Giao hàng toàn quốc...
✔ Điếu được làm tại Thanh Hoá với các nghệ nhân điếu lâu năm
✔ Rất nhiều mẫu đẹp: đầu rắn và râu rồng huyền bí, bọc đồng dầy 2 đầu, chân, nỏ, sống lưng
✔ 100% lên màu bằng phương pháp thủ công hun khói
✔ Ống tre thẳng dày đều không sợ nứt tóp
✔ Chân, nõ điếu được làm bằng gỗ mun với nhiều hoa văn trạm trổ cầu kỳ theo các tích phong thủy, kêu vang giòn đanh tiếng như AK xả liên thanh
✔ Nhận hàng và kiểm tra thoải mái xong mới thanh toán tiền trực tiếp cho nhân viên giao hàng
✔ Bảo hành đổi trả trong vòng 7 ngày ko cần lý do', 1, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (29, N'
Điếu Cày Quế', N'https://dieucaydep.net/wp-content/uploads/2018/10/3fb44879dfc93c9765d8.jpg', 25.0000, N' 1 hương vị khác lạ', NULL, 2, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (30, N'Điếu cày quế Yên Bái ngắn', N'http://dieucaythanghoanggia.com/files/product/3016/17-06-2019/602282972993613043133214695742359520935936n_N43lGmSi.jpg', 15.0000, NULL, N'Điếu cày thân làm từ vỏ quế vùng Văn Yên Yên Bái,điếu dài 50cm

Nõ kêu ngon vang đanh tiếng,khách mua hàng có thể dùng hoặc biếu tặng rất ý nghĩa', 2, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (31, N'điếu quế yên bái 70cm', N'http://dieucaythanghoanggia.com/files/product/3016/22-12-2019/797240224492895259871641074103687879589888o_enbjXLkr.jpg', 17.0000, NULL, NULL, 2, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (32, N'Điếu cày quế Yên Bái bọc đồng hoa văn', N'http://dieucaythanghoanggia.com/files/product/3016/26-08-2019/6902833236111742480437589097133755465728n_QFYAYUVC.jpg', 25.0000, NULL, N'Điếu cày quế bọc đồng siêu đẹp', 2, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (33, N'Điếu bát hút thuốc lào đỏ mận bọc đồng', N'https://bánđiếubát.vn/wp-content/uploads/2016/02/dieu-bat-DB201-1-300x300.jpg', 29.0000, N'Điếu bát hút thuốc lào màu đỏ mận bọc đồng xuất xứ Bát Tràng', N'Trong ngũ hành quy luật tương sinh tạo nên sự thúc đẩy, hỗ trợ cho sự phát triển thịnh vượng. Do Hoả sinh Thổ nên người mệnh Thổ dùng màu đỏ là rất phù hợp để tăng thêm nguồn năng lượng may mắn cho bản thân, tạo ra những cơ hội mới thu hút vận may, vượng khí cho chủ nhân. Bên cạnh đó, mệnh Hỏa cũng là câu trả lời cho cây hỏi màu đỏ hợp mệnh gì: cụ thể người mệnh Hoả cũng có thể dùng màu đỏ do quan hệ tương hỗ giúp cho chủ nhân bình an, may mắn, gặp nhiều điều tốt lành. Ngoài ra, người mệnh Thổ và Hoả khi dùng màu đỏ còn có thể trừ tà, ngăn cản hung khí tác động tiêu cực tới chủ nhân.', 3, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (34, N'Điếu bát cổ thắt bọc đồng men vàng', N'https://bánđiếubát.vn/wp-content/uploads/2017/02/dieu-bat-DB251-300x300.jpg', 29.0000, N'Điếu bát giả cổ Bát Tràng men màu vàng trơn', N'Màu vàng hợp với mệnh gì: là màu thuộc ngũ hành Kim. Theo quy luật tương sinh thì ngũ hành Kim tương sinh ra ngũ hành Thủy. Do đó, màu vàng hợp nhất mệnh Kim và sau đó là đến mệnh Thủy.', 3, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (35, N'Điếu Bát Cổ Xưa Men Rạn Bát Tràng', N'https://bánđiếubát.vn/wp-content/uploads/2020/12/dieu-bat-co-xua-DB381.jpg', 29.0000, N'Điếu bát cổ xưa men rạn là dụng cụ hút thuốc lào phổ biến', N'Men rạn là gì? Men rạn thực chất vẫn là một loại gốm được hình thành bởi độ co giữa men và xương gốm tạo nên những đường rạn với nhiều kích cỡ khác nhau. Đây là loại men nổi tiếng và chỉ có duy nhất ở làng gốm Bát Tràng, nó xuất hiện bắt đầu vào thế kỉ XVI và được phục chế, phát triển rộng rãi trong những năm gần đây.', 3, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (36, N'Điếu bát bình dân men đen bóng giả cổ', N'https://bánđiếubát.vn/wp-content/uploads/2013/08/2013-05-04-pm-17-17-22DieuBatDen_1-300x225.jpg', 22.0000, N'Điếu bát bình dân men đen bóng vẽ họa tiết phong thủy bằng tay, chính gốc Bát Tràng Hà Nội', N'Đường kính bát: 20cm, cao: 10 cm

Đường kính điếu: 11cm, cao: 9 cm

Đường kính trong: 14cm.', 3, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (37, N'Điếu Bát Chivas 21 Cao Cấp Bọc Đồng Hình Rồng Đỏ Mận', N'https://bánđiếubát.vn/wp-content/uploads/2020/07/dieu-bat-chivas-DB30A1-300x294.jpg', 120.0000, N'Điếu bát Chivas bọc đồng nguyên chất cực tinh xảo', N'Sợi thuốc lào được vê tròn lại thành viên kích cỡ như đầu ngón tay út và tra vào nõ điếu. Sau đó dùng lửa để đốt cho thuốc cháy tạo thành khói đồng thời dùng miệng để hút. Châm lửa, tốt nhất là dùng đóm, là những mảnh tre, nứa, gỗ làm diêm… mỏng để lửa cháy trong một khoảng thời gian vừa đủ, lại không có mùi lẫn vào như khi dùng diêm, bật lửa ga. Lúc bắt đầu hút, người hút hít vào từng hơi ngắn để có thêm ô xy cho thuốc cháy đều và khói tích tụ trong thân điếu rồi mới hít một hơi thật sâu kèm theo một lượng khói lớn. Trước đó, người hút thuốc thường thổi một hơi ngắn và mạnh để xái thuốc lào văng ra khỏi nõ điếu. Động tác này đòi hỏi phải khéo léo để xái thuốc bắn ra rơi vào bát điếu và phải có kinh nghiệm mới thực hiện thuần thục được.', 3, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (38, N'Điếu Cày Thanh Hóa Điếu Cày Mini Bọc Đồng
', N'http://bandieucaytphcm.com/wp-content/uploads/2019/06/389af617b68653d80a97-666x597.jpg', 170.0000, NULL, N'Trót dại cho nên nghiện thuốc lào
Phì phà nhả khói giỡn mây cao
Tay ôm đất lệch quay cuồng tít
Mắt nhắm trời nghiêng ngã bổ nhào
Hảo hán nguôi quên niềm uất hận
Anh hùng gạt bỏ nỗi gian lao
Chiều đông sớm hạ tình chan chứa
Ấm lạnh nhiều phen cũng dạt dào !', 4, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (39, N'Điếu cày bọc đông toàn phần', N'https://dieucaydep.net/wp-content/uploads/2016/09/14031129_1785024908384719_1228325387_n.jpg', 155.0000, NULL, NULL, 4, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (40, N'
Điếu Bọc Đồng Vàng Nguyên Khối', N'https://shopdieucay.com/wp-content/uploads/2019/05/56527802_323194275051380_3407710808803639296_n.jpg', 186.0000, NULL, NULL, 4, 39)
INSERT [dbo].[product] ([id], [name], [image], [price], [title], [description], [cateID], [sell_ID]) VALUES (41, N'ĐIẾU CÀY MINI CHỐNG ĐỔ NƯỚC – ĐIẾU BỌC FULL ĐỒNG ĐẸP DÀI 30CM', N'https://dieucay36.vn/wp-content/uploads/2020/05/%C4%91i%E1%BA%BFu-c%C3%A0y-mini-Full-%C4%91%E1%BB%93ng-1.jpg', 27.0000, NULL, N'Điếu cày Mini Chống đổ nước tiện lợi khi di chuyển. Người dùng có thể mang điếu thuốc lào theo xe oto, mang du lịch. Với chiều dài điếu chỉ 30cm cực kỳ nhỏ gọn. Đặc biệt điếu có khả năng chống đổ nước mà khi dốc ngược điếu vẫn không bị chảy nước.', 4, 39)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
ALTER TABLE [dbo].[Cart] ADD  DEFAULT ((0)) FOR [ordered]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([oid])
REFERENCES [dbo].[Order] ([oid])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[Category] ([cid])
GO
USE [master]
GO
ALTER DATABASE [Wish] SET  READ_WRITE 
GO
