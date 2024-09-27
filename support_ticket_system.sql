-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 27, 2024 at 02:20 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `support_ticket_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_26_181032_create_open_tickets_table', 2),
(6, '2024_09_27_085019_create_ticket_conversations_table', 3),
(7, '2024_09_27_112412_create_notifications_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('043d0415-b8bf-47d5-8691-eeb4032ed628', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":7,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:29:57', '2024-09-27 05:29:57'),
('074051ff-4908-42eb-b537-a3d0293b263a', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:03:25', '2024-09-27 07:03:25'),
('0b25c543-33d4-4601-a408-7473f0e1e4ef', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":32,\"ticket_title\":\"sgsdgsdg\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:14:39', '2024-09-27 07:14:39'),
('0d1fefc9-5f1c-43fd-9f09-0c090c838e58', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":5,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:24:32', '2024-09-27 05:24:32'),
('11d1723e-d42b-470f-9f43-eb12a5257dd4', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":36,\"ticket_title\":\"sdsdfsdf\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:32:39', '2024-09-27 07:32:39'),
('1213e432-3e05-4f61-82bd-86ce04b95aad', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 06:02:24', '2024-09-27 06:02:24'),
('1c693768-0eb6-45ac-9f62-9d85b25ea015', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":23,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:56:47', '2024-09-27 05:56:47'),
('2066fa01-3801-421a-8536-591eb9aff29d', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":31,\"ticket_title\":\"sgsdgsdg\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:14:38', '2024-09-27 07:14:38'),
('22fe8cd7-ff96-4aff-b70d-999d156c3948', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":30,\"ticket_title\":\"sgsdgsdg\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:12:49', '2024-09-27 07:12:49'),
('26302a57-2536-48e1-8109-238367c6fc37', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:25:02', '2024-09-27 07:25:02'),
('264c0fa5-b75c-4338-9c19-578994011528', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:06:25', '2024-09-27 07:06:25'),
('2a09d899-207e-4d63-92bc-7ec75f5af96f', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:09:23', '2024-09-27 07:09:23'),
('35df1b86-2491-462c-b3ef-ae789789a9a7', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":1,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 05:59:13', '2024-09-27 05:59:13'),
('3e8110a1-38b3-4816-a85c-43ffc7cdf98c', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:22:06', '2024-09-27 07:22:06'),
('3fb9a58b-346d-48ff-b82f-fdbefd6aeb93', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":12,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:33:23', '2024-09-27 05:33:23'),
('40ec4b99-c8e3-4a83-95d3-99fdbab1d27c', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":26,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:57:08', '2024-09-27 05:57:08'),
('439c9a9a-029a-4c8f-b9c1-0a983d458f20', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:03:27', '2024-09-27 07:03:27'),
('44c603c5-624c-438e-8e32-a6db302bea1c', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":28,\"ticket_title\":\"sgsdgsdg\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:12:24', '2024-09-27 07:12:24'),
('475af897-d18b-43a2-a7f6-6d5d34b7472d', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:11:50', '2024-09-27 07:11:50'),
('54012c7e-f015-4ec1-87c9-2a8a40227e57', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":1,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 05:59:29', '2024-09-27 05:59:29'),
('552892c4-955b-4d2d-a932-746bd460872d', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:06:10', '2024-09-27 07:06:10'),
('5fd50d2c-5dec-4f42-89db-7e3dda9b7935', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":35,\"ticket_title\":\"I am Saurov\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:31:25', '2024-09-27 07:31:25'),
('60af4af9-d04d-44e5-beaa-345ee526801a', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":34,\"ticket_title\":\"I have a new Problem\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:27:48', '2024-09-27 07:27:48'),
('61963469-0275-4ee1-9684-0d13221c76ae', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":16,\"ticket_title\":\"I have a new problem\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:44:41', '2024-09-27 05:44:41'),
('622c7513-2db5-4201-be3d-92709c5688b3', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:22:21', '2024-09-27 07:22:21'),
('659b5edb-2dab-4542-82eb-5dbae4b6865f', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":6,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:25:21', '2024-09-27 05:25:21'),
('68051362-1b80-408a-b52a-f53e9fab8314', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:21:33', '2024-09-27 07:21:33'),
('7739407e-e846-4f5c-82c8-31194ddf891b', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":15,\"ticket_title\":\"I have a new problem\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:43:09', '2024-09-27 05:43:09'),
('7a1c9d33-a6c1-44e7-869a-142fa7b4a0e1', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:06:18', '2024-09-27 07:06:18'),
('8fe9465d-a543-4261-8ef4-dd08c18ceb2e', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":11,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:33:06', '2024-09-27 05:33:06'),
('93ab4b33-2e06-4bd2-9685-b101381643db', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:06:05', '2024-09-27 07:06:05'),
('9703611a-8bae-48fb-a702-70b5f2339dca', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":1,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 05:59:30', '2024-09-27 05:59:30'),
('9bd8d54d-2c94-4738-945b-f9cd200c6586', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":22,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:54:06', '2024-09-27 05:54:06'),
('9c783a64-4321-479b-bdb3-26717e8ff7fa', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:11:47', '2024-09-27 07:11:47'),
('9ff40260-7aaa-4f79-b0b8-4116aadf3ce2', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":25,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:56:54', '2024-09-27 05:56:54'),
('a52fcfb3-c1f0-4773-98e7-08e4fc778403', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:06:57', '2024-09-27 07:06:57'),
('a779c81e-55f5-400b-b90d-8a3c9e77f263', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:09:22', '2024-09-27 07:09:22'),
('ab95b177-41c8-4e91-947e-3c2ffd7cfa01', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":1,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 05:57:37', '2024-09-27 05:57:37'),
('b15fed90-31ab-4782-af67-1ef46bfa1792', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":33,\"ticket_title\":\"dsfsdfsdf\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:25:59', '2024-09-27 07:25:59'),
('b985a7fc-e940-480c-a1c4-89e28b45a360', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 06:09:52', '2024-09-27 06:09:52'),
('bfa27561-424e-4984-9257-11aef369daec', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":17,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:45:04', '2024-09-27 05:45:04'),
('c67f82b6-055b-441d-9601-bf6a97427749', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":13,\"ticket_title\":\"I have a new problem\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:42:23', '2024-09-27 05:42:23'),
('c97533cc-2576-4ff4-a6c9-9946f41ea610', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":18,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:46:29', '2024-09-27 05:46:29'),
('cb22a360-1897-4d97-8571-437f1cb20808', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":24,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:56:51', '2024-09-27 05:56:51'),
('ccac2df4-27ad-4655-be4f-56b4443c3ad3', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":1,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 05:59:23', '2024-09-27 05:59:23'),
('ce113747-6633-4ee1-8f32-8eda09672a58', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":1,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 06:02:08', '2024-09-27 06:02:08'),
('dceb2db8-c925-46c7-83e9-30b11fffcaa9', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":27,\"ticket_title\":\"ghdfhdfh\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:57:12', '2024-09-27 05:57:12'),
('e40f3b4d-0ea6-4f94-9eae-68604849a902', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":8,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:30:37', '2024-09-27 05:30:37'),
('e97954f9-220c-4962-803e-60d977eec778', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":10,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:32:33', '2024-09-27 05:32:33'),
('f103ad0f-1b20-49fb-bf47-12bdfcdf98bd', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":29,\"ticket_title\":\"sgsdgsdg\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 07:12:48', '2024-09-27 07:12:48'),
('f361fa81-bfbb-4d69-82bc-add2b121fbf0', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":37,\"ticket_title\":\"I have a Problem\",\"created_by\":\"customer\"}', NULL, '2024-09-27 08:09:57', '2024-09-27 08:09:57'),
('f4cf4fe0-9289-4e5a-a961-ea4c438deef4', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 06:02:17', '2024-09-27 06:02:17'),
('f4d62b19-8e2d-4f4d-91e6-b7b2f4d56ccd', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":1,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 06:02:12', '2024-09-27 06:02:12'),
('fd5a010f-894e-4f7d-aa57-767d5c1c4e16', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 1, '{\"ticket_id\":2,\"ticket_title\":\"Sample Ticket\",\"created_by\":\"John Doe\"}', NULL, '2024-09-27 07:23:44', '2024-09-27 07:23:44'),
('ffe85d4c-8941-4bd7-b3cf-df9b1eb08d3d', 'App\\Notifications\\NewTicketNotification', 'App\\Models\\User', 2, '{\"ticket_id\":9,\"ticket_title\":\"I have a new open ticket\",\"created_by\":\"Saurov Saha\"}', NULL, '2024-09-27 05:31:53', '2024-09-27 05:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `open_tickets`
--

CREATE TABLE `open_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `title_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issues_details` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` enum('Active','Closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `open_tickets`
--

INSERT INTO `open_tickets` (`id`, `title_name`, `issues_details`, `attachment`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(37, 'I have a Problem', 'This is issue, Please solve it', '[\"upload\\/customer\\/Opent_ticket\\/1727446197_business.jpg\"]', 3, 'Closed', '2024-09-27 08:09:57', '2024-09-27 08:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_conversations`
--

