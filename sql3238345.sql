-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql3.freesqldatabase.com
-- Время создания: Июн 04 2018 г., 06:54
-- Версия сервера: 5.5.54-0ubuntu0.12.04.1
-- Версия PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sql3238345`
--

-- --------------------------------------------------------

--
-- Структура таблицы `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contacts`
--

INSERT INTO `contacts` (`id`, `type_id`, `value`, `user_id`) VALUES
(1, 3, '+346666', 1),
(2, 1, '+380687412589', 1),
(3, 4, 'skypeclient123', 2),
(4, 5, '+380678523698', 3),
(5, 3, 'client___VIP@mail.ru', 4),
(6, 6, 'qqRWTWATEYR', 8),
(9, 4, 'eret3srwr', 8),
(11, 6, 'werew', 8),
(12, 6, 'werew', 8),
(13, 3, '77777', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `contact_types`
--

CREATE TABLE `contact_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `contact_types`
--

INSERT INTO `contact_types` (`id`, `contact_type`) VALUES
(3, 'Email'),
(2, 'Fax'),
(1, 'Phone'),
(4, 'Skype'),
(7, 'Telegram'),
(8, 'Test111111111111'),
(5, 'Viber'),
(6, 'WhatsApp');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_11_24_144440_entrust_setup_tables', 1),
(4, '2017_11_29_232330_create_contact_types_table', 1),
(5, '2017_11_29_232429_create_contacts_table', 1),
(6, '2017_11_29_232943_create_user_contact_table', 1),
(7, '2017_11_30_180030_change_users_table_column_status', 1),
(8, '2017_11_30_215449_CreateTechnologyTables', 1),
(9, '2017_11_30_222239_create_user_technology_table', 1),
(10, '2017_12_01_145312_create_projects_table', 1),
(11, '2017_12_01_171604_create_tasks_table', 1),
(12, '2017_12_01_183047_create_task_user_table', 1),
(13, '2017_12_01_184222_create_task_comment_table', 1),
(14, '2017_12_01_184840_create_task_file_table', 1),
(15, '2017_12_01_193421_create_user_comment_table', 1),
(22, '2017_12_02_013252_create_project_technology_table', 2),
(23, '2017_12_02_014159_create_task_technology_table', 2),
(24, '2018_02_18_045236_create_project_user_table', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('olgaaa@gmail.com', '$2y$10$Xi/pf0E60ypzaUH.uehlzO.BpQUNehAqM0wDAnUUcyHvdQvruLVQu', '2018-02-20 23:36:45'),
('ssamyraika@gmail.com', '$2y$10$hxxyIErGtBWSqmiXT1kDxOhzH2m4vHhZIzcpEQVd6DjtYH1OqKdYe', '2018-02-20 23:42:29');

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `clients_id` int(10) UNSIGNED NOT NULL,
  `status` enum('finished','in work','canceled','paused') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in work',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `clients_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Proj1', 'complex project for important customer', 2, 'finished', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(2, 'Proj2', 'simple project for important customer', 2, 'finished', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(3, 'retet', 'etetretetet', 2, 'in work', '2018-02-18 10:37:15', '2018-02-18 10:37:15'),
(4, '3445u3', 'r43o5i3u5ou', 2, 'finished', '2018-02-18 10:38:46', '2018-02-18 10:38:46'),
(6, 'test name change', '1111111111111111111111111111111 22222222222222222 detgiertg nmtiuwtiwe mweriwutlwdfdfjsfv nstfsuf', 10, 'finished', '2018-02-18 17:42:39', '2018-02-18 18:34:14'),
(8, 'qrqrwrw', 'test status', 2, 'finished', '2018-02-21 01:49:54', '2018-02-21 01:49:54'),
(9, 'test', 'test', 8, 'canceled', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `project_technology`
--

CREATE TABLE `project_technology` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `id_technology` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `project_user`
--

CREATE TABLE `project_user` (
  `id_project` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `project_user`
--

INSERT INTO `project_user` (`id_project`, `id_user`) VALUES
(1, 1),
(3, 1),
(4, 1),
(2, 2),
(1, 3),
(2, 3),
(4, 3),
(1, 4),
(2, 4),
(1, 5),
(2, 6),
(3, 6),
(1, 7),
(2, 7),
(1, 8),
(2, 9),
(3, 9),
(4, 9),
(2, 11),
(2, 12);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Admin Role', 'Admin Role', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(2, 'Client', 'Client Role', 'Client Role', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(3, 'ProjectMan', 'ProjectMan Role', 'ProjectMan Role', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(4, 'Programmer', 'Programmer Role', 'Programmer Role', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(5, 'TeamLeader', 'TeamLeader Role', 'TeamLeader Role', '2017-12-01 22:10:46', '2017-12-01 22:10:46');

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(6, 1),
(7, 1),
(8, 1),
(2, 2),
(6, 2),
(8, 2),
(9, 2),
(10, 2),
(12, 2),
(19, 2),
(1, 3),
(3, 3),
(6, 3),
(8, 3),
(11, 3),
(4, 4),
(6, 4),
(8, 4),
(5, 5),
(6, 5),
(8, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `project_id` int(10) UNSIGNED NOT NULL,
  `start` datetime NOT NULL DEFAULT '2017-12-02 00:07:51',
  `end` datetime NOT NULL DEFAULT '2017-12-02 00:07:51',
  `status` enum('new','in_progress','completed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id`, `name`, `description`, `project_id`, `start`, `end`, `status`, `created_at`, `updated_at`) VALUES
(1, 'task1', 'create db', 1, '2018-06-01 00:00:00', '2018-06-03 00:00:00', 'canceled', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(2, 'task2', 'write a lot of code', 1, '2017-12-02 00:00:00', '2017-12-02 00:00:00', 'completed', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(3, 'task1', 'edit layout', 2, '2017-12-02 00:07:51', '2017-12-02 00:07:51', 'new', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(4, 'task2', 'add imgs', 2, '2017-12-02 00:07:51', '2017-12-02 00:07:51', 'new', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(5, 'TaskTest1', 'egtawlguteso;hgb.x', 1, '2017-12-04 00:00:00', '2017-12-21 00:00:00', 'new', NULL, NULL),
(6, 'Testtask2', 'jtw;tu3w krghketrg wqjhtgawjef jrgjwe', 1, '2018-02-04 00:00:00', '2018-02-20 00:00:00', 'new', NULL, NULL),
(7, 'Test task3', 'qrwtuoi kthekrht kdjghesght', 8, '2018-02-12 00:00:00', '2018-01-31 00:00:00', 'completed', NULL, NULL),
(8, 'Test task 4', NULL, 1, '2017-12-20 00:00:00', '2018-01-22 00:00:00', 'new', NULL, NULL),
(9, 'Test task 5', 'wtwuj4t skthrewkgt kutyert', 1, '2018-03-12 00:00:00', '2017-12-20 00:00:00', 'new', NULL, NULL),
(10, 'Test task 6', NULL, 1, '2018-02-12 00:00:00', '2018-02-12 00:00:00', 'in_progress', NULL, NULL),
(11, 'тест календарь', NULL, 6, '2018-02-20 00:00:00', '2018-02-22 00:00:00', 'new', NULL, NULL),
(13, 'test hhdhhd', 'qrqr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(14, 'test hhdhhd', 'qrqr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(15, 'test hhdhhd', 'qrqr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(16, 'Rrrrrrrrrrrrrrrrrrrr', 'rrrrrrrrrrrrrrrrrrrrr', 4, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(17, 'app file', 'afear', 1, '2018-02-07 00:00:00', '2018-02-08 00:00:00', 'new', NULL, NULL),
(18, 'wqee', 'qeqwe', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(19, 'wrwr', 'wrwr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(20, 'rw', 'rwre', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(21, 'sfwsf', 'ssf', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(22, 'er', 'er', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(23, 'dfse', 'asda', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(24, 'ewrw', 'wrwr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(25, 'ewrw', 'wrwr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(26, 'ewrw', 'wrwr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(27, 'ewrw', 'wrwr', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(28, 'ew', 'ewre', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(29, 'ee', 'ee', 1, '2018-02-21 00:00:00', '2018-02-21 00:00:00', 'new', NULL, NULL),
(30, '1', '2', 2, '2018-02-23 00:00:00', '2018-02-23 00:00:00', 'canceled', NULL, NULL),
(31, 'testTask', 'testRask', 1, '2018-06-07 00:00:00', '2018-06-26 00:00:00', 'new', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `task_comment`
--

CREATE TABLE `task_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_comment`
--

INSERT INTO `task_comment` (`id`, `task_id`, `comment`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 1, 'Some strange comment...', '2017-12-01 22:10:46', '2017-12-01 22:10:46', 1),
(2, 2, 'Some silly comment...', '2017-12-01 22:10:46', '2017-12-02 22:10:46', 2),
(3, 3, 'Some important comment...', '2017-12-01 22:10:46', '2017-12-03 22:10:46', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `task_file`
--

CREATE TABLE `task_file` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `path` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_file`
--

INSERT INTO `task_file` (`id`, `task_id`, `path`, `created_at`, `updated_at`, `name`) VALUES
(1, 1, 'storage/111.jpg', '2017-12-01 22:10:46', '2017-12-01 22:10:46', ''),
(2, 2, 'storage/222.jpg', '2017-12-01 22:10:46', '2017-12-01 22:10:46', ''),
(3, 1, '19458424_1601614596562758_1391261600_n.jpg', NULL, NULL, '19458424_1601614596562758_1391261600_n.jpg'),
(4, 27, 'other.jpg', '2018-02-21 03:52:51', '2018-02-21 03:52:51', 'other.jpg'),
(5, 28, 'Английский конспект.docx', '2018-02-21 03:56:39', '2018-02-21 03:56:39', 'Английский конспект.docx'),
(6, 29, 'Размеры.txt', '2018-02-21 03:58:04', '2018-02-21 03:58:04', 'Размеры.txt');

-- --------------------------------------------------------

--
-- Структура таблицы `task_technology`
--

CREATE TABLE `task_technology` (
  `id_task` int(10) UNSIGNED NOT NULL,
  `id_technology` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `task_user`
--

CREATE TABLE `task_user` (
  `id_task` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `task_user`
--

INSERT INTO `task_user` (`id_task`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 5, '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(1, 8, NULL, NULL),
(2, 4, '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(3, 4, '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(4, 4, '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(5, 6, NULL, NULL),
(6, 6, NULL, NULL),
(8, 4, NULL, NULL),
(9, 4, NULL, NULL),
(10, 4, NULL, NULL),
(11, 8, NULL, NULL),
(13, 9, NULL, NULL),
(14, 9, NULL, NULL),
(15, 9, NULL, NULL),
(16, 9, NULL, NULL),
(17, 9, NULL, NULL),
(18, 9, NULL, NULL),
(19, 9, NULL, NULL),
(20, 9, NULL, NULL),
(21, 9, NULL, NULL),
(22, 9, NULL, NULL),
(23, 9, NULL, NULL),
(24, 9, NULL, NULL),
(25, 9, NULL, NULL),
(26, 9, NULL, NULL),
(27, 9, NULL, NULL),
(28, 9, NULL, NULL),
(29, 9, NULL, NULL),
(30, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `technologies`
--

CREATE TABLE `technologies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `technologies`
--

INSERT INTO `technologies` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2, 'C#', 'ASP.NET', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(3, 'MySQL', NULL, '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(4, 'MSSQL', NULL, '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(5, 'ADO.NET', NULL, '2017-12-01 22:10:46', '2017-12-01 22:10:46');

-- --------------------------------------------------------

--
-- Структура таблицы `technology_user`
--

CREATE TABLE `technology_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `technology_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `technology_user`
--

INSERT INTO `technology_user` (`user_id`, `technology_id`) VALUES
(5, 2),
(4, 3),
(5, 3),
(5, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'User_admin', 'user_admin@gmail.com', '$2y$10$g9B95EsZdiyRvEitcTz6/ue3iTGZqp0u5w/ZLzS07Keaye358WHgi', 'user.png', 'active', 'ZLXGkShldnKRYc6eG8PNrgaoAsSKYQdv2ZpyIyqFfPjXCJzjh84wlSD05HEh', '2017-12-01 22:10:45', '2017-12-01 22:10:45'),
(2, 'User_client', 'User_client@gmail.com', '$2y$10$SjKBK9mm9n98eoQA3i4AYeyaO54.nncbC.mbd.3WtBv2N2zWp7gmO', 'user.png', 'active', NULL, '2017-12-01 22:10:45', '2017-12-01 22:10:45'),
(3, 'User_pm', 'User_pm@gmail.com', '$2y$10$n117vLC.Ta1Hz1oFxkoNpun0mqjXAiGCDR4.p1dhoiWnqPR9SOfXy', 'pm.jpg', 'active', NULL, '2017-12-01 22:10:45', '2018-02-20 06:34:37'),
(4, 'User_dev', 'User_dev@gmail.com', '$2y$10$pLyQMm5aWa0KPjSLnkMJi.mUcvGacc8CezPp28N3PYUHxmYs3J8ri', 'user.png', 'active', NULL, '2017-12-01 22:10:45', '2017-12-01 22:10:45'),
(5, 'User_tl', 'User_tl@gmail.com', '$2y$10$Z8W6bN.LHGSwBKiKbOV18OyL3RJ.0sMKo5GTIiZD5HQN2FvpkDOO2', 'user.png', 'active', NULL, '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(6, 'super', 'super@gmail.com', '$2y$10$8Ep3iTCN3u0Hiu/dxgrI0eKlVBtV4OlUXBPMnB1urFQa3aDiFl4Ui', 'user.png', 'active', 'MYCsIGWRSjetCbQM8gvl6QrV5kz4N3orjXBzDLjTiv3OHESJr7t7k0cHqgq4', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(7, 'Olga', 'olga@gmail.com', '$2y$10$5knnTFBNJO2b6W8XlujMru9OfLkhtkr8RRRjf1u1rDotImoQN02zS', 'img.jpg', 'active', '8rsPtNRaaGr10M9siohmd6HtMsccEbfLws9PZ7RmX79q3a5grXPGhor9EcJv', '2017-12-12 22:55:06', '2017-12-20 00:43:32'),
(8, 'olgaaa', 'olgaaa@gmail.com', '$2y$10$Ol9gTzfuMXColoRBXIzpIuTW9wvP5SZUYzyFdXegLrnR89erYjxve', 'olga.jpg', 'active', 'AD3cvvcwkaWzTu95FecF2SB9UyuDqslaDyJAGFlUka21cE4vesxBqnS5kpzA', '2018-02-13 20:02:53', '2018-05-21 22:57:04'),
(9, 'an', 'an@gmail.com', '$2y$10$dMQ8KMqE3keynKXSbmxlPOiPNzn.zl7r7jdAAKQ83ANXF4t6IqrAS', 'user.png', 'active', 'ksXaQzulEgrb10qLI5HKhdXgk4tCcJJusF2zlkh1P8bAXRU1Hr5ojCivgvdz', '2018-02-14 20:53:19', '2018-02-14 20:53:19'),
(10, 'iiii', 'iiii@mail.com', '$2y$10$rhXxGPPE8Ky8aT.kQnBPLeJ63977KziLaID4TKLRh9Y/oNyj703Pe', 'user.png', 'active', 'GCqeWc14uQ3YTWwVJnKuIEk2YvOdfcdOl1tN9wPoIeXWmgpf5zTw3voyu9Nq', '2018-02-14 21:00:59', '2018-02-14 21:00:59'),
(11, 'TestName11', 'TestName1@gmail.com', '$2y$10$UVYCmGLnSXx9hKSXvR2hmuET89fhPXeSn/u5F.PjUskkioTiMZOjW', 'admin.jpg', 'active', 'fvAxAlYpsMmhfU8jBjdpV1YTJex52f4icfzKHpREr9YhushWBlqd3MbNtJvZ', '2018-02-20 06:16:10', '2018-02-20 06:20:27'),
(12, 'Real Name', 'ssamyraika@gmail.com', '$2y$10$6/xdIaNyPFewyfOA2Iz0beHhbF0KEiKrFMmc5QNLs5YEcm9EKFZXi', NULL, 'active', 'D4fH0V9Unz4I0YCyGFigbXr8LjRvXIbddy2Vosj5G4dZ5ShxJm2aT30oavYD', '2018-02-20 23:39:19', '2018-02-20 23:39:19'),
(15, 'desktopName', 'desktop@mail.ru', '$2a$10$nGHBsEwaUW4yNpO1sZRES.HF8LEJjXePmC6lSMPqdhhzIJ0EDL3QG', 'img.jpg', 'active', NULL, NULL, NULL),
(19, 'testChange', 'testRole@gmail.com', '$2a$10$Rs3YjxW2Y66cQW3EAYjWhOJOsexY2KvqiVnPFQS1HPE4AauWNj1aa', 'other.jpg', 'active', 'i4M8IGC66h4OuFaFggXGCfclxlIETGpPYGfrg8UEjFfZ5WHGFVNqKjzeDNAm', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_comment`
--

CREATE TABLE `user_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_comment`
--

INSERT INTO `user_comment` (`id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 2, 'Very good client! Pays in time.', '2017-12-01 22:10:46', '2017-12-01 22:10:46'),
(2, 4, 'Very responsible dev!', '2017-12-01 22:10:46', '2017-12-01 22:10:46');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_type_id_foreign` (`type_id`),
  ADD KEY `users_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `contact_types`
--
ALTER TABLE `contact_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_types_contact_type_unique` (`contact_type`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_clients_id_foreign` (`clients_id`);

--
-- Индексы таблицы `project_technology`
--
ALTER TABLE `project_technology`
  ADD PRIMARY KEY (`id_project`,`id_technology`),
  ADD KEY `project_technology_id_technology_foreign` (`id_technology`);

--
-- Индексы таблицы `project_user`
--
ALTER TABLE `project_user`
  ADD PRIMARY KEY (`id_project`,`id_user`),
  ADD KEY `project_user_id_user_foreign` (`id_user`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`);

--
-- Индексы таблицы `task_comment`
--
ALTER TABLE `task_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comment_task_id_foreign` (`task_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `task_file`
--
ALTER TABLE `task_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_file_task_id_foreign` (`task_id`);

--
-- Индексы таблицы `task_technology`
--
ALTER TABLE `task_technology`
  ADD PRIMARY KEY (`id_task`,`id_technology`),
  ADD KEY `task_technology_id_technology_foreign` (`id_technology`);

--
-- Индексы таблицы `task_user`
--
ALTER TABLE `task_user`
  ADD PRIMARY KEY (`id_task`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `technologies_name_unique` (`name`);

--
-- Индексы таблицы `technology_user`
--
ALTER TABLE `technology_user`
  ADD PRIMARY KEY (`user_id`,`technology_id`),
  ADD KEY `technology_user_technology_id_foreign` (`technology_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_comment`
--
ALTER TABLE `user_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_comment_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT для таблицы `contact_types`
--
ALTER TABLE `contact_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT для таблицы `task_comment`
--
ALTER TABLE `task_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `task_file`
--
ALTER TABLE `task_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `technologies`
--
ALTER TABLE `technologies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `user_comment`
--
ALTER TABLE `user_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `contacts_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `contact_types` (`id`);

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_clients_id_foreign` FOREIGN KEY (`clients_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `project_technology`
--
ALTER TABLE `project_technology`
  ADD CONSTRAINT `project_technology_id_project_foreign` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_technology_id_technology_foreign` FOREIGN KEY (`id_technology`) REFERENCES `technologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `project_user`
--
ALTER TABLE `project_user`
  ADD CONSTRAINT `project_user_id_project_foreign` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_user_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_comment`
--
ALTER TABLE `task_comment`
  ADD CONSTRAINT `task_comment_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_file`
--
ALTER TABLE `task_file`
  ADD CONSTRAINT `task_file_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_technology`
--
ALTER TABLE `task_technology`
  ADD CONSTRAINT `task_technology_id_task_foreign` FOREIGN KEY (`id_task`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_technology_id_technology_foreign` FOREIGN KEY (`id_technology`) REFERENCES `technologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `task_user`
--
ALTER TABLE `task_user`
  ADD CONSTRAINT `task_user_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `technology_user`
--
ALTER TABLE `technology_user`
  ADD CONSTRAINT `technology_user_technology_id_foreign` FOREIGN KEY (`technology_id`) REFERENCES `technologies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `technology_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_comment`
--
ALTER TABLE `user_comment`
  ADD CONSTRAINT `user_comment_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
