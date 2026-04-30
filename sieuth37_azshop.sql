-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th6 02, 2024 lúc 01:29 PM
-- Phiên bản máy phục vụ: 10.6.17-MariaDB-cll-lve
-- Phiên bản PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sieuth37_azshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank`
--

CREATE TABLE `bank` (
  `id` int(11) NOT NULL,
  `stk` text NOT NULL,
  `name` text NOT NULL,
  `bank_name` text NOT NULL,
  `logo` text NOT NULL,
  `ghichu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bank_auto`
--

CREATE TABLE `bank_auto` (
  `id` int(11) NOT NULL,
  `user_id` text NOT NULL,
  `tranId` text NOT NULL,
  `payment_method` text NOT NULL,
  `amount` int(11) NOT NULL,
  `comment` text NOT NULL,
  `create_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_vietnamese_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `trans_id` varchar(255) DEFAULT NULL,
  `telco` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `serial` text DEFAULT NULL,
  `pin` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dongtien`
--

CREATE TABLE `dongtien` (
  `id` int(11) NOT NULL,
  `sotientruoc` int(11) DEFAULT NULL,
  `sotienthaydoi` int(11) DEFAULT NULL,
  `sotiensau` int(11) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `noidung` text DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_vietnamese_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `create_date` text DEFAULT NULL,
  `action` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_vietnamese_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `options`
--

INSERT INTO `options` (`id`, `key`, `value`) VALUES
(1, 'title', 'Shop bán key hack'),
(2, 'mota', 'Bán tool - bán acc ngọc rồng tự động giá rẻ'),
(3, 'tukhoa', ''),
(4, 'logo', 'upload/theme/logo_light_0HX.png'),
(12, 'thongbao', '<p>cặc</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(13, 'anhbia', 'data:image/webp;base64,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'),
(14, 'favicon', 'upload/theme/favicon_LTH.png'),
(57, 'domain', 'sieuthicode.net'),
(59, 'logo_light', 'assets/storage/images/logo_light_27S.png'),
(60, 'description', ''),
(61, 'keywords', ''),
(62, 'author', ''),
(63, 'status', '1'),
(64, 'status_update', '1'),
(65, 'status_captcha', '0'),
(66, 'hotline', ''),
(67, 'email', ''),
(68, 'email_smtp', ''),
(69, 'pass_email_smtp', ''),
(70, 'session_login', '2592000'),
(71, 'min_recharge', '1000'),
(72, 'status_card', '1'),
(73, 'notice_napthe', '<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>Vui l&ograve;ng nhập đầy đủ th&ocirc;ng tin&nbsp;Serial&nbsp;-&nbsp;Pin&nbsp;-&nbsp;Mệnh Gi&aacute;&nbsp;của thẻ.</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>Thẻ được xử l&yacute; tự động trong v&agrave;i gi&acirc;y.</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>Nạp sai mệnh gi&aacute; mất&nbsp;50%&nbsp;gi&aacute; trị thực của thẻ.</strong></span></p>\r\n'),
(74, 'partner_key_card', ''),
(75, 'partner_id_card', ''),
(76, 'noidung_naptien', 'naptien'),
(77, 'status_momo', '1'),
(78, 'token_momo', '9145556b-2958-497f-8c74-ec16acbe8221'),
(79, 'ck_bank', '0'),
(80, 'status_mbbank', '1'),
(81, 'token_mbbank', 'vKTLpMJHrWNI-QaNGbB-emQE-yHwZ-Rykt'),
(82, 'token_tsr', 'TwjVWmkeKzRu-wNkKAh-aRyl-Ksyw-UmAL'),
(83, 'notification', '1'),
(84, 'status_tsr', '1'),
(85, 'color', '#ffffff'),
(86, 'notice_napbank', '<p>Vui l&ograve;ng <strong>điền đ&uacute;ng nội dung</strong> tiền sẽ được cộng v&agrave;o t&agrave;i khoản <strong>30-60s</strong></p>\r\n\r\n<p>Nếu sau thời gian tr&ecirc;n chưa được cộng tiền vui l&ograve;ng li&ecirc;n hệ admin</p>\r\n\r\n<p>Xin cảm ơn qu&yacute; kh&aacute;ch !</p>\r\n'),
(87, 'notice_transfer', '<p><span style=\"color:#2c3e50\"><strong>- Ph&iacute; cố định 0đ</strong></span></p>\r\n\r\n<p><span style=\"color:#2c3e50\"><strong>- Chuyển tiền kh&ocirc;ng giới hạn</strong></span></p>\r\n\r\n<p><span style=\"color:#2c3e50\"><strong>- Số tiền chuyển tối thiểu l&agrave; 10.000đ</strong></span></p>\r\n'),
(88, 'status_demo', '0'),
(89, 'notice_withdraw', '<p><span style=\"color:#2c3e50\"><strong>Kh&ocirc;ng thể r&uacute;t tiền đối với t&agrave;i khoản&nbsp;Th&agrave;nh Vi&ecirc;n</strong></span></p>\r\n'),
(90, 'notice_check_nro', '<p><span style=\"color:#e74c3c\"><strong>C&ocirc;ng cụ check số lượng lớn t&agrave;i khoản nro ho&agrave;n to&agrave;n miễn ph&iacute;</strong></span></p>\r\n\r\n<p><span style=\"color:#e74c3c\"><strong>Ch&uacute;c c&aacute;c bạn một ng&agrave;y vui vẻ</strong></span></p>\r\n'),
(91, 'notice_account', '<p><strong>Hệ thống b&aacute;n t&agrave;i khoản game đa dạng, t&igrave;m kiếm acc t&ugrave;y th&iacute;ch, dễ d&agrave;ng sử dụng</strong></p>\r\n'),
(92, 'banner_active', 'https://i.imgur.com/JUxlDUE.png'),
(93, 'banner_1', 'upload/theme/banner/banner_UJI.png'),
(94, 'banner_2', 'upload/theme/banner/banner_V5C.png'),
(95, 'site_key', '6Lc81a4kAAAAAG-ypoTtulgQJx5Zs4hF80fZ5UI8'),
(96, 'secret_key', '6Lc81a4kAAAAALSsaaT9BuOJ2mvQrEzW14IJHSpW'),
(97, 'notice_plowing', '<p><span style=\"color:#2c3e50\"><strong>C&aacute;c bạn ch&uacute; &yacute; trạng th&aacute;i ho&agrave;n th&agrave;nh khi thu&ecirc; g&oacute;i</strong></span></p>\r\n\r\n<p><span style=\"color:#2c3e50\"><strong>Kh&ocirc;ng được ph&eacute;p v&agrave;o t&agrave;i khoản khi đang trong qu&aacute; tr&igrave;nh c&agrave;y</strong></span></p>\r\n'),
(98, 'token_zalopay', ''),
(99, 'status_zalopay', '1'),
(100, 'link_facebook', ''),
(101, 'link_youtube', 'https://www.youtube.com/@114hack'),
(102, 'status_vcb', '1'),
(103, 'token_vcb', ''),
(104, 'status_sellacc', '1'),
(105, 'status_service', '1'),
(106, 'token_acb', ''),
(107, 'status_acb', '1'),
(108, 'logo_center', 'upload/theme/logo_center_MA1.png'),
(109, 'embed_youtube', 'https://www.youtube.com/embed/gqSeaGBTJIU'),
(110, 'embed_intro', 'https://www.youtube.com/embed/gqSeaGBTJIU'),
(111, 'server_card', 'trumthere'),
(112, 'check_time_cron_momo', '1712079009'),
(113, 'money_reg', '0'),
(114, 'client_id_imgur', '9a032c6333834c2'),
(115, 'status_imgur', '1'),
(116, 'button_vongquay', 'https://i.imgur.com/76ueWU0.png'),
(117, 'button_play', 'https://i.imgur.com/XdaeYwn.png'),
(118, 'banner_one', 'https://i.imgur.com/uNmov6G.jpg'),
(119, 'status_banner', '1'),
(120, 'status_cursor', '0'),
(121, 'cursor_default', 'https://i.imgur.com/WA1e0zZ.jpeg'),
(122, 'cursor_hover', 'https://i.imgur.com/HvAPaFB.png'),
(123, 'status_minify', '0'),
(124, 'status_anti_f12', '0'),
(125, 'status_snowflake', '1'),
(126, 'api_key_host', 'ab13f05f2b15a8cb4bd083646f5af1f40ce0c40315c981a582eb02f3c'),
(127, 'banner', 'upload/theme/banner_O0I.png'),
(128, 'footer', 'upload/theme/footer_ZW6.png'),
(129, 'noti_home', 'BANHACK - WEB THUÊ HACK PUBG MOBILE, HACK PUBG BATTLEGROUND PC STEAM,TOOL LOL(LMHT) - GENSHI IMPACT - CALL OF DUTY -LOL MOBILE - LIÊN MINH TỐC CHIẾN- CROSS FIRE CFVN-VALORANT-LIÊN QUÂN MOBILE'),
(130, 'status_api', '0'),
(131, 'content_banner', 'HACK CS2, HACK PUBG, PUBG MOBILE, PUBG STEAM, APEX LEGEND,CALL OF DUTY, ĐÂU TRƯỜNG CÔNG LÝ, HACK CALL OF DUTY - NICK RÁC LOL - NICK LMHT - ACC RÁC - HACK VALORANT, HACK ĐỘT KÍCH CFVN-HACK GAME ONLINE.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_blogs`
--

