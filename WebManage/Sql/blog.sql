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
(1, 'Blog', 'Blog', '2021-06-15 00:00:00', '2021-06-10 00:00:00', 0, 0, 0, 0),
(2, 'Đào tạo', 'Đào tạo', '2021-06-15 00:00:00', '2021-06-10 00:00:00', 0, 0, 0, 0);

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
(1, 'STEM', 1, 'STEM', '2021-10-20 00:00:00', '2021-10-20 00:00:00', 0, 0, 0, 0),
(2, 'Environment', 1, 'Môi trường', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(3, 'Climate', 1, 'Khí hậu', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(11, 'News', 2, 'Tin tức', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0),
(12, 'Documentary', 2, 'Tài liệu', '2021-06-16 00:00:00', '2021-06-16 00:00:00', 0, 0, 0, 0);


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
-- Chỉ mục cho bảng `pages_content`
--
ALTER TABLE `pages_content`
  ADD PRIMARY KEY (`pages_content_id`);



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
-- AUTO_INCREMENT cho bảng `pages_content`
--
ALTER TABLE `pages_content`
  MODIFY `pages_content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=527;



