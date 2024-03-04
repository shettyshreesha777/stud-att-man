-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 05:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admininfo`
--

CREATE TABLE `admininfo` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admininfo`
--

INSERT INTO `admininfo` (`username`, `password`, `email`, `fname`, `phone`, `type`) VALUES
('admin', 'admin', 'admin@admin.com', 'Admin', '12344', 'admin'),
('student', 'admin', 'student@student.com', 'Student', '+8809121', 'student'),
('teacher', 'admin', 'teacher@teacher.com', 'Teacher', '+8809121', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `stat_id` int(20) NOT NULL,
  `course` varchar(20) NOT NULL,
  `st_status` varchar(20) NOT NULL,
  `stat_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`stat_id`, `course`, `st_status`, `stat_date`) VALUES
(109, 'digital_signal_proce', 'Present', '2024-03-04'),
(110, 'digital_signal_proce', 'Absent', '2024-03-04'),
(111, 'digital_signal_proce', 'Absent', '2024-03-04'),
(112, 'digital_signal_proce', 'Present', '2024-03-04'),
(109, 'digital_signal_proce', 'Present', '2024-03-04'),
(110, 'digital_signal_proce', 'Absent', '2024-03-04'),
(111, 'digital_signal_proce', 'Absent', '2024-03-04'),
(112, 'digital_signal_proce', 'Present', '2024-03-04'),
(101, 'database_management', 'Absent', '2024-03-04'),
(102, 'database_management', 'Present', '2024-03-04'),
(103, 'database_management', 'Absent', '2024-03-04'),
(113, 'analog_electronics', 'Absent', '2024-03-04'),
(114, 'analog_electronics', 'Absent', '2024-03-04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `reports`
-- (See below for the actual view)
--
CREATE TABLE `reports` (
`st_id` int(20)
,`st_name` varchar(255)
,`st_dept` varchar(255)
,`st_batch` varchar(255)
,`stat_date` date
,`st_status` varchar(20)
,`course` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `st_id` int(20) NOT NULL,
  `st_name` varchar(255) NOT NULL,
  `st_dept` varchar(255) NOT NULL,
  `st_batch` varchar(255) NOT NULL,
  `st_sem` varchar(255) NOT NULL,
  `st_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`st_id`, `st_name`, `st_dept`, `st_batch`, `st_sem`, `st_email`) VALUES
(101, 'Amar', 'CSE', '24', 'Spring 15', 'amar@gmail.com'),
(102, 'Ankith', 'CSE', '24', 'Fall-15', 'ankith@gmail.com'),
(103, 'Shreyas', 'CSE', '24', 'Spring 153', 'shreyas@gmail.com'),
(104, 'Raju', 'CSE', '25', 'Spring 15', 'raju@gmail.com'),
(105, 'Vyshak', 'CSE', '25', 'Spring 16', 'vyshak@gmail.com'),
(106, 'Sourab', 'CSE', '25', 'Fall', 'sourabh@gmail.com'),
(107, 'Amy', 'CSE', '25', 'Fall', 'amy@gmail.com'),
(108, 'Nick', 'CSE', '25', 'Fall', 'nick@gmail.com'),
(109, 'Sam', 'EC', '24', 'Fall', 'sam@gmail.com'),
(110, 'Bob', 'EC', '24', 'Fall', 'bob@gmail.com'),
(111, 'Danny', 'EC', '24', 'Fall', 'danny@gmail.com'),
(112, 'Travis', 'EC', '24', 'Fall', 'travis@gmail.com'),
(113, 'Julie', 'EC', '25', 'Fall', 'julie@gmail.com'),
(114, 'Mary', 'EC', '25', 'Fall', 'mary@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `tc_id` int(20) NOT NULL,
  `tc_name` varchar(255) NOT NULL,
  `tc_dept` varchar(255) NOT NULL,
  `tc_email` varchar(255) NOT NULL,
  `tc_course` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`tc_id`, `tc_name`, `tc_dept`, `tc_email`, `tc_course`) VALUES
(401, 'John Smith', 'CSE', 'john@gmail.com', 'Computer Network'),
(402, 'Chris Green', 'CSE', 'chris@gmail.com', 'Software Engineering'),
(403, 'Bronny Grey', 'EC', 'bronny@city.com', 'VLSI'),
(404, 'Sheela Matthew', 'EC', 'sheela@gmail.com', 'Semiconductor');

-- --------------------------------------------------------

--
-- Structure for view `reports`
--
DROP TABLE IF EXISTS `reports`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reports`  AS SELECT `students`.`st_id` AS `st_id`, `students`.`st_name` AS `st_name`, `students`.`st_dept` AS `st_dept`, `students`.`st_batch` AS `st_batch`, `attendance`.`stat_date` AS `stat_date`, `attendance`.`st_status` AS `st_status`, `attendance`.`course` AS `course` FROM (`attendance` join `students`) WHERE `students`.`st_id` = `attendance`.`stat_id``stat_id`  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admininfo`
--
ALTER TABLE `admininfo`
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`st_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`tc_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