CREATE TABLE `tbl_blogs` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_category_hack`
--

CREATE TABLE `tbl_category_hack` (
  `id` int(11) NOT NULL,
  `stt` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_category_hack`
--

INSERT INTO `tbl_category_hack` (`id`, `stt`, `name`, `slug`, `images`, `content`, `status`, `create_date`, `update_date`) VALUES
(1, 11, 'Hack Freefire', 'hack-freefire', 'upload/product/productLPJ8BH.png', 'Hack Freefire cho ios không cần jaibreak Và hack jaibreak', 0, '2022-12-27 15:43:51', '2024-04-25 10:25:15'),
(3, 5, 'PUBG MOBILE GIẢ LẬP', 'pubg-mobile-gia-lap', 'upload/product/product5C6P3N.png', 'Nhiều Loại hack an toàn, gói ít giờ và có thêm hack chức năng Đạn Dí', 0, '2023-02-06 22:40:17', '2024-04-25 10:29:50'),
(4, 10, 'PUBG MOBILE ANDROID', 'pubg-mobile-android', 'upload/product/productQLXN23.png', 'Hack PUBG Mobile trên điện thoại Android siêu an toàn', 0, '2023-02-06 22:40:46', '2024-01-23 07:03:11'),
(5, 4, 'PUBG STEAM', 'pubg-steam', 'upload/product/product4YVO5Z.png', 'HACK PUBG PC STEAM BẢO TRÌ ĐỊNH KỲ THỨ 4 HÀNG TUẦN DO GAME UPDATE LƯU Ý', 0, '2023-02-06 22:41:15', '2024-04-25 10:29:43'),
(7, 5, 'LIÊN MINH HUYỀN THOẠI', 'lien-minh-huyen-thoai', 'upload/product/productHRKJBM.png', 'TOOL LIÊN MINH HUYỀN THOẠI HỖ TRỢ BẠN COMBO NHAN, NÉ SKILL, AUTO TRÙNG PHẠT VÀ BƠM MÁU. AN TOÀN CAO', 1, '2023-02-06 22:42:56', '2024-05-12 12:05:39'),
(8, 6, 'HACK FREE FIRE', 'hack-free-fire', 'upload/product/productRYDO6P.png', 'Hack Liên Quân Free Fire NHIỀU CHỨC NĂNG BÁ ĐẠO ỔN ÁP', 0, '2023-02-06 22:48:08', '2024-01-23 07:03:33'),
(9, 7, 'PUBG MOBILE IOS', 'pubg-mobile-ios', 'upload/product/productKTDENZ.png', 'Hack PUBG Mobile trên điện thoại IOS siêu an toàn', 0, '2023-02-06 22:49:07', '2024-01-23 07:03:25'),
(10, 8, 'HACK CALL OF DUTY MOBILE CODM', 'hack-call-of-duty-mobile-codm', 'upload/product/productMYPDQ3.png', 'Hack Call Of Duty Mobile VNG SAFE', 0, '2023-02-06 23:31:26', '2024-01-23 07:03:19'),
(13, 1, 'HACK CS2', 'hack-cs2', 'upload/product/productFDKAW3.png', 'HACK CS2 An Toàn - Giá Rẻ - Có Modskin - Có Spinbot HVH XỊN !!!', 1, '2024-01-23 06:23:14', '2024-01-23 06:32:44'),
(14, 3, 'HACK ĐỘT KÍCH CFVN - CF4VN', 'hack-dot-kich-cfvn-cf4vn', 'upload/product/product27LESC.png', 'Hack CFVN - CF4VN Nhìn Xuyên Tường + Esp + Không giật xịn xò', 1, '2024-01-23 06:35:38', '2024-01-23 07:02:00'),
(16, 2, 'HACK VALORANT', 'hack-valorant', 'upload/product/productDO8PQ0.png', 'HACK Valorant - Giá Rẻ - An Toàn - Hỗ Trợ Máy Nhà + Máy net', 1, '2024-01-23 06:44:25', '2024-01-23 07:01:18'),
(17, 6, 'HACK TRUY KÍCH 2 - PC', 'hack-truy-kich-2-pc', 'upload/product/productT5Y1LU.png', '', 1, '2024-01-23 20:47:42', '2024-05-11 10:40:10'),
(18, 3, 'HWID SPOOFER', 'hwid-spoofer', 'upload/product/productKYM42G.png', '', 0, '2024-02-15 08:58:29', '2024-04-25 10:26:10'),
(19, 3, 'SPOOFER NÉ BAN HWID MỌI GAME', 'spoofer-ne-ban-hwid-moi-game', 'upload/product/productT4HF7D.png', '', 1, '2024-04-25 11:01:56', '2024-04-25 11:02:34'),
(20, 7, 'HACK PUBG STEAM - PC', 'hack-pubg-steam-pc', 'upload/product/product5U21MF.png', '', 1, '2024-05-12 12:07:10', '2024-05-12 12:07:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_groups_hack`
--

CREATE TABLE `tbl_groups_hack` (
  `id` int(11) NOT NULL,
  `cate_id` int(11) DEFAULT NULL,
  `stt` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tutorial` longtext DEFAULT NULL,
  `link_down` text DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_groups_hack`
--

INSERT INTO `tbl_groups_hack` (`id`, `cate_id`, `stt`, `name`, `slug`, `images`, `content`, `tutorial`, `link_down`, `status`, `create_date`, `update_date`) VALUES
(6, 14, 1, 'BẢN MAD AIM PRIVATE - CFVN', 'ban-mad-aim-private-cfvn', 'upload/product/productT4H98Y.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/wBeZUBx0CX0?si=VKSi2OmJ4geIjxfJ\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-family:Arial,Helvetica,sans-serif\">All windows&nbsp;10,11</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All CPU/GPU</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">Hỗ trợ chơi net</span></span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">l&agrave;&nbsp;</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">Win 10,11&nbsp;</span><span style=\"color:#ffff00\">20h2-22h2&nbsp;</span><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">+ H&ecirc;n xui tuỳ m&aacute;y s</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span></span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;chỉ để test trước</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">(&nbsp;</span></span><span style=\"color:#ffff00\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">)</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">******************************************************************************************************</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ff0000\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"color:#cbcbcb; font-family:Arial,Helvetica,sans-serif\">Li&ecirc;n hệ admin để lấy video c&agrave;i đặt hack&nbsp;&nbsp;</span><a href=\"https://www.facebook.com/NGUYENCKA61\" style=\"color: rgb(22, 150, 231); box-sizing: border-box; padding: 0px; text-decoration: underline; transition: all 0.3s ease-out 0s; outline: medium;\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n<span style=\"font-family:Arial\"><span style=\"color:#ff0000\">+</span></span><span style=\"color:#cbcbcb; font-family:Arial\">&nbsp;Kh&ocirc;ng giật</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">+</span></span><span style=\"color:#cbcbcb; font-family:Arial\">&nbsp;Esp xuy&ecirc;n tường</span><br />\r\n<span style=\"font-family:Arial\"><span style=\"color:#ff0000\">+&nbsp;</span><span style=\"color:#cbcbcb\">Aimbot k&ecirc; đầu</span></span><br />\r\n<span style=\"color:#ffff00\">FIX kh&ocirc;ng hiện menu :&nbsp;</span><br />\r\n<span style=\"color:#f7f7f7\">Đổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ</span></span></span><br />\r\n<span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ffff00\">Kiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;</span></span></span><span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ffff00\">nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</span></span></span></p>\r\n\r\n<p style=\"text-align:start\">&nbsp;</p>', 'https://maldevhax.com/', 1, '2024-01-23 07:08:51', '2024-05-19 12:00:43'),
(8, 13, 2, 'BẢN XONE - CS2 LEGIT AN TOÀN GIÁ RẺ', 'ban-xone-cs2-legit-an-toan-gia-re', 'upload/product/product1ZV9MS.png', '', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>+ Hỗ trợ đổi m&aacute;y, đổi key nếu lỗi kh&ocirc;ng x&agrave;i được&nbsp;</p>\r\n\r\n<p><strong><span style=\"background-color:#c0392b\">CHỨC NĂNG: ESP AIMBOT TRIGGER BOT NHẸ NH&Agrave;NG ĐỦ ĐỂ ANH CHƠI LEGIT</span></strong></p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nFile setup trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/13vnGM0tvlUIJaD5zHzubrOBGRvhhJlxs/view?fbclid=IwAR0omGbsuhKH0mKPvzaZiR4_KwxrY7gnZ12o_lb7lyvrBa_rdQ9g2A5MiGw&amp;pli=1\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n1:V&agrave;o web XONE.FUN tạo t&agrave;i khoản +&nbsp;điền key đ&atilde; mua v&agrave; d&aacute;n v&agrave;o active<br />\r\n2:&nbsp;Nhập TK MK đ&atilde; đăng k&iacute; tr&ecirc;n web XONE-&gt; bấm Login<br />\r\n3: Chọn Hack CS2 External v&agrave; ấn n&uacute;t START<br />\r\n4: Đợi th&ocirc;ng b&aacute;o v&agrave;o game&nbsp;<br />\r\n5: V&agrave;o game ấn INS để ẩn hiện menu, tuỳ chỉnh menu như clip hướng dẫn<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', '2', 1, '2024-01-23 19:25:46', '2024-03-02 08:22:02'),
(9, 13, 1, 'BẢN MIDNIGHT - CS2 SKINCHANGER VIP + TẶNG KÈM CONFIG XỊN LEO RANK', 'ban-midnight-cs2-skinchanger-vip-tang-kem-config-xin-leo-rank', 'upload/product/productQ3G4PX.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/ZtspjTsS-lo?si=7ow05l1QbvuzJpGN\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>+ Hỗ trợ đổi m&aacute;y, đổi key nếu lỗi kh&ocirc;ng x&agrave;i được&nbsp;</p>\r\n\r\n<p><strong>CHỨC NĂNG: ESP AIMBOT TRIGGER BOT MOD SKIN XỊN&nbsp;X&Ograve; CỰC NGON AN TO&Agrave;N CAO</strong></p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nFile setup trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/13vnGM0tvlUIJaD5zHzubrOBGRvhhJlxs/view?fbclid=IwAR0omGbsuhKH0mKPvzaZiR4_KwxrY7gnZ12o_lb7lyvrBa_rdQ9g2A5MiGw&amp;pli=1\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n1:V&agrave;o web Midnight.im&nbsp;tạo t&agrave;i khoản +&nbsp;điền key đ&atilde; mua v&agrave; d&aacute;n v&agrave;o active<br />\r\n2:&nbsp;Nhập TK MK đ&atilde; đăng k&iacute; tr&ecirc;n web MIDNIGHT.IM -&gt; bấm Login<br />\r\n3:&nbsp;Ấn n&uacute;t START<br />\r\n4: Đợi th&ocirc;ng b&aacute;o v&agrave;o game&nbsp;<br />\r\n5: V&agrave;o game ấn INS để ẩn hiện menu, li&ecirc;n hệ admin để lấy config<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://midnight.im/', 1, '2024-01-23 19:36:37', '2024-01-25 16:58:27'),
(10, 13, 1, 'BẢN NEVERLOSE - HVH NÓI KHÔNG VỚI THUA + SPINBOT XỊN CÓ SKINCHANGER', 'ban-neverlose-hvh-noi-khong-voi-thua-spinbot-xin-co-skinchanger', 'upload/product/productUZ4PMO.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/m3Ex97IOhQI?si=-DYi_gPWGqjmx-e0\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>+ Hỗ trợ đổi m&aacute;y, đổi key nếu lỗi kh&ocirc;ng x&agrave;i được&nbsp;</p>\r\n\r\n<p><strong>CHỨC NĂNG: HVH CẮM MẶT XUỐNG ĐẤT BẮN SI&Ecirc;U D&Iacute;NH + LEGIT BẮN NHẸ NH&Agrave;NG AN TO&Agrave;N CỰC CAO</strong></p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nFile setup trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/13vnGM0tvlUIJaD5zHzubrOBGRvhhJlxs/view?fbclid=IwAR0omGbsuhKH0mKPvzaZiR4_KwxrY7gnZ12o_lb7lyvrBa_rdQ9g2A5MiGw&amp;pli=1\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n1:Nhập key đ&atilde; mua&nbsp;<br />\r\n2:V&agrave;o Game<br />\r\n3: Đơn giản vậy th&ocirc;i l&agrave; được<br />\r\n5: V&agrave;o game ấn INS để ẩn hiện menu, li&ecirc;n hệ admin để lấy config<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://neverlose.cc/', 1, '2024-01-23 19:47:00', '2024-01-25 17:00:38'),
(11, 13, 1, 'BẢN 114 AIMCHANGER - CS2 AIM XỊN MOD SKIN NGON', 'ban-114-aimchanger-cs2-aim-xin-mod-skin-ngon', 'upload/product/product0F8JIQ.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/eqSiQFoASxg?si=tzhAEk8IWvUxutFT\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>+ Hỗ trợ đổi m&aacute;y, đổi key nếu lỗi kh&ocirc;ng x&agrave;i được&nbsp;</p>\r\n\r\n<p><strong>CHỨC NĂNG: HVH CẮM MẶT XUỐNG ĐẤT BẮN SI&Ecirc;U D&Iacute;NH + LEGIT BẮN NHẸ NH&Agrave;NG AN TO&Agrave;N CỰC CAO</strong></p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nFile setup trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/13vnGM0tvlUIJaD5zHzubrOBGRvhhJlxs/view?fbclid=IwAR0omGbsuhKH0mKPvzaZiR4_KwxrY7gnZ12o_lb7lyvrBa_rdQ9g2A5MiGw&amp;pli=1\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n1:Nhập key đ&atilde; mua&nbsp;<br />\r\n2:V&agrave;o Game<br />\r\n3: Đơn giản vậy th&ocirc;i l&agrave; được<br />\r\n5: V&agrave;o game ấn INS để ẩn hiện menu, li&ecirc;n hệ admin để lấy config<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://www.facebook.com/NGUYENCKA61/', 1, '2024-01-23 19:52:44', '2024-01-25 17:00:52'),
(12, 13, 2, 'BẢN AIMWARE - CS2 HVH SPIN BOT', 'ban-aimware-cs2-hvh-spin-bot', 'upload/product/productVLXAYJ.png', '<h2 style=\"font-style:italic\"><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/StT475A6nvg?si=F9sTG_0Cs2qJY1zD\" title=\"YouTube video player\" width=\"560\"></iframe></h2>', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>+ Hỗ trợ đổi m&aacute;y, đổi key nếu lỗi kh&ocirc;ng x&agrave;i được&nbsp;</p>\r\n\r\n<p><strong>CHỨC NĂNG: HVH CẮM MẶT XUỐNG ĐẤT BẮN SI&Ecirc;U D&Iacute;NH + LEGIT BẮN NHẸ NH&Agrave;NG AN TO&Agrave;N CỰC CAO</strong></p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nFile setup trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/13vnGM0tvlUIJaD5zHzubrOBGRvhhJlxs/view?fbclid=IwAR0omGbsuhKH0mKPvzaZiR4_KwxrY7gnZ12o_lb7lyvrBa_rdQ9g2A5MiGw&amp;pli=1\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n1:Nhập key đ&atilde; mua&nbsp;<br />\r\n2:V&agrave;o Game<br />\r\n3: Đơn giản vậy th&ocirc;i l&agrave; được<br />\r\n5: V&agrave;o game ấn INS để ẩn hiện menu, li&ecirc;n hệ admin để lấy config<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://aimware.net/', 1, '2024-01-23 19:54:19', '2024-03-02 08:33:07'),
(14, 16, 1, 'HACK GLOW ESP - AN TOÀN MÁY NHÀ', 'hack-glow-esp-an-toan-may-nha', 'upload/product/productTM1GV9.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/fn5dIrBOAzo?si=Qrp7zLfg64ymy1W3\" title=\"YouTube video player\" width=\"560\"></iframe></p>\r\n\r\n<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/TizVVncKlVY?si=rSiWA5xGCIdjOY_O\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-family:Arial,Helvetica,sans-serif\">All windows 10,11<span style=\"color:#00ff00\">&nbsp;( 21h2 - 22h2 )</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All CPU/GPU</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">Hỗ trợ chơi net</span></span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">l&agrave;&nbsp;</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">Win 10&nbsp;</span><span style=\"color:#ffff00\">21h2-22h2&nbsp;</span><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">+ H&ecirc;n xui tuỳ m&aacute;y s</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span></span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;chỉ để test trước&nbsp;</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">(&nbsp;</span></span><span style=\"color:#ffff00\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader, sẽ trừ đến khi hết hạn, nghĩa l&agrave; bạn kh&ocirc;ng d&ugrave;ng vẫn hết key</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;)</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">******************************************************************************************************</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"color:#ff0000\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">Những thứ cần setup trước khi chạy hack&nbsp;</span><a href=\"https://youtu.be/Od1OTHpHwPE\" style=\"box-sizing:border-box; padding:0px; color:#1696e7; text-decoration:underline; transition:all 0.3s ease-out 0s; outline:medium\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để xem hướng dẫn</a><br />\r\nGỡ faceit nếu ở net:&nbsp;<a href=\"https://youtu.be/YY706oT5RLs\" style=\"box-sizing:border-box; padding:0px; color:#1696e7; text-decoration:underline; transition:all 0.3s ease-out 0s; outline:medium\" target=\"_blank\">bấm v&agrave;o để xem hướng dẫn</a><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">1:</span></span><span style=\"font-family:Arial\">&nbsp;Run as adminstrator</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">2:</span></span><span style=\"font-family:Arial\">&nbsp;Add key -&gt; bấm Sub</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">3:&nbsp;</span></span><span style=\"font-family:Arial\">V&agrave;o game chuyển qua chế độ Windows Full screen</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">4:</span></span><span style=\"font-family:Arial\">&nbsp;Ở sảnh chờ bấm Inject&nbsp;</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">5:&nbsp;</span></span><span style=\"font-family:Arial\"><span style=\"font-family:Arial\">(Đợi khoản 5s done) Hiện men</span>u l&agrave; ok</span><br />\r\n<span style=\"color:#ffff00\">FIX valorant m&agrave;ng xanh v&agrave; crash game:&nbsp;</span><br />\r\n<span style=\"color:#f7f7f7\">Lệnh CMD: v&agrave;o link tải để xem</span><br />\r\n<span style=\"color:#ffff00\">Khởi động lại PC</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All windows 10</span></span><span style=\"color:#00ff00\">&nbsp;( 21h2 - 22h2 )</span></span></span></span></p>', 'https://fishy-m.gitbook.io/glow-setup/', 1, '2024-01-23 20:25:41', '2024-04-25 10:30:46'),
(15, 16, 1, 'COLOR AIMBOT - AN TOÀN MÁY NHÀ + MÁY NET', 'color-aimbot-an-toan-may-nha-may-net', 'upload/product/productHGLEV2.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/dCi99Kpwq-M?si=OhGIeEvZPJ6EOPfY\" title=\"YouTube video player\" width=\"560\"></iframe></p>\r\n\r\n<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/3vMlTDcpwtE?si=3By1rpKaeA-XVL5k\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-family:Arial,Helvetica,sans-serif\">All windows 10,11<span style=\"color:#00ff00\">( 21h2 - 22h2 )</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All CPU/GPU</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">Hỗ trợ chơi net</span></span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">l&agrave;&nbsp;</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">Win 10&nbsp;</span><span style=\"color:#ffff00\">21h2-22h2&nbsp;</span><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">+ H&ecirc;n xui tuỳ m&aacute;y s</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span></span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;chỉ để test trước&nbsp;</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">(&nbsp;</span></span><span style=\"color:#ffff00\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader, sẽ trừ đến khi hết hạn, nghĩa l&agrave; bạn kh&ocirc;ng d&ugrave;ng vẫn hết key</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;)</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">******************************************************************************************************</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"color:#ff0000\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">Những thứ cần setup trước khi chạy hack&nbsp;</span><a href=\"https://youtu.be/Od1OTHpHwPE\" style=\"box-sizing:border-box; padding:0px; color:#1696e7; text-decoration:underline; transition:all 0.3s ease-out 0s; outline:medium\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để xem hướng dẫn</a><br />\r\nGỡ faceit nếu ở net:&nbsp;<a href=\"https://youtu.be/YY706oT5RLs\" style=\"box-sizing:border-box; padding:0px; color:#1696e7; text-decoration:underline; transition:all 0.3s ease-out 0s; outline:medium\" target=\"_blank\">bấm v&agrave;o để xem hướng dẫn</a><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">1:</span></span><span style=\"font-family:Arial\">&nbsp;Run as adminstrator</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">2:</span></span><span style=\"font-family:Arial\">&nbsp;Add key -&gt; bấm Sub</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">3:&nbsp;</span></span><span style=\"font-family:Arial\">V&agrave;o game chuyển qua chế độ Windows Full screen</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">4:</span></span><span style=\"font-family:Arial\">&nbsp;Ở sảnh chờ bấm Inject&nbsp;</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">5:&nbsp;</span></span><span style=\"font-family:Arial\"><span style=\"font-family:Arial\">(Đợi khoản 5s done) Hiện men</span>u l&agrave; ok</span><br />\r\n<span style=\"color:#ffff00\">FIX valorant m&agrave;ng xanh v&agrave; crash game:&nbsp;</span><br />\r\n<span style=\"color:#f7f7f7\">Lệnh CMD: v&agrave;o link tải để xem</span><br />\r\n<span style=\"color:#ffff00\">Khởi động lại PC</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All windows 10</span></span><span style=\"color:#00ff00\">&nbsp;( 21h2 - 22h2 )</span></span></span></span></p>', 'https://fishy-markets.gitbook.io/valorant-aim/setup/setup', 1, '2024-01-23 20:30:25', '2024-02-29 08:20:04'),
(16, 16, 2, 'AIMBOT ARDUINO - NGON AN TOÀN', 'aimbot-arduino-ngon-an-toan', 'upload/product/product6R04YP.png', '<div class=\"col-lg-5 info-list-details\">\r\n<h3>Th&ocirc;ng tin</h3>\r\n\r\n<div class=\"row\">\r\n<hr />\r\n<p><span style=\"font-family:Arial\">All windows 10 + 11<span style=\"color:#00ff00\">&nbsp;( 21h2 - 22h2 )</span></span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">All CPU/GPU</span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">Hỗ trợ chơi net</span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\">l&agrave;&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\">Win 10&nbsp;</span><span style=\"color:#ffff00; font-family:Arial; font-size:1rem\">21h2-22h2&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">+ H&ecirc;n xui tuỳ m&aacute;y s</span><span style=\"font-family:Arial; font-size:1rem\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c m&aacute;y net, nh&agrave; lỗi chỉ cần c&agrave;i lại windows,&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span><span style=\"font-family:Arial; font-size:1rem\">&nbsp;chỉ để test trước&nbsp;</span></p>\r\n\r\n<p><span style=\"font-family:Arial; font-size:1rem\">(&nbsp;</span><span style=\"color:#ffff00; font-family:Arial; font-size:1rem\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader, sẽ trừ đến khi hết hạn, nghĩa l&agrave; bạn kh&ocirc;ng d&ugrave;ng vẫn hết key</span><span style=\"font-family:Arial; font-size:1rem\">&nbsp;)</span></p>\r\n\r\n<p><span style=\"font-family:Arial; font-size:1rem\">******************************************************************************************************</span><br />\r\n<span style=\"color:#ff0000; font-family:Arial\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"font-family:Arial\">Những thứ cần setup trước khi chạy hack&nbsp;</span><a href=\"https://youtu.be/Od1OTHpHwPE\" style=\"background-color: rgb(63, 71, 78);\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để xem hướng dẫn</a><br />\r\nGỡ faceit nếu ở net:&nbsp;<a href=\"https://youtu.be/YY706oT5RLs\" style=\"background-color: rgb(63, 71, 78);\" target=\"_blank\">bấm v&agrave;o để xem hướng dẫn</a><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">1:</span></span><span style=\"font-family:Arial\">&nbsp;Run as adminstrator</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">2:</span></span><span style=\"font-family:Arial\">&nbsp;Đăng k&iacute; TK -&gt; Add key -&gt; bấm Sub -&gt; Login</span><br />\r\n<span style=\"color:#ff0000; font-family:Arial\">3:&nbsp;</span><span style=\"font-family:Arial\">Bấm Injcet - Login tk-mk- đợi10s -&gt; hiện waiting game</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">4:&nbsp;</span></span><span style=\"font-family:Arial\">V&agrave;o game chuyển qua chế độ Windows Full screen</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">5:</span></span><span style=\"font-family:Arial\">&nbsp;Ở sảnh chờ bấm Inject&nbsp;</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">6:&nbsp;</span></span><span style=\"font-family:Arial\">(Đợi khoản 5s done) Hiện menu l&agrave; ok</span></p>\r\n</div>\r\n</div>', '<p>&nbsp;</p>\r\n\r\n<div class=\"col-lg-5 info-list-details\">&nbsp;\r\n<h3>Th&ocirc;ng tin</h3>\r\n&nbsp;\r\n\r\n<div class=\"row\">&nbsp;\r\n<hr />&nbsp;\r\n<p><span style=\"font-family:Arial\">All windows 10 + 11<span style=\"color:#00ff00\">&nbsp;( 21h2 - 22h2 )</span></span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">All CPU/GPU</span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">Hỗ trợ chơi net</span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\">l&agrave;&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\">Win 10&nbsp;</span><span style=\"color:#ffff00; font-family:Arial; font-size:1rem\">21h2-22h2&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-family:Arial; font-size:1rem\">+ H&ecirc;n xui tuỳ m&aacute;y s</span><span style=\"font-family:Arial; font-size:1rem\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c m&aacute;y net, nh&agrave; lỗi chỉ cần c&agrave;i lại windows,&nbsp;</span><span style=\"font-family:Arial; font-size:1rem\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span><span style=\"font-family:Arial; font-size:1rem\">&nbsp;chỉ để test trước&nbsp;</span></p>\r\n\r\n<p><span style=\"font-family:Arial; font-size:1rem\">(&nbsp;</span><span style=\"color:#ffff00; font-family:Arial; font-size:1rem\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader, sẽ trừ đến khi hết hạn, nghĩa l&agrave; bạn kh&ocirc;ng d&ugrave;ng vẫn hết key</span><span style=\"font-family:Arial; font-size:1rem\">&nbsp;)</span></p>\r\n\r\n<p><span style=\"font-family:Arial; font-size:1rem\">******************************************************************************************************</span><br />\r\n<span style=\"color:#ff0000; font-family:Arial\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"font-family:Arial\">Những thứ cần setup trước khi chạy hack&nbsp;</span><a href=\"https://youtu.be/Od1OTHpHwPE\" style=\"background-color: rgb(63, 71, 78);\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để xem hướng dẫn</a><br />\r\nGỡ faceit nếu ở net:&nbsp;<a href=\"https://youtu.be/YY706oT5RLs\" style=\"background-color: rgb(63, 71, 78);\" target=\"_blank\">bấm v&agrave;o để xem hướng dẫn</a><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">1:</span></span><span style=\"font-family:Arial\">&nbsp;Run as adminstrator</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">2:</span></span><span style=\"font-family:Arial\">&nbsp;Đăng k&iacute; TK -&gt; Add key -&gt; bấm Sub -&gt; Login</span><br />\r\n<span style=\"color:#ff0000; font-family:Arial\">3:&nbsp;</span><span style=\"font-family:Arial\">Bấm Injcet - Login tk-mk- đợi10s -&gt; hiện waiting game</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">4:&nbsp;</span></span><span style=\"font-family:Arial\">V&agrave;o game chuyển qua chế độ Windows Full screen</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">5:</span></span><span style=\"font-family:Arial\">&nbsp;Ở sảnh chờ bấm Inject&nbsp;</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">6:&nbsp;</span></span><span style=\"font-family:Arial\">(Đợi khoản 5s done) Hiện menu l&agrave; ok</span></p>\r\n</div>\r\n</div>\r\n\r\n<p>&nbsp;</p>', '', 1, '2024-01-23 20:31:28', '2024-04-25 10:45:28'),
(19, 17, 1, 'BẢN 114 ESP - AN TOÀN + AIM MƯỢT', 'ban-114-esp-an-toan-aim-muot', 'upload/product/product9DC2OE.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/9So622AdLdk?si=6HaeDntPyMP-49FC\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>+ Hỗ trợ đổi m&aacute;y, đổi key nếu lỗi kh&ocirc;ng x&agrave;i được&nbsp;</p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nFile setup trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/13vnGM0tvlUIJaD5zHzubrOBGRvhhJlxs/view?fbclid=IwAR0omGbsuhKH0mKPvzaZiR4_KwxrY7gnZ12o_lb7lyvrBa_rdQ9g2A5MiGw&amp;pli=1\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n1:&nbsp;Run as adminstrator<br />\r\n2:&nbsp;Nhập key -&gt; bấm Login<br />\r\n3:&nbsp;Sau khi đ&oacute; loader sẽ tắt v&agrave; bạn cần li&ecirc;n hệ với admin để được x&aacute;c thực key<br />\r\n4:&nbsp;Mở lại loader bấm Inject v&agrave; đợi loader tắt sau đ&oacute; v&agrave;o game &nbsp;&nbsp;<br />\r\n5:&nbsp;(Đợi khoản 10s done) Hiện menu l&agrave; ok<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://anonym.ninja/download/ckneYAcNv50HVj4?fbclid=IwAR30ar4UgOwIsHg-Fkmzw31TUiaNlyn-1Tp_NPUxNiL1sPWQzqEFxfBV-ig', 1, '2024-01-24 16:48:02', '2024-01-24 16:51:07'),
(23, 19, 2, 'PERM SPOOFER', 'perm-spoofer', 'upload/product/productF436TU.png', '', '', '', 1, '2024-02-15 08:54:31', '2024-04-25 11:02:54'),
(28, 19, 2, 'RAMS SPOOFER XỊN', 'rams-spoofer-xin', 'upload/product/productS1QH65.png', '', '', '', 1, '2024-02-29 08:16:04', '2024-04-25 11:02:45'),
(29, 16, 3, 'PRIVATE STREAM', 'private-stream', 'upload/product/productFWPNIR.png', '', NULL, NULL, 1, '2024-02-29 08:24:40', '2024-02-29 08:24:40'),
(33, 13, 1, 'BẢN MEMESENSE- CS2 LEGIT AN TOÀN NGON', 'ban-memesense-cs2-legit-an-toan-ngon', 'upload/product/productVPLNHZ.png', '', '', '', 1, '2024-03-02 08:21:29', '2024-03-02 08:31:31'),
(34, 13, 1, 'BẢN ANYX - CS2 SKINCHANGER VIP + TẶNG KÈM CONFIG XỊN LEO RANK', 'ban-anyx-cs2-skinchanger-vip-tang-kem-config-xin-leo-rank', 'upload/product/productDT17RK.png', '', NULL, NULL, 1, '2024-03-02 08:40:02', '2024-03-02 08:40:02'),
(35, 14, 3, 'BẢN 114 AIM- CF4VN LẬU', 'ban-114-aim-cf4vn-lau', 'upload/product/productI1P8KS.png', '', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nFile setup 1 trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/1hZcDLDrSyY3RV6GWfbMHJTkQRpMzCpr0/view?usp=sharing\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n1:&nbsp;Run as adminstrator<br />\r\n2:&nbsp;Nhập key -&gt; bấm Login<br />\r\n3:&nbsp;Sau khi đ&oacute; loader sẽ tắt v&agrave; bạn cần li&ecirc;n hệ với admin để được x&aacute;c thực key<br />\r\n4:&nbsp;Mở lại loader bấm Inject v&agrave; đợi loader tắt sau đ&oacute; v&agrave;o game &nbsp;&nbsp;<br />\r\n5:&nbsp;(Đợi khoản 10s done) Hiện menu l&agrave; ok<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://www.114hack.com/p/thichthihack-tai-hack.html', 1, '2024-03-02 08:45:39', '2024-05-17 21:32:40'),
(36, 7, 1, 'PV LOL', 'pv-lol', 'upload/product/productOPZL7C.png', '', '<ul>\r\n	<li><span style=\"color:#000000\">Window Support</span></li>\r\n	<li>All window 10+11&nbsp;</li>\r\n	<li>All CPU/GPU</li>\r\n	<li>Hỗ trợ chơi net</li>\r\n	<li>File setup trước khi chạy hack (Pass:114) &nbsp;<a href=\"https://drive.google.com/file/d/13vnGM0tvlUIJaD5zHzubrOBGRvhhJlxs/view?fbclid=IwAR0omGbsuhKH0mKPvzaZiR4_KwxrY7gnZ12o_lb7lyvrBa_rdQ9g2A5MiGw&amp;pli=1\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a></li>\r\n	<li>1-&nbsp; Run full Dirver</li>\r\n	<li>2- Disable antivirus<br />\r\n	Hướng dẫn Chạy hax<br />\r\n	Bước 1: Chạy hack quyền admin<br />\r\n	Bước 2: Sao ch&eacute;p key v&agrave;o loader ( đợi khoản 5s )<br />\r\n	Bước 3: V&agrave;o game<br />\r\n	Bước 4 Chuyển game sang chế độ kh&ocirc;ng viền<br />\r\n	Bước 5: Nhấn shift để bật menu<br />\r\n	C&aacute;c Bước combo<br />\r\n	+ N&uacute;t combo: Space<br />\r\n	+ Fam l&iacute;nh: V<br />\r\n	+ lasthit: X<br />\r\n	+ harass: C</li>\r\n</ul>', 'https://anonym.ninja/download/JwtR15gQnJ0iPn4', 1, '2024-03-02 12:47:50', '2024-03-02 12:55:37'),
(38, 16, 3, 'FISHWARE FULL - ESP AIMBOT MOD SKIN NGON', 'fishware-full-esp-aimbot-mod-skin-ngon', 'upload/product/productTHBUSE.png', '', '<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"font-family:&quot;chakra petch&quot;,sans-serif\"><span style=\"background-color:#181b20\"><span style=\"font-family:Arial,Helvetica,sans-serif\">All windows 10 + 11<span style=\"color:#00ff00\">&nbsp;( 21h2 - 22h2 )</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All CPU/GPU</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">Hỗ trợ chơi net</span></span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">l&agrave;&nbsp;</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">Win 10&nbsp;</span><span style=\"color:#ffff00\">21h2-22h2&nbsp;</span><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">+ H&ecirc;n xui tuỳ m&aacute;y s</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c m&aacute;y net, nh&agrave; lỗi chỉ cần c&agrave;i lại windows,&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span></span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;chỉ để test trước&nbsp;</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"font-family:&quot;chakra petch&quot;,sans-serif\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">(&nbsp;</span></span><span style=\"color:#ffff00\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader, sẽ trừ đến khi hết hạn, nghĩa l&agrave; bạn kh&ocirc;ng d&ugrave;ng vẫn hết key</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;)</span></span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"font-family:&quot;chakra petch&quot;,sans-serif\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">******************************************************************************************************</span></span><br />\r\n<span style=\"color:#ff0000\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">Những thứ cần setup trước khi chạy hack&nbsp;</span><a href=\"https://youtu.be/Od1OTHpHwPE\" style=\"box-sizing:border-box; padding:0px; color:#1696e7; text-decoration:underline; transition:all 0.3s ease-out 0s; outline:medium; background-color:#3f474e\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để xem hướng dẫn</a><br />\r\nGỡ faceit nếu ở net:&nbsp;<a href=\"https://youtu.be/YY706oT5RLs\" style=\"box-sizing:border-box; padding:0px; color:#1696e7; text-decoration:underline; transition:all 0.3s ease-out 0s; outline:medium; background-color:#3f474e\" target=\"_blank\">bấm v&agrave;o để xem hướng dẫn</a><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">1:</span></span><span style=\"font-family:Arial\">&nbsp;Run as adminstrator</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">2:</span></span><span style=\"font-family:Arial\">&nbsp;Đăng k&iacute; TK -&gt; Add key -&gt; bấm Sub -&gt; Login</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">3:&nbsp;</span></span><span style=\"font-family:Arial\">Bấm Injcet - Login tk-mk- đợi10s -&gt; hiện waiting game</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">4:&nbsp;</span></span><span style=\"font-family:Arial\">V&agrave;o game chuyển qua chế độ Windows Full screen</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">5:</span></span><span style=\"font-family:Arial\">&nbsp;Ở sảnh chờ bấm Inject&nbsp;</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">6:&nbsp;</span></span><span style=\"font-family:Arial\">(Đợi khoản 5s done) Hiện menu l&agrave; ok</span></span></span></span></span></p>', 'https://fishy-markets.gitbook.io/fishware_full_valorant/', 1, '2024-03-03 08:33:41', '2024-04-25 11:28:38'),
(39, 14, 2, 'BẢN AI GOD - CFVN', 'ban-ai-god-cfvn', 'upload/product/product3MHZ5L.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/OmPKVBlcy2o?si=QG_KNjcNPgQjmNnU\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-family:Arial,Helvetica,sans-serif\">All windows&nbsp;10,11</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All CPU/GPU</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">Hỗ trợ chơi net</span></span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">l&agrave;&nbsp;</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">Win 10,11&nbsp;</span><span style=\"color:#ffff00\">20h2-22h2&nbsp;</span><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">+ H&ecirc;n xui tuỳ m&aacute;y s</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span></span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;chỉ để test trước</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">(&nbsp;</span></span><span style=\"color:#ffff00\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">)</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">******************************************************************************************************</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ff0000\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"color:#cbcbcb\"><span style=\"font-family:Arial,Helvetica,sans-serif\">Li&ecirc;n hệ admin để lấy video c&agrave;i đặt hack&nbsp;&nbsp;</span></span><a href=\"https://www.facebook.com/NGUYENCKA61\" style=\"color:#1696e7; box-sizing:border-box; padding:0px; text-decoration:underline; transition:all 0.3s ease-out 0s; outline:medium\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n<span style=\"font-family:Arial\"><span style=\"color:#ff0000\">+</span></span><span style=\"color:#cbcbcb\"><span style=\"font-family:Arial\">&nbsp;Kh&ocirc;ng giật</span></span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">+</span></span><span style=\"color:#cbcbcb\"><span style=\"font-family:Arial\">&nbsp;Bắn nhanh</span></span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">+&nbsp;</span></span><span style=\"color:#cbcbcb\"><span style=\"font-family:Arial\">Thay đạn nhanh</span></span><br />\r\n<span style=\"font-family:Arial\"><span style=\"color:#ff0000\">+&nbsp;</span><span style=\"color:#cbcbcb\">Tăng tỉ lệ DAME AI</span></span><br />\r\n<span style=\"color:#ffff00\">FIX kh&ocirc;ng hiện menu :&nbsp;</span><br />\r\n<span style=\"color:#f7f7f7\">Đổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ</span></span></span><br />\r\n<span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ffff00\">Kiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;</span></span></span><span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ffff00\">nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</span></span></span></p>', 'https://www.114hack.com/p/thichthihack-tai-hack.html', 1, '2024-04-01 19:33:08', '2024-04-11 07:42:17'),
(41, 14, 1, 'BẢN G4 LITE- CFVN', 'ban-g4-lite-cfvn', 'upload/product/productGVW2RZ.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/CZFfeOEqUq0?si=x67zV7AwUfzI_hIP\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nLi&ecirc;n hệ admin để lấy video c&agrave;i đặt hack&nbsp;&nbsp;<a href=\"https://www.facebook.com/NGUYENCKA61\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n+&nbsp;Kh&ocirc;ng giật<br />\r\n+&nbsp;Bắn nhanh<br />\r\n+&nbsp;Thay đạn nhanh<br />\r\n+ Triggerbot<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://drive.google.com/file/d/1S9uclmRInKjsMNJhhxaTSgLMOlz1cT8k/view?usp=sharing', 1, '2024-04-11 06:40:17', '2024-05-12 12:33:54');
INSERT INTO `tbl_groups_hack` (`id`, `cate_id`, `stt`, `name`, `slug`, `images`, `content`, `tutorial`, `link_down`, `status`, `create_date`, `update_date`) VALUES
(42, 14, 1, 'BẢN G4 PRIVATE - FULL CHỨC NĂNG', 'ban-g4-private-full-chuc-nang', 'upload/product/productNYIU48.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/iHVTEpwh5pE?si=IaGv-Hcjk0HvYoZ6\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>All windows&nbsp;10,11<br />\r\nAll CPU/GPU<br />\r\nHỗ trợ chơi net<br />\r\n+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;l&agrave;&nbsp;Win 10,11&nbsp;20h2-22h2&nbsp;hoạt động tốt&nbsp;<br />\r\n+ H&ecirc;n xui tuỳ m&aacute;y sẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;n&ecirc;n mua key&nbsp;thấp giờ&nbsp;chỉ để test trước</p>\r\n\r\n<p>(&nbsp;key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực)</p>\r\n\r\n<p>******************************************************************************************************</p>\r\n\r\n<p>Hướng dẫn&nbsp;<br />\r\nLi&ecirc;n hệ admin để lấy video c&agrave;i đặt hack&nbsp;&nbsp;<a href=\"https://www.facebook.com/NGUYENCKA61\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n+&nbsp;Kh&ocirc;ng giật<br />\r\n+&nbsp;Bắn nhanh<br />\r\n+&nbsp;Thay đạn nhanh<br />\r\n+ Dịch chuyển<br />\r\n+ Chạy nhanh<br />\r\n+ Auto bunny<br />\r\n+ Trigger bot<br />\r\n+ Spam radio<br />\r\nFIX kh&ocirc;ng hiện menu :&nbsp;<br />\r\nĐổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ<br />\r\nKiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</p>', 'https://drive.google.com/file/d/1S9uclmRInKjsMNJhhxaTSgLMOlz1cT8k/view?usp=sharing', 1, '2024-04-11 06:40:42', '2024-05-12 12:33:56'),
(43, 16, 1, 'VAL RECHECK XỊN NGON - AN TOÀN MÁY NET', 'val-recheck-xin-ngon-an-toan-may-net', 'upload/product/productK3TNO1.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/zwKoOKA4Qj4?si=BBA18pFirdxjCCBS\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>Run riot cilent as admin</p>\r\n\r\n<p>Run game Run cheat loader and log in.</p>\r\n\r\n<p>Choice number 1 and enter to inject Note:</p>\r\n\r\n<p>Make sure all AV,</p>\r\n\r\n<p>Defender turn off Core isolation turn off</p>', 'https://mega.nz/folder/vvgyDBTI#CytGWCUausjVzqNSevwrBg', 1, '2024-04-19 13:48:16', '2024-04-25 10:43:47'),
(44, 16, 1, 'PRIVATE LIG - ESP AIMBOT AN TOÀN CAO', 'private-lig-esp-aimbot-an-toan-cao', 'upload/product/productNOJ9LV.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/MRIU0_NWdoE?si=nEQZjC7ob8gQxMUw\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '<p>&nbsp;</p>\r\n\r\n<p><strong>Valorant </strong> <strong>Movavi</strong> <a href=\"https://mega.nz/file/DWp2WSyA#h654DNKhjjwacCITzlLnIDGz0q_oZ1wNCznrYsH8YDw\" rel=\"noreferrer noopener\" tabindex=\"0\" target=\"_blank\" title=\"https://mega.nz/file/DWp2WSyA#h654DNKhjjwacCITzlLnIDGz0q_oZ1wNCznrYsH8YDw\r\n\r\n(https://mega.nz/file/DWp2WSyA#h654DNKhjjwacCITzlLnIDGz0q_oZ1wNCznrYsH8YDw)\">https://mega.nz/file/DWp2WSyA#h654DNKhjjwacCITzlLnIDGz0q_oZ1wNCznrYsH8YDw</a></p>\r\n\r\n<p><strong>Loader</strong>: Loader.NLxZf.exe</p>\r\n\r\n<ol start=\"1\">\r\n	<li>Install Movavi Recorder and keep it running in background.</li>\r\n	<li>Run loader</li>\r\n	<li>Wait it load</li>\r\n	<li>When it said <code>Waiting for game</code> then you can run game.</li>\r\n	<li>Go back to CMD and hit enter.</li>\r\n</ol>\r\n\r\n<p>// In the case it doesnt load restart the loader. // Movavi can be expired but its ok</p>', 'https://cdn.discordapp.com/attachments/1117054866142003271/1232356367071711252/Loader.NLxZf.exe?ex=662b230d&is=6629d18d&hm=8628a788bb6f330547837aead3d10473876d0c9f6adb62469fd35bc82a050a88&', 1, '2024-04-25 10:41:03', '2024-04-29 16:16:05'),
(45, 16, 2, 'PRIVATE RADA - AN TOÀN', 'private-rada-an-toan', 'upload/product/productPI0OKU.png', '', '', '', 1, '2024-04-25 10:59:43', '2024-04-25 10:59:58'),
(46, 16, 1, 'ONYX - ESP AIMBOT AN TOÀN CAO MÁY NHÀ', 'onyx-esp-aimbot-an-toan-cao-may-nha', 'upload/product/productWLCNO4.png', '<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/NUJseTBRKsI?si=g1iE9555W6C6LAZW\" title=\"YouTube video player\" width=\"560\"></iframe></p>', '', '', 1, '2024-04-27 13:53:27', '2024-04-29 16:09:07'),
(47, 16, 1, 'ONYX - ONLY ESP AN TOÀN CAO', 'onyx-only-esp-an-toan-cao-', 'upload/product/productAHFQ85.png', '', NULL, NULL, 1, '2024-04-27 13:59:18', '2024-04-27 13:59:18'),
(48, 19, 1, 'SPOOFER LITE', 'spoofer-lite', 'upload/product/productILEFM7.png', '', NULL, NULL, 1, '2024-05-02 09:46:27', '2024-05-02 09:46:27'),
(49, 17, 1, 'BẢN TK-PC- TRUY KÍCH 2 PC', 'ban-tk-pc-truy-kich-2-pc', 'upload/product/productMYKXCL.png', '', '<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-family:Arial,Helvetica,sans-serif\">All windows&nbsp;10,11</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">All CPU/GPU</span></span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">Hỗ trợ chơi net</span></span><br />\r\n<span style=\"font-family:Arial,Helvetica,sans-serif\">+ Winver hoạt động tốt nhất tr&ecirc;n all c&aacute;c m&aacute;y&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">l&agrave;&nbsp;</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">Win 10,11&nbsp;</span><span style=\"color:#ffff00\">20h2-22h2&nbsp;</span><span style=\"font-family:Arial,Helvetica,sans-serif\"><span style=\"font-size:1rem\">hoạt động t</span>ốt&nbsp;</span><br />\r\n<span style=\"font-size:1rem\"><span style=\"font-family:Arial\">+ H&ecirc;n xui tuỳ m&aacute;y s</span></span><span style=\"font-family:Arial,Helvetica,sans-serif\">ẽ hoạt&nbsp;động tr&ecirc;n c&aacute;c ver&nbsp;</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">n&ecirc;n mua key&nbsp;<span style=\"color:#ffff00\">thấp giờ</span></span></span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">&nbsp;chỉ để test trước</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">(&nbsp;</span></span><span style=\"color:#ffff00\">key được t&iacute;nh v&agrave;o l&uacute;c bạn nhập key v&agrave;o loader v&agrave; sau khi admin x&aacute;c thực</span><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">)</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"color:#cbcbcb\"><span style=\"background-color:#181b20\"><span style=\"font-size:1rem\"><span style=\"font-family:Arial\">******************************************************************************************************</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:start\"><span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ff0000\">Hướng dẫn&nbsp;</span><br />\r\n<span style=\"color:#cbcbcb; font-family:Arial,Helvetica,sans-serif\">Li&ecirc;n hệ admin để lấy video c&agrave;i đặt hack&nbsp;&nbsp;</span><a href=\"https://www.facebook.com/NGUYENCKA61\" style=\"color: rgb(22, 150, 231); box-sizing: border-box; padding: 0px; text-decoration: underline; transition: all 0.3s ease-out 0s; outline: medium;\" target=\"_blank\">Bấm v&agrave;o đ&acirc;y để tải về</a><br />\r\n<span style=\"font-family:Arial\"><span style=\"color:#ff0000\">+</span></span><span style=\"color:#cbcbcb; font-family:Arial\">&nbsp;Kh&ocirc;ng giật</span><br />\r\n<span style=\"color:#ff0000\"><span style=\"font-family:Arial\">+</span></span><span style=\"color:#cbcbcb; font-family:Arial\">&nbsp;Esp xuy&ecirc;n tường</span><br />\r\n<span style=\"font-family:Arial\"><span style=\"color:#ff0000\">+&nbsp;</span><span style=\"color:#cbcbcb\">Aimbot k&ecirc; đầu</span></span><br />\r\n<span style=\"color:#ffff00\">FIX kh&ocirc;ng hiện menu :&nbsp;</span><br />\r\n<span style=\"color:#f7f7f7\">Đổi chế độ to&agrave;n m&agrave;n h&igrave;nh sang cửa sổ to&agrave;n m&agrave;n h&igrave;nh hoặc cửa sổ</span></span></span><br />\r\n<span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ffff00\">Kiểm tra bạn đ&atilde; tải v&agrave; c&agrave;i đặt đủ bộ hỗ trợ hack chưa,&nbsp;</span></span></span><span style=\"font-size:15px\"><span style=\"background-color:#181b20\"><span style=\"color:#ffff00\">nếu đ&atilde; thử m&agrave; vẫn kh&ocirc;ng được h&atilde;y nhắn cho Admin nh&eacute;.</span></span></span></p>\r\n\r\n<p style=\"text-align:start\">&nbsp;</p>', 'https://zalo.me/0564559413', 1, '2024-05-11 10:34:02', '2024-05-11 10:43:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_history_hack`
--

CREATE TABLE `tbl_history_hack` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `groups_name` text DEFAULT NULL,
  `thoigian` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `license` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_license`
--

CREATE TABLE `tbl_license` (
  `id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `license` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_logs_orders`
--

CREATE TABLE `tbl_logs_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `amount` text DEFAULT NULL,
  `ip` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `id` int(11) NOT NULL,
  `stt` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `noidung` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_package_hack`
--

CREATE TABLE `tbl_package_hack` (
  `id` int(11) NOT NULL,
  `groups_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `thoigian` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_package_hack`
--

INSERT INTO `tbl_package_hack` (`id`, `groups_id`, `price`, `thoigian`) VALUES
(1, 1, 5000, 1),
(2, 1, 8000, 2),
(3, 1, 13000, 3),
(4, 2, 2000, 1),
(5, 2, 3, 2),
(6, 1, 15000, 4),
(7, 1, 13000, 6),
(8, 6, 35000, 24),
(9, 6, 185000, 168),
(10, 6, 400000, 720),
(11, 7, 50000, 168),
(13, 7, 120000, 720),
(15, 8, 20000, 24),
(17, 8, 150000, 720),
(18, 10, 950000, 720),
(19, 11, 250000, 336),
(21, 11, 400000, 720),
(22, 12, 750000, 720),
(23, 13, 60000, 6),
(24, 18, 40000, 24),
(25, 19, 3000, 3),
(27, 19, 35000, 168),
(28, 19, 100000, 720),
(29, 19, 10000, 24),
(30, 19, 400000, 99999),
(32, 21, 38000, 24),
(33, 20, 38000, 24),
(34, 20, 140000, 168),
(35, 20, 250000, 720),
(37, 22, 50000, 24),
(38, 22, 180000, 168),
(40, 22, 350000, 720),
(42, 18, 190000, 168),
(43, 18, 380000, 720),
(52, 14, 60000, 24),
(54, 23, 350000, 5),
(55, 23, 1400000, 9999),
(57, 14, 400000, 168),
(58, 14, 750000, 720),
(59, 25, 25000, 24),
(60, 26, 500000, 168),
(61, 26, 1250000, 720),
(62, 27, 600000, 168),
(63, 27, 1700000, 720),
(64, 28, 300000, 999999999),
(65, 29, 4500000, 720),
(66, 30, 6400000, 720),
(67, 31, 90000, 24),
(68, 31, 350000, 168),
(69, 31, 900000, 720),
(70, 32, 510000, 168),
(71, 32, 1500000, 720),
(73, 33, 500000, 720),
(74, 34, 700000, 720),
(75, 35, 25000, 24),
(76, 35, 120000, 168),
(77, 35, 250000, 720),
(78, 25, 100000, 168),
(79, 25, 200000, 720),
(81, 36, 12000, 7),
(82, 37, 100000, 24),
(83, 37, 300000, 168),
(84, 37, 650000, 720),
(85, 37, 2100000, 99999),
(86, 32, 150000, 24),
(87, 38, 120000, 24),
(88, 38, 500000, 168),
(89, 38, 1200000, 720),
(92, 15, 65000, 24),
(93, 15, 300000, 168),
(94, 15, 500000, 720),
(95, 39, 38000, 24),
(96, 39, 150000, 168),
(97, 39, 300000, 720),
(98, 42, 60000, 24),
(99, 42, 190000, 168),
(100, 42, 300000, 720),
(101, 41, 30000, 24),
(102, 41, 100000, 168),
(103, 41, 250000, 720),
(104, 40, 60000, 24),
(105, 40, 180000, 168),
(106, 40, 350000, 720),
(107, 43, 55000, 6),
(108, 43, 120000, 24),
(109, 43, 500000, 168),
(110, 43, 1200000, 720),
(111, 16, 100000, 168),
(112, 16, 300000, 168),
(113, 16, 600000, 720),
(114, 44, 1400000, 720),
(115, 44, 4000000, 99999999),
(117, 45, 1400000, 720),
(118, 46, 200000, 24),
(119, 46, 800000, 168),
(120, 46, 2000000, 720),
(121, 47, 120000, 24),
(122, 47, 500000, 168),
(123, 47, 1000000, 720),
(124, 48, 150000, 24),
(125, 49, 280000, 168),
(126, 49, 600000, 720),
(129, 9, 330000, 720);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `coin` int(11) NOT NULL DEFAULT 0,
  `total_coin` int(11) NOT NULL DEFAULT 0,
  `role` int(11) NOT NULL DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `otp` text DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `bank_auto`
--
ALTER TABLE `bank_auto`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_id` (`trans_id`);

--
-- Chỉ mục cho bảng `dongtien`
--
ALTER TABLE `dongtien`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `tbl_blogs`
--
ALTER TABLE `tbl_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_category_hack`
--
ALTER TABLE `tbl_category_hack`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_groups_hack`
--
ALTER TABLE `tbl_groups_hack`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_history_hack`
--
ALTER TABLE `tbl_history_hack`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_license`
--
ALTER TABLE `tbl_license`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_logs_orders`
--
ALTER TABLE `tbl_logs_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_package_hack`
--
ALTER TABLE `tbl_package_hack`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bank`
--
ALTER TABLE `bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `bank_auto`
--
ALTER TABLE `bank_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1397;

--
-- AUTO_INCREMENT cho bảng `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dongtien`
--
ALTER TABLE `dongtien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3637;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8732;

--
-- AUTO_INCREMENT cho bảng `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT cho bảng `tbl_blogs`
--
ALTER TABLE `tbl_blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `tbl_category_hack`
--
ALTER TABLE `tbl_category_hack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `tbl_groups_hack`
--
ALTER TABLE `tbl_groups_hack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `tbl_history_hack`
--
ALTER TABLE `tbl_history_hack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1885;

--
-- AUTO_INCREMENT cho bảng `tbl_license`
--
ALTER TABLE `tbl_license`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2650;

--
-- AUTO_INCREMENT cho bảng `tbl_logs_orders`
--
ALTER TABLE `tbl_logs_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1833;

--
-- AUTO_INCREMENT cho bảng `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tbl_package_hack`
--
ALTER TABLE `tbl_package_hack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT cho bảng `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1537;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
