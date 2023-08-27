-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table personal_task_manager.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table personal_task_manager.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table personal_task_manager.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table personal_task_manager.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_08_26_122136_create_tasks_table', 1);

-- Dumping structure for table personal_task_manager.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table personal_task_manager.password_reset_tokens: ~0 rows (approximately)
DELETE FROM `password_reset_tokens`;

-- Dumping structure for table personal_task_manager.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table personal_task_manager.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table personal_task_manager.tasks
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `due_date` date NOT NULL,
  `status` enum('Not Started','In Progress','Completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table personal_task_manager.tasks: ~49 rows (approximately)
DELETE FROM `tasks`;
INSERT INTO `tasks` (`id`, `user_id`, `title`, `description`, `due_date`, `status`, `created_at`, `updated_at`) VALUES
	(1, 7, 'Voluptates est expedita distinctio veritatis sed.', 'Aut dolor nihil qui deserunt natus incidunt quasi. Ut adipisci labore et amet voluptatibus nesciunt sed pariatur. Vero laborum maxime aut nemo. Nihil sapiente et aliquid ut eveniet illum aut et.', '1980-06-19', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(2, 10, 'Eos molestias numquam nesciunt debitis.', 'Est ut ad velit eligendi est magnam. Nulla nisi dicta et doloribus. Voluptatem ullam ut non eum non. Voluptas porro aut consequuntur quasi velit quo.', '2000-09-26', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(3, 2, 'Vitae commodi saepe ut rem minima adipisci.', 'Molestias eos atque aut nisi molestiae. Quos qui velit officia accusantium vitae est.', '1984-12-08', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(4, 6, 'Aut magnam accusantium ea doloribus neque.', 'Exercitationem architecto libero minima porro. Consectetur deleniti impedit ab at molestiae nihil ut. Asperiores voluptatum nisi natus velit.', '2020-05-09', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(5, 2, 'Ullam ab repudiandae magni similique.', 'Dolorum accusamus dolor quos maiores quia. Sed eos eos eaque est consequuntur voluptatem sint. Maxime unde ea nulla saepe. Harum iusto pariatur illum unde pariatur. Placeat ex incidunt magnam enim aspernatur laudantium.', '2013-07-25', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(6, 9, 'Explicabo officia vero animi.', 'Nisi consequatur ad accusamus harum. Reprehenderit beatae omnis iusto ab suscipit quia. Modi ipsa pariatur omnis id est in rerum quaerat. Autem modi natus minima voluptas eligendi qui et.', '1996-05-27', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(7, 2, 'Commodi voluptatem tenetur et ipsam.', 'Dolorem totam nobis a dolor. Quaerat fugit doloribus est ut sed maxime sunt. Adipisci sit repellendus fugit est facere odio dicta amet. Consequatur aut dignissimos ad rerum numquam quisquam harum.', '2014-10-24', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(8, 8, 'Consequuntur vel libero voluptatem quia non.', 'Sapiente fugit et placeat nisi ullam enim. Nihil dolor harum nam atque quo quis. Soluta vel est omnis quia aut dolorum provident voluptatem.', '2022-02-05', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(9, 6, 'Molestiae numquam nesciunt nisi sunt expedita.', 'Iste et cupiditate quis dolores dolore corrupti voluptate voluptatum. Repellendus porro aspernatur qui est laboriosam aperiam. Laudantium non assumenda facilis non quo aut rerum fugiat.', '2009-03-05', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(10, 2, 'Maxime et fugit dolor repellat.', 'In ad ipsum alias enim sequi assumenda. Amet incidunt odit perspiciatis recusandae nihil.', '1970-11-03', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(11, 7, 'Enim sit dolor distinctio consequuntur.', 'Aspernatur itaque alias quidem sit. Quia nisi alias non mollitia dicta velit. Aliquam nesciunt in sit.', '2020-02-11', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(12, 5, 'Ut doloremque nulla architecto.', 'Ratione minima consequatur est. Nisi excepturi eum asperiores.', '1974-12-10', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(13, 2, 'Eum animi accusamus id animi.', 'Quaerat quidem et voluptatem at est. Qui quibusdam veniam earum eaque omnis quidem ea. Accusamus assumenda nihil ea dolorem quis architecto pariatur.', '2016-03-09', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(14, 6, 'Maxime optio molestiae quos et.', 'Harum quo officiis nobis perspiciatis ut autem a. Labore sed est et adipisci voluptatem error. Sunt pariatur voluptatem sunt hic aut veritatis aperiam cumque. Quod vel optio eligendi eveniet.', '1980-10-23', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(15, 7, 'Aut sint ea soluta odio ratione nisi.', 'Commodi sequi nisi ex odit deserunt cupiditate omnis rerum. Sunt et et aut esse quia. Consequuntur voluptate nisi labore est harum quidem autem. Voluptatem nihil quia iure quia consequatur et maxime.', '2011-11-19', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(17, 4, 'Repellat amet recusandae aliquam doloribus illum.', 'Tenetur quaerat dolorum qui et quis dolorum officia dolor. Doloribus dolorem velit et ut. Sequi ducimus delectus aut rerum.', '1984-08-22', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(18, 1, 'Et et reprehenderit saepe aut esse provident.', 'Ad repellat possimus est sunt. Et dicta similique consequatur nam nesciunt. Alias qui architecto sit modi eveniet. Debitis natus iste nam rerum.', '2023-08-29', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 11:11:44'),
	(19, 7, 'Ducimus distinctio incidunt sed rem vero.', 'Dignissimos eaque distinctio nesciunt voluptatem. Sunt harum ea dolores fugiat.', '2002-11-27', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(20, 10, 'Non sunt officia nemo.', 'Magni laboriosam magnam dolores velit amet. Temporibus soluta molestias voluptatum doloremque voluptas illum similique. Ipsum est soluta et fuga. Quibusdam beatae placeat officiis qui et quis maxime. Non repellendus id quasi nostrum similique temporibus sed voluptatum.', '2022-03-28', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(21, 9, 'Aut distinctio vitae rem occaecati ut ab.', 'Veniam iste nisi ab et explicabo. Pariatur ab repellat voluptas aperiam quidem suscipit. Voluptate voluptatum rerum eos aut ea modi quis.', '1983-08-10', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(22, 2, 'Eos est quis et est.', 'Id et a debitis animi. Sed sint adipisci enim nemo quasi. Ipsa temporibus et molestiae cumque neque vel. Quae sunt enim quasi debitis excepturi eius eos. Eveniet quis aperiam porro.', '1992-05-31', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(23, 8, 'Maiores officia voluptate ut fugit.', 'Perspiciatis eaque sit aut ea eum. Molestiae ex officia sapiente illum. Quam dolor aut molestias aut et qui dolorem.', '1996-07-05', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(24, 10, 'Voluptatem incidunt et itaque ut dignissimos.', 'Reprehenderit ullam nobis perspiciatis sit alias laudantium voluptatem. Veniam ad ipsa sunt aut. Minus ut velit doloribus voluptas. Ut qui minima et provident quibusdam.', '2018-10-03', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(25, 9, 'Nisi dolor qui omnis.', 'Debitis temporibus ex nobis deleniti aspernatur. Optio tempora sed ad ipsam rerum incidunt dolorem.', '2016-11-21', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(26, 6, 'Corporis pariatur voluptate sunt.', 'Rem sunt illum perspiciatis est. Et reiciendis repudiandae expedita repellat odit et. Quaerat aperiam nisi qui aut.', '2023-07-14', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(27, 2, 'Beatae aliquam qui modi omnis blanditiis.', 'Pariatur non repellat quibusdam non a voluptatem. Aut occaecati enim eos ut. Reprehenderit aliquam ea qui quis ut omnis voluptas iure.', '1998-05-15', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(28, 6, 'Accusamus sunt quod ut voluptas.', 'Aliquam culpa explicabo ut minima magnam est. Tenetur molestias enim natus repudiandae. Sed id ea quis quae voluptas omnis et. Autem porro incidunt id blanditiis in et.', '1989-12-04', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(29, 3, 'Omnis est aliquid deleniti eligendi.', 'Molestiae nemo sed nam quia. Laboriosam aut dolore eos enim repudiandae aut. Enim sit non perspiciatis magnam quidem accusantium. Deserunt expedita ut aliquam quia et.', '2014-12-12', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(30, 5, 'Voluptates consequatur neque laudantium reprehenderit nihil iusto.', 'Ea quam aspernatur soluta eaque est et. Aut doloremque id ea rerum architecto corrupti. Libero veniam nisi omnis recusandae molestias reprehenderit rerum. Natus temporibus ex labore et ipsum quos.', '2014-12-17', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(31, 2, 'Voluptas est molestiae laudantium ut et dolorum.', 'Adipisci rerum aperiam et dicta maiores. Molestiae eos est animi eligendi. Aut qui nisi temporibus dolor non. Nemo numquam magni placeat.', '2021-06-09', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(32, 1, 'Veritatis illo facilis vel aut.', 'Commodi non temporibus accusantium molestias. Assumenda ab vel unde earum autem quo dolor illum. Non quaerat sint ullam eius sint vel qui. Commodi quia inventore similique officia.', '2023-08-30', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 11:11:54'),
	(33, 1, 'Inventore qui commodi non enim aspernatur.', 'Distinctio asperiores eos dolores aut velit in ut. Est aut quas ea itaque optio voluptatem. Atque ullam ab animi accusamus.', '2021-09-05', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(34, 7, 'Magni voluptate totam laudantium quia.', 'Quasi sit est rerum aperiam. Laborum nobis blanditiis in aperiam alias accusamus. Dolore reiciendis at dolor sit ut repudiandae.', '1983-02-12', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(35, 4, 'Neque est unde consequatur qui.', 'Autem minus aut et sunt doloribus. Quas magni vitae optio. Et mollitia necessitatibus ducimus quia sint.', '1971-01-10', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(36, 2, 'Deserunt qui pariatur natus optio consequatur.', 'Sed necessitatibus tempore illum. Voluptate nobis nam minus voluptatem corporis et consequuntur occaecati. Similique soluta est ab aut adipisci qui aut.', '1990-08-12', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(37, 2, 'Occaecati sint inventore dolorum quis quas aliquid.', 'Sapiente accusamus vel facilis maiores. Reiciendis est distinctio deleniti et culpa labore. Nisi non rem ea velit nobis veniam.', '1972-07-03', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(38, 10, 'Excepturi nostrum at reprehenderit.', 'Consequuntur qui tempora qui error. Vel libero sequi dolorem ipsa nostrum et sapiente voluptatem. Quo libero deserunt impedit molestias beatae rerum est accusamus. Ullam enim earum commodi expedita fuga illum.', '2008-10-27', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(39, 7, 'Ad ex magni repudiandae repellat ratione.', 'Ut nihil similique aut maiores dolor. Omnis sint quos repellat aut rerum sequi facilis. Ut impedit velit corrupti ea ut.', '2014-03-23', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(40, 4, 'Facilis sint odio quam sunt.', 'Alias maxime quia placeat nostrum recusandae beatae illum. Est perferendis magnam sed nihil rerum quos nesciunt. Ut eum sit ut sint qui. Impedit eum quidem quia rerum magni tempore praesentium facilis. Qui fugiat ratione repellat qui occaecati voluptatem voluptatibus ullam.', '2007-03-19', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(41, 4, 'Accusantium aut cupiditate sed et.', 'Cupiditate dicta praesentium voluptas illum. Accusamus modi amet voluptas omnis ea corporis similique. Eos corporis ex odio in.', '1979-01-20', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(42, 4, 'Molestiae libero sed repellat similique est nihil.', 'Ratione animi et qui magnam. Est modi voluptatem sequi et id. Sed voluptates ipsam quod at facere. Et ad consectetur in placeat praesentium.', '1971-05-28', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(43, 8, 'Dignissimos delectus quos et.', 'Dignissimos tenetur aut unde alias iusto et quia. Atque repudiandae asperiores repellendus voluptatem natus. Facere vitae laborum animi id et quia.', '1984-11-06', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(44, 8, 'Omnis pariatur voluptas omnis.', 'Sequi maiores neque eos maxime dolores nihil. Itaque sunt accusantium minus a reprehenderit est sint. Quia accusantium omnis ipsum soluta non. Voluptatem aut optio ullam ut sed numquam debitis quae.', '2018-07-06', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(45, 5, 'Impedit quam sunt est est eaque.', 'Provident suscipit nobis expedita doloribus ut nesciunt est illo. Iste minima ut suscipit aut eos quidem harum. Qui eius rerum aut cum sit rerum aut. Quia nisi repudiandae esse nihil.', '2014-12-14', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(46, 6, 'Et est ad consequatur cumque cum voluptatem blanditiis.', 'Enim et quibusdam nostrum alias dolores. Veritatis mollitia aut sapiente ut dignissimos in. Laboriosam sint maxime animi rerum laboriosam quos recusandae quisquam.', '1976-12-24', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(47, 8, 'Eum accusantium corporis eum adipisci.', 'Et nostrum aut dolore enim. Ut vero fugit debitis in vel voluptatem. Quisquam qui eos voluptate.', '1993-08-15', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(48, 1, 'Omnis sit ipsam voluptas debitis.', 'Officiis aliquid id atque voluptatem. Eos sunt at nobis voluptatem. Laboriosam eveniet impedit corrupti at optio. Omnis veritatis quo voluptas qui. Ducimus amet qui ad nesciunt eum.', '2020-08-24', 'Completed', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(49, 6, 'Amet sed laboriosam totam atque maxime.', 'Atque impedit laborum eligendi qui ipsam. Iusto consequatur perspiciatis dolorem ipsam vitae excepturi. Velit facere neque eum maiores inventore laboriosam. Aperiam nesciunt architecto atque non sit magnam enim.', '2013-08-18', 'Not Started', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(50, 4, 'Quis in officiis quia beatae atque.', 'Repellendus deleniti laudantium in. Iusto possimus eligendi quia et quod veritatis harum.', '1982-06-23', 'In Progress', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(51, 1, 'kela', 'Do modi sit ex quis', '1985-07-22', 'Not Started', '2023-08-26 11:22:39', '2023-08-26 11:22:39'),
	(52, 1, 'Velit soluta reprehe', 'Adipisicing quis des', '1978-10-04', 'Not Started', '2023-08-26 11:28:43', '2023-08-26 11:28:43');

-- Dumping structure for table personal_task_manager.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table personal_task_manager.users: ~10 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'John Doe', 'user@gmail.com', '2023-08-26 10:23:00', '$2y$10$xM.14ih5IvjBd4EdFEUc.ek9j4wGYQHdqxOKpPjXnR6bJMERvG21a', 'EVoVnYTUrg', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(2, 'Prof. Alfredo Boyer V', 'josephine.beatty@example.com', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'a6hQHvybwk', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(3, 'German Cole', 'darion38@example.org', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rSec92QwSw', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(4, 'Dillan Smitham', 'caden07@example.com', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yZaZCWMaz5', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(5, 'Telly Barrows Sr.', 'ngorczany@example.com', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PGGzCg4wo9', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(6, 'Prof. Anabelle Muller', 'hailey55@example.net', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jpo65xzp5a', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(7, 'Juvenal Grady Jr.', 'mckenzie.conor@example.org', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'oMpr677m7V', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(8, 'Jennie McDermott DVM', 'howard15@example.net', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zWirpHFRLM', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(9, 'Ms. Vickie Olson PhD', 'gkrajcik@example.net', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TbeRQOvSto', '2023-08-26 10:23:00', '2023-08-26 10:23:00'),
	(10, 'Sean Pfannerstill PhD', 'lenna91@example.net', '2023-08-26 10:23:00', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'uG4YcSVs6j', '2023-08-26 10:23:00', '2023-08-26 10:23:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
