-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 09:48 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikum05`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'review menonton sri asih', 'keren pahlawan indonesia', '2022-12-25 00:44:38', '2022-12-25 00:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `namaKoleksi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenisKoleksi` tinyint(4) NOT NULL,
  `jumlahKoleksi` int(11) NOT NULL,
  `jumlahAwal` int(11) NOT NULL,
  `jumlahSisa` int(11) NOT NULL,
  `jumlahKeluar` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `namaKoleksi`, `jenisKoleksi`, `jumlahKoleksi`, `jumlahAwal`, `jumlahSisa`, `jumlahKeluar`, `created_at`, `updated_at`) VALUES
(3, 'Buaya Darat', 1, 10, 10, 10, 0, '2022-12-14 05:00:16', '2022-12-18 09:23:50'),
(4, 'Koleksi Majalah Anjay', 2, 10, 10, 10, 0, '2022-12-20 05:00:40', '2022-12-01 03:46:44'),
(5, 'harry potter', 1, 18, 18, 17, -1, '2022-12-10 05:01:29', '2022-12-01 03:49:18'),
(10, 'Buku Cerita', 1, 10, 10, 10, 0, '2022-12-16 22:05:51', '2022-12-16 22:05:51'),
(11, 'Buku Tidur', 1, 10, 10, 10, 0, '2022-12-16 22:15:37', '2022-12-16 22:15:37'),
(12, 'Si Banteng Anak Nakal', 1, 15, 15, 15, 0, '2022-12-18 09:22:49', '2022-12-18 09:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `detail_transactions`
--

CREATE TABLE `detail_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transactionId` int(11) NOT NULL,
  `collectionId` int(11) NOT NULL,
  `tanggalKembali` date DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `keterangan` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_transactions`
--