CREATE TABLE `ticket_conversations` (
  `id` bigint UNSIGNED NOT NULL,
  `ticket_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `issues_details` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `status` enum('Active','Closed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_conversations`
--

INSERT INTO `ticket_conversations` (`id`, `ticket_id`, `user_id`, `issues_details`, `attachment`, `status`, `created_at`, `updated_at`) VALUES
(7, 37, 2, 'This problem will be solve', NULL, 'Closed', '2024-09-27 08:15:14', '2024-09-27 08:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `usertype`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Saurov Saha', 'saurov.unipro@gmail.com', NULL, '$2y$10$uD1641yfFfBC6l4iK05Nkum6sMd9/SgEWDh4jwim7F.NP/zLqg9mK', 'customer', NULL, '2024-09-26 10:53:56', '2024-09-26 10:53:56'),
(2, 'admin', 'saurovsaha786@gmail.com', NULL, '$2y$10$5qSIMFKdpfNdrEnNVC6UPu2IQXbS6letogrYHyZOOMeYpXF1w474W', 'admin', NULL, '2024-09-26 10:54:26', '2024-09-26 10:54:26'),
(3, 'customer', 'customer@gmail.com', NULL, '$2y$10$RgANx38fCL7gzOYpvm0lH.7f3UXV0Qk.IjRXBegwFlHy92zbQN8ni', 'customer', NULL, '2024-09-27 08:04:38', '2024-09-27 08:04:38');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `open_tickets`
--
ALTER TABLE `open_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `open_tickets_user_id_foreign` (`user_id`);

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
-- Indexes for table `ticket_conversations`
--
ALTER TABLE `ticket_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_conversations_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_conversations_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `open_tickets`
--
ALTER TABLE `open_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_conversations`
--
ALTER TABLE `ticket_conversations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `open_tickets`
--
ALTER TABLE `open_tickets`
  ADD CONSTRAINT `open_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_conversations`
--
ALTER TABLE `ticket_conversations`
  ADD CONSTRAINT `ticket_conversations_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `open_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_conversations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
