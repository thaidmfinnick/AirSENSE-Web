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
-- Cơ sở dữ liệu: `airsense`
--









--
-- Cấu trúc bảng cho bảng `oauthen2`
--

CREATE TABLE `oauthen2` (
  `id` INT(11) NOT NULL,
  `permission_id` INT(11) NOT NULL,
  `userid` INT(11) NOT NULL,
  `tocken` VARCHAR(256) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `id_created` INT(11) NOT NULL,
  `id_updated` INT(11) NOT NULL,
  `deleteflag` INT(11) NOT NULL,
  `time_relase` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `addrid` int(11) NOT NULL,
  `avartar` varchar(255) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id_created` int(11) NOT NULL,
  `id_updated` int(11) NOT NULL,
  `note` varchar(30) CHARACTER SET utf32 COLLATE utf32_vietnamese_ci DEFAULT NULL,
  `permission_id` int(11) NOT NULL,
  `deleteflag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `name`, `fullname`, `phone`, `email`, `password`, `contact`, `addrid`, `avartar`, `created_at`, `updated_at`, `id_created`, `id_updated`, `note`, `permission_id`, `deleteflag`) VALUES
(1, 'Hiền Trần', 'Trần Thị Hồng Hiền', '', 'hienttt@gmail.com', '123456a@', '', 0, '', '2021-01-18 23:21:43', '2021-01-18 23:21:43', 43, 43, '', 1, 0),
(17, 'registerbycomputer', 'admins', '1234567', 'sparcLab@email.comdd', 'password', 'SPARC', 0, '', '2020-04-19 23:22:20', '2020-10-18 08:36:27', 0, 22, '', 1, 1),
(19, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'sadasd', 'SPARC', 0, '0', '2020-08-05 23:42:59', '2020-10-18 08:36:19', 17, 22, '', 1, 1),
(20, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbietdau', 'SPARC', 0, '', '2020-10-18 09:03:27', '2020-10-20 08:12:40', 22, 22, '', 1, 1),
(22, 'registerbycomputer', 'admins', '1234567', 'sparcLab@email.comdd', 'default', 'SPARC', 0, '', '2020-10-20 16:34:49', '2020-10-20 16:50:23', 22, 22, 'note', 1, 1),
(29, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-10-20 08:44:38', '2020-10-20 16:50:05', 22, 22, 'xxxx', 10, 1),
(30, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-08-08 23:06:58', '2020-10-20 08:45:25', 19, 22, '', 1, 1),
(31, 'registerbycomputer', 'admins', '1234567', 'sparcLab@email.comdd', 'adsabsajsdh', 'SPARC', 0, '', '2020-08-06 22:53:59', '2020-10-18 08:36:38', 19, 22, '', 10, 1),
(32, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-08-08 21:46:05', '2020-10-20 08:34:31', 19, 22, NULL, 10, 1),
(33, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-10-20 08:34:31', '2020-10-20 08:35:32', 22, 22, NULL, 10, 1),
(34, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-10-20 08:35:32', '2020-10-20 08:37:00', 22, 22, NULL, 10, 1),
(35, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-10-20 08:37:00', '2020-10-20 08:38:04', 22, 22, NULL, 10, 1),
(36, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-10-20 08:38:04', '2020-10-20 08:39:46', 22, 22, NULL, 10, 1),
(37, 'Lu', 'admins', '1234567', 'sparcLab@email.comdd', 'khongbiet', 'SPARC', 0, '', '2020-10-20 08:39:46', '2020-10-20 08:44:38', 22, 22, NULL, 10, 1),
(38, 'namlb', 'admins', '1234567', 'sparcLab@email.com', '123456a@', 'SPARC', 0, '', '2020-12-26 12:21:24', '2020-12-26 12:21:24', 22, 43, 'note', 1, 0),
(39, 'namlb', 'admins', '1234567', 'sparcLab@email.comdd', '123456a@', 'SPARC', 0, '', '2020-10-20 08:45:09', '2020-10-20 08:45:09', 22, 22, NULL, 1, NULL),
(40, 'namlb', 'admins', '1234567', 'sparcLab@email.comdd', '123456a@', 'SPARC', 0, '', '2020-10-20 08:45:09', '2020-10-20 16:31:17', 22, 22, NULL, 1, 1),
(41, 'namlb', 'admins', '1234567', 'sparcLab@email.comdd', '123456a@', 'SPARC', 0, '', '2020-10-20 16:31:22', '2020-10-20 16:31:55', 22, 22, NULL, 1, 1),
(42, 'registerbycomputer', 'admins', '1234567', 'sparcLab@email.comdd', 'default', 'SPARC', 0, '', '2020-08-09 00:21:05', '2020-10-20 16:34:49', 19, 22, NULL, 1, 1),
(43, 'admin', 'Admin', '12345678', 'sparcLab@email.com', 'SPARCLab', 'SPARC', 0, 'img/avatar.jpg', '2020-12-26 12:21:41', '2020-12-26 12:21:41', 43, 43, 'SPARC', 1, 0),
(44, 'LeDuyNhat', 'admins', '1234567', 'nhat.cobb@gmail.com', 'leduynhat', 'SPARC', 0, '', '2021-01-31 17:21:45', '2021-01-31 17:21:45', 44, 43, '', 1, 0),
(45, '', 'admins', '1234567', 'sparcLab@email.comdd', 'leduynhat', 'SPARC', 0, '', '2020-10-20 19:29:18', '2020-10-20 19:30:35', 43, 44, NULL, 1, 1),
(46, 'hoangvannguyen', 'admins', '1234567', 'sparcLab@email.com', 'airsense', 'SPARC', 0, '', '2020-12-26 12:21:12', '2020-12-26 12:21:12', 44, 43, '', 1, 0),
(47, 'hoangvannguyen', 'admins', '1234567', 'sparcLab@email.comdd', 'airsense', 'SPARC', 0, '', '2020-11-04 10:18:17', '2020-11-04 10:18:57', 44, 44, NULL, 3, 1),
(48, 'admin', 'admins', '1234567', 'sparcLab@email.comdd', 'SPARCLab', 'SPARC', 0, '', '2020-10-20 16:51:19', '2020-11-19 17:43:51', 22, 43, NULL, 1, 1),
(49, 'admin', 'admins', '1234567', 'sparcLab@email.comdd', 'SPARCLab', 'SPARC', 0, '', '2020-11-19 17:43:51', '2020-11-19 17:44:02', 22, 43, NULL, 1, 1),
(50, '', 'admins', '1234567', 'sparcLab@email.comdd', '', 'SPARC', 0, '', '2020-12-04 12:32:25', '2020-12-04 12:32:31', 43, 43, '', 1, 1),
(51, 'hoangvannguyen', 'admins', '1234567', 'sparcLab@email.comdd', 'airsense', 'SPARC', 0, '', '2020-11-04 10:18:57', '2020-12-26 12:21:12', 44, 43, NULL, 1, 1),
(52, 'LeDuyNhat', 'admins', '1234567', 'sparcLab@email.comdd', 'leduynhat', 'SPARC', 0, '', '2020-10-20 19:30:35', '2020-12-26 12:21:18', 43, 43, NULL, 1, 1),
(53, 'namlb', 'admins', '1234567', 'sparcLab@email.comdd', '123456a@', 'SPARC', 0, '', '2020-10-20 16:31:55', '2020-12-26 12:21:24', 22, 43, NULL, 1, 1),
(54, 'admin', 'admins', '1234567', 'sparcLab@email.comjj', 'SPARCLab', 'SPARC', 0, 'img/avatar.jpg', '2020-11-19 17:44:02', '2020-12-26 12:21:41', 43, 43, NULL, 1, 1),
(56, 'inest1', 'inest', '000000000', 'inest1', 'inest1', '', 0, '', '2021-01-21 15:54:09', '2021-01-26 16:22:50', 43, 43, '', 3, 1),
(57, 'inest1', 'inest', '000000000', '', 'hello', '', 0, '', '2021-01-21 15:52:22', '2021-01-21 15:53:16', 43, 43, NULL, 3, 1),
(58, 'inest1', 'inest', '000000000', 'inest1', 'hello', '', 0, '', '2021-01-21 15:53:16', '2021-01-21 15:54:09', 43, 43, NULL, 3, 1),
(59, 'inest', 'inest', '123456', 'inest@gmail.com', '123456a@', '', 0, '', '2021-01-22 21:42:06', '2021-01-22 21:42:06', 43, 43, 'supporter', 3, 0),
(60, 'LeDuyNhat', 'admins', '1234567', 'sparcLab@email.com', 'leduynhat', 'SPARC', 0, '', '2020-12-26 12:21:18', '2021-01-31 17:21:45', 44, 43, NULL, 1, 1),
(61, 'KU', 'Giang Nguyen Vu', '0912268733', 'giangnv@gmail.com', 'airsense', '18 Hoàng Quốc Việt, Cầu Giấy', 0, '', '2021-02-08 12:37:44', '2021-02-08 12:37:44', 43, 43, '', 3, 0),
(62, 'nguyenthican', 'Nguyễn Thị Cần', '012312938', 'nguyenthican@airsense.vn', '123123', '', 0, '', '2021-02-16 11:28:24', '2021-02-16 11:28:24', 43, 43, '', 1, 0);

-- --------------------------------------------------------

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `oauthen2`
--
ALTER TABLE `oauthen2`
  ADD PRIMARY KEY (`id`);


--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `oauthen2`
--
ALTER TABLE `oauthen2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;


--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;


