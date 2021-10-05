-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 27, 2021 lúc 03:10 AM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hust_tech`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address`
--

CREATE TABLE `address` (
  `addr_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contactPhoneNumber` varchar(20) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `streetaddr` varchar(100) DEFAULT NULL,
  `postCode` varchar(12) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `advertisement_content`
--

CREATE TABLE `advertisement_content` (
  `advertisement_id` int(11) NOT NULL,
  `group_content_sub_id` int(11) NOT NULL,
  `group_file` varchar(50) DEFAULT NULL,
  `filesave` varchar(100) DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `content_img` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `set_to_fist` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `advertisement_content`
--

INSERT INTO `advertisement_content` (`advertisement_id`, `group_content_sub_id`, `group_file`, `filesave`, `title`, `content`, `content_img`, `set_to_fist`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 1, 'group_file', 'storeHtml/fileOfCWkIKhLstFsB6Vlqi61627225294014.html', 'làm quen airen', 'làm quen airen', 'https://intphcm.com/data/upload/banner-la-gi.jpg', 0, '2021-07-25 22:01:34', '2021-07-25 22:01:34', 1, 1, 0, 0),
(520, 2, 'group_file', 'storeHtml/filecM3Dl4Pk8xjvvQOifNvL1627225356833.html', 'làm quen airen', 'làm quen airen', 'https://intphcm.com/data/upload/banner-dep.jpg', 0, '2021-07-25 22:02:36', '2021-07-25 22:02:36', 1, 1, 0, 0),
(521, 1, 'group_file', 'storeHtml/fileG98XzR2P3h7m0qGP6l1f1627227177441.html', 'aisen', 'aisen', 'https://intphcm.com/data/upload/mau-banner-website.jpg', 0, '2021-07-25 22:32:57', '2021-07-25 22:32:57', 1, 1, 0, 0),
(522, 3, 'group_file', 'storeHtml/filev7LUOoAmo8ti8DiQU53d1627227181775.html', 'aisen', 'aisen', 'https://intphcm.com/data/upload/mau-banner-ngang.jpg', 0, '2021-07-25 22:33:01', '2021-07-25 22:33:01', 1, 1, 0, 0),
(523, 2, 'group_file', 'storeHtml/filekG4FYmPGcqcPlC0X2KVy1627227185774.html', 'aisen', 'aisen', 'https://intphcm.com/data/upload/mau-banner-dep-chuan.jpg', 0, '2021-07-25 22:33:05', '2021-07-25 22:33:05', 1, 1, 0, 0),
(524, 4, 'group_file', 'storeHtml/fileKCsqVoPwvoyvSGOwY8JM1627227189156.html', 'aisen', 'aisen', 'https://intphcm.com/data/upload/mau-banner-hinh-anh.jpg', 0, '2021-07-25 22:33:09', '2021-07-25 22:33:09', 1, 1, 0, 0),
(525, 5, 'group_file', 'storeHtml/filelc6Mo2m8Y6EXBNBqcFQT1627227192082.html', 'aisen', 'aisen', 'https://intphcm.com/data/upload/mau-banner-online.jpg', 0, '2021-07-25 22:33:12', '2021-07-25 22:33:12', 1, 1, 0, 0),
(526, 6, 'group_file', 'storeHtml/file5TL7Z8YhISlRCv4LS3os1627227195099.html', 'aisen', 'aisen', 'https://intphcm.com/data/upload/mau-banner-ngang.jpg', 0, '2021-07-25 22:33:15', '2021-07-25 22:33:15', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `backproduct`
--

CREATE TABLE `backproduct` (
  `buyproduct_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `KM` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `backproduct`
--

INSERT INTO `backproduct` (`buyproduct_id`, `product_id`, `quantity`, `KM`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 1, 2, 1, '2021-08-11 22:44:53', '2021-08-11 22:44:53', 1, 1, 0, 0),
(2, 1, 2, 1, '2021-08-11 22:45:10', '2021-08-11 22:45:14', 0, 1, 1, 0),
(3, 1, 0, 0, '2021-08-11 22:45:01', '2021-08-11 22:45:10', 1, 1, 1, 2),
(4, 1, 1, 1, '2021-08-12 12:54:01', '2021-08-12 12:54:06', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_service`
--

CREATE TABLE `bill_service` (
  `bill_service_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `content` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_service`
--

INSERT INTO `bill_service` (`bill_service_id`, `customer_id`, `service_id`, `value`, `content`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 1, 2, 1, '1', '2021-08-11 23:01:50', '2021-08-11 23:01:54', 0, 1, 1, 0),
(2, 1, 1, 1, '1', '2021-08-11 23:01:46', '2021-08-11 23:01:50', 1, 1, 1, 1),
(3, 1, 4, 0, 'âs', '2021-08-22 16:48:02', '2021-08-22 16:48:02', 15, 15, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `buyproduct`
--

CREATE TABLE `buyproduct` (
  `buyproduct_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selled_id` int(11) NOT NULL,
  `KM` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `buyproduct`
--

INSERT INTO `buyproduct` (`buyproduct_id`, `user_id`, `selled_id`, `KM`, `Total`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 18, 0, 0, 5200, '2021-09-27 01:52:12', '2021-09-27 01:52:12', 0, 0, 0, 0),
(2, 19, 0, 0, 5200, '2021-09-27 02:02:42', '2021-09-27 02:02:42', 0, 0, 0, 0),
(3, 20, 0, 0, 5200, '2021-09-27 02:10:11', '2021-09-27 02:10:11', 0, 0, 0, 0),
(4, 21, 0, 0, 5200, '2021-09-27 02:12:19', '2021-09-27 02:12:19', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `buyproductdetail`
--

CREATE TABLE `buyproductdetail` (
  `id_buy_detail` int(11) NOT NULL,
  `buyproduct_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `KM` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `buyproductdetail`
--

INSERT INTO `buyproductdetail` (`id_buy_detail`, `buyproduct_id`, `product_id`, `product_image`, `quantity`, `KM`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 1, 1, 0, 1, 0, '2021-09-27 01:52:12', '2021-09-27 01:52:12', 18, 18, 0, 0),
(2, 1, 1, 0, 1, 0, '2021-09-27 01:52:12', '2021-09-27 01:52:12', 18, 18, 0, 0),
(3, 1, 1, 0, 1, 0, '2021-09-27 01:52:12', '2021-09-27 01:52:12', 18, 18, 0, 0),
(4, 3, 1, 1, 1, 0, '2021-09-27 02:10:11', '2021-09-27 02:10:11', 20, 20, 0, 0),
(5, 3, 1, 4, 1, 0, '2021-09-27 02:10:11', '2021-09-27 02:10:11', 20, 20, 0, 0),
(6, 3, 1, 3, 1, 0, '2021-09-27 02:10:11', '2021-09-27 02:10:11', 20, 20, 0, 0),
(7, 4, 1, 1, 1, 0, '2021-09-27 02:12:19', '2021-09-27 02:12:19', 21, 21, 0, 0),
(8, 4, 1, 4, 1, 0, '2021-09-27 02:12:19', '2021-09-27 02:12:19', 21, 21, 0, 0),
(9, 4, 1, 3, 1, 0, '2021-09-27 02:12:19', '2021-09-27 02:12:19', 21, 21, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `charging_service`
--

CREATE TABLE `charging_service` (
  `bill_service_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `bank` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `detail_bank` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `charging_service`
--

INSERT INTO `charging_service` (`bill_service_id`, `customer_id`, `service_id`, `value`, `bank`, `detail_bank`, `content`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 2, 1, 1, '1', '1', '`', '2021-08-11 22:54:31', '2021-08-11 22:54:36', 1, 1, 1, 0),
(2, 1, 2, 2, '1', '1', '1', '2021-08-12 21:04:24', '2021-08-12 21:04:28', 0, 1, 1, 0),
(3, 1, 2, 1, '1', '1', '1', '2021-08-12 21:04:17', '2021-08-12 21:04:24', 1, 1, 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `companyname` varchar(50) NOT NULL,
  `adresss` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `company`
--

INSERT INTO `company` (`company_id`, `companyname`, `adresss`, `phone`, `fax`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, '1', '1', '1', '2', '2021-08-11 19:58:10', '2021-08-11 20:01:27', 0, 1, 1, 0),
(2, '1', '1', '1', '1', '2021-08-11 19:58:03', '2021-08-11 19:58:10', 1, 1, 1, 1),
(3, 'abc', 'hà bài', '098856', '222', '2021-08-11 20:13:40', '2021-08-11 20:13:40', 1, 1, 0, 0),
(4, '1âsas', '1', '0988732723', '1', '2021-08-22 14:52:07', '2021-08-22 14:52:12', 0, 13, 1, 0),
(5, '1', '1', '1', '1', '2021-08-15 10:31:16', '2021-08-22 14:52:07', 1, 13, 1, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(20) UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_reset` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`customer_id`, `username`, `email`, `password`, `token_reset`, `phone`, `avatar`, `fullname`, `permission_id`, `address`, `note`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(2, 'luvancuong0105@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'llllllll', '+84389992137', 'llllllllll', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'ggggg', '2021-09-26 16:41:44', '2021-09-26 16:41:44', 0, 0, 0, 0),
(3, 'luvancuong0105@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'llllllll', '+84389992137', 'llllllllll', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'ggggg', '2021-09-26 16:46:38', '2021-09-26 16:46:38', 0, 0, 0, 0),
(4, 'luvancuong0105@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'llllllll', '+84389992137', 'llllllllll', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'ggggg', '2021-09-26 16:47:53', '2021-09-26 16:47:53', 0, 0, 0, 0),
(5, 'luvancuong0105@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'llllllll', '+84389992137', 'llllllllll', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'ggggg', '2021-09-26 16:48:32', '2021-09-26 16:48:32', 0, 0, 0, 0),
(6, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:05:27', '2021-09-26 17:05:27', 0, 0, 0, 0),
(7, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:24:58', '2021-09-26 17:24:58', 0, 0, 0, 0),
(8, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:29:48', '2021-09-26 17:29:48', 0, 0, 0, 0),
(9, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:31:12', '2021-09-26 17:31:12', 0, 0, 0, 0),
(10, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:35:45', '2021-09-26 17:35:45', 0, 0, 0, 0),
(11, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:47:00', '2021-09-26 17:47:00', 0, 0, 0, 0),
(12, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:51:08', '2021-09-26 17:51:08', 0, 0, 0, 0),
(13, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 17:59:23', '2021-09-26 17:59:23', 0, 0, 0, 0),
(14, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 18:04:10', '2021-09-26 18:04:10', 0, 0, 0, 0),
(15, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 18:04:15', '2021-09-26 18:04:15', 0, 0, 0, 0),
(16, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 18:04:50', '2021-09-26 18:04:50', 0, 0, 0, 0),
(17, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'âsas', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'âs', '2021-09-26 18:05:42', '2021-09-26 18:05:42', 0, 0, 0, 0),
(18, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'dsdsd', '+84389992137', 'dssđs', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'dsasda', '2021-09-26 18:52:12', '2021-09-26 18:52:12', 0, 0, 0, 0),
(19, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'cxvcxvcx', '+84389992137', 'xcvcxv', 'Lu van', 0, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'cxvcxv', '2021-09-26 19:02:42', '2021-09-26 19:02:42', 0, 0, 0, 0),
(20, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'khongbietdau', 'cxvcxvcx', '+84389992137', 'xcvcxv', 'Lu van', 0, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'cxvcxv', '2021-09-26 19:10:11', '2021-09-26 19:10:11', 0, 0, 0, 0),
(21, 'cuong@gmail.com', 'luvancuong0105@gmail.com', 'sadasd', 'sâs', '+84389992137', 'âsas', 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'zxzx', '2021-09-26 19:12:19', '2021-09-26 19:12:19', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `decentralization_access`
--

CREATE TABLE `decentralization_access` (
  `decentralization_access_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_member` int(11) DEFAULT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `detailbank`
--

CREATE TABLE `detailbank` (
  `bank_id` int(11) NOT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `bank` varchar(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `detailbank`
--

INSERT INTO `detailbank` (`bank_id`, `info`, `bank`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 'ax', 'azx', '2021-08-11 08:03:19', '2021-08-11 08:03:23', 0, 1, 1, 0),
(2, 'ax', 'ax', '2021-08-11 08:03:12', '2021-08-11 08:03:19', 1, 1, 1, 1),
(3, 'a', 'a', '2021-08-11 08:09:05', '2021-08-11 08:10:22', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `enterprise`
--

CREATE TABLE `enterprise` (
  `enterprise_id` int(11) NOT NULL,
  `name` varchar(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `detail_info` varchar(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `enterprise`
--

INSERT INTO `enterprise` (`enterprise_id`, `name`, `detail_info`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, '1', '2', '2021-08-11 07:19:33', '2021-08-11 07:29:31', 0, 1, 1, NULL),
(2, '1', '1', '2021-08-11 07:19:21', '2021-08-11 07:19:33', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_content`
--

CREATE TABLE `group_content` (
  `group_content_id` int(11) NOT NULL,
  `group_content` varchar(50) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `group_content`
--

INSERT INTO `group_content` (`group_content_id`, `group_content`, `title`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 'Công nghệ', 'Công nghệ mới ', '2021-06-15 00:00:00', '2021-06-10 00:00:00', 0, 0, 0, 0),
(2, 'Tài liệu', 'Tài liệu ', '2021-06-15 00:00:00', '2021-06-10 00:00:00', 0, 0, 0, 0),
(3, 'Giáo trình ', 'giáo trình ', '2021-06-15 00:00:00', '2021-06-10 00:00:00', 0, 0, 0, 0),
(4, 'Công cụ', 'Công cụ ', '2021-06-15 00:00:00', '2021-06-10 00:00:00', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_content_sub`
--

CREATE TABLE `group_content_sub` (
  `group_content_sub_id` int(11) NOT NULL,
  `group_content` varchar(50) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `group_content_id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `group_content_sub`
--

INSERT INTO `group_content_sub` (`group_content_sub_id`, `group_content`, `group_content_id`, `title`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 'Công nghệ mới ', 1, 'Công nghệ mới ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(2, 'IT/AI', 1, 'Điện tử viễn thông ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(3, 'Điện tử', 1, 'Điện tử máy tính ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(4, 'Cơ khí', 1, 'Điện tử y sinh ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(21, 'Toán/Vật lý', 2, 'điện tử cơ bản ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(22, 'Lập trình', 2, 'Lập trình ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(23, 'Điện tử', 2, 'Điện tử viễn thông ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(24, 'Cơ khí', 2, 'Điện tử máy tính ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(25, 'Đồ án', 2, 'Điện tử y sinh ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(26, 'Kỹ năng', 2, 'Kỹ năng', '2021-08-18 00:00:00', '2021-08-18 00:00:00', 1, 1, 0, 0),
(31, 'Toán/Vật lý', 3, 'điện tử cơ bản ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(32, 'Lập trình', 3, 'Lập trình ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(33, 'Điện tử', 3, 'Điện tử viễn thông ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(34, 'Cơ khí', 3, 'Điện tử máy tính ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(41, 'Chuyển đổi vật lý', 4, 'Chuyển đổi vật lý ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(42, 'Công cụ kinh tế', 4, 'Công cụ kinh tế ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(43, 'công cụ xử lý ảnh', 4, 'công cụ xử lý ảnh ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(44, 'Công cụ design', 4, 'Công cụ design ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(45, 'công cụ IOT', 4, 'công cụ IOT ', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group_customer_content`
--

CREATE TABLE `group_customer_content` (
  `group_customer_id` int(11) NOT NULL,
  `group_content` varchar(50) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lostproduct`
--

CREATE TABLE `lostproduct` (
  `stord_id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `contain` varchar(50) DEFAULT NULL,
  `expridate` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `lostproduct`
--

INSERT INTO `lostproduct` (`stord_id`, `product_id`, `company_id`, `content`, `number`, `contain`, `expridate`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, '1', '3', '1a', '1', '1', '0000-00-00 00:00:00', '2021-08-11 22:10:25', '2021-08-11 22:10:25', 0, 1, 0, 0),
(2, '1', '3', '1', '1', '1', '0000-00-00 00:00:00', '2021-08-11 22:10:18', '2021-08-11 22:10:25', 1, 1, 1, 1),
(3, '1', '3', 'a', '2', '1', '0000-00-00 00:00:00', '2021-08-11 22:10:45', '2021-08-11 22:10:51', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mqtt_microservice`
--

CREATE TABLE `mqtt_microservice` (
  `mqtt_microservice_id` int(11) NOT NULL,
  `content` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_pub` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_sub` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_user` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_pass` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_id` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `mqtt_microservice`
--

INSERT INTO `mqtt_microservice` (`mqtt_microservice_id`, `content`, `mqtt_pub`, `mqtt_sub`, `mqtt_user`, `mqtt_pass`, `mqtt_id`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 'w', 'ư', 'ư', 'ư', 'ư', 'R', '2021-08-09 21:57:17', '2021-08-09 22:05:29', 0, 1, 1, NULL),
(2, 'w', 'ư', 'ư', 'ư', 'ư', 'ư', '2021-08-09 21:25:38', '2021-08-09 21:57:17', 1, 1, 1, 1),
(3, '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '2021-08-22 14:36:44', '2021-08-22 14:36:44', 13, 13, 0, NULL),
(4, '1asassad chiu', '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '2021-08-22 14:38:34', '2021-08-22 14:38:34', 0, 13, 0, NULL),
(5, '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '2021-08-22 14:37:07', '2021-08-22 14:37:11', 13, 13, 1, NULL),
(6, '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '2021-08-22 14:36:54', '2021-08-22 14:38:34', 13, 13, 1, 4),
(7, 'abcdefaaa', 'abcdefaaa', 'abcdefaaa', 'abcdefaaa', 'abcdefaaa', 'abcdefaaa', '2021-08-22 16:47:01', '2021-08-22 16:47:01', 15, 15, 0, NULL),
(8, '21212', '121212', '121212', '21212', '111111111111111', '121221', '2021-08-22 16:51:16', '2021-08-22 16:51:16', 0, 17, 0, NULL),
(9, '21212', '121212', '121212', '21212', '21212', '121221', '2021-08-22 16:49:06', '2021-08-22 16:51:16', 17, 17, 1, 8),
(10, 'âsadasdasd', 'âsadasdasd', 'âsadasdasd', 'âsadasdasd', 'âsadasdasd', 'âsadasdasd', '2021-08-22 21:13:32', '2021-08-22 21:13:44', 18, 18, 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mqtt_user`
--

CREATE TABLE `mqtt_user` (
  `mqtt_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_pub` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_sub` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_user` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_pass` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `mqtt_id` varchar(40) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `mqtt_user`
--

INSERT INTO `mqtt_user` (`mqtt_user_id`, `user_id`, `content`, `mqtt_pub`, `mqtt_sub`, `mqtt_user`, `mqtt_pass`, `mqtt_id`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(2, 1, 'luvancuong0105', 'p_luvancuong0105', 's_luvancuong0105', 'luvancuong0105', 'HLTxOqwV6Y', 'luvancuong0105', '2021-08-08 21:48:14', '2021-08-08 21:48:14', 0, 0, 0, NULL),
(3, 1, '1asassad', '1asassadaa', '1asassad', '1asassadâ ac2', '1asassad', '1asassad', '2021-08-22 14:49:37', '2021-08-22 14:49:37', 0, 13, 0, NULL),
(4, 1, '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '1asassad', '2021-08-22 14:37:27', '2021-08-22 14:37:33', 13, 13, 1, 3),
(5, 1, '1asassad', '1asassadaa', '1asassad', '1asassad', '1asassad', '1asassad', '2021-08-22 14:37:33', '2021-08-22 14:49:37', 0, 13, 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauthen2`
--

CREATE TABLE `oauthen2` (
  `id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `tocken` varchar(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `value_manifest` varchar(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `time_relase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `oldid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `oauthen2`
--

INSERT INTO `oauthen2` (`id`, `permission_id`, `userid`, `tocken`, `value_manifest`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `time_relase`, `oldid`) VALUES
(1, 1, 1, 'S3JTiT8fuCNDOUe3G9mfXId85ptLNrRyE7tN2oyVzIKlW2zoGKihKmPvrYdSjrk1pigopoAiDFgzBce4v1AO7pjN1hT5LxjgZdDN5vfAJolDAML7j1jsdRZF2hw22oE7A8N2mRDHPRxjvXkQFmNuejzGMaZCXi153GL6S4jDRyOGOYIzSAitxoONdXqYallhRws2uk4gbum4QV85n85KNM0rhVQkUE0OlUagqG9Brr996Gi4xDQAaRdXV6MRwddr', '1', '2021-08-09 21:18:41', '2021-08-09 21:18:41', 1, 1, 0, '2021-08-10 14:18:41', NULL),
(2, 1, 1, 'EzjOZUddxqf3dYEJx5a1TV0RdJ1Aq4gyqe5El98KBIkfqONS4ofiks21XTWtzmCRGhp5C1hKqBrpzu1curCorF0ZxePc5RWIF6daf344dzeo7oajbLHcpuZcMQmAbgyYypZBZjywsneExSjWq2DM9zEq8YAdOw0A9jHMWBiT1KvPUUHEgIsrOht0LW7qKyqIw6YnvZyXHlVwCf4rLRgqyW22nEcCp0tbwb2oGqa5jIbA00T7FQyCLhBjSbxW8jV5', '1', '2021-08-10 22:08:06', '2021-08-10 22:08:06', 1, 1, 0, '2021-08-11 15:08:06', NULL),
(3, 1, 1, 'p9zkILHnzOdtFQJ4Nj6c20rqZF9Cif1aj653Xe1SstOtUpesfvrB5hmGagnpWSU6mzWQUgXu8lqzoTii3uUrNroThj30UM008QV7vdAI8iFcYHXpcK23gTv0gccapVuIBtYAtWv4iQ2cwRcrnlVGMxsunzJvvALK3NTQxv0HvsVw8pvALmh0cBhLBT4ZglSl0giVULms5xJ7RjWVTG46hMf3WFHThbp5ljJBwuZbHwtiSyhqyMWQQ1xKIa2Jyj9i', '1', '2021-08-11 22:09:58', '2021-08-11 22:09:58', 1, 1, 0, '2021-08-12 15:09:58', NULL),
(4, 1, 1, 'YsT8GFzZavPRgTM8kU3YMSEYY3EcrX78NMLMDlxXWVeN1gQahJ5JYs7FjqVZ6GQUau68VkC5W8knOuZWILfH4kKCklQFq419FCfcgosZaMlSoLycXLmROW9pXqbJ7TBIpn1b1M0y12IvbsWIvK2WkLaZrxGu8w2Dk205J6qEjaqsFOHOALP7YppGRxukPltfwRfAzk82c9j15azI1FaoPkZkEgADfshPcnzcNpHCKYTXyDYE3xCFrOyS5oTQZDqQ', '1', '2021-08-12 22:20:13', '2021-08-12 22:20:13', 1, 1, 0, '2021-08-13 15:20:13', NULL),
(5, 1, 1, 'oSO86DD2IHckZSQOGwbx6FpOTRScPqo2THLOoWyzSNNBxrClj2PhsWNNF2SqaD1oUBvEScuXphCUxxg2ij4XH1sN7oNKEGPFlCSaRkkUuNtrSU9XFFuJxViNbS6D35G0vXttCjU6hWBgyCLw5EytTwMHMDyjzz5vld8wVawyC4g1DQeAsz2pk3H4UX3r5TXmjmHD9f2SQd6EIbNImIHj1vV1ZqwPeHqE4MMjYvhrZP2moqhzI6jF7nGAu7zQwTc7', '1', '2021-08-14 10:27:06', '2021-08-14 10:27:06', 1, 1, 0, '2021-08-15 03:27:06', NULL),
(6, 1, 1, '4zlnTyZ6j16PeGqWi8JADEDJNXjghA1QarVbBRahdqvxc1DrSNU8zMYeSoxRbR7I5XB2hwwNUCNP5HkMCOpReX8q0zb6ODhQNdi9cxS324gmNj5fwpqlwKfk6zM8idHT1QTWZTZaPhvu3RxGpNdy4azD2WTWw9tKR6W5lIbw1wLPEqgA41rwgaFCPsHmJMcQAHKhaOC8LwLjlMOc1dfrVG32sOe3NQw3YTsWS4n0LsY7KKBDOqpLJxki0hcQxZpY', '1', '2021-08-14 16:41:15', '2021-08-14 16:41:15', 1, 1, 0, '2021-08-15 09:41:15', NULL),
(7, 1, 1, 'A8qOaDJ7ITtmcHrdLWAXNVvJyKKtNKgbHlV9DFG8dm1Yqeqdljv41W6mI03Ldy9OzDVIvHRnZ7Wq52yfmszRT41KiJ1Fkrvgodp703qdM60SKSccFZTKECaK2Fw00i0kKlAL00tTazbEjhR4SEW6wbND4STjVmvFgQGAsqxlz8WIPAnXpLXljSe6A5KVuK9F0FQYAtdBU8q1i8iIAhiQnOyRhALSiX2UPCNrJ3Xw1VZXpt5t435OC3n94NiQAU35', '1', '2021-08-15 17:15:41', '2021-08-15 17:15:41', 1, 1, 0, '2021-08-16 10:15:41', NULL),
(8, 1, 1, 'GkZGf09KfMQ33K8RB4u1nU98f2UWaOUXAv3jrxoJzpPdpPUqHRFzHqUaz64aNVVi1CAg8ltEh2I1WI9YU4uSKwC8BWoCtXjIxCd3JbIvw4iCejzoofHwW1ZLVWRGznXeNnHudMT0CnPe7SycrpKivazFgt8vAIN83UBh8vWuPUqNCcaGhu9fk5nsMN5ht3QnS1m3HUz2tcNsOjpbXEpXUqSDef2fJasMXIEZ3Ld23dpxl6yfM4sCo5i0IwHgzxgI', '1', '2021-08-16 19:33:42', '2021-08-16 19:33:42', 1, 1, 0, '2021-08-17 12:33:42', NULL),
(9, 1, 1, 'c0HJSmCupL2i9CJNmbLmtWibS4XmFeO4cgIvosj3IeUBaMaWkwp655A36WrXhOdPr177VcN1B8rWw8ExJ5asazjqaDvmxIUhqv1WvqXB95bPwZE0r3bT3QyE6ZGYSJXwhmy0c0bs6PkPAr6O5YGUoBTqIlo22v1j6e3AxZdxp3NAdsQnwQuF99H0kCLXm2VK71ILTYHCWm3syPXqbR5ZMSVfjdtU5oSEC2F8ODJ3GrO8Ckm66eUq3rq5lxaqLwGD', '1', '2021-08-17 21:53:04', '2021-08-17 21:53:04', 1, 1, 0, '2021-08-18 14:53:04', NULL),
(10, 2, 5, 'e7QM5LrJ2QAU2EbJrpLpuaT4A3eKlf9g80S3xTl6vvIVsZQ10TLIcwWRNiTB6q6Fa3QCib2x8A8RAK7fQ4n5unySfDnsJJfcAxMaIqtnJmZRghscMwZfBWNmHQHikd62wNouUvwlu6gTu947dENJknz7iM9f3HRbXLOtqwpi1k7zabP7axhFzIVHlar7xzabHSYvwIs31vxGBj3f3qZyCaDYWFYcfXpfK2iXzBnRHaUB2asg8JNmNIcvme0NrEFF', '5', '2021-08-18 08:05:14', '2021-08-18 08:05:14', 5, 5, 0, '2021-08-19 01:05:14', NULL),
(11, 1, 1, 'VYUaC42b2mQAa5D7TFPAsTmElTHRuKtfVhjsWO96LQdjv51gzYNkP9heMWUl5Yw1t4gEdIBaM7xmCEBkV0158mWN2pilSqkC34QKJYKa5HJoa7xgbmkV5SmfJGtKF9lRgKYAGNkt2rRCm1f1d2k8aIALGjr0MOYrU3Ylq8SZh4XBX2r624ElMQY08RJMwGKbkx9pdNfczRY4eE41Dq6tgserVBRbZhL3fqF9crCKmU93dl2ZMB06y9D3MCT4FWxj', '1', '2021-08-18 08:05:32', '2021-08-18 08:05:32', 1, 1, 0, '2021-08-19 01:05:32', NULL),
(12, 1, 1, 'eSCLkB4wn3YOQoBLkmzEP98zXTDH3NmbRoWqiiUolAVgUC9hPh4dvix4kgnbMnJ4wt5Sh0AeksE1KitC22cIuOfMQNaV7jdP25CVCH64nBXSgU1AAnOvC4GTk4KX83xqKNIMb2kzzsgSHnxHrUJiwGiEaNYppgcFu7ByFVZW5Fh9I7bCvC9UMmrbIT1B9zUKsKSoKMjvUPka4Ed2CLi9pirNvREAeU1Iu8qRUSgr9gyZwq0aCaTFfsHMVfPizjQj', '1', '2021-08-18 08:06:09', '2021-08-18 08:06:09', 1, 1, 0, '2021-08-19 01:06:09', NULL),
(13, 1, 1, 'QxKDzqqNMhqtRkcX52lans6IghqKfdyglRh5PPvQquf1fjVqCnEpZUzwYhoz4YxYh82J98HhF7ESz3BpVMHHqRmHo6MIe3k0EOtvkcCfPlUKUsMMisP0sriFetIysA52WeZdYdG2lY42UzvCmjTW8Hn0gXdPowJJFpy4mt9cWCgAS6uVbJT9JRoHCrtbJ8CPgNUqlYR9lCZTwLSRqaWK5p8Prws0lQJJGAahhFpeJnUWjXpECh6gFpnxFDs22Xye', '1', '2021-08-18 08:20:05', '2021-08-18 08:20:05', 1, 1, 0, '2021-08-19 01:20:05', NULL),
(14, 1, 1, '5M6cbPIkf3BM9bzyRzqoiwIXcICR0kL1tQewU7YjdzkYYiFCFTkQaniaiMeANaCfbIk2eux959p7J2snUI9hWGkTXP0x2QubRVonlclgdwikmI1vGNyM0yZpMmy2YP5ji87jxvAJDqSKEsSMiL8nOVyuYuRdrivJfuwqi3Vu7SBzr3Ti8WMT71SVvPbQWUnSnkfgc8HhWIBVbaqXJ5cshPTy8xlNNssA8Z6FZ9ZxYutny3XlRUwWnK3qj0LFDI95', '1', '2021-08-18 21:00:26', '2021-08-18 21:00:26', 1, 1, 0, '2021-08-19 14:00:26', NULL),
(15, 1, 1, 'oyQTH2YEOCLermYTbT1IHbYx48FJ7lb1qm5RiG9fmdJ3dyQhCHPXBsy4uYlLL9UC4snEUlJ0CtVskfSmH2FH73fLrTjj1WOepTXsaONA3Ai984oVEsBIleQHNUFvz1g9nmwlBFAp7wSgLRML0sfODQ9wLu9tkwp35jACQOjcD2ASiQMM1T9ucWosIAEWGwPDZnZjT2uPiHadTn9SfyC9Bn5Q6BINp0RxIoKREDK8MUBRdUfnSwPJLBz6WKq6zq1z', '1', '2021-08-18 22:29:59', '2021-08-18 22:29:59', 1, 1, 0, '2021-08-19 15:29:59', NULL),
(16, 1, 1, '9sbILVnGIeuAsfelNzZHNsIA9eEc06ktKm6dWr6KgST5Zx4W7teWtkTRH9NmyZh3Aojge1k7fB9s2yLq9v4w81QENMMTsWorVWlVhzgKZy1zp0MWWTWpy0IZBbeUAJziLmsLW2fFgPeopc16JkiILhMajDEIlwxDHqrJ1R11DBJaYWNXxviqkjkZfPSHR3VEXPn69ApGfSuy8AHLAKIfGCldtxthh4jNx3CS1i1sdkCvhSCLQHwrlE68LvqUmfRU', '1', '2021-08-18 22:36:19', '2021-08-18 22:36:19', 1, 1, 0, '2021-08-19 15:36:19', NULL),
(17, 1, 1, 'I5wX1N727VNLplGoWyCTwxB1XuOHmgzyBhlfrRIEnk2oY3wiisXLQO8kKoIIxK3Y1RCLibWhtfIKSRDubGwS30CTpznrOYGUtURVIzbzWBKh6O53BoqTHfn1EZrRqIkWdIpYwdisMS9w8trIJdcV5ULmAZohEmHJ1bY7VKRbkWQBK4Z447RpZKZ4YfZ26JequHikM0g0teDiu0FeEOMXjc4VvikMhXjh6zQ3wB1fxHwUuhRyOh4IURfdj6J5xSqG', '1', '2021-08-18 22:48:16', '2021-08-18 22:48:16', 1, 1, 0, '2021-08-19 15:48:16', NULL),
(18, 1, 1, 'Yc0zzZQVOnrooiM8GCESIYc1wjxrXyI9pxBWM6yohBbwzhxrTyIdJ4GW6u0ZRwMZMIVMV7HCewudacj7HfMmFbWx53ZeqGoll2c8FFVbvq38fmPpSuURZkpLdzSxVXGaA02n0NrccomELCfKzjnOcT5p5GDP0bv0EPG0gjS87gS1ODqrj6FDskB0IjRVuCtry647STPTkkznVzXX91IFR5IM58fGXwmfVgdirlJJLiwIU2lbeMjB6K8XG6ogv5Ru', '1', '2021-08-20 00:42:28', '2021-08-20 00:42:28', 1, 1, 0, '2021-08-20 17:42:28', NULL),
(19, 1, 1, 'ARcJKJ5NYbzVUQyCXwzfrOszzUvRjTZyKr5ynIUzRzX2eB6fDP157Gxx7BKE2Qcq5Few1lfXy451QxX1IlBY9JpznLseaLeXjhD0pPczpF8JZg9HeVzWDSZ080WV07ElquGprBpn98NCOOAW8JR3Eh3l2tyI0iGeXUvO3wclFbu4TZTBqyWGmUMOEPILRV5WwxRJD0oPxzLW5LFg7cSuS972u1qeXEiteJ2mQOxEvVTr7FenRZ5J4LAkZljnZH0p', '1', '2021-08-20 03:24:14', '2021-08-20 03:24:14', 1, 1, 0, '2021-08-20 20:24:14', NULL),
(20, 4, 11, '3rSoC69XpjhONtHiEBIOMH35TJUiZhIaBQxwoDolJXQLZs6id2qU4QCpWrLfdNyofQljtA6bvLsMQ8vd70U3TzbYdDEcAC7jM1ZTi7DPVh1ysXUL2t5udE0oQdxQPiSsNnveAgBB2A7J7Jo3ABnFDBAIqK3PzaDBUv3Xr0EfjAdthOoa1MSbUpVsH51YEjrlQL04EAr4a5vsZuJLDH4nHnQEVtO9wOaLuBCIa2fpwcvJKUp764JVz9YR9cvDEtcf', '11', '2021-08-20 03:27:32', '2021-08-20 03:27:32', 11, 11, 0, '2021-08-20 20:27:32', NULL),
(21, 4, 11, 'upL1Qlm5F2rdRtMgurdjZXEbS4y2DbHaaAFZtLr5Cqz7YjOGEwHleQ8WED5NHEitWSb6gfJevaQtlrIhiBQuPTYcOC5Ax798JCG32kx600aAs6TT5zatQdMJd3yEHdfTDLWsocStxzs9Ki5TCRL8MWgZLgtsktjcJ6VKP1O1IdJuAvrOUarx1JcvwveAvNDVJ2Rvl75PwFwP60Raqqo3ksK89mbHhPLQCY1l61Q4U0b4cgWk4OC4638F36mlzz18', '11', '2021-08-21 09:50:05', '2021-08-21 09:50:05', 11, 11, 0, '2021-08-22 02:50:05', NULL),
(22, 1, 1, 'Prjq0poJFDxGUVflFpk0GRs83qET7VUL78QyK9hkEQlfe1iN5iFonWVhrhKYd1Cr94tq17e9W00gBtXz6X475PclBNSJ50h3IwzDnKDaHtwby3cVrelVMOZnwbI75wr9NyqqZ93cjQbpIMVrEFwJhRjsuzB4e2ejPZAwZssvLAso4j7iIO8dootw6Z8RAotg1CMQ42AlnGfTZNQVWjYmWbacMJMCrhRnM2eXh9PRzj9FJ06M5ddKcfhbr0wri1Wn', '1', '2021-08-21 13:43:11', '2021-08-21 13:43:11', 1, 1, 0, '2021-08-22 06:43:11', NULL),
(23, 1, 1, 'EDzZKHQxbkjqWMEpLD912QAp9UfZmrZYh5SeCZ4VqZe3kLzsnaMuHZrCO1cfimKl83D2bZg5aZ0pDkwgKyZ06byNfd1uYwtkYqL4pWdbGSZZRxgq51OfABykzxGufXMBIpSXI3GpOynPbQyiCRtAZvZywiI4les2Ognqb5oSxKAH6ZEncDGmlt7pxaoqEGKeU7zd4WrZjFdp8d2KM52r0ygEiN0GGp5aE1rzkfHGo3REcyitrjuBsKQTZWyETxCE', '1', '2021-08-21 15:39:24', '2021-08-21 15:39:24', 1, 1, 0, '2021-08-22 08:39:24', NULL),
(24, 1, 1, 'dvsvqBSmU2rO8kllmXdD5UXIMUWKKCkiNK5ZpqNnpSW3KKfjHlZ7OxUEzZKwYDC1zMUzSDluli7F13CBOHCiLK8zeMb1PfvGlDxtvq8UFGJunKznEMibnUG87YNOa8fr7m4bc2DfM5XRaPdUYKJ9uYc9sF3rvGB3pswMWYeNT24aPMqVI0vSjVOY3etpcMYR8i9YajgWLPX3v5gwqC7N9ryw3C6bNnbG9yiAQrgzYvjEI8p6Dm8XeSYThWZcgJFK', '1', '2021-08-21 22:55:41', '2021-08-21 22:55:41', 1, 1, 0, '2021-08-22 15:55:41', NULL),
(25, 1, 1, 'JTC3ZVkrcu1EJpqJOTteRWsKoobZ0DwFnZldMjHVEZKK13g84KqVwRLEXvU8s4PDeVtgHXcs2y3JnMfH1iNnP5aHoOUvBDg4XAfpf7y3CM3UWh4B1owuiN6uiQq7U3NdJ6H3a98d1iE2Ar3hzzj9NSMyWB60HfwY667rTqLdi0G7JOH56q0p44Bvog2Rc8SfTLppCXTTs8Y6wb1BGS34PuRLlBB4ocDIWanq935qFzPxbFkIKtHctPUa55e1V7v2', '1', '2021-08-21 22:56:31', '2021-08-21 22:56:31', 1, 1, 0, '2021-08-22 15:56:31', NULL),
(26, 1, 1, 'JTtYeJOBrEHcioAXOsqKc0Uz0uNiNlHDLZWuyCef00mfr97kueDSCU8AqckCJhyf0iuLL3sl9lcKO0cwOfWVaFXVVngCUeLRElh8nNseMlXRFGJRix6m2r9EGpTGACfWssRvjS0TDSx7EwCGW3xyGnMk4CNDr2tkJJ1iQphLeUrhjBUOCCovVH31MhKptJ27NsfH4w7R9Q0SxEUqiTmORfpzgnTkUXwjp0hxCEhpCG4d1zuxrrrrIMXQiSd5CtmT', '1', '2021-08-21 22:57:31', '2021-08-21 22:57:31', 1, 1, 0, '2021-08-22 15:57:31', NULL),
(27, 1, 1, 'gTQgE4763qanupAPpb6hhV9VDnnYgTcAP4cv3aiTDyFhQBWNzEtig1vbSie9DlPhsULJagwKgCMNshlfopHATgXfWpqnk91Hm14zvw4oruIhlrRsEwcwvnvM3fmrrBnT7pNaynqPwdiBKRJAIzaFQD5LRcvVVdrR5tVWex1ShHw1es2KWzsHq24DJJLEPVQ6xXJslqCDMPGk5SwSuxRMSix8ki8r52zKFy6TXr3FMRkzIG3VO7Iko2HgJYQCkZaa', '1', '2021-08-21 23:04:15', '2021-08-21 23:04:15', 1, 1, 0, '2021-08-22 16:04:15', NULL),
(28, 1, 1, 'Hgp4dpDh9xRMymgc9ssDaCAxFbrbfELLxoSe77iWPa2mK8ZJsODDktKpVHj0F4qcb1mU9eDJZN1I8KgiBJ0jGrDNxH2P8z4aNpw52Dq2G4p177iTukphpOL9jGkDtvW9UhuffjztepMKUj0xQ3RX7SsMaeVNqVbLDADSlA36k9KqsePKkEzhjdAKT2ITjlgxTMNW0wF8wqZDGnN5TonKXH6ErUnX4LKndwruIe0nbKKayYqypBfJxfaO3vjckt3z', '1', '2021-08-21 23:08:15', '2021-08-21 23:08:15', 1, 1, 0, '2021-08-22 16:08:15', NULL),
(29, 1, 1, '1y0CGz9XLEdzaE1jMNKP0KYCnZNQcnw9fbqJe4tXjT25DMaMgPQy5ChoLi5wpNcS9JcxUmx7xQXGJvbi9KWpWL0qWZq95JqTaWf819HO3whc6iDknF5iL2QKSC7PxnvruH7nQANUHcr6aEWajGiFlcADGtcko3U3KKcCrmFhpgKrghPCTrGAg12lOpkbMAgs87UA58W4wwBTWIwNLljsfC9GKMslFWkE6aKaTBdpwNUxqnn2TAQFqhErhLkL2Tzl', '1', '2021-08-22 09:07:16', '2021-08-22 09:07:16', 1, 1, 0, '2021-08-23 02:07:16', NULL),
(30, 2, 13, 'BbkscaluYBRBFj5dBO9D1kiJsGPJXGE8lF4zQya5T251Ib140FLFOWUoCnipMtaFyvFlDhyxqamp8Sll3r7cFrD6h7IEam7j9N8l3d8NJ5MVv2y20W1F0wLPB8e7mlP37SrpvqJeXcSIPHVxFAI7tOmtrgMHOedadfeY0bZeRxtVuFcSsTjhORM2lcIFa5PqOlgr1muRbbdppxeaBAcShyDWeY8VWYsKsOsow6gT55i6gUAa4wunVd0G7Zide1UY', '13', '2021-08-22 09:43:22', '2021-08-22 09:43:22', 13, 13, 0, '2021-08-23 02:43:22', NULL),
(31, 3, 15, 'M2Yu7CtJkNf8OatNg4v1ncwNQeocce9l8RInVi85DL56ulWK7MO7VoU1jX0o75rIAG1yX5n0Rgp5CanNZuiuDltGTNuMOo4nO2FjejQx2vjDaKEMrJ2m6E9BtF5WTeaXChzOlbem35wlUsOLhpsYReitUhGspLEAJ0qNbzuo0QP6hGA9QwRBQ7aJXZipaCw8qZzfdIKq5tdxgoXKIA9HDWKH5FZJnPPpk3AwKLtqLfyszNJzJLSQvHA951uUI5rj', '15', '2021-08-22 14:54:56', '2021-08-22 14:54:56', 15, 15, 0, '2021-08-23 07:54:56', NULL),
(32, 4, 17, 'cERtoD0DokWVGKBqJPe5d3ggnTqomCCAZZTrGlG1tjrSvV3EoAG7x6nYMbX1gkdZ7UeEngaAwuM11mY9xv7ZAfDqaR1zZinlSN3MMIOYSswQJzy3x2xS7OnTfu75gJmj5sgzz1uCdon75hNDgTuK4kJoQOKdPs03g7TupFjArA0xchO8P8e4fnOUXqpk4yO2UYzRfoV2SJlLYntbdlrxj0QyixDIkGDpVnHAl7UDWkG8EXeVG2goNfIUsKPTVFKA', '17', '2021-08-22 16:48:46', '2021-08-22 16:48:46', 17, 17, 0, '2021-08-23 09:48:46', NULL),
(33, 4, 17, 'rxSWTXZwqZRmgNINyVFddwhjp5rNqoyglGBkMHIXPotU8xvayBuUqoyxqMpkJ0SE5nHX4VfnHMdZFM881pif93JixM3dt1TYa6XxbLtnXwzICJlHpSwHXj34scbdBi6UYao0e3jUh47Zk8Zg7aiOQC6Xx3Pw8uepAtj9HT8UWQ7Fb3lD7B1O8cqqqVND7fOVtlNZuMEpVdwDZd3IhuCiLG8FXliYcMKLWWR3dEJCvOsGvnKo2DoNClftyfxoG7t4', '17', '2021-08-22 20:22:43', '2021-08-22 20:22:43', 17, 17, 0, '2021-08-23 13:22:43', NULL),
(34, 4, 17, '2NvyjsCryEf5fxzYJwiyJMKXaR3hzroR2RkTqgI1sYocEZLo0UtgJ1HEhH8n3WNV0DCK8BvAE5fvah7YGmHxmiMQ5f8V2OUKXDuUaO1nClUNByqCYRYQcsl0haxYcuKMjbCl3SeeCSPikuAYmwHous1sD8enRyqA18At7l3i7g95dQuuo6U3wnf8HpzTDgweDQPBGwEHfHfxS8Hh1YjQmcSBWsqeKf9niwlF0rH9vheESOHBeSQnazBls2a3WAko', '17', '2021-08-22 20:25:53', '2021-08-22 20:25:53', 17, 17, 0, '2021-08-23 13:25:53', NULL),
(35, 10, 18, 'jEQmwz8JYmAYOxdAWgES1UApReOClqbyMGZmdBnUeRGECXQYIA1SyMhEqLNA1GIaxPHzNDwXLlV6FjE7hDJvbIAtd7WhlQ7RE6uRjSdMaEZYx8dCzISvryb11AUptnVT1Wgu0KzdI3BrrbQPAxYD6zxiIgtoPmcAs4eJKRlJZO6Cmo51ynxHYQvoN1MRtCFWdzmDrJrJWF1wQ0Y6Y0ZFyZwcw4v0lyUN2ZLnatXqUZpGGVTw0fSGVwMuWi2Tv8KV', '18', '2021-08-22 20:37:56', '2021-08-22 20:37:56', 18, 18, 0, '2021-08-23 13:37:56', NULL),
(36, 2, 13, 'jeWHIym6PpxpTAAC0Ff06GXvns6WXLTty3Lo13TKepGI5qqkmjODIcmsSS9njY0lQWXwz3qYXe0HE1niHFjKm6Z8ExDhGkKJnY05yTwUQGAvlMqDok3bdv5SObbE0k5AToJAvT9orjBUnXQIH6pO90LYRlI5jGnhTLC9zTQ39IYxWnftJSRuvFXFAZnykcx5gqF7HMiVbLnc8LQVddZrhXjFqDurIy3urIuA7rkz60SMXjFU23yO4zToMl15Rg1D', '13', '2021-09-05 17:00:25', '2021-09-05 17:00:25', 13, 13, 0, '2021-09-06 10:00:25', NULL),
(37, 2, 13, '44SWxcOHXWhyLMckPqRdyUprCy37PSC4f7qyQOQb1sOJ2djPtc3uvFLz2V8K83POaIbQom1qsQjU1x93mVXDDaBePBE6FYK66Lq8CYk3ayMtaKejWPvdiQS7dp3saF5P3Nfh94FdahT687lQFLjfhjGKRhFJfeuw46G87xblEx9YpFQtzQvHFBMtSjK13vEjGfjjJFRL1zR2m6PxmTpevgRRyrw2Xwa0imufVS1qT43BIMIqWIw1mCKQl0Pt977u', '13', '2021-09-06 21:45:35', '2021-09-06 21:45:35', 13, 13, 0, '2021-09-07 14:45:35', NULL),
(38, 2, 13, 'Tb0kgNyvX24AD8Egiu22dDs6XCsVh2EwIxpqeiT995HX3ReUATjIw5oi1iDCYG4cNSy1DsOSDhZvRddOTgrcrPEbCYab3MFsWCzw4a3is4CBS2AiTI757Z2ZtMPoavIomc3Bw6KYpIpBvoxgH0HXuX3JjmRXixHjUYhCAqTIi1CLcshOoI05a1S4qktJZQBOwJxfg5QhY2r4diTom268LBif0OzPPCQJUCrFeay2m7EZ1s6qikKJNozVX2lhCc1Z', '13', '2021-09-10 00:10:07', '2021-09-10 00:10:07', 13, 13, 0, '2021-09-10 17:10:07', NULL),
(39, 1, 1, 'vmwVleY6tnAQXxpZpAx6LgjDd4Z1JupWgGGV01Wnvyg3yszf3YTb5NDN40vU9DvXrzmplFFBkLJET2XcC8Vq0OZWjGAgtF0Ry5PId4pPlQCRJkJ4Ez9nxo9UQ81bXhius01r0uxoDhJ4TZkqyNmyoqcBgQDBptUjPrzEZpmQOh3Yai0HxdbMXGhgypzyKTBhg0WTKAGCLB12a7RfeDKEmghvWPTrQl2MN0FXIl4VXZijXZswGQirdD38sxjJkjXE', '1', '2021-09-26 14:23:41', '2021-09-26 14:23:41', 1, 1, 0, '2021-09-27 07:23:41', NULL),
(40, 1, 1, '4m8ijvG28nWqbPsG29QQVSYdffHeZ3oFYG8JewB6K6KVQkw0DqpTiCtIpf7DLMfTAy6oYKyqaYZoF7FJkKtlIda0veGW8uX75FaflK2eZ6BF7oLjfusOU3Edro5HPtSQHKYvu5IZkHHWip6qO4tvR9lQ5UYrAkxfxTTFWc3WFC0PdrkFwSAy19UfxasuMX3dbBpyQK0Fprvsqj2dNfFyr92MO3schsIGnDeuuywYQgpr7RDFHXkFuCrhZQ7lyeWw', '1', '2021-09-26 14:53:03', '2021-09-26 14:53:03', 1, 1, 0, '2021-09-27 07:53:03', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauthen2customer`
--

CREATE TABLE `oauthen2customer` (
  `id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `customeid` int(11) NOT NULL,
  `tocken` varchar(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `value_manifest` varchar(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `time_relase` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `oldid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `oauthen2customer`
--

INSERT INTO `oauthen2customer` (`id`, `permission_id`, `customeid`, `tocken`, `value_manifest`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `time_relase`, `oldid`) VALUES
(1, 1, 1, 'xjzjR2IB4D0Jzxyb9YCPbqcUe9MC4KaidA8YmjHx2amwQM3bATfuVaGBzKVJs0QEdiQDgvgLr98ROJCsqHyCPWyWMYLyp82iYUqgKjEq4OLFdPzAy6OaTKiPgJSf8qjfoti4I530RkPXS5ML7FdMmLi0cTCXJmfhS8IuLqBsMCWciF06JzAVZZSVaVRDe3cLsxPgR7ziagLTUAndUzeNlY17R8nhgkD5B3gzkG6Xym966LjOaiyxhT03aw38qhQn', '1', '2021-08-14 14:20:06', '2021-08-14 14:20:06', 1, 1, 0, '2021-08-15 07:20:06', NULL),
(2, 1, 1, 'yk1jCU6OSdqbGs76GHeeAVTApHe3KFUx1MW4nzg3JXbcxhp6KpI7DC3yVaI8YIKHvmv32zVLQ8VClxuaGEIMPgHcgFCWyva7bJaegasfOW7Tmw2OpH8XgJGjoi2yPyUCUkj1MxX2Eop7PoKprMSMnJvY4E9AdnHORvS6NGS3GznGLnfVsMy46EGevupGfR0aRNBIVXwWDbTd0J5U2ageS19TUnsGVZkiUnxFOEiMzwusu72Zao73bWpEiG4JMO5A', '1', '2021-08-14 14:46:45', '2021-08-14 14:46:45', 1, 1, 0, '2021-08-15 07:46:45', NULL),
(3, 1, 1, 'khd85ooVXukO0ujSrenkEDJhGMT8IM4gtt3FSOoDwWbjYoFpvB1dNZxKOe3q7apFPWVturXQMszJWNSlkAUuegTeVK3ToDa0GO1e5CAvVT0cqRa4cgTnr9DkTz63draHTrwNN9o9sHgyzSaipLqMg95PILr24ouqQAit2JOIh8BJjIwZloSzAqm1BtKuDWFchf1ryfJTlhbto1yTIU89SQyCGneD2iWES2GdIrLuR1tPntTHB8zQz9Wr1rtl1a3Q', '1', '2021-08-14 14:46:54', '2021-08-14 14:46:54', 1, 1, 0, '2021-08-15 07:46:54', NULL),
(4, 1, 1, 'AhsIGQcOiHLAPxLO4CInACA8jXpWZNnb47njZUL2EXUWvdrjktr3BYrqXnyPckRiCCO6WmRryUFlh7MffaSR0DBOFkuvj9vXkbLalvvPrJsmYrUKm5RcFdN4Y8XfeGjPZiJ6g9DE6ksWEaErtBZoYpzvYZoJGXyFzC5qTSf3BFXPSzdXQTWwuxfquhTZmNVwWONEDzrgYFVrZVpdyCHSGrTFs1ucv1Jl6ijlmvU6e08ZYJg0U01P99tVT19bwKCN', '1', '2021-08-14 14:50:51', '2021-08-14 14:50:51', 1, 1, 0, '2021-08-15 07:50:51', NULL),
(5, 1, 1, 'mAX3y4yNULQttbcO8wyUcV7lEo1Hy0tnpw6pD7AqoI2d6OSea7DCvakCTDzUsrvwLoAIYEM6LkwgkykliBrk5LJ2aKUllkgw3t8dVMcq1reWs73ImQ74bNBYpWjaHKgk0muA4TY9qhH1UHJesWecoM8IORYhQRyaJTRagT5ldzA4wPytnQhmLnlNSiR5zLnQbPmEEcb7gPfPD6dHvplSo3RI0SHBSEHDa9CpGd6tG7GCpJgwpQgKO2BzVmRASbsb', '1', '2021-08-14 14:51:15', '2021-08-14 14:51:15', 1, 1, 0, '2021-08-15 07:51:15', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages_content`
--

CREATE TABLE `pages_content` (
  `pages_content_id` int(11) NOT NULL,
  `group_content_sub_id` int(11) NOT NULL,
  `group_file` varchar(50) DEFAULT NULL,
  `filesave` varchar(100) DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `content_img` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `is_main_pages_id` int(11) NOT NULL,
  `set_to_fist` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `pages_content`
--

INSERT INTO `pages_content` (`pages_content_id`, `group_content_sub_id`, `group_file`, `filesave`, `title`, `content`, `content_img`, `is_main_pages_id`, `set_to_fist`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(5, 21, 'group_file', 'storeHtml/fileYiIyeuT83kLX0FVbP2uD1625070724114.html', 'vi du', 'không rỗ', 'http://localhost:3000/uploads/datas/1625069820079-anh13.jpg', 0, 0, '2021-06-30 23:32:04', '2021-06-30 23:32:04', 1, 1, 0, 0),
(6, 1, 'group_file', 'storeHtml/filerigUa24JrEfHFjtGSxgV1626537985174.html', 'công nghệ 1 xxxx', 'không rỗ xxxx', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 1, '2021-06-30 23:33:07', '2021-07-17 23:06:25', 1, 1, 0, 0),
(7, 1, 'group_file', 'storeHtml/fileMwMciSt1yKxN1jxcsrDA1625070797905.html', 'công nghệ 2', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:17', '2021-06-30 23:33:17', 1, 1, 0, 0),
(8, 2, 'group_file', 'storeHtml/file95faRzHr0fMaz6BCf4EN1625070806525.html', 'công nghệ 22', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:26', '2021-06-30 23:33:26', 1, 1, 0, 0),
(9, 3, 'group_file', 'storeHtml/filetZHYpPgtisiWzypXldO11625070810340.html', 'công nghệ 22', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:30', '2021-06-30 23:33:30', 1, 1, 0, 0),
(10, 3, 'group_file', 'storeHtml/filej13fow55xGe6UbIaOdoD1625070812345.html', 'công nghệ 22', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:32', '2021-06-30 23:33:32', 1, 1, 0, 0),
(11, 4, 'group_file', 'storeHtml/fileeVxSBAwqlvyDwtslt8oe1625070819435.html', 'công nghệ 12', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:39', '2021-06-30 23:33:39', 1, 1, 0, 0),
(12, 4, 'group_file', 'storeHtml/filePxLbfuycGa2ygD6PRJG31625070824963.html', 'công nghệ 13', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:44', '2021-06-30 23:33:44', 1, 1, 0, 0),
(13, 5, 'group_file', 'storeHtml/filejckzPqDfU77wi2eP2epS1625070831582.html', 'công nghệ 132', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:51', '2021-06-30 23:33:51', 1, 1, 0, 0),
(14, 5, 'group_file', 'storeHtml/file9hZn3in17JswhX56O0qj1625070835664.html', 'công nghệ 15', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:33:55', '2021-06-30 23:33:55', 1, 1, 0, 0),
(15, 6, 'group_file', 'storeHtml/fileVed9OIxPpT79SEksTlqC1625070841086.html', 'công nghệ 15', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:34:01', '2021-06-30 23:34:01', 1, 1, 0, 0),
(16, 22, 'group_file', 'storeHtml/fileAlGLkClOVm3ZYhmxOl9q1625070848938.html', 'công nghệ 15', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:34:08', '2021-06-30 23:34:08', 1, 1, 0, 0),
(17, 24, 'group_file', 'storeHtml/fileYFhtjaOKPjS0gpVBtuWY1625070852175.html', 'công nghệ 15', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:34:12', '2021-06-30 23:34:12', 1, 1, 0, 0),
(18, 31, 'group_file', 'storeHtml/filek5jCuHMeW3ACAtWlOEby1625070859177.html', 'công nghệ 15ưqe', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:34:19', '2021-06-30 23:34:19', 1, 1, 0, 0),
(19, 31, 'group_file', 'storeHtml/file1lqtwx0Sso84YnN9ni8b1625070860924.html', 'công nghệ 15ưqe', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:34:20', '2021-06-30 23:34:20', 1, 1, 0, 0),
(20, 31, 'group_file', 'storeHtml/fileyksChPRMFHG8DlV2YBa91625070863747.html', 'công nghệ 15ưqe', 'không rỗ', 'http://localhost:3000/uploads/datas/1625070781786-2309.jpg', 0, 0, '2021-06-30 23:34:23', '2021-06-30 23:34:23', 1, 1, 0, 0),
(21, 41, 'tool', 'static/hk2_2021/AngleToRad/AngleToRad.html', 'angle sang rad', 'công cụ chuyển đổi radian sang độ', NULL, 0, 0, '2021-06-23 00:00:00', '2021-03-09 00:00:00', 1, 1, 0, 21),
(22, 22, 'group_file', 'storeHtml/fileWa5nW3M5EsIxZ71mH9Tg1626106996268.html', 'xsasas', 'aasasa', '', 0, 0, '2021-07-12 23:23:16', '2021-07-12 23:23:16', 1, 1, 0, 0),
(23, 1, 'group_file', 'storeHtml/fileh0KzqvjO4uwgloJWHSus1626495375358.html', 'Hướng dẫn phương pháp học lập trình cơ bản cho ngư', 'vi du', '', 0, 0, '2021-07-17 11:16:15', '2021-07-17 11:16:15', 1, 1, 0, 0),
(24, 1, 'group_file', 'storeHtml/fileOKzPzgVanfC0ISyT3uhz1626496822391.html', 'Hướng dẫn  hoc lap trinh', 'cong nghe moi', '', 0, 0, '2021-07-17 11:40:22', '2021-07-17 11:40:22', 1, 1, 0, 0),
(25, 1, 'group_file', 'storeHtml/fileUVurorm8gGTNVG1r2hRd1626496833138.html', 'Hướng dẫn  hoc lap trinh trinh 1', 'cong nghe moi', '', 0, 0, '2021-07-17 11:40:33', '2021-07-17 11:40:33', 1, 1, 0, 0),
(26, 1, 'group_file', 'storeHtml/filexin1FDWNhwvcjzZntDlR1626496835655.html', 'Hướng dẫn  hoc lap trinh trinh 1', 'cong nghe moi', '', 0, 0, '2021-07-17 11:40:35', '2021-07-17 11:40:35', 1, 1, 0, 0),
(27, 1, 'group_file', 'storeHtml/fileARvAIntA8ulEI2203Vxr1626496843281.html', 'Hướng dẫn  hoc lap trinh trinh 2', 'cong nghe moi', '', 0, 0, '2021-07-17 11:40:43', '2021-07-17 11:40:43', 1, 1, 0, 0),
(28, 1, 'group_file', 'storeHtml/fileOUS6Y6d9e3faXegZJZCl1626496849108.html', 'Hướng dẫn  hoc lap trinh trinh 3', 'cong nghe moi', '', 0, 0, '2021-07-17 11:40:49', '2021-07-17 11:40:49', 1, 1, 0, 0),
(29, 3, 'group_file', 'storeHtml/filetdpTAQpSxYDZVNdmkMwG1626496855702.html', 'Hướng dẫn  hoc lap trinh trinh 5', 'cong nghe moi', '', 0, 0, '2021-07-17 11:40:55', '2021-07-17 11:40:55', 1, 1, 0, 0),
(30, 1, 'group_file', 'storeHtml/filerEYG5pnvWKMoXdBZKRDy1626496861467.html', 'Hướng dẫn  hoc lap trinh trinh 6', 'cong nghe moi', '', 0, 0, '2021-07-17 11:41:01', '2021-07-17 11:41:01', 1, 1, 0, 0),
(31, 1, 'group_file', 'storeHtml/fileocMtXKvjZpmyOeh9FOei1626496868922.html', 'Hướng dẫn  hoc lap trinh trinh 7', 'cong nghe moi', '', 0, 0, '2021-07-17 11:41:08', '2021-07-17 11:41:08', 1, 1, 0, 0),
(32, 2, 'group_file', 'storeHtml/file1YkDka828NVbmZkKQKDb1626496900751.html', 'Hướng dẫn  hoc lap trinh viên thong 1', 'cong nghe viên thong 1', '', 0, 0, '2021-07-17 11:41:40', '2021-07-17 11:41:40', 1, 1, 0, 0),
(33, 2, 'group_file', 'storeHtml/filePSzoJcmdkd52Q31Ffimr1626496913723.html', 'Hướng dẫn  hoc lap trinh viên thong 2', 'cong nghe viên thong 2', '', 0, 0, '2021-07-17 11:41:53', '2021-07-17 11:41:53', 1, 1, 0, 0),
(34, 2, 'group_file', 'storeHtml/fileMfKhjFtnSEd0I73k4Vgl1626497802630.html', 'Hướng dẫn  hoc lap trinh viên thong 3', 'cong nghe viên thong 3', '', 0, 0, '2021-07-17 11:56:42', '2021-07-17 11:56:42', 1, 1, 0, 0),
(35, 2, 'group_file', 'storeHtml/file85AbHeR7IfcB0WycjyNg1626497810507.html', 'Hướng dẫn  hoc lap trinh viên thong 4', 'cong nghe viên thong 4', '', 0, 0, '2021-07-17 11:56:50', '2021-07-17 11:56:50', 1, 1, 0, 0),
(36, 2, 'group_file', 'storeHtml/fileK34LblqXhWThF0NlXwlO1626497844970.html', 'Hướng dẫn  hoc lap trinh viên thong 5', 'cong nghe viên thong 5', '', 0, 0, '2021-07-17 11:57:24', '2021-07-17 11:57:24', 1, 1, 0, 0),
(37, 2, 'group_file', 'storeHtml/fileE2PZtafQAbUhruyRRUlJ1626503219223.html', '0 cách tự học lập trình đơn giản', '0 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-17 13:26:59', '2021-07-17 13:26:59', 1, 1, 0, 0),
(38, 2, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', '10 cách tự học lập trình đơn giản', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-17 13:28:13', '2021-07-17 13:28:13', 1, 1, 0, 0),
(39, 3, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', '10 cách tự học lập trình đơn giản', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(40, 3, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'đua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(41, 3, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(42, 3, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(43, 3, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(44, 3, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(45, 4, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(46, 4, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(47, 4, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(48, 4, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(49, 4, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(50, 5, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(51, 5, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(52, 5, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(53, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(54, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(55, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(56, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn xxxs', '10 cách tự học lập trình đơn giản xxss ss', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', -1, 2, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(57, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(58, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(59, 21, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(60, 21, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(61, 21, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(62, 21, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(63, 21, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(64, 21, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(65, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(66, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(67, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(68, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(69, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(70, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(71, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(72, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(73, 22, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(74, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(75, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(76, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(77, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(78, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(79, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(80, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(81, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(82, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(83, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(84, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(85, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(86, 23, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(87, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(88, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(89, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(90, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(91, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(92, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(93, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(94, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(95, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(96, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(97, 25, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(98, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(99, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(100, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(101, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(102, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(103, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(104, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(105, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(106, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(107, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(108, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(109, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(110, 26, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(111, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(112, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(113, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(114, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(115, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(116, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(117, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(118, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(119, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(120, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(121, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(122, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(123, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(124, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(125, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(126, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(127, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(128, 27, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(129, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(130, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(131, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(132, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(133, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(134, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(135, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(136, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(137, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(138, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(139, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(140, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(141, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(142, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(143, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(144, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(145, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(146, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(147, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(148, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(149, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(150, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(151, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(152, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(153, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(154, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(155, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(156, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(157, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(158, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(159, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(160, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(161, 28, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(162, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(163, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(164, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(165, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(166, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(167, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(168, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(169, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(170, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(171, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(172, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(173, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(174, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(175, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(176, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(177, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(178, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(179, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(180, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(181, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(182, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(183, 31, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(184, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(185, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(186, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(187, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(188, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(189, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(190, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(191, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0);
INSERT INTO `pages_content` (`pages_content_id`, `group_content_sub_id`, `group_file`, `filesave`, `title`, `content`, `content_img`, `is_main_pages_id`, `set_to_fist`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(192, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(193, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(194, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(195, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(196, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(197, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(198, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(199, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(200, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(201, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(202, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(203, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(204, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(205, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(206, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(207, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(208, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(209, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(210, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(211, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(212, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(213, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(214, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(215, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(216, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(217, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(218, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(219, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(220, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(221, 32, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(222, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(223, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(224, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(225, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(226, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(227, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(228, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(229, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(230, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(231, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(232, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(233, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(234, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(235, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(236, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(237, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(238, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(239, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(240, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(241, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(242, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(243, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(244, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(245, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(246, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(247, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(248, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(249, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(250, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(251, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(252, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(253, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(254, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(255, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(256, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(257, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(258, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(259, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(260, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(261, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(262, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(263, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(264, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(265, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(266, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(267, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(268, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(269, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(270, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(271, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(272, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(273, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(274, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(275, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(276, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(277, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(278, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(279, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(280, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(281, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(282, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(283, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(284, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(285, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(286, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(287, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(288, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(289, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(290, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(291, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(292, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(293, 33, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(294, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(295, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(296, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(297, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(298, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(299, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(300, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(301, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(302, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(303, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(304, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(305, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(306, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(307, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(308, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(309, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(310, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(311, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(312, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(313, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(314, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(315, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(316, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(317, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(318, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(319, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(320, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(321, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(322, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(323, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(324, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(325, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(326, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(327, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(328, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(329, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(330, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(331, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(332, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(333, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(334, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(335, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(336, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(337, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(338, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(339, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(340, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(341, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(342, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(343, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(344, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(345, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(346, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(347, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(348, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(349, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(350, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(351, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(352, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(353, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(354, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(355, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(356, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(357, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(358, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(359, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(360, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(361, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(362, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(363, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(364, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(365, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(366, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(367, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(368, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(369, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(370, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(371, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0);
INSERT INTO `pages_content` (`pages_content_id`, `group_content_sub_id`, `group_file`, `filesave`, `title`, `content`, `content_img`, `is_main_pages_id`, `set_to_fist`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(372, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(373, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(374, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(375, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(376, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(377, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(378, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(379, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(380, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(381, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(382, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(383, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(384, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(385, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(386, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(387, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(388, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(389, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(390, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(391, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(392, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(393, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(394, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(395, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(396, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(397, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(398, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(399, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(400, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(401, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(402, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(403, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(404, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(405, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(406, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(407, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(408, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(409, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(410, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(411, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(412, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(413, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(414, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(415, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(416, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(417, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(418, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(419, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(420, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(421, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(422, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(423, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(424, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(425, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(426, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(427, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(428, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(429, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(430, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(431, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(432, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(433, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(434, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(435, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(436, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(437, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(438, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(439, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(440, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(441, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(442, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(443, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(444, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(445, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(446, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(447, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(448, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(449, 34, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(450, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(451, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(452, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(453, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(454, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(455, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(456, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(457, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(458, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(459, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(460, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(461, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(462, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(463, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(464, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(465, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(466, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(467, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(468, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(469, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(470, 35, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(471, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(472, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(473, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(474, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(475, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(476, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(477, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(478, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(479, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(480, 36, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(481, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(482, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(483, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(484, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(485, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(486, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(487, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(488, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(489, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(490, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(491, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(492, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(493, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(494, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(495, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(496, 37, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(497, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(498, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(499, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(500, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(501, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(502, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(503, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(504, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(505, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(506, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(507, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(508, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(509, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(510, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(511, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(512, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(513, 38, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'ua bài viết này các bạn ', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 0, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(514, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'Bài 1', '10 cách tự học lập trình đơn giản s1', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 56, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(515, 6, 'group_file', 'storeHtml/filerigUa24JrEfHFjtGSxgV1626537985174.html', 'Bài 2', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 56, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(516, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'Bài 3', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 56, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(517, 6, 'group_file', 'storeHtml/filerigUa24JrEfHFjtGSxgV1626537985174.html', 'Bài 4', '10 cách tự học lập trình đơn giản', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 56, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(518, 6, 'group_file', 'storeHtml/filexdGDkE5xAAmvhmWoxP0g1626503293014.html', 'Bài 5', '10 cách tự học lập trình đơn giản 1', 'http://localhost:3000/uploads/datas/1626502591224-converted.jpg', 56, 0, '2021-07-12 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(519, 1, 'group_file', 'storeHtml/fileKd5iGRnXMfu0SB5ta6H71630836622668.html', 'ZXCXZC', 'XZCZXC', '', 0, 0, '2021-09-05 17:10:22', '2021-09-05 17:10:22', 13, 13, 0, 0),
(520, 1, 'group_file', 'storeHtml/filedbapxkad0C8nvxaCWlfE1630855722102.html', '', '', '', 0, 0, '2021-09-05 22:28:42', '2021-09-05 22:28:42', 13, 13, 0, 0),
(521, 1, 'group_file', 'storeHtml/filetTPKMwNM0GbP0yjC4UMG1630891491188.html', '', '', '', 0, 0, '2021-09-06 08:24:51', '2021-09-06 08:24:51', 13, 13, 0, 0),
(522, 1, 'group_file', 'storeHtml/fileViFR9yDI1d6I2MCeYuDG1630939686754.html', 'Tiêu đề bài viết', 'Tiêu đề bài viết', 'http://127.0.0.1:3000/uploads/datas/1630939583362-Untitled9.png', 0, 0, '2021-09-06 21:48:06', '2021-09-06 21:48:06', 13, 13, 0, 0),
(523, 1, 'group_file', 'storeHtml/filefd8iNptB1LmZU09roGA91630947689194.html', 'xxxxxxxxxxxxxxxxxxxx', 'xxxxxxx', 'http://127.0.0.1:3000/uploads/datas/1630947669308-Untitled9.png', 0, 0, '2021-09-07 00:01:29', '2021-09-07 00:01:29', 13, 13, 0, 0),
(524, 1, 'group_file', 'storeHtml/fileQTtDjPHloJdwqfdR0z8b1630949249102.html', 'https://www.youtube.com/watch?v=0VC6euBtKkk', 'https://www.youtube.com/watch?v=0VC6euBtKkk', 'http://127.0.0.1:3000/uploads/datas/1630949176033-Untitled9.png', 0, 0, '2021-09-07 00:27:29', '2021-09-07 00:27:29', 13, 13, 0, 0),
(525, 1, 'group_file', 'storeHtml/filegSrhwfhQbnEhhScIiXTF1630949651632.html', 'https://www.youtube.com/watch?v=0VC6euBtKkk', 'https://www.youtube.com/watch?v=0VC6euBtKkk', 'http://127.0.0.1:3000/uploads/datas/1630949637760-Untitled7.png', 0, 0, '2021-09-07 00:34:11', '2021-09-07 00:34:11', 13, 13, 0, 0),
(526, 1, 'group_file', 'storeHtml/filecVK1FcA46z7YwfFi2Yr11632643266380.html', 'dddddddd', 'ddd', 'http://127.0.0.1:3000/uploads/datas/1632643176100-71f2c32c128be6d5bf9a.jpg', 0, 0, '2021-09-26 15:01:06', '2021-09-26 15:01:06', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages_customer_content`
--

CREATE TABLE `pages_customer_content` (
  `pages_customer_content_id` int(11) NOT NULL,
  `group_content_customer_id` int(11) NOT NULL,
  `group_file` varchar(50) DEFAULT NULL,
  `filesave` varchar(100) DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `content_img` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `set_to_fist` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission`
--

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL,
  `content` varchar(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `permission`
--

INSERT INTO `permission` (`permission_id`, `content`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 'Quản trị cấp cao', '2021-03-09 00:00:00', '2021-07-13 00:00:00', 0, 0, 0, 0),
(2, 'Quản trị trang', '2021-03-09 00:00:00', '2021-07-13 00:00:00', 0, 0, 0, 0),
(3, 'Trợ lý trang', '2021-03-09 00:00:00', '2021-07-13 00:00:00', 0, 0, 0, 0),
(4, 'kế toán', '2021-03-09 00:00:00', '2021-07-13 00:00:00', 0, 0, 0, 0),
(10, 'Cộng tác viên ', '2021-03-09 00:00:00', '2021-07-13 00:00:00', 0, 0, 0, 0),
(11, 'Ghi danh', '2021-03-09 00:00:00', '2021-07-13 00:00:00', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `detail` text,
  `image` text,
  `store` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `company_id`, `name`, `detail`, `image`, `store`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 3, 'son off', 'son off', 'https://dientukey.com/wp-content/uploads/2019/07/C%C3%B4ng-t%E1%BA%AFc-th%C3%B4ng-minh-Sonoff-Basic.jpg', 2, '2021-08-11 21:57:04', '2021-08-11 21:57:04', 0, 1, 0, 0),
(2, 3, 'son off', 'son off', 'https://ae01.alicdn.com/kf/HTB1Sg_zwCBYBeNjy0Feq6znmFXaV/Sonoff-th-16a-10a-Nhi-t-V-Gi-m-S-t-m-WiFi-Khi-n.jpg_Q90.jpg_.webp', 2, '2021-08-11 21:56:33', '2021-08-11 21:57:04', 1, 1, 0, 0),
(3, 4, 'sss', 'ss', 'https://dientutuonglai.com/uploads/media/module/so-do-chan-nodemcu-esp8266.png', 1, '2021-08-11 21:57:20', '2021-08-11 21:57:27', 1, 1, 0, 0),
(4, 4, 'so 2', '2', 'https://hstatic.net/087/1000069087/1/2016/1-31/module_esp8266_master.jpg', 1, '2021-08-15 10:45:04', '2021-08-15 10:45:09', 0, 1, 0, 0),
(5, 5, '1', '1', 'https://cf.shopee.vn/file/840ca258e042584fdb42fbe959118ffa', 3, '2021-08-15 10:34:01', '2021-08-15 10:44:50', 1, 1, 0, 0),
(6, 5, '1', '2', 'https://iotmaker.vn/images/detailed/1/chip-esp8285-1mb-flash-wifi-iot.jpg', 3, '2021-08-15 10:44:50', '2021-08-15 10:45:04', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name_image_detail` varchar(100) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `image_info_detail` varchar(128) DEFAULT NULL,
  `cost_detail` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`image_id`, `product_id`, `name_image_detail`, `image_info_detail`, `cost_detail`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 1, 'Giảm giá 10%', 'https://cf.shopee.vn/file/e15e95f7f5843edc38fae1fcd38705ac', 3000, '2021-09-14 00:00:00', '2021-09-14 00:00:00', 1, 1, 0, 0),
(2, 1, 'giảm giá 10%', 'https://product.hstatic.net/1000069225/product/wifi_smart_switch_sonoff_th16.jpg', 2000, '2021-09-14 00:00:00', '2021-09-14 00:00:00', 1, 1, 0, 0),
(3, 1, 'giảm giá 20%', 'https://chipviet.vn/wp-content/uploads/2021/03/104186-cong-tac-dieu-khien-nhiet-do-do-am-wifi-wifi-smart-switch-sonoff-th16-h1.j', 1200, '2021-09-14 00:00:00', '2021-09-14 00:00:00', 1, 1, 0, 0),
(4, 1, 'giảm giá 30%', 'https://file-cdn.bzfuture.com/news/9ecf93f4f00bbc46aaaa234a2de07f4a.png', 1000, '2021-09-14 00:00:00', '2021-09-14 00:00:00', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `return_service`
--

CREATE TABLE `return_service` (
  `bill_service_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `bank` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `detail_bank` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(128) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `return_service`
--

INSERT INTO `return_service` (`bill_service_id`, `customer_id`, `service_id`, `value`, `bank`, `detail_bank`, `content`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 1, 1, 1, '1', '1', '1', '2021-08-11 22:54:14', '2021-08-11 22:54:19', 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(1024) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(256) NOT NULL,
  `page_service_id` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `downloads` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `service`
--

INSERT INTO `service` (`service_id`, `name`, `content`, `image`, `page_service_id`, `cost`, `downloads`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 'png to svg', 'Một máy bay của Pakistan đã đến sân bay Kabul vào ngày 13/9, đánh dấu chuyến bay thương mại quốc tế đầu tiên hạ cánh ở đây kể từ khi Taliban lên nắm quyền tại Afghanistan', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 1, 1, 1, '2021-08-11 23:06:20', '2021-08-11 23:06:25', 1, 1, 0, 0),
(2, 'image cutting', 'Một máy bay của Pakistan đã đến sân bay Kabul vào ngày 13/9, đánh dấu chuyến bay thương mại quốc tế đầu tiên hạ cánh ở đây kể từ khi Taliban lên nắm quyền tại Afghanistan', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 11, 1, 1, '2021-08-12 12:54:32', '2021-08-12 12:54:32', 0, 1, 0, 0),
(3, 'svg to png', 'Một máy bay của Pakistan đã đến sân bay Kabul vào ngày 13/9, đánh dấu chuyến bay thương mại quốc tế đầu tiên hạ cánh ở đây kể từ khi Taliban lên nắm quyền tại Afghanistan', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 11, 1, 1, '2021-08-12 12:54:22', '2021-08-12 12:54:32', 1, 1, 0, 2),
(4, 'công c? v?', 'Một máy bay của Pakistan đã đến sân bay Kabul vào ngày 13/9, đánh dấu chuyến bay thương mại quốc tế đầu tiên hạ cánh ở đây kể từ khi Taliban lên nắm quyền tại Afghanistan', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 10, 1, 1, '2021-08-12 23:16:26', '2021-08-12 23:16:26', 1, 1, 0, 0),
(5, '', 'Một máy bay của Pakistan đã đến sân bay Kabul vào ngày 13/9, đánh dấu chuyến bay thương mại quốc tế đầu tiên hạ cánh ở đây kể từ khi Taliban lên nắm quyền tại Afghanistan', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 10, 0, 0, '2021-08-12 23:17:03', '2021-08-12 23:17:03', 1, 1, 0, 0),
(6, 'ab', 'Một máy bay của Pakistan đã đến sân bay Kabul vào ngày 13/9, đánh dấu chuyến bay thương mại quốc tế đầu tiên hạ cánh ở đây kể từ khi Taliban lên nắm quyền tại Afghanistan', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 10, 3, 1, '2021-08-13 20:34:50', '2021-08-13 20:34:50', 0, 1, 0, 0),
(7, 'a', 'a', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 10, 0, 0, '2021-08-12 23:17:29', '2021-08-13 20:21:08', 1, 1, 0, 6),
(8, 'a', 'ab', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 10, 2, 0, '2021-08-13 20:21:08', '2021-08-13 20:21:26', 0, 1, 0, 6),
(9, 'a', 'ab', 'https://d1j8r0kxyu9tj8.cloudfront.net/images/1566394573t7NmKpCOtnQNiON.jpg', 10, 3, 0, '2021-08-13 20:21:26', '2021-08-13 20:34:50', 0, 1, 0, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `storeproduct`
--

CREATE TABLE `storeproduct` (
  `store_product_id` int(11) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `company_id` varchar(100) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `product_image` int(11) NOT NULL,
  `number` varchar(50) DEFAULT NULL,
  `contain` varchar(50) DEFAULT NULL,
  `expridate` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `storeproduct`
--

INSERT INTO `storeproduct` (`store_product_id`, `product_id`, `company_id`, `content`, `product_image`, `number`, `contain`, `expridate`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, '1', '3', 'Sony Smart Air Condtion', 1, '10', '1', '0000-00-00 00:00:00', '2021-08-11 22:02:41', '2021-08-11 22:02:41', 1, 1, 0, 0),
(2, '2', '3', 'Sony Smart Air Condtion', 1, '18', '4', '0000-00-00 00:00:00', '2021-08-11 22:04:54', '2021-08-11 22:04:57', 0, 1, 0, 0),
(3, '3', '4', 'Sony Smart Air Condtion', 1, '14', '1', '0000-00-00 00:00:00', '2021-08-11 22:04:46', '2021-08-11 22:04:54', 1, 1, 0, 0),
(4, '4', '4', 'Sony Smart Air Condtion', 1, '15', '1', '2021-09-16 00:00:00', '2021-06-16 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(5, '5', '5', 'Sony Smart Air Condtion', 1, '20', '1', '2021-09-16 00:00:00', '2021-06-16 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0),
(6, '6', '5', 'Sony Smart Air Condtion', 1, '30', '1', '2021-09-16 00:00:00', '2021-06-16 00:00:00', '2021-07-12 00:00:00', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `users_id` int(20) UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fullname` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL,
  `oldid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`users_id`, `username`, `email`, `password`, `phone`, `avatar`, `fullname`, `permission_id`, `address`, `note`, `created_at`, `updated_at`, `id_created`, `id_updated`, `deleteflag`, `oldid`) VALUES
(1, 'cuong', 'cuong@gmail.com', '$2b$12$60EHiBeAiyLcu8CatwHxe.x/RuG6dzFlb7csxPLLnA7vyNFIADypu', '123456789', 'https://1.bp.blogspot.com/-n_bFzL9lPUU/Xp23H9Sk8yI/AAAAAAAAhyA/JYfvZhwguxc8vT_YS3w14Xi3YWf3hxqIQCLcBGAsYHQ/s1600/Hinh-Anh-Dep-Tren-Mang%2B%25282%2529.jpg', '123456789', 1, '1', '1', '2021-06-22 17:00:00', '2021-06-15 17:00:00', 1, 1, 0, 1),
(5, 'sample', 'luvancuog0105@gmail.com', '$2b$12$60EHiBeAiyLcu8CatwHxe.x/RuG6dzFlb7csxPLLnA7vyNFIADypu', '0389992137', NULL, 'Lu van', 2, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'sss', '2021-08-18 01:04:26', '2021-08-21 06:43:27', 1, 1, 1, 0),
(6, 'lê minh mạng', 'luvancuong0105@gmail.com', '$2b$12$TuyWReRM4HRSSX6reTki1Oa6qAXnYO0wkliU0KAeDP32lApXBmeki', '0389992137', NULL, 'Lu van', 3, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'a', '2021-08-19 14:43:25', '2021-08-19 14:43:40', 1, 1, 1, 0),
(7, 'ahghghgh', 'luvancuong0105@gmail.com', '$2b$12$w1lC25RcDH/DldxGgHHemOg67BLXL4Aly67IZyq/jk0NDcjx475r.', '0389992137', NULL, 'Lu van', 2, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'hghh', '2021-08-19 14:45:28', '2021-08-19 18:12:52', 1, 1, 1, 0),
(8, 'đâsdsadasd', 'luvancuong0105@gmail.com', '$2b$12$JaC03LrYBl8kW/jg7tl6P.2WdVObapyH5PvIGJJbHUYKGy6nraX06', '0389992137', NULL, 'Lư Cương', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'sdadsad', '2021-08-19 14:45:50', '2021-08-21 06:43:24', 1, 1, 1, 0),
(9, 'âsasas', 'luvancuong0105@gmail.com', '$2b$12$XZav14jJ3Wm7v1/JZ4d6EOnaZ9rYj/CtZkmi0oiM8ybSyIOCIKL1C', '0389992137', NULL, 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'aaa', '2021-08-19 14:48:14', '2021-08-19 19:14:15', 1, 1, 1, 0),
(10, 'cxcxcxccx', 'luvancuong0105@gmail.com', '$2b$12$OoXKmXcTAoBI6rDQiDLc1eQTZrWX.L6ORWCmzMnm6.0izwxedWEnW', '0389992137', NULL, 'Lu van', 1, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'c', '2021-08-19 14:56:25', '2021-08-19 19:14:09', 1, 1, 1, 0),
(11, 'kế toán', 'levan2@gmail.com', '$2b$12$jLVNOZ.zBHvqLhpqS.V9r.WLcLMVNj0Geh4GXMyeh1.5YsT.ueCMi', '0983838232', NULL, 'sadasd', 4, 'ádasd', 'sdsd', '2021-08-19 19:54:10', '2021-08-21 06:43:21', 1, 1, 1, 0),
(12, 'cộng tác viên', 'lelan2a@gmail.com', '$2b$12$75vpmZq3zCEpi6YoFYQxp.KcEbbCJU3epCUrHOvktxxIz2sn5jn.a', '0399943233', NULL, 'Lu van', 10, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'c', '2021-08-19 20:02:25', '2021-08-21 06:43:18', 1, 1, 1, 0),
(13, 'cuong1', 'luvancuong0105@gmail.com', '$2b$12$ikt/VxDiSphFb4uj9IBkMetzZUHwz98Wq3zMxHHa3irFwsOI7eQ.S', '0389992137', NULL, 'Lu van', 2, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'a', '2021-08-21 06:44:22', '2021-08-21 06:44:22', 1, 1, 0, 0),
(14, 'levan cuong', 'luvan1@gmail.com', '$2b$12$5O2.qyjLQqU9HNcOhZd6Y.Bx20awu8Z3A.TaXBhpGGe8MQgKoCVvG', '0988891234', NULL, 'anhban', 2, 'asdasd', 'a', '2021-08-21 07:35:36', '2021-08-21 07:35:36', 1, 1, 0, 0),
(15, 'quản trị nhóm', 'troly2@gmail.com', '$2b$12$ikt/VxDiSphFb4uj9IBkMetzZUHwz98Wq3zMxHHa3irFwsOI7eQ.S', '0923456789', NULL, 'troy 2', 3, '1', '1', '2021-08-21 07:38:43', '2021-08-21 07:38:43', 1, 1, 0, 0),
(16, 'troly3', 'troly3@gmail.com', '$2b$12$d6GD1t3rvZ0bYq.LG2mwLuUP5a6Sqe2we3Lk45VQhru1Wm4EkzOP2', '0812345671', NULL, 'tro ly 3', 3, 'ádasd', '1', '2021-08-21 07:45:48', '2021-08-21 07:45:48', 1, 1, 0, 0),
(17, 'ké toán 1', 'ketoan1@gmail.com', '$2b$12$M7yCipCfqdgYCAZVBCfE2u1GYaehoWSq69a7DI3LfiZulr3Hzn7sW', '0912345678', NULL, 'ketoan1', 4, '1', '1', '2021-08-21 07:47:03', '2021-08-21 07:47:03', 1, 1, 0, 0),
(18, 'cong tac vien', 'congtacvien1@gmail.com', '$2b$12$M7yCipCfqdgYCAZVBCfE2u1GYaehoWSq69a7DI3LfiZulr3Hzn7sW', '0987654321', NULL, 'sssd', 10, 'sâs', 'sâs', '2021-08-21 08:28:40', '2021-08-21 08:28:40', 1, 1, 0, 0),
(19, 'user name', 'ghidanh@gmail.com', '$2b$12$q3zB3/sTYsO.KtHUqBbNWOxs05lVbeQckT4PEyPkevUSjKVCSVCDy', '0987654321', NULL, 'acesss', 11, 'a', 'a', '2021-08-21 08:29:28', '2021-08-21 08:29:28', 1, 1, 0, 0),
(20, 'vidu1a', 'luvancusong0105@gmail.com', '$2b$12$ipHPbNh1kYt71.SmHDEQUeNQi2FIv3fRbVGuT2YPQaoIaeP5.PL9a', '0389992137', NULL, 'Lu van', 3, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'ư', '2021-08-22 07:04:08', '2021-08-22 07:27:04', 0, 13, 1, 0),
(21, 'vidu1', 'luvancusong0105@gmail.com', '$2b$12$9hvsgRrZaqdlqZnMkU1In.b04CO5Sqk5aUmqhFLIPd0qp0y5QPaby', '0389992137', NULL, 'Lu van', 3, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'ư', '2021-08-22 04:09:45', '2021-08-22 06:43:42', 13, 13, 1, 20),
(22, 'vidu1', 'luvancusong0105@gmail.com', '$2b$12$9hvsgRrZaqdlqZnMkU1In.b04CO5Sqk5aUmqhFLIPd0qp0y5QPaby', '0389992137', NULL, 'Lu van', 3, 'so 15 ngõ Lê trọng tấn Thanh xuân hà nội', 'ư', '2021-08-22 04:09:45', '2021-08-22 07:04:07', 13, 13, 1, 20);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addr_id`);

--
-- Chỉ mục cho bảng `advertisement_content`
--
ALTER TABLE `advertisement_content`
  ADD PRIMARY KEY (`advertisement_id`);

--
-- Chỉ mục cho bảng `backproduct`
--
ALTER TABLE `backproduct`
  ADD PRIMARY KEY (`buyproduct_id`);

--
-- Chỉ mục cho bảng `bill_service`
--
ALTER TABLE `bill_service`
  ADD PRIMARY KEY (`bill_service_id`);

--
-- Chỉ mục cho bảng `buyproduct`
--
ALTER TABLE `buyproduct`
  ADD PRIMARY KEY (`buyproduct_id`);

--
-- Chỉ mục cho bảng `buyproductdetail`
--
ALTER TABLE `buyproductdetail`
  ADD PRIMARY KEY (`id_buy_detail`);

--
-- Chỉ mục cho bảng `charging_service`
--
ALTER TABLE `charging_service`
  ADD PRIMARY KEY (`bill_service_id`);

--
-- Chỉ mục cho bảng `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `decentralization_access`
--
ALTER TABLE `decentralization_access`
  ADD PRIMARY KEY (`decentralization_access_id`);

--
-- Chỉ mục cho bảng `detailbank`
--
ALTER TABLE `detailbank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Chỉ mục cho bảng `enterprise`
--
ALTER TABLE `enterprise`
  ADD PRIMARY KEY (`enterprise_id`);

--
-- Chỉ mục cho bảng `group_content`
--
ALTER TABLE `group_content`
  ADD PRIMARY KEY (`group_content_id`);

--
-- Chỉ mục cho bảng `group_content_sub`
--
ALTER TABLE `group_content_sub`
  ADD PRIMARY KEY (`group_content_sub_id`);

--
-- Chỉ mục cho bảng `group_customer_content`
--
ALTER TABLE `group_customer_content`
  ADD PRIMARY KEY (`group_customer_id`);

--
-- Chỉ mục cho bảng `lostproduct`
--
ALTER TABLE `lostproduct`
  ADD PRIMARY KEY (`stord_id`);

--
-- Chỉ mục cho bảng `mqtt_microservice`
--
ALTER TABLE `mqtt_microservice`
  ADD PRIMARY KEY (`mqtt_microservice_id`);

--
-- Chỉ mục cho bảng `mqtt_user`
--
ALTER TABLE `mqtt_user`
  ADD PRIMARY KEY (`mqtt_user_id`);

--
-- Chỉ mục cho bảng `oauthen2`
--
ALTER TABLE `oauthen2`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauthen2customer`
--
ALTER TABLE `oauthen2customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages_content`
--
ALTER TABLE `pages_content`
  ADD PRIMARY KEY (`pages_content_id`);

--
-- Chỉ mục cho bảng `pages_customer_content`
--
ALTER TABLE `pages_customer_content`
  ADD PRIMARY KEY (`pages_customer_content_id`);

--
-- Chỉ mục cho bảng `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Chỉ mục cho bảng `return_service`
--
ALTER TABLE `return_service`
  ADD PRIMARY KEY (`bill_service_id`);

--
-- Chỉ mục cho bảng `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- Chỉ mục cho bảng `storeproduct`
--
ALTER TABLE `storeproduct`
  ADD PRIMARY KEY (`store_product_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address`
--
ALTER TABLE `address`
  MODIFY `addr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `advertisement_content`
--
ALTER TABLE `advertisement_content`
  MODIFY `advertisement_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;

--
-- AUTO_INCREMENT cho bảng `backproduct`
--
ALTER TABLE `backproduct`
  MODIFY `buyproduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `bill_service`
--
ALTER TABLE `bill_service`
  MODIFY `bill_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `buyproduct`
--
ALTER TABLE `buyproduct`
  MODIFY `buyproduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `buyproductdetail`
--
ALTER TABLE `buyproductdetail`
  MODIFY `id_buy_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `charging_service`
--
ALTER TABLE `charging_service`
  MODIFY `bill_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `decentralization_access`
--
ALTER TABLE `decentralization_access`
  MODIFY `decentralization_access_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `detailbank`
--
ALTER TABLE `detailbank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `enterprise`
--
ALTER TABLE `enterprise`
  MODIFY `enterprise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `group_content`
--
ALTER TABLE `group_content`
  MODIFY `group_content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `group_content_sub`
--
ALTER TABLE `group_content_sub`
  MODIFY `group_content_sub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `group_customer_content`
--
ALTER TABLE `group_customer_content`
  MODIFY `group_customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lostproduct`
--
ALTER TABLE `lostproduct`
  MODIFY `stord_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `mqtt_microservice`
--
ALTER TABLE `mqtt_microservice`
  MODIFY `mqtt_microservice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `mqtt_user`
--
ALTER TABLE `mqtt_user`
  MODIFY `mqtt_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `oauthen2`
--
ALTER TABLE `oauthen2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `oauthen2customer`
--
ALTER TABLE `oauthen2customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `pages_content`
--
ALTER TABLE `pages_content`
  MODIFY `pages_content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;

--
-- AUTO_INCREMENT cho bảng `pages_customer_content`
--
ALTER TABLE `pages_customer_content`
  MODIFY `pages_customer_content_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `return_service`
--
ALTER TABLE `return_service`
  MODIFY `bill_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `service`
--
ALTER TABLE `service`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `storeproduct`
--
ALTER TABLE `storeproduct`
  MODIFY `store_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
