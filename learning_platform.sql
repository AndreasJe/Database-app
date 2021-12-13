-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 12. 12 2021 kl. 23:19:41
-- Serverversion: 10.4.21-MariaDB
-- PHP-version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learning_platform`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `course`
--

CREATE TABLE `course` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `course_title` varchar(100) NOT NULL,
  `course_brief` varchar(100) NOT NULL,
  `instructor_id` bigint(11) NOT NULL,
  `num_of_chapters` bigint(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `instructor` (
  `id` bigint(11) UNSIGNED NOT NULL,
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
  PRIMARY KEY (`id`),
  INDEX `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE 'course'
  ADD CONSTRAINT FOREIGN KEY (instructor_id) REFERENCES instructor (id);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `course_chapter`
--

CREATE TABLE `course_chapter` (
    `id` bigint(11) UNSIGNED NOT NULL,
  `course_id` bigint(11) NOT NULL,
  `chapter_title` varchar(100) NOT NULL,
  `chapter_reading` bigint(11) NOT NULL,
  `chapter_video` bigint(11) NOT NULL,
  `chapter_assignment` bigint(11) NOT NULL,
  `required_time` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `course_chapter_content`
--

CREATE TABLE `course_chapter_content` (
    `id` bigint(11) UNSIGNED NOT NULL,
  `course_chapter_id` bigint(11) NOT NULL,
  `mandatory` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `enrollment`
--

CREATE TABLE `enrollment` (
    `id` bigint(11) UNSIGNED NOT NULL,
  `course_id` bigint(11) NOT NULL,
  `student_id` bigint(11) NOT NULL,
  `enrollment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `feedback`
--

CREATE TABLE `feedback` (
    `id` bigint(11) UNSIGNED NOT NULL,
  `enrollment_id` bigint(11) NOT NULL,
  `rating` bigint(11) NOT NULL,
  `feedback` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `instructor`
--
-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `progress`
--

CREATE TABLE `progress` (
    `id` bigint(11) UNSIGNED NOT NULL,
  `enrollment_id` bigint(11) NOT NULL,
  `course_chapter_id` bigint(11) NOT NULL,
  `start_time_log` date NOT NULL,
  `complete_time_log` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `students`
--

CREATE TABLE `students` (
    `id` bigint(11) UNSIGNED NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `courses_enrolled` bigint(11) NOT NULL,
  `courses_complete` bigint(11) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `registration_date` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`),
  ADD CONSTRAINT FOREIGN KEY (instructor_id) REFERENCES instructor (id) ON DELETE CASCADE ON UPDATE RESTRICT
;
--
-- Indeks for tabel `course_chapter`
--
ALTER TABLE `course_chapter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`),
  ADD CONSTRAINT FOREIGN KEY (course_id) REFERENCES course (id);

--
-- Indeks for tabel `course_chapter_content`
--
ALTER TABLE `course_chapter_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`),
  ADD CONSTRAINT FOREIGN KEY (id) REFERENCES course_chapter (id);

--
-- Indeks for tabel `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`),
  ADD CONSTRAINT FOREIGN KEY (id) REFERENCES course (id),
  ADD CONSTRAINT FOREIGN KEY (id2) REFERENCES student (id);

--
-- Indeks for tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`);

--
-- Indeks for tabel `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`);

--
-- Indeks for tabel `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`);

--
-- Indeks for tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
    INDEX `id` (`id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `course`
--
ALTER TABLE `course`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `course_chapter`
--
ALTER TABLE `course_chapter`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `course_chapter_content`
--
ALTER TABLE `course_chapter_content`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `instructor`
--
ALTER TABLE `instructor`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `progress`
--
ALTER TABLE `progress`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tilføj AUTO_INCREMENT i tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