INSERT INTO `detail_transactions` (`id`, `transactionId`, `collectionId`, `tanggalKembali`, `status`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2022-12-12', 2, NULL, '2022-12-12 07:12:25', '2022-12-12 07:12:25'),
(2, 2, 7, '2022-12-12', 3, NULL, '2022-12-12 09:00:41', '2022-12-12 09:00:41'),
(3, 2, 5, '2022-12-12', 2, NULL, '2022-12-12 09:00:42', '2022-12-12 09:00:42'),
(4, 3, 4, '2022-12-12', 3, NULL, '2022-12-12 09:11:28', '2022-12-12 09:11:28'),
(5, 3, 4, NULL, 1, NULL, '2022-12-12 09:11:28', '2022-12-12 09:11:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(29, '2014_10_12_000000_create_users_table', 1),
(30, '2014_10_12_100000_create_password_resets_table', 1),
(31, '2019_08_19_000000_create_failed_jobs_table', 1),
(35, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(37, '2022_11_17_162032_delete_collections_table', 3),
(38, '2022_11_17_162239_delete_collection_table', 4),
(39, '2022_11_17_162332_delete_collection_table', 5),
(40, '2022_11_17_162421_delete_collections_table', 6),
(43, '2022_11_26_051736_update_collection_tables', 8),
(44, '2022_11_26_052556_update_collections_table', 9),
(46, '2022_11_26_062845_insert_collections_table', 11),
(47, '2022_11_16_075857_create_collection_tables', 12),
(48, '2022_12_01_091125_edit_collections_tables', 13),
(49, '2022_12_01_091411_edit_collections_tables', 14),
(53, '2022_12_12_140954_create_transactions_table', 15),
(54, '2022_12_12_141036_drop_detail_transactions_table', 15),
(55, '2022_12_12_141128_create_detail_transactions_table', 16),
(56, '2022_12_25_070120_create_blogs_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 6, 'auth_token', 'fc6b280e3aea9a1ec8e451e286c71af20bf917602b7bf3e8844f00eb33ae89f1', '[\"*\"]', NULL, NULL, '2022-12-09 21:41:48', '2022-12-09 21:41:48'),
(2, 'App\\Models\\User', 6, 'auth_token', '1b946b9578f63cb73838894ef3aff1823f38138915fc59c6d5155d9897bba35b', '[\"*\"]', '2022-12-09 23:14:07', NULL, '2022-12-09 21:46:50', '2022-12-09 23:14:07'),
(3, 'App\\Models\\User', 6, 'auth_token', 'bf46de529fc2043c4a4b93ecf6ff9bfa03c652e4e5e8742ff5476aeccfac6e6e', '[\"*\"]', '2022-12-16 22:10:41', NULL, '2022-12-16 21:53:09', '2022-12-16 22:10:41'),
(4, 'App\\Models\\User', 6, 'auth_token', '2c1bb9605ed94acbb1ad9f5111d81304e4f626f06ae802f45545f88435aada58', '[\"*\"]', '2022-12-18 09:24:31', NULL, '2022-12-16 22:12:45', '2022-12-18 09:24:31'),
(5, 'App\\Models\\User', 7, 'MyApp', '109628ecbd241c94521e8b3acca016d6619a2c918467f2da7090f94f2a501859', '[\"*\"]', NULL, NULL, '2022-12-25 00:39:10', '2022-12-25 00:39:10'),
(6, 'App\\Models\\User', 7, 'MyApp', '3405b8d2e0cafc8669422e1c11e633047aed289bfc93ab9ef4c8cd150307dca2', '[\"*\"]', '2022-12-25 00:56:27', NULL, '2022-12-25 00:41:35', '2022-12-25 00:56:27');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userIdPetugas` bigint(20) NOT NULL,
  `userIdPeminjam` bigint(20) NOT NULL,
  `tanggalPinjam` date NOT NULL,
  `tanggalSelesai` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `userIdPetugas`, `userIdPeminjam`, `tanggalPinjam`, `tanggalSelesai`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2022-12-12', NULL, '2022-12-12 07:12:24', '2022-12-12 07:12:24'),
(2, 1, 5, '2022-12-12', NULL, '2022-12-12 09:00:40', '2022-12-12 09:00:40'),
(3, 1, 2, '2022-12-12', NULL, '2022-12-12 09:11:28', '2022-12-12 09:11:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `fullname`, `email`, `alamat`, `birthdate`, `password`, `phoneNumber`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yudhistirahs', 'Yudhistira Hary', 'yudhis@gmail.com', 'bojongswan', '2022-11-17', '$2y$10$eLffysizFc8HDEC7hXWq7urBjPMsNNemDZnXneqhRY204pC.PgZ5S', '082229137476', NULL, NULL, '2022-11-17 09:08:29', '2022-12-02 06:06:43'),
(2, 'riri', 'rivaaa', 'riri@gmail.com', 'sukapura', '2022-11-04', '$2y$10$Wa8BVAHyDg3DI2c5XifwfO1Xh8s91bAin27Z/qCBIuOuwkO6vlmDm', '082229134749', NULL, NULL, '2022-11-17 09:57:38', '2022-11-17 09:57:38'),
(3, 'loco loco', 'locomotif', 'loco@gmail.com', 'bandung', '2022-11-10', '$2y$10$kz1SRqnKWUEhqRTkXvwROuiSp.mtnD5PoI/ZjZGGvtvt4A9QHeDNa', '0822-2913-4743', NULL, NULL, '2022-11-17 19:39:05', '2022-11-17 19:39:05'),
(4, 'valez', 'valezka yujin', 'valez@gmail.com', 'padang', '2022-12-02', '$2y$10$dOASHOMrlcoRWpaMUEGVDeXl0X3LF3tD1.D5DzfFtVMmISjFfEMrC', '082229138888', NULL, NULL, '2022-12-02 09:12:33', '2022-12-02 09:12:33'),
(5, 'jiyu', 'ziyu arlian', 'ziyu@gmail.com', 'cipagalo', '2022-12-01', '$2y$10$MwIHQoUl4BQ8q3VQDaOzhuYbZ7zKHVbL.5Y2ODO6y/iFaK1.1u5fe', '088286457894', NULL, NULL, '2022-12-02 09:21:18', '2022-12-02 09:21:18'),
(6, 'userapi', 'userapi', 'userapi@gmail.com', NULL, NULL, '$2y$10$lFwszovvW1eG4xQa8WIHAeolpOR2CetLI5FOQ4UsXglNnSaYiIMle', NULL, NULL, NULL, '2022-12-09 21:41:48', '2022-12-09 21:41:48'),
(7, 'riva', 'Riva Zahra', 'rivazahra@gmail.com', NULL, NULL, '$2y$10$JL4G45QDIVIRt02mX6u1e.7LAPM0lAeGQvDIlwnhF/NUE1vUMbvv.', NULL, NULL, NULL, '2022-12-25 00:39:09', '2022-12-25 00:39:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detail_transactions`
--
ALTER TABLE `detail_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `detail_transactions`
--
ALTER TABLE `detail_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
