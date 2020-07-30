-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 30, 2020 at 02:14 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dental`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `Time` varchar(100) DEFAULT NULL,
  `allDay` varchar(100) NOT NULL DEFAULT 'true',
  `request_id` int(200) NOT NULL,
  `doctor` varchar(100) DEFAULT NULL,
  `status` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `start_date`, `end_date`, `Time`, `allDay`, `request_id`, `doctor`, `status`) VALUES
(5, '2020-07-02', '2020-07-02', NULL, 'true', 4, '12', '0'),
(6, '2020-07-02', '2020-07-02', '1 : 18 AM', 'true', 5, '9', '1'),
(8, '2020-07-01', '2020-07-01', '6 : 37 PM', 'true', 7, '15', '2'),
(9, '2020-07-02', '2020-07-02', '7 : 59 PM', 'true', 8, '9', '0'),
(10, '2020-07-01', '2020-07-01', '7 : 59 PM', 'true', 9, '21', '0'),
(11, '2020-07-01', '2020-07-01', '6 : 43 PM', 'true', 10, '21', '0');

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `id` int(11) NOT NULL,
  `clinic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`id`, `clinic`) VALUES
(1, 'St. Marys Dental Clinic');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `work_id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `cadre` varchar(200) NOT NULL,
  `flag` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `work_id`, `name`, `email`, `mobile`, `cadre`, `flag`) VALUES
(2, '100109219', 'AGABA ANDREW', 'j@gmai.com', '0781781771', 'Paediatric Dentist', 1),
(9, '7281718', 'TOM LOUISE', 'a6@y.com', '0881718', 'Dental Surgeon', 1),
(12, '728171832', 'JAMES JAMESON', 'a621@y.com', '088171812', 'Dental Surgeon', 1),
(15, '7281718342', 'JAYSON', 'a621@y.com', '088171812', 'Dental Surgeon', 1),
(18, '72817183426', 'Tray', 'a621@y.com', '088171812', 'Dental Surgeon', 1),
(21, '788887', 'Teddy', '6@gmail.com', '2671671881', 'Orthodontist', 1),
(23, '787888', 'Cruise', '66@y.com', '9888778', 'Orthodontist', 1),
(25, '77617717', 'Trus', 'ty@yahoo.co.uk', '082177188', 'Paediatric Dentist', 1);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `uid` varchar(100) DEFAULT NULL,
  `apikey` varchar(100) NOT NULL,
  `eventdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `uid`, `apikey`, `eventdate`, `action`) VALUES
