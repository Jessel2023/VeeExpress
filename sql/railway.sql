-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 03:17 AM
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
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `TicketID` int(20) NOT NULL,
  `TrainNumber` int(11) NOT NULL,
  `TrainDate` date NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `ReservationStatus` varchar(20) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trainavailability`
--x

CREATE TABLE `trainavailability` (
  `TrainAvailabilityID` int(11) NOT NULL,
  `TrainNumber` int(11) DEFAULT NULL,
  `Weekday` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `trainlist`
--

CREATE TABLE `trainlist` (
  `TrainNumber` int(11) NOT NULL,
  `TrainName` varchar(50) DEFAULT NULL,
  `Source` varchar(50) DEFAULT NULL,
  `Destination` varchar(50) DEFAULT NULL,
  `AC_Fare` decimal(10,2) DEFAULT NULL,
  `General_Fare` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `train_status`
--

CREATE TABLE `train_status` (
  `TrainStatusID` int(11) NOT NULL,
  `TrainNumber` int(11) DEFAULT NULL,
  `TrainDate` date DEFAULT NULL,
  `Total_ACSeats` int(11) DEFAULT NULL,
  `B_ACSeats` int(11) DEFAULT NULL,
  `TotalGeneralSeats` int(11) DEFAULT NULL,
  `B_GeneralSeats` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_member`
--
ALTER TABLE `tbl_member`
  ADD PRIMARY KEY (`id`);
--
-- Indexes for dumped tables
--

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`TicketID`),
  ADD KEY `TrainNumber` (`TrainNumber`);

--
-- Indexes for table `trainavailability`
--
ALTER TABLE `trainavailability`
  ADD PRIMARY KEY (`TrainAvailabilityID`),
  ADD KEY `TrainNumber` (`TrainNumber`);

--
-- Indexes for table `trainlist`
--
ALTER TABLE `trainlist`
  ADD PRIMARY KEY (`TrainNumber`);

--
-- Indexes for table `train_status`
--
ALTER TABLE `train_status`
  ADD PRIMARY KEY (`TrainStatusID`),
  ADD KEY `TrainNumber` (`TrainNumber`);

--
-- AUTO_INCREMENT for dumped tables
--
ALTER TABLE `tbl_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `TicketID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainavailability`
--
ALTER TABLE `trainavailability`
  MODIFY `TrainAvailabilityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `train_status`
--
ALTER TABLE `train_status`
  MODIFY `TrainStatusID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`TrainNumber`) REFERENCES `trainlist` (`TrainNumber`);

--
-- Constraints for table `trainavailability`
--
ALTER TABLE `trainavailability`
  ADD CONSTRAINT `trainavailability_ibfk_1` FOREIGN KEY (`TrainNumber`) REFERENCES `trainlist` (`TrainNumber`);

--
-- Constraints for table `train_status`
--
ALTER TABLE `train_status`
  ADD CONSTRAINT `train_status_ibfk_1` FOREIGN KEY (`TrainNumber`) REFERENCES `trainlist` (`TrainNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
