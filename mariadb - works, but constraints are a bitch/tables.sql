CREATE TABLE `course` (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `course_title` varchar(100) NOT NULL,
  `course_brief` varchar(100) NOT NULL,
  `num_of_chapters` bigint(11) UNSIGNED NOT NULL,
  INDEX `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `instructor` (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` blob NOT NULL,
  `introduction_brief` varchar(200) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `registration_date` date NOT NULL,
  `published_courses` bigint(11) NOT NULL,
  `enrolled-students` bigint(11) NOT NULL,
  `rating` bigint(11) NOT NULL,
  `num_of_ratings` bigint(11) NOT NULL,
  INDEX `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `course_chapter` (
    `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `chapter_title` varchar(100) NOT NULL,
  `chapter_reading` bigint(11) NOT NULL,
  `chapter_video` bigint(11) NOT NULL,
  `chapter_assignment` bigint(11) NOT NULL,
  `required_time` bigint(11) NOT NULL,
  INDEX `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `course_chapter_content` (
    `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `mandatory` tinyint(1) NOT NULL DEFAULT 0,
  INDEX `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `enrollment` (
`id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`enrollment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `feedback` (
`id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
`rating` bigint(11) NOT NULL,
`feedback` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `progress` (
    `id` bigint(11) UNSIGNED NOT NULL  AUTO_INCREMENT PRIMARY KEY,
  `start_time_log` date NOT NULL,
  `complete_time_log` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `students` (
    `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `first_name` varchar(50) NULL,
  `last_name` varchar(50) NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `courses_enrolled` bigint(11) NOT NULL,
  `courses_complete` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `registration_date` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