(2, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:35:03', 'Login'),
(3, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:37:22', 'Login'),
(4, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:37:24', 'Login'),
(5, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:39:59', 'Login'),
(6, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:40:11', 'Login'),
(7, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:52:49', 'Fecthed Requests'),
(8, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:00:40', 'Fecthed Requests'),
(9, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:01:02', 'Fecthed Requests'),
(10, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:01:16', 'Fecthed Requests'),
(11, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:01:45', 'Fecthed Requests'),
(12, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:02:48', 'Fecthed Requests'),
(13, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:04:13', 'Fecthed Requests'),
(14, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:04:23', 'Fecthed Requests'),
(15, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:05:38', 'Login'),
(16, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:06:06', 'Login'),
(17, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:12:37', 'Login'),
(18, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:14:14', 'Fecthed Requests'),
(19, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:01:48', 'Cancel Request and Delete is messages'),
(20, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:02:02', 'Cancel Request and Delete is messages'),
(21, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:02:24', 'Cancel Request and Delete is messages'),
(22, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:04:13', 'Cancel Request and Delete is messages'),
(23, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:04:39', 'Cancel Request and Delete is messages'),
(24, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:05:50', 'Cancel Request and Delete is messages'),
(25, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:06:24', 'Cancel Request and Delete is messages'),
(26, NULL, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:07:19', 'Cancel Request and Delete is messages');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `entry_id` varchar(100) DEFAULT NULL,
  `followupdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `request_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `message_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `entry_id`, `followupdate`, `request_id`, `body`, `message_id`, `name`, `mobile`, `role`) VALUES
(7, '07876554445Dental Implants,Cosmic Braces  2020-07-20', '2020-07-20 08:29:07', 5, 'I need your assistance on Dental Implants,Cosmic Braces  ', NULL, 'Humo Julius', '07876554445', 'Patient'),
(8, '07816615516Teeth Whitening,Cosmic Braces  2020-07-20', '2020-07-20 08:42:54', 6, 'I need your assistance on Teeth Whitening,Cosmic Braces  ', NULL, 'Julius', '07816615516', 'Patient'),
(9, '076721661661Dental Implants,Teeth Whitening,Cosmic Braces   2020-07-20', '2020-07-20 08:57:47', 7, 'I need your assistance on Dental Implants,Teeth Whitening,Cosmic Braces   ', NULL, 'Andres Iniesta', '076721661661', 'Patient'),
(10, '07726661551Dental Implants,Teeth Whitening,Cosmic Braces   2020-07-20', '2020-07-20 08:59:36', 8, 'I need your assistance on Dental Implants,Teeth Whitening,Cosmic Braces   ', NULL, 'Iniesta Sama', '07726661551', 'Patient'),
(11, '0776515414Teeth Whitening,Cosmic Braces  2020-07-20', '2020-07-20 09:01:24', 9, 'I need your assistance on Teeth Whitening,Cosmic Braces  ', NULL, 'Tila', '0776515414', 'Patient'),
(12, '07816161771Dental Implants,Teeth Whitening  2020-07-20', '2020-07-20 11:31:26', 10, 'I need your assistance on Dental Implants,Teeth Whitening  ', NULL, 'Wadria Derrick', '07816161771', 'Patient'),
(13, NULL, '2020-07-29 07:06:49', 5, 'Thanks For getting in touch. Kindly share the date you want to come for assistance', 7, 'St.Marys Dental Clinic', '', 'Doctor'),
(14, NULL, '2020-07-29 07:08:05', 5, '20TH August 2020 in the morning around midday', 7, 'Humo Julius', '', 'Patient'),
(15, NULL, '2020-07-29 07:19:32', 5, 'Will call you shortyly to comfirm', 7, 'St.Marys', '', 'doctor'),
(16, NULL, '2020-07-29 07:32:54', 5, 'Thanks St. marys', 7, 'Humo Julius', '', 'Patient'),
(18, NULL, '2020-07-29 07:44:37', 5, 'My pleasure', 7, 'St.Marys', '', 'Doctor'),
(19, NULL, '2020-07-29 07:45:08', 5, 'Waiting for your call', 7, 'Humo', '', 'Patient'),
(20, NULL, '2020-07-29 09:42:31', 5, 'Jesus Christ, Kindly call me back', 7, 'Super l Administrator', NULL, 'Doctor'),
(21, NULL, '2020-07-29 09:49:49', 5, 'Jesus Christ, Kindly call me back', 7, 'Super l Administrator', NULL, 'Doctor'),
(22, NULL, '2020-07-29 09:51:37', 5, 'Jesus Christ, Kindly call me back', 7, 'Super l Administrator', NULL, 'Doctor'),
(23, NULL, '2020-07-29 09:52:42', 5, 'Jesus Christ, Kindly call me back', 7, 'Super l Administrator', NULL, 'Doctor'),
(24, NULL, '2020-07-29 09:55:36', 7, 'Come on, you are silent', 9, 'Super l Administrator', NULL, 'Doctor'),
(25, NULL, '2020-07-29 19:29:56', 8, 'hi', 10, 'Super l Administrator', NULL, 'Doctor');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `clinic` varchar(300) NOT NULL,
  `doctor` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `requested_date` date DEFAULT NULL,
  `services` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `name`, `mobile`, `email`, `clinic`, `doctor`, `address`, `request_date`, `requested_date`, `services`, `remarks`, `status`) VALUES
(5, 'Humo Julius', '07876554445', 'agabaandres@gmail.com', 'St. Marys Dental Clinic', '25', '', '2020-07-20', '2020-07-01', 'Dental Implants,Cosmic Braces  ', '', 0),
(6, 'Julius', '07816615516', 'agas@gmail.com', 'St. Marys Dental Clinic', '15', '', '2020-07-20', '2020-07-02', 'Teeth Whitening,Cosmic Braces  ', '', 0),
(7, 'Andres Iniesta', '076721661661', 'iniesta@gmail.com', 'St. Marys Dental Clinic', '12', '', '2020-07-20', '2020-07-02', 'Dental Implants,Teeth Whitening,Cosmic Braces   ', '', 0),
(8, 'Iniesta Sama', '07726661551', 'sam@gmail.com', 'St. Marys Dental Clinic', '15', '', '2020-07-20', '2020-07-02', 'Dental Implants,Teeth Whitening,Cosmic Braces   ', '', 0),
(9, 'Tila', '0776515414', 'tila@tild.com', 'St. Marys Dental Clinic', '12', '', '2020-07-20', '2020-07-02', 'Teeth Whitening,Cosmic Braces  ', '', 0),
(10, 'Wadria Derrick', '07816161771', 'derick@ymail.co.uk', 'St. Marys Dental Clinic', '2', 'Kitezi', '2020-07-20', '2020-07-01', 'Dental Implants,Teeth Whitening  ', 'Coming soon', 0);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `entry_id` varchar(255) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `entry_id`, `doctor_id`, `date`) VALUES
(77, '2020-07-01-2', 2, '2020-07-01'),
(78, '2020-07-01-25', 25, '2020-07-21'),
(80, '2020-07-10-2', 2, '2020-07-19'),
(81, '2020-07-10-25', 25, '2020-07-10'),
(82, '2020-07-10-12', 12, '2020-07-10'),
(83, '2020-07-02-25', 25, '2020-07-20'),
(84, '2020-07-02-12', 12, '2020-07-22'),
(85, '2020-07-02-15', 15, '2020-08-02'),
(86, '2020-02-05-12', 12, '2020-02-05'),
(87, '2020-02-05-15', 15, '2020-02-05'),
(88, '2020-08-05-23', 23, '2020-08-05'),
(89, '2020-08-05-12', 12, '2020-08-05'),
(90, '2020-08-05-15', 15, '2020-08-05'),
(91, '2020-08-05-18', 18, '2020-08-05'),
(92, '2020-08-04-2', 2, '2020-08-04'),
(93, '2020-08-04-23', 23, '2020-08-04'),
(94, '2020-08-04-12', 12, '2020-08-04'),
(95, '2020-08-04-15', 15, '2020-08-04'),
(100, '2020-08-07-21', 21, '2020-08-07'),
(101, '2020-08-07-9', 9, '2020-08-07'),
(102, '2020-08-07-18', 18, '2020-08-07'),
(103, '2020-07-11-15', 15, '2020-07-11'),
(104, '2020-07-11-21', 21, '2020-07-11'),
(105, '2020-07-11-9', 9, '2020-07-11'),
(106, '2020-07-11-18', 18, '2020-07-11'),
(107, '2020-07-11-25', 25, '2020-07-11'),
(108, '2020-07-14-12', 12, '2020-07-14'),
(109, '2020-07-14-21', 21, '2020-07-14'),
(110, '2020-07-14-9', 9, '2020-07-14'),
(111, '2020-07-14-18', 18, '2020-07-14'),
(112, '2020-07-14-25', 25, '2020-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `img_url` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `img_url`, `description`) VALUES
(3, 'Cosmic Braces', 'https://www.news-medical.net/image.axd?picture=2017%2f9%2fshutterstock_572412436.jpg&ts=20170921022001&ri=673', 'There are several different types of dental braces'),
(4, 'Extractions', '', ''),
(5, 'Crowns', '', ''),
(6, 'Bridges', '', ''),
(7, 'Root Canal Treatment', '', ''),
(8, 'Dentures', '', ''),
(9, 'Topical Fluoride placement', '', ''),
(10, 'Sealant placement', '', ''),
(11, 'Teeth Bleaching', '', ''),
(12, 'Saliva Analysis', '', ''),
(13, 'Oral cancer screening', '', ''),
(14, 'Oral hygiene Instructions training', '', ''),
(15, 'Restorative Dentistry/ Fillings', '', ''),
(16, 'Minor Oral Surgery', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uuid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(250) NOT NULL,
  `apikey` varchar(200) DEFAULT NULL,
  `usertype` varchar(15) NOT NULL,
  `name` varchar(25) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uuid`, `username`, `password`, `apikey`, `usertype`, `name`, `created_on`, `status`) VALUES
(2, 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'Super l Administrator', '2020-05-23 18:06:01', 1),
(25, '07827817818', 'login', NULL, 'admin', 'Agaba Andrea', '2020-07-30 08:02:55', 1),
(26, '07876554445', 'd56b699830e77ba53855679cb1d252da', NULL, 'admin', 'Humo Jerry', '2020-07-30 08:02:56', 1),
(27, '07816615516', 'd56b699830e77ba53855679cb1d252da', NULL, 'Patient', 'Julius', '2020-07-30 07:59:09', 1),
(28, '076721661661', 'd56b699830e77ba53855679cb1d252da', NULL, 'Patient', 'Andres Iniesta', '2020-07-30 07:59:11', 1),
(29, '07726661551', 'd56b699830e77ba53855679cb1d252da', NULL, 'Patient', 'Iniesta Sama', '2020-07-30 07:59:12', 1),
(30, '0776515414', 'd56b699830e77ba53855679cb1d252da', NULL, 'Patient', 'Tila', '2020-07-20 09:01:24', 1),
(31, '07816161771', 'd56b699830e77ba53855679cb1d252da', NULL, 'Patient', 'Wadria Derrick', '2020-07-20 11:31:26', 1),
(32, 'agabaandre', 'd56b699830e77ba53855679cb1d252da', NULL, 'admin', 'Agaba Andrew', '2020-07-30 07:25:48', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `work_id` (`work_id`),
  ADD KEY `national_id` (`work_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entry_id` (`entry_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uuid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `apikey` (`apikey`),
  ADD KEY `username_2` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `clinic`
--
ALTER TABLE `clinic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
