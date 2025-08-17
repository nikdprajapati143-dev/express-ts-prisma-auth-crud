-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 14, 2025 at 11:55 AM
-- Server version: 9.1.0
-- PHP Version: 8.2.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nodecrudwithts`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `imageUrl` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `createdBy` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_createdBy_fkey` (`createdBy`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `quantity`, `imageUrl`, `createdAt`, `updatedAt`, `createdBy`) VALUES
(2, 'Camero', 100, 1, NULL, '2025-08-14 04:47:51.759', '2025-08-14 04:47:51.759', NULL),
(3, '', 0, 1, NULL, '2025-08-14 07:10:16.122', '2025-08-14 07:10:16.122', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `expiresAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Token_token_key` (`token`),
  KEY `Token_userId_idx` (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token`, `userId`, `createdAt`, `expiresAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTc1NTE0Njg1NCwiZXhwIjoxNzU1MTUwNDU0fQ.wvzJ9ENw97fVQwz0xTcnv1sYtZ4ZGtXV1qbmGnW_PIU', 1, '2025-08-14 04:47:34.925', '2025-08-13 05:47:34.924'),
(2, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTc1NTE1NTQwNSwiZXhwIjoxNzU1MTU5MDA1fQ.K7wxRjXId6Va4Kz9nzP_Tpl0bbrjB01GKCwstAZAwoo', 1, '2025-08-14 07:10:05.777', '2025-08-14 08:10:05.777'),
(3, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTc1NTE2NDE5NSwiZXhwIjoxNzU1MTY3Nzk1fQ.6C4KgVucfVn7QE6WyUC3KNu_-qU4R_dvnlQFue4MWlM', 1, '2025-08-14 09:36:35.771', '2025-08-14 10:36:35.771');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `createdAt`, `updatedAt`, `name`) VALUES
(1, 'brij123@yopmail.com', '$2b$10$RBY3N3cgvO/Nw2ldQEsHiuNIryl505VAfH7WD9NKIWEkPqJ50UIem', '2025-08-13 07:43:16.866', '2025-08-13 07:43:16.866', 'brij');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
CREATE TABLE IF NOT EXISTS `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('ffdfa083-042d-4132-86bb-26c5283de708', '52c326a2f7965586a8acc7d8bf8c8f8c58b96db59780a3d1925e3bc611b6df37', '2025-08-13 05:01:18.725', '20250813050118_init', NULL, NULL, '2025-08-13 05:01:18.699', 1),
('08afd1f9-3ae2-4c37-a78a-353d5fe0e1e4', '06f15ba03b8471695cd510ecf9cdf4e7e824a78c8b452d70b712b8634e4ded67', '2025-08-13 07:35:47.850', '20250813073547_name_field_added', NULL, NULL, '2025-08-13 07:35:47.767', 1),
('e967ca33-1577-4ef6-b07f-c92a3f34b57b', '19a11d8b0e00463f7bc9142c2ffd11591c7565624263c4c31a6be5d02ba3d805', '2025-08-13 08:52:00.757', '20250813085200_add_product', NULL, NULL, '2025-08-13 08:52:00.663', 1),
('91adf939-9d57-4eb2-93e3-083d3564e0ed', '023074a39a4eef70f93319064c4ad4ea859103341fb3ac18fc9b5df77362c20b', '2025-08-13 09:10:05.856', '20250813091005_add_tokens', NULL, NULL, '2025-08-13 09:10:05.704', 1),
('d059d4a4-3b40-4a76-af17-3343c99117c2', '5a426030540051a1a16d7a2dd86c1a6ead2eadc6c17490dbfddd63bb269a0c9e', '2025-08-13 11:25:28.208', '20250813112527_make_image_url_optional', NULL, NULL, '2025-08-13 11:25:27.911', 1),
('924b9ca0-b93b-4ca1-b8c1-5ac84e1451ff', '6c0ad4874ac8aa62b6f7820f6b4148239d213ae5c913afe1641f291f9a712b0f', '2025-08-14 04:31:47.171', '20250814043146_make_token_unique', NULL, NULL, '2025-08-14 04:31:46.898', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
