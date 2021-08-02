-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th8 02, 2021 lúc 08:06 PM
-- Phiên bản máy phục vụ: 10.3.30-MariaDB-0ubuntu0.20.04.1
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nxnsystem`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_g_new_lines` (IN `state` INT(20), IN `g_id` INT(20))  NO SQL
SELECT a.* from (SELECT *,ROW_NUMBER() OVER(ORDER BY `id`) as RowNum FROM `g_chat_lines` WHERE `g_chat_id` = g_id) as a WHERE a.RowNum > state$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_new_lines` (IN `state` INT(20), IN `rel_id` INT(20))  SELECT a.* from (SELECT *,ROW_NUMBER() OVER(ORDER BY `id`) as RowNum FROM `p_chats` WHERE `relationship_id` = rel_id) as a WHERE a.RowNum > state$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `g_chats`
--

CREATE TABLE `g_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(20) UNSIGNED NOT NULL,
  `g_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `g_image` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/resources/default_avatar.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `g_chats`
--

INSERT INTO `g_chats` (`id`, `user_id`, `g_name`, `g_image`, `created_at`, `updated_at`) VALUES
(8, 14, 'Noxus', 'images/resources/default_avatar.png', '2021-07-10 04:12:38', '2021-07-10 04:12:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `g_chat_lines`
--

CREATE TABLE `g_chat_lines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `g_chat_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `g_chat_lines`
--

INSERT INTO `g_chat_lines` (`id`, `user_id`, `g_chat_id`, `text`, `image`, `created_at`, `updated_at`) VALUES
(52, 15, 8, 'alo\r\n', NULL, '2021-07-10 04:48:37', '2021-07-10 04:48:37'),
(53, 15, 8, 'alo\r\n', NULL, '2021-07-10 04:52:14', '2021-07-10 04:52:14'),
(54, 16, 8, 'alo\r\n', NULL, '2021-07-10 04:52:41', '2021-07-10 04:52:41'),
(55, 15, 8, 'alo\r\n', NULL, '2021-07-10 04:54:06', '2021-07-10 04:54:06'),
(56, 16, 8, 'alo\r\n', NULL, '2021-07-10 04:54:17', '2021-07-10 04:54:17'),
(57, 16, 8, ' alo\r\n', NULL, '2021-07-10 04:54:35', '2021-07-10 04:54:35'),
(58, 15, 8, ' gi do\r\n', NULL, '2021-07-10 04:54:40', '2021-07-10 04:54:40'),
(59, 14, 8, 'hi m.n\r\n', NULL, '2021-07-10 05:23:03', '2021-07-10 05:23:03'),
(60, 16, 8, 'hiiii\r\n', NULL, '2021-07-10 05:23:22', '2021-07-10 05:23:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `g_chat_user`
--

CREATE TABLE `g_chat_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `g_chat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `g_chat_user`
--

INSERT INTO `g_chat_user` (`id`, `user_id`, `g_chat_id`, `created_at`, `updated_at`) VALUES
(7, 14, 8, '2021-07-10 04:12:38', '2021-07-10 04:12:38'),
(8, 15, 8, '2021-07-10 04:12:59', '2021-07-10 04:12:59'),
(9, 16, 8, '2021-07-10 04:12:59', '2021-07-10 04:12:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(26, '2021_06_28_160451_create_post_pics_table', 1),
(28, '2021_06_29_102752_add_root_folder_to_users_table', 2),
(86, '2014_10_12_000000_create_users_table', 3),
(87, '2014_10_12_100000_create_password_resets_table', 3),
(88, '2019_08_19_000000_create_failed_jobs_table', 3),
(89, '2021_05_27_014836_create_user_info_table', 3),
(90, '2021_06_28_151735_create_posts_table', 3),
(91, '2021_07_01_095656_create_requests_table', 3),
(92, '2021_07_01_100345_create_relationships_table', 3),
(93, '2021_07_02_172110_create_p_chats_table', 3),
(94, '2021_07_08_083920_create_g_chats_table', 3),
(95, '2021_07_08_084649_create_user_gchats_table', 3),
(96, '2021_07_08_153045_create_g_chat_lines_table', 4),
(97, '2021_07_09_160000_create_post_comments_table', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_image` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_like` int(11) NOT NULL DEFAULT 0,
  `post_dislike` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `post_content`, `post_image`, `post_like`, `post_dislike`, `created_at`, `updated_at`) VALUES
(14, 16, 'This is my skin!', 'user16-1625885837/post/post-1625886178dariusSplash-720x405.jpg', 0, 0, '2021-07-10 03:03:01', '2021-07-10 03:03:01'),
(15, 15, 'Haizzz', 'user15-1625885693/post/post-1625886291yonePost.jpeg', 3, 0, '2021-07-10 03:04:53', '2021-07-10 04:57:31'),
(16, 14, 'hi evryone', 'user14-1625885084/post/post-1625888231jhonwick.jpeg', 2, 0, '2021-07-10 03:37:13', '2021-07-10 04:57:32'),
(17, 15, '<a href=\"https://www.youtube.com/watch?v=tbgLfI1dvOg&ab_channel=Nguy%E1%BB%85nH%C6%B0%C6%A1ngLyOfficial\" target=\"_blank\">https://www.youtube.com/watch?v=tbgLfI1dvOg&ab_channel=Nguy%E1%BB%85nH%C6%B0%C6%A1ngLyOfficial</a>', 'user15-1625885693/post/post-1625893941huongly.jpeg', 7, 0, '2021-07-10 05:12:22', '2021-07-10 05:22:39'),
(18, 15, '', 'user15-1625885693/post/post-1625893966huongly.jpg', 3, 0, '2021-07-10 05:12:48', '2021-07-10 05:22:35'),
(19, 16, 'Enemy!!', 'user16-1625885837/post/post-1625894082Viego_0.jpg', 5, 0, '2021-07-10 05:14:51', '2021-07-10 05:22:27'),
(20, 14, 'beaty', 'user14-1625885084/post/post-1625894443kamikochi-1920x1080-mountains-japan-river-blue-sky-4k-23423.jpg', 4, 0, '2021-07-10 05:20:54', '2021-07-10 05:21:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `text`, `image`, `created_at`, `updated_at`) VALUES
(47, 15, 16, 'handsom boy!\r\n', NULL, '2021-07-10 04:57:42', '2021-07-10 04:57:42'),
(48, 14, 19, 'wao\r\n', NULL, '2021-07-10 05:22:30', '2021-07-10 05:22:30'),
(49, 14, 17, 'hihihi\r\n', NULL, '2021-07-10 05:22:43', '2021-07-10 05:22:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `p_chats`
--

CREATE TABLE `p_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `relationship_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `text` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` char(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `p_chats`
--

INSERT INTO `p_chats` (`id`, `relationship_id`, `user_id`, `text`, `image`, `created_at`, `updated_at`) VALUES
(4, 5, 14, 'hi\r\n', NULL, '2021-07-10 03:38:21', '2021-07-10 03:38:21'),
(5, 5, 15, 'gi do em trai\r\n', NULL, '2021-07-10 04:57:53', '2021-07-10 04:57:53'),
(6, 7, 14, 'alo\r\n', NULL, '2021-07-10 05:22:03', '2021-07-10 05:22:03'),
(7, 7, 16, 'gi do\r\n', NULL, '2021-07-10 05:22:17', '2021-07-10 05:22:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `relationships`
--

CREATE TABLE `relationships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user1` bigint(20) UNSIGNED NOT NULL,
  `user2` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `relationships`
--

INSERT INTO `relationships` (`id`, `user1`, `user2`, `status`, `created_at`, `updated_at`) VALUES
(7, 14, 16, 1, '2021-07-10 05:21:44', '2021-07-10 05:21:44'),
(8, 14, 15, 1, '2021-07-10 05:21:50', '2021-07-10 05:21:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `requests`
--

CREATE TABLE `requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `requests`
--

INSERT INTO `requests` (`id`, `receiver_id`, `sender_id`, `created_at`, `updated_at`) VALUES
(10, 15, 14, '2021-07-10 05:21:20', '2021-07-10 05:21:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `root_folder` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `root_folder`, `remember_token`, `created_at`, `updated_at`) VALUES
(14, 'Nguyễn Xuân Nghĩa', 'nguyengia.nxn@gmail.com', '2021-07-10 02:45:06', '$2y$10$ofznx76B045l4YV9EoYLXuDDjAMjjoxa5WNOsR/Q2bvgCgiQ6AyU.', 'user14-1625885084', '6xXqeovBVIqy1T3JWBXjs2dsdxtf4OyyA4dkMgQi1iAd36T1ei78w6mLl6al', '2021-07-10 02:44:39', '2021-07-10 02:46:26'),
(15, 'Yone', 'xuannghia.project@gmail.com', NULL, '$2y$10$XujXJv/RWtYJsuZ12TaIRe7Hq/hFazcjvUNwaKcOBnfCRV.rMQUhK', 'user15-1625885693', NULL, '2021-07-10 02:54:53', '2021-07-10 02:54:53'),
(16, 'Darius', 'yasuo2000@gmail.com', NULL, '$2y$10$4roFVxIn1cFj6OtAjCbcfOFMNZ6JXmiiINk.IKcfRQnHrYWp7RpWq', 'user16-1625885837', NULL, '2021-07-10 02:57:17', '2021-07-10 02:58:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info`
--

CREATE TABLE `user_info` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `Gender` char(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Birthday_Date` timestamp NULL DEFAULT NULL,
  `job` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hometown` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` char(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Country` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `About` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Hobbies` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Education` char(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Avatar_pic` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/resources/default_avatar.png',
  `Cover_pic` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'images/resources/default_cover_pic.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_info`
--

INSERT INTO `user_info` (`id`, `user_id`, `Gender`, `Birthday_Date`, `job`, `hometown`, `phone_number`, `Country`, `About`, `Hobbies`, `Education`, `Avatar_pic`, `Cover_pic`, `created_at`, `updated_at`) VALUES
(10, 14, 'Male', NULL, NULL, NULL, NULL, 'USA', NULL, NULL, NULL, 'images/uploads/user14-1625885084/avatar-admin.jpg', 'images/uploads/user14-1625885084/cover-s-t-a-l-k-e-r-2-1920x1080-screenshot-4k-22742.jpg', '2021-07-10 02:44:44', '2021-07-10 05:21:09'),
(11, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'images/resources/default_avatar.png', 'images/resources/default_cover_pic.png', '2021-07-10 02:54:53', '2021-07-10 02:54:53'),
(12, 16, NULL, NULL, NULL, NULL, NULL, 'USA', NULL, NULL, NULL, 'images/uploads/user16-1625885837/avatar-3500.jpg', 'images/resources/default_cover_pic.png', '2021-07-10 02:57:17', '2021-07-10 02:58:36');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `g_chats`
--
ALTER TABLE `g_chats`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `g_chat_lines`
--
ALTER TABLE `g_chat_lines`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `g_chat_user`
--
ALTER TABLE `g_chat_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_gchats_user_id_foreign` (`user_id`),
  ADD KEY `user_gchats_g_id_foreign` (`g_chat_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `p_chats`
--
ALTER TABLE `p_chats`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `relationships`
--
ALTER TABLE `relationships`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `g_chats`
--
ALTER TABLE `g_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `g_chat_lines`
--
ALTER TABLE `g_chat_lines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `g_chat_user`
--
ALTER TABLE `g_chat_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `p_chats`
--
ALTER TABLE `p_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `relationships`
--
ALTER TABLE `relationships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `requests`
--
ALTER TABLE `requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `g_chat_user`
--
ALTER TABLE `g_chat_user`
  ADD CONSTRAINT `user_gchats_g_id_foreign` FOREIGN KEY (`g_chat_id`) REFERENCES `g_chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_gchats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
