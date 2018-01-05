-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 05, 2018 at 07:57 AM
-- Server version: 5.7.19
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tnag_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `directions`
--

DROP TABLE IF EXISTS `directions`;
CREATE TABLE IF NOT EXISTS `directions` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `img_url1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_url2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `directions_recipe_id_foreign` (`recipe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_13_091402_create_recipes_table', 1),
(4, '2017_12_13_091403_create_ingredients_table', 1),
(5, '2017_12_13_091404_create_recipe_ingredients_table', 1),
(6, '2017_12_13_091405_create_directions_table', 1),
(7, '2017_12_13_091406_create_types_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE IF NOT EXISTS `recipes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ingredient_count` tinyint(4) NOT NULL,
  `direction_count` tinyint(4) NOT NULL,
  `img_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` tinyint(4) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipes_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `recipe_name`, `ingredient_count`, `direction_count`, `img_url`, `point`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'breakfast 1', 3, 6, 'http://192.168.90.103:8000/images/breakfast1.jpg', 4, 11, '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(2, 'breakfast 2', 1, 1, 'http://192.168.90.103:8000/images/breakfast2.jpg', 1, 18, '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(3, 'breakfast 3', 4, 7, 'http://192.168.90.103:8000/images/breakfast3.jpg', 7, 10, '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(4, 'breakfast 4', 6, 1, 'http://192.168.90.103:8000/images/breakfast4.jpg', 4, 12, '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(5, 'breakfast 5', 7, 1, 'http://192.168.90.103:8000/images/breakfast5.jpg', 8, 10, '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(6, 'breakfast 6', 7, 1, 'http://192.168.90.103:8000/images/breakfast1.jpg', 1, 10, '2017-12-14 02:40:56', '2017-12-14 02:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
CREATE TABLE IF NOT EXISTS `recipe_ingredients` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `ingredient_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `recipe_ingredients_recipe_id_foreign` (`recipe_id`),
  KEY `recipe_ingredients_ingredient_id_foreign` (`ingredient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `recipe_id` int(10) UNSIGNED NOT NULL,
  `type` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `types_recipe_id_foreign` (`recipe_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Joannie Fay', 'vivian06@example.com', '$2y$10$DwQfxQqjmsIv11fozs7/x.hHl/PT8qPsda.rzxHqrK3c9j27uW352', 'Z3N8mNXaf9', '2017-12-14 01:44:34', '2017-12-14 01:44:34'),
(2, 'Katelyn Swaniawski', 'isabell58@example.com', '$2y$10$DwQfxQqjmsIv11fozs7/x.hHl/PT8qPsda.rzxHqrK3c9j27uW352', 'wAIpHKchFU', '2017-12-14 01:44:34', '2017-12-14 01:44:34'),
(3, 'Fatima Powlowski', 'mcdermott.geo@example.org', '$2y$10$DwQfxQqjmsIv11fozs7/x.hHl/PT8qPsda.rzxHqrK3c9j27uW352', 'ckJlWxU1Bk', '2017-12-14 01:44:34', '2017-12-14 01:44:34'),
(4, 'Melyna Smith', 'rachel.goldner@example.com', '$2y$10$DwQfxQqjmsIv11fozs7/x.hHl/PT8qPsda.rzxHqrK3c9j27uW352', 'UA7PcAtEaO', '2017-12-14 01:44:34', '2017-12-14 01:44:34'),
(5, 'Dr. Ferne Corkery II', 'donald.vandervort@example.org', '$2y$10$DwQfxQqjmsIv11fozs7/x.hHl/PT8qPsda.rzxHqrK3c9j27uW352', 'Jdoou6MVnF', '2017-12-14 01:44:34', '2017-12-14 01:44:34'),
(6, 'Florine Stanton', 'fisher.romaine@example.net', '$2y$10$f2TbVSOvfEJWMUvt1qNfHeo2hqK7VU26PTS77bMOJ0ZEZYLb5DW5G', '1kzE7oZhgj', '2017-12-14 01:45:39', '2017-12-14 01:45:39'),
(7, 'Dr. Amani Grant', 'jhoppe@example.com', '$2y$10$f2TbVSOvfEJWMUvt1qNfHeo2hqK7VU26PTS77bMOJ0ZEZYLb5DW5G', 'UpqAkCsdQF', '2017-12-14 01:45:39', '2017-12-14 01:45:39'),
(8, 'Dr. Edgardo O\'Keefe IV', 'carter.stephanie@example.net', '$2y$10$f2TbVSOvfEJWMUvt1qNfHeo2hqK7VU26PTS77bMOJ0ZEZYLb5DW5G', 'IDntNA9gb7', '2017-12-14 01:45:39', '2017-12-14 01:45:39'),
(9, 'Jayce Lakin', 'domenick.mckenzie@example.net', '$2y$10$f2TbVSOvfEJWMUvt1qNfHeo2hqK7VU26PTS77bMOJ0ZEZYLb5DW5G', 'kQYrqWLMVc', '2017-12-14 01:45:39', '2017-12-14 01:45:39'),
(10, 'Demetrius Beer IV', 'diana.rosenbaum@example.com', '$2y$10$f2TbVSOvfEJWMUvt1qNfHeo2hqK7VU26PTS77bMOJ0ZEZYLb5DW5G', 'ZGt6lq4ujM', '2017-12-14 01:45:39', '2017-12-14 01:45:39'),
(11, 'Aubrey Cronin', 'raufderhar@example.com', '$2y$10$pxT5e7iBb.QkpjzpLITJyOpoPdsABwEhChJM7hLVLSMGHK2gd8ha2', 'Gi6xLl6nlB', '2017-12-14 01:46:32', '2017-12-14 01:46:32'),
(12, 'Dr. Logan Haag III', 'vladimir22@example.org', '$2y$10$pxT5e7iBb.QkpjzpLITJyOpoPdsABwEhChJM7hLVLSMGHK2gd8ha2', 'NFOXFiic3t', '2017-12-14 01:46:32', '2017-12-14 01:46:32'),
(13, 'Cortez Jaskolski', 'candida.reichel@example.net', '$2y$10$pxT5e7iBb.QkpjzpLITJyOpoPdsABwEhChJM7hLVLSMGHK2gd8ha2', 'L360CwlwXc', '2017-12-14 01:46:32', '2017-12-14 01:46:32'),
(14, 'Ms. Jude Stamm V', 'denesik.melba@example.org', '$2y$10$pxT5e7iBb.QkpjzpLITJyOpoPdsABwEhChJM7hLVLSMGHK2gd8ha2', 'fME0gYFkpV', '2017-12-14 01:46:32', '2017-12-14 01:46:32'),
(15, 'Ryann Dicki', 'bailee.koelpin@example.org', '$2y$10$pxT5e7iBb.QkpjzpLITJyOpoPdsABwEhChJM7hLVLSMGHK2gd8ha2', 'vkRf2lRsuY', '2017-12-14 01:46:32', '2017-12-14 01:46:32'),
(16, 'Evert Jaskolski', 'cale.damore@example.net', '$2y$10$SJ0igQ0bCao5U/tDGIyTPOY18m2VHx4gFI.M.jUvWzWRoFwzL/Uui', 'DHqpiwOlFi', '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(17, 'Elenora Sauer', 'balistreri.merl@example.com', '$2y$10$SJ0igQ0bCao5U/tDGIyTPOY18m2VHx4gFI.M.jUvWzWRoFwzL/Uui', 'VX8Uclsn8L', '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(18, 'Mikayla Prohaska', 'andre.weber@example.net', '$2y$10$SJ0igQ0bCao5U/tDGIyTPOY18m2VHx4gFI.M.jUvWzWRoFwzL/Uui', '7bga8uUtAk', '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(19, 'Marcelo Williamson', 'lindsey.muller@example.net', '$2y$10$SJ0igQ0bCao5U/tDGIyTPOY18m2VHx4gFI.M.jUvWzWRoFwzL/Uui', 'isfybzxdL8', '2017-12-14 02:40:56', '2017-12-14 02:40:56'),
(20, 'Mr. Earl Rau Sr.', 'breanna.homenick@example.com', '$2y$10$SJ0igQ0bCao5U/tDGIyTPOY18m2VHx4gFI.M.jUvWzWRoFwzL/Uui', 'mSnx6ngiqT', '2017-12-14 02:40:56', '2017-12-14 02:40:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
