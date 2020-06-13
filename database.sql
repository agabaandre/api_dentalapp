-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 13, 2020 at 02:28 AM
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
(1, 'CM871819191', 'Sam Agaba', 'agabaandre@gmail.com', '0778787889', 'Dental Surgeon', 1),
(2, 'CM8718191916', 'Nkuke Henry', '', '077878789', 'Dental Surgeon', 1),
(3, 'e89929829', 'Dembe Denis', '', '078378299281', 'Dental Surgeon', 1),
(4, '77277718', 'Jimmy Carter', '', '07877787887', 'Dental Surgeon', 1),
(5, '213123YY37817', 'Asiimwe Gordon', '', '07817817981', 'Dental Surgeon', 1),
(14, '077727', 'Prince James', 'princonn@yahoo.com', '07787878554', 'Dental Assistant', 1),
(15, '065677', 'kizito James', 'kizitoconn@yahoo.com', '0778787800', 'Dental Assistant', 1),
(16, '0887565577', 'Dedio James', 'kizitocos@yahoo.com', '0778767486500', 'Dental Assistant', 1);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `apikey` varchar(100) NOT NULL,
  `eventdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `action` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `apikey`, `eventdate`, `action`) VALUES
(1, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 03:31:21', 'Login'),
(2, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:35:03', 'Login'),
(3, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:37:22', 'Login'),
(4, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:37:24', 'Login'),
(5, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:39:59', 'Login'),
(6, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:40:11', 'Login'),
(7, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 11:52:49', 'Fecthed Requests'),
(8, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:00:40', 'Fecthed Requests'),
(9, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:01:02', 'Fecthed Requests'),
(10, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:01:16', 'Fecthed Requests'),
(11, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:01:45', 'Fecthed Requests'),
(12, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:02:48', 'Fecthed Requests'),
(13, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:04:13', 'Fecthed Requests'),
(14, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 12:04:23', 'Fecthed Requests'),
(15, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:05:38', 'Login'),
(16, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:06:06', 'Login'),
(17, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:12:37', 'Login'),
(18, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 18:14:14', 'Fecthed Requests'),
(19, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:01:48', 'Cancel Request and Delete is messages'),
(20, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:02:02', 'Cancel Request and Delete is messages'),
(21, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:02:24', 'Cancel Request and Delete is messages'),
(22, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:04:13', 'Cancel Request and Delete is messages'),
(23, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:04:39', 'Cancel Request and Delete is messages'),
(24, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:05:50', 'Cancel Request and Delete is messages'),
(25, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:06:24', 'Cancel Request and Delete is messages'),
(26, '21232f297a57a5a743894a0e4a801fc3', '2020-05-23 19:07:19', 'Cancel Request and Delete is messages');

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
  `mobile` varchar(15) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `entry_id`, `followupdate`, `request_id`, `body`, `message_id`, `name`, `mobile`, `role`) VALUES
(1, NULL, '2020-05-23 13:17:38', 1, 'Tooth alignment, tooth whitening', NULL, 'Agaba Andrew', '0702787688', 'Patient'),
(2, NULL, '2020-05-23 09:33:44', 1, 'Thanks for get in touch with, we shall give you a call shortly to comfirm', 1, 'Gordon Asiimwe', '', 'Doctor'),
(3, NULL, '2020-05-23 10:35:53', 4, 'Need Help with Enamel Coating', NULL, 'Dembe Denis', '', 'Patient'),
(4, NULL, '2020-05-23 10:36:20', 4, 'Thanks Denis, we will call you shortly', 3, 'Dr. Godwin', '', 'Admin'),
(5, NULL, '2020-05-23 10:36:26', 1, 'Hope the service was satisfactory', 1, 'Dr. Godwin', '', 'Doctor'),
(6, NULL, '2020-05-23 11:15:00', 4, 'Dembe, how Enamel Coating holding', 3, 'Dr. Birungi Deus', '', 'Doctor'),
(21, NULL, '2020-05-23 17:45:03', 21, 'I need your help on Tooth Removal, Whitening, Cementing', NULL, 'Kiyingi Chris 07877261881', '', 'Patient'),
(25, '07877261881Tooth Removal, Whitening, Cementing2020-05-23', '2020-05-23 17:55:51', 25, 'I need your assistance on Tooth Removal, Whitening, Cementing', NULL, 'Kiyingi Chris', '07877261881', 'Patient');

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
  `doctor` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `request_date` date DEFAULT NULL,
  `requested_date` datetime DEFAULT NULL,
  `services` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `name`, `mobile`, `email`, `clinic`, `doctor`, `address`, `request_date`, `requested_date`, `services`, `remarks`, `status`) VALUES
(1, 'Nkuke Henry', '0785677181', 'henricsanyu@gmail.com', 'ST. MARYS', 1, 'KYEBANDO NSOBA', '2020-05-23', '2020-05-25 03:08:43', 'Dental cleaning, Cementing', 'Thanks', 0),
(2, 'Agaba Andrew', '0702787688', 'agabaandre@gmail.com', 'St.Marys', 4, 'Kampala', '2020-05-22', '2020-05-30 05:35:07', 'Teeth Whitening', 'Call me to comfirm', 1),
(3, 'Dembe Denis', '07829928199', NULL, ' Kitezi HCIII', 3, 'Kampala', '2020-05-23', '2020-05-29 00:00:00', 'Tooth Removal, Whitening, Cementing', 'Call Me', 0),
(4, 'Dembe Denis', '07829928199', 'dembe@gmail.com', ' Kitezi HCIII', 3, 'Kampala', '2020-05-23', '2020-05-29 00:00:00', 'Tooth Removal, Whitening, Cementing', 'Call Me', 0),
(5, 'Luck Jim', '07899928199', 'Jim@gmail.com', ' Kitezi HCIII', 2, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'Call Me', 0),
(6, 'Luck Jim', '07899928199', 'Jim@gmail.com', ' Kitezi HCIII', 2, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'Call Me', 0),
(7, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(8, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(9, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(10, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(11, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(12, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(14, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(15, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(16, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(17, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(18, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(19, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(20, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(21, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(22, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(23, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(24, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(25, 'Kiyingi Chris', '07877261881', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 0),
(26, 'Data Chris', '078772618764', 'chris@gmail.com', ' Kitezi HCIII', 5, 'Kampala', '2020-05-23', '2020-05-24 00:00:00', 'Tooth Removal, Whitening, Cementing', 'In Pain', 3);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `doctor_id`, `date`) VALUES
(1, 1, '2020-05-25'),
(2, 1, '2020-05-26'),
(3, 2, '2020-05-25');

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
(1, 'Dental Implants', '', NULL),
(2, 'Teeth Whitening', '', NULL),
(3, 'Cosmic Braces', '', NULL);

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
(4, '0702787688', 'd56b699830e77ba53855679cb1d252da', NULL, 'patient', 'Test', '2020-05-23 12:57:34', 1),
(5, 'test2@system.com', 'd56b699830e77ba53855679cb1d252da', NULL, 'doctor', 'Test2', '2020-05-23 12:34:19', 1),
(12, '07787878554', 'd56b699830e77ba53855679cb1d252da', NULL, 'Doctor', 'Prince James', '2020-05-23 16:29:54', 1),
(13, '0778787800', 'd56b699830e77ba53855679cb1d252da', NULL, 'Doctor', 'kizito James', '2020-05-23 16:31:55', 1),
(18, '07877261881', 'd56b699830e77ba53855679cb1d252da', NULL, 'Patient', 'Kiyingi Chris', '2020-05-23 17:55:51', 1),
(19, '078772618764', 'd56b699830e77ba53855679cb1d252da', NULL, 'Patient', 'Data Chris', '2020-05-23 18:13:48', 1),
(20, '0778767486500', 'd56b699830e77ba53855679cb1d252da', NULL, 'Doctor', 'Dedio James', '2020-05-23 18:18:23', 1);

--
-- Indexes for dumped tables
--

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
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
