-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2023 at 01:22 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `food_id` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(11, '2014_10_12_000000_create_users_table', 1),
(12, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(13, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(14, '2019_08_19_000000_create_failed_jobs_table', 1),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(16, '2023_04_08_232804_create_sessions_table', 1),
(17, '2023_04_09_091132_create_food_table', 1),
(18, '2023_04_09_135219_create_carts_table', 1),
(19, '2023_06_06_235900_create_products_table', 1),
(20, '2023_06_11_090737_pesanans', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'secret', 'f6d8577bbfa0a4a01aa43152f8a103a7dbb404b79b4b3e2976bd7dfbb424546a', '[\"*\"]', NULL, NULL, '2023-06-11 02:36:21', '2023-06-11 02:36:21'),
(2, 'App\\Models\\User', 1, 'secret', '59b6f779edd40d0591eb31eb099853dcf42dfc1d13e217a8afad6d0465ef0251', '[\"*\"]', NULL, NULL, '2023-06-11 02:36:42', '2023-06-11 02:36:42'),
(3, 'App\\Models\\User', 1, 'secret', 'b040d817fcde3d83d242040bf00bb4627e062df9055d9923a4b76049b2fefb51', '[\"*\"]', NULL, NULL, '2023-06-11 02:40:02', '2023-06-11 02:40:02'),
(4, 'App\\Models\\User', 1, 'secret', '3ccb266a32d7db35574af5e752dfda538f4ad2b6316483bbeb658fe6b93829a0', '[\"*\"]', NULL, NULL, '2023-06-11 02:41:47', '2023-06-11 02:41:47'),
(5, 'App\\Models\\User', 1, 'secret', '74c28b87bd9859035850f6e033e013e2d1e4ada1e8ec30c2beff9df4bc728e41', '[\"*\"]', NULL, NULL, '2023-06-11 02:42:57', '2023-06-11 02:42:57'),
(6, 'App\\Models\\User', 1, 'secret', 'a414634353e0e903870642a5db97a18784a668fda09b63ea8b5a940a3854e99e', '[\"*\"]', NULL, NULL, '2023-06-11 02:46:17', '2023-06-11 02:46:17'),
(7, 'App\\Models\\User', 1, 'secret', '32519dbc1c908dbbe1f52e195e1e9e932933476f4a0765cfe0a06422198d91d4', '[\"*\"]', NULL, NULL, '2023-06-11 02:49:58', '2023-06-11 02:49:58'),
(8, 'App\\Models\\User', 2, 'secret', 'b314985d2c9b72c7a6e4433777df836c41f75a00086a32b6c4a0bfed5de6bf0f', '[\"*\"]', NULL, NULL, '2023-06-11 06:42:09', '2023-06-11 06:42:09'),
(9, 'App\\Models\\User', 2, 'secret', 'e8b1ca41e575ad14110f5cc15807cecc3f09554ade35931b09721141b47f3263', '[\"*\"]', NULL, NULL, '2023-06-11 06:42:47', '2023-06-11 06:42:47'),
(10, 'App\\Models\\User', 3, 'secret', '18d94ccafd685754edb2eea080304bf8d6ae94c3c404a8b4876abb8d11a8d096', '[\"*\"]', NULL, NULL, '2023-06-11 08:51:53', '2023-06-11 08:51:53'),
(11, 'App\\Models\\User', 3, 'secret', '14ecc2a93d6713736f0c6c4bf7c491b21651237ad6df5756aa0c52ab1a731dbf', '[\"*\"]', NULL, NULL, '2023-06-11 09:02:00', '2023-06-11 09:02:00'),
(12, 'App\\Models\\User', 2, 'secret', 'edbed677f5bb6f7ca84f456a8f8d0832e2516d161b450e8acc3394b176bae761', '[\"*\"]', NULL, NULL, '2023-06-11 09:02:30', '2023-06-11 09:02:30'),
(13, 'App\\Models\\User', 3, 'secret', 'a1bf3ea53e74a4e6effcaf8412dcf55665183ed8f7f46389f7fd07a670edd8d9', '[\"*\"]', NULL, NULL, '2023-06-11 09:16:39', '2023-06-11 09:16:39'),
(14, 'App\\Models\\User', 3, 'secret', '8242909bbbc80d23f1b9f60269413e119eb0d20d2b6df652e9ef60ca6e7a9d3b', '[\"*\"]', NULL, NULL, '2023-06-11 09:17:05', '2023-06-11 09:17:05'),
(15, 'App\\Models\\User', 3, 'secret', '361b389d6912f92d20c3484699a5dcffa5fd0667a30f59a71f9a1db234c451c1', '[\"*\"]', NULL, NULL, '2023-06-11 09:19:59', '2023-06-11 09:19:59'),
(16, 'App\\Models\\User', 3, 'secret', 'af6af2ce644f951b693c7e5000dc3a2830fedb04d2c21f4e8678dc3cd8463c20', '[\"*\"]', NULL, NULL, '2023-06-11 09:23:15', '2023-06-11 09:23:15'),
(17, 'App\\Models\\User', 3, 'secret', '83cfd002b1aae1b0626107a45547b376545de8a7c5577c0b3c81078c49083924', '[\"*\"]', NULL, NULL, '2023-06-11 09:26:12', '2023-06-11 09:26:12'),
(18, 'App\\Models\\User', 3, 'secret', '7561026d42575807c532746bf7d4b6adf1cb8b30e050d90fc8fa8566ec296a6d', '[\"*\"]', NULL, NULL, '2023-06-11 09:41:15', '2023-06-11 09:41:15'),
(19, 'App\\Models\\User', 3, 'secret', '51e074e280b6c3d9c55c4955ead549be173939b8c92c1742428297b3c649f0a2', '[\"*\"]', NULL, NULL, '2023-06-11 09:50:01', '2023-06-11 09:50:01'),
(20, 'App\\Models\\User', 3, 'secret', '24c3535bd3ee0ea2942139fd8da05af220b354428ce20319773bcaf93d0bb625', '[\"*\"]', NULL, NULL, '2023-06-11 09:50:55', '2023-06-11 09:50:55'),
(21, 'App\\Models\\User', 3, 'secret', '0e6f616b71132356c99064a66fdc7eb9c43bd33e8be7ddb472028aff55967816', '[\"*\"]', NULL, NULL, '2023-06-11 20:17:03', '2023-06-11 20:17:03'),
(22, 'App\\Models\\User', 3, 'secret', '14119eab24d358b3d975e7537703c76d8ca79ce6d233d57b9eedc3876c9dee0d', '[\"*\"]', NULL, NULL, '2023-06-11 20:19:30', '2023-06-11 20:19:30'),
(23, 'App\\Models\\User', 3, 'secret', 'e5c5c365b4e396f5b76bebd7dd8795770c49da696569c098e1c5aa38b38bbfad', '[\"*\"]', NULL, NULL, '2023-06-11 20:25:00', '2023-06-11 20:25:00'),
(24, 'App\\Models\\User', 3, 'secret', 'f42836fd3a0e24d9c1af33431f0d3e44ea0143d8edfde015a5fcb1b7e00cef71', '[\"*\"]', NULL, NULL, '2023-06-11 20:26:13', '2023-06-11 20:26:13'),
(25, 'App\\Models\\User', 3, 'secret', '3f3c0257e37eae012a8d671779b262272c990dac24f80c1c94c3a5e1a529309e', '[\"*\"]', NULL, NULL, '2023-06-11 20:26:43', '2023-06-11 20:26:43'),
(26, 'App\\Models\\User', 3, 'secret', 'c085d0f1e7d34cbf449a44174a023d7504132d37eedb82ffdebbe7ea89770533', '[\"*\"]', NULL, NULL, '2023-06-11 20:27:28', '2023-06-11 20:27:28'),
(27, 'App\\Models\\User', 3, 'secret', '9bfa4f2da6cea0727d777e90b69e8d4964c1d29396de76132c7a8d2d4bcc690e', '[\"*\"]', NULL, NULL, '2023-06-11 20:28:02', '2023-06-11 20:28:02'),
(28, 'App\\Models\\User', 3, 'secret', 'b9c4820a109d3be13adc01f318d6ad7105819b2b4077d92c63b6f51a28c44a0f', '[\"*\"]', NULL, NULL, '2023-06-11 20:28:30', '2023-06-11 20:28:30'),
(29, 'App\\Models\\User', 3, 'secret', '809e57362508af5cd7c4fcd799e832b5286f5dc14bea3b44a3d88df5c0160a59', '[\"*\"]', NULL, NULL, '2023-06-11 20:29:11', '2023-06-11 20:29:11'),
(30, 'App\\Models\\User', 3, 'secret', '0cebecb2cec2c508879e13fe5a9c1d8b51d0dea4fcc12bc3aa8fec95dd80a919', '[\"*\"]', NULL, NULL, '2023-06-11 20:31:16', '2023-06-11 20:31:16'),
(31, 'App\\Models\\User', 3, 'secret', 'bd725247a27619dc6b1cff58cd20cf01cb30a6b4e5df827cf275be49fdf34359', '[\"*\"]', NULL, NULL, '2023-06-11 20:32:18', '2023-06-11 20:32:18'),
(32, 'App\\Models\\User', 3, 'secret', '2ec9b136715608bb0b91b44d94644791f4fb531d8245b30fff3035e8ef9c9682', '[\"*\"]', NULL, NULL, '2023-06-11 20:33:07', '2023-06-11 20:33:07'),
(33, 'App\\Models\\User', 3, 'secret', '11abfb55a4273b2784e0349b7a2b3c3ffe0c74a6dacbd747ad168682d6014303', '[\"*\"]', NULL, NULL, '2023-06-11 20:33:25', '2023-06-11 20:33:25'),
(34, 'App\\Models\\User', 3, 'secret', '62b41d75d3f7a95410755396be30fdaee4b6187b7948edf1e007cd9c161788fa', '[\"*\"]', NULL, NULL, '2023-06-11 20:36:34', '2023-06-11 20:36:34'),
(35, 'App\\Models\\User', 3, 'secret', '353966c09b538f7615a2e163fa4f2a219111d30376c40839e9c6a4fc6457bfb7', '[\"*\"]', NULL, NULL, '2023-06-11 20:37:01', '2023-06-11 20:37:01'),
(36, 'App\\Models\\User', 3, 'secret', 'dd957c57557f55092abc744847fc8b9b567f5ff49c7d02619d3a1bd25349f738', '[\"*\"]', NULL, NULL, '2023-06-11 20:38:16', '2023-06-11 20:38:16'),
(37, 'App\\Models\\User', 3, 'secret', 'f5cd7ecc87b9acf9d16b9281d060e3e0a12c5095740fc22c8aea8685a7b5e5e1', '[\"*\"]', NULL, NULL, '2023-06-11 21:45:10', '2023-06-11 21:45:10'),
(38, 'App\\Models\\User', 3, 'secret', 'f5d5426e0006a3f30c3a2cb806c29c27fc66b4aba53057d71b3af56527d8b362', '[\"*\"]', NULL, NULL, '2023-06-11 22:18:30', '2023-06-11 22:18:30'),
(39, 'App\\Models\\User', 3, 'secret', 'fa22b4de6d8f89774e335a017326709ff6d2d13288fafb6c486524f6c3c785cd', '[\"*\"]', NULL, NULL, '2023-06-12 03:34:06', '2023-06-12 03:34:06'),
(40, 'App\\Models\\User', 3, 'secret', '4652a8acbc55453d94a9aff0402572df2adbbedf36c26a6f4b2c65e43fa80f8c', '[\"*\"]', NULL, NULL, '2023-06-12 03:35:15', '2023-06-12 03:35:15'),
(41, 'App\\Models\\User', 3, 'secret', '6c7afa3117d6c0502978a9219c0d375999ca49570848bb0f6ec3fa7110af9216', '[\"*\"]', NULL, NULL, '2023-06-12 03:36:10', '2023-06-12 03:36:10'),
(42, 'App\\Models\\User', 3, 'secret', '9f3925b457bb7919bddd6268aeaf60b1412c27b0f58a8a04b2e87dd893d463e8', '[\"*\"]', NULL, NULL, '2023-06-12 03:36:29', '2023-06-12 03:36:29'),
(43, 'App\\Models\\User', 3, 'secret', '01eb91ef7d7b174f7635d862702cd72c50e645ec348f5da7bc5b1a6916d159d6', '[\"*\"]', NULL, NULL, '2023-06-12 03:37:15', '2023-06-12 03:37:15'),
(44, 'App\\Models\\User', 3, 'secret', '86d38be4852b9b3e78794b5571651619a0830202a10ce4690758eb8d094fe41c', '[\"*\"]', NULL, NULL, '2023-06-12 03:39:47', '2023-06-12 03:39:47'),
(45, 'App\\Models\\User', 3, 'secret', 'a070fcc3512eeda0d1e4fb1264471f2608cc4c2872c4c257af5e2697779338d0', '[\"*\"]', NULL, NULL, '2023-06-12 03:42:17', '2023-06-12 03:42:17'),
(46, 'App\\Models\\User', 3, 'secret', '21d50365abea9bfd3379bd0dd0ed82edba743df70660399847d9c2b28cd49e97', '[\"*\"]', NULL, NULL, '2023-06-12 03:44:26', '2023-06-12 03:44:26'),
(47, 'App\\Models\\User', 3, 'secret', '243a9b91501d485b878f0f3690526ab988dca094d7ce5ed3a79485477ab7b073', '[\"*\"]', NULL, NULL, '2023-06-12 03:48:39', '2023-06-12 03:48:39'),
(48, 'App\\Models\\User', 3, 'secret', 'a25cffe2544a4d1478a089164ba7cb268be621de872a15f30b3ae5f8f749e78b', '[\"*\"]', NULL, NULL, '2023-06-12 03:53:28', '2023-06-12 03:53:28'),
(49, 'App\\Models\\User', 3, 'secret', 'f6f3db22b65cb30e31754599d8fcf9b1856a0c513d0a3a888b86db7d59240bd8', '[\"*\"]', NULL, NULL, '2023-06-12 04:00:54', '2023-06-12 04:00:54'),
(50, 'App\\Models\\User', 3, 'secret', '747afca9ec87e7ee0668ae19aa7d1192f5aecdaf1f77d70839f80bf6ba03ec15', '[\"*\"]', NULL, NULL, '2023-06-12 04:03:01', '2023-06-12 04:03:01'),
(51, 'App\\Models\\User', 3, 'secret', 'dfb74e42bd40f00f9eeb346e567de30c4c9a50c55a0d9bd378cbb096a0a36055', '[\"*\"]', NULL, NULL, '2023-06-12 04:13:35', '2023-06-12 04:13:35'),
(52, 'App\\Models\\User', 3, 'secret', 'f657dc2f54eacdd0e3ab787c84380884132b1a942a3a6d2bda4ee598cf70112e', '[\"*\"]', NULL, NULL, '2023-06-12 04:15:07', '2023-06-12 04:15:07'),
(53, 'App\\Models\\User', 3, 'secret', 'c02a48bb1bc6a39cd93b1f33e99f101d7a6c746a7260b40289ae6c61ed5587fe', '[\"*\"]', NULL, NULL, '2023-06-12 04:16:37', '2023-06-12 04:16:37');

-- --------------------------------------------------------

--
-- Table structure for table `pesanans`
--

CREATE TABLE `pesanans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `jumlah_harga` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pesanans`
--

INSERT INTO `pesanans` (`id`, `user_id`, `product_id`, `tanggal`, `status`, `jumlah`, `jumlah_harga`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-06-11', '0', 0, 0, NULL, NULL),
(2, 1, 5, '2023-06-09', '0', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `type`, `image`, `text`, `created_at`, `updated_at`) VALUES
(1, 'Nasi Ayam Bakar', '25000', 1, 'https://images.unsplash.com/photo-1666239308046-ead0314ee0fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 'Nasi pake Ayam Bakar', '2023-06-02 03:21:11', NULL),
(2, 'Nasi Sosis Bakar', '20000', 1, 'https://images.unsplash.com/photo-1645696301019-35adcc18fc21?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1329&q=80', 'Nasi pake Sosis Bakar', '2023-06-02 17:00:00', NULL),
(3, 'Nasi Goreng', '25000', 1, 'https://images.unsplash.com/photo-1645696329525-8ec3bee460a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1329&q=80', 'Nasi digoreng', '2023-06-03 17:00:00', NULL),
(4, 'Mie Goreng Iblis', '17000', 2, 'https://images.unsplash.com/photo-1645696329525-8ec3bee460a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1329&q=80', 'Bagi para pejantan', '2023-06-04 17:00:00', NULL),
(5, 'Mie Bikin Laper', '18000', 2, 'https://images.unsplash.com/photo-1612927601601-6638404737ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80', 'Awas ketagihan', '2023-06-05 17:00:00', NULL),
(6, 'Sate 25 Tusuk', '30000', 3, 'https://images.unsplash.com/photo-1620088694138-0475bc8fef83?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80', 'Paket mukbang', '2023-06-06 17:00:00', NULL),
(7, 'Iced Tea', '15000', 4, 'https://images.unsplash.com/photo-1499638673689-79a0b5115d87?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80', 'Es teh doang ini mah', '2023-06-07 17:00:00', NULL),
(8, 'Lime Water', '12000', 4, 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80', 'Ga tau enak apa kaga', '2023-06-08 17:00:00', NULL),
(9, 'Ham Burger ', '18000', 5, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=999&q=80', 'Bikin perut keroncongan', '2023-06-09 17:00:00', NULL),
(10, 'Beef Burger', '20000', 5, 'https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1472&q=80', 'Asli ini mah laper jadinya', '2023-06-10 17:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `usertype`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'user', 'user@gmail.com', '0', NULL, '$2y$10$GOM0MAP2CD2Jus6ujtcFWu9jw8ANhTEsHkuZPKyhLy279yVePtUm.', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 02:36:21', '2023-06-11 02:36:21'),
(2, 'Reza Donsika', 'rezaaja@gmail.com', '0', NULL, '$2y$10$SP8URocP403TVFOPk4Kwl.lbp7OBS53oI.VYskpdJabSOnT3oaZly', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 06:42:09', '2023-06-11 06:42:09'),
(3, 'Reza Putra', 'tes123@gmail.com', '0', NULL, '$2y$10$WRfbHEwwaQdOJxTtcQ8T3ewOQT5wfSmKQ63FtOrlxzsL9N9s6Ua9e', NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-11 08:51:53', '2023-06-11 08:51:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pesanans`
--
ALTER TABLE `pesanans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `pesanans`
--
ALTER TABLE `pesanans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
