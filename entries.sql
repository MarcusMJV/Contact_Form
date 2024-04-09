-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2024 at 08:43 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `technical_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `entries`
--

INSERT INTO `entries` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`) VALUES
(3, 'John Doe', 'john@example.com', '+27 11 555 1234', 'Lorem ipsum dolor sit amet', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(4, 'Jane Smith', 'jane@example.com', '+27 21 444 5678', 'Consectetur adipiscing elit', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(5, 'Alice Johnson', 'alice@example.com', '+27 31 333 9012', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(6, 'Bob Brown', 'bob@example.com', '+27 41 222 3456', 'Ut enim ad minim veniam', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(7, 'Emma Davis', 'emma@example.com', '+27 51 111 7890', 'Quis nostrud exercitation ullamco', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(8, 'Michael Wilson', 'michael@example.com', '+27 61 999 4321', 'Laboris nisi ut aliquip ex ea commodo consequat', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(9, 'Sophia Taylor', 'sophia@example.com', '+27 71 888 7654', 'Duis aute irure dolor in reprehenderit', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(10, 'William Anderson', 'william@example.com', '+27 81 777 0987', 'Excepteur sint occaecat cupidatat non proident', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(11, 'Olivia Martinez', 'olivia@example.com', '+27 91 666 2345', 'Sunt in culpa qui officia deserunt mollit anim id est laborum', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(12, 'James Garcia', 'james@example.com', '+27 10 444 5678', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '2024-04-09 06:21:36', '2024-04-09 06:21:36'),
(16, 'Marcus Vorster', 'vorstermarcus@gmail.com', '+27721912086', 'Testing Testing', '2024-04-09 06:42:56', '2024-04-09 06:42:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `entries`
--
ALTER TABLE `entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
