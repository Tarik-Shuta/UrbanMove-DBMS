-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2025 at 06:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `urbanmove`
--

-- --------------------------------------------------------

--
-- Table structure for table `defect`
--

CREATE TABLE `defect` (
  `DefectID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `TypeOfDefect` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ServiceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `defect`
--

INSERT INTO `defect` (`DefectID`, `Date`, `TypeOfDefect`, `Description`, `ServiceID`) VALUES
(1, '2025-03-31', 'Brake Issue', 'Rear brake not responsive', 1);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Coordinates` varchar(100) DEFAULT NULL,
  `DateOfVisit` date DEFAULT NULL,
  `ScooterID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`LocationID`, `Address`, `Coordinates`, `DateOfVisit`, `ScooterID`) VALUES
(1, '789 Scooter St', '37.7749,-122.4194', '2025-04-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(11) NOT NULL,
  `DateOfPayment` date DEFAULT NULL,
  `TypeOfService` varchar(100) DEFAULT NULL,
  `TypeOfPayment` varchar(100) DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `PriceIncrease` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `DateOfPayment`, `TypeOfService`, `TypeOfPayment`, `Amount`, `Discount`, `PriceIncrease`) VALUES
(1, '2025-04-01', 'Rental', 'Credit Card', 20, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `RatingID` int(11) NOT NULL,
  `PenaltyPoints` int(11) DEFAULT NULL,
  `AwardPoints` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`RatingID`, `PenaltyPoints`, `AwardPoints`) VALUES
(1, 2, 10),
(2, 0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `RecordID` int(11) NOT NULL,
  `CreatedAt` date DEFAULT NULL,
  `UpdatedAt` date DEFAULT NULL,
  `CurrentState` varchar(100) DEFAULT NULL,
  `ServiceID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`RecordID`, `CreatedAt`, `UpdatedAt`, `CurrentState`, `ServiceID`) VALUES
(1, '2025-03-01', '2025-03-05', 'OK', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL,
  `ReservationDate` date DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ScooterID` int(11) DEFAULT NULL,
  `PaymentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ReservationID`, `ReservationDate`, `ExpirationDate`, `Status`, `Cost`, `UserID`, `ScooterID`, `PaymentID`) VALUES
(1, '2025-04-03', '2025-04-04', 'Confirmed', 18, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ridehistory`
--

CREATE TABLE `ridehistory` (
  `RideID` int(11) NOT NULL,
  `LastService` date DEFAULT NULL,
  `NoPenalty` tinyint(1) DEFAULT NULL,
  `ReservationID` int(11) DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ridehistory`
--

INSERT INTO `ridehistory` (`RideID`, `LastService`, `NoPenalty`, `ReservationID`, `RecordID`) VALUES
(1, '2025-04-02', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `UserType` varchar(100) DEFAULT NULL,
  `Privilege` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `UserType`, `Privilege`) VALUES
(1, 'Customer', 1),
(2, 'Admin', 10);

-- --------------------------------------------------------

--
-- Table structure for table `scooter`
--

CREATE TABLE `scooter` (
  `ScooterID` int(11) NOT NULL,
  `Manufacturer` varchar(100) DEFAULT NULL,
  `Mark` varchar(100) DEFAULT NULL,
  `Warranty` date DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `CurrentLocation` varchar(200) DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scooter`
--

INSERT INTO `scooter` (`ScooterID`, `Manufacturer`, `Mark`, `Warranty`, `Status`, `Cost`, `CurrentLocation`, `RecordID`) VALUES
(1, 'Xiaomi', 'M365', '2026-12-31', 'Available', 350, 'Station A', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `TypeOfService` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Cost` double DEFAULT NULL,
  `RecordID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`ServiceID`, `Date`, `TypeOfService`, `Description`, `Cost`, `RecordID`, `UserID`) VALUES
(1, '2025-04-01', 'Maintenance', 'Battery check and brake tune-up', 15, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Surname` varchar(100) DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `PhoneNumber` varchar(20) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `NumberOfDrivingLiscense` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `RatingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `Surname`, `DateOfBirth`, `PhoneNumber`, `Address`, `Email`, `Username`, `Password`, `NumberOfDrivingLiscense`, `RoleID`, `RatingID`) VALUES
(1, 'John', 'Doe', '1995-06-15', '1234567890', '123 Main St', 'john@example.com', 'johnny', 'pass123', 9988, 1, 1),
(2, 'Alice', 'Smith', '1990-02-10', '0987654321', '456 Park Ave', 'alice@example.com', 'alice90', 'securepass', 8877, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `defect`
--
ALTER TABLE `defect`
  ADD PRIMARY KEY (`DefectID`),
  ADD KEY `ServiceID` (`ServiceID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`LocationID`),
  ADD KEY `ScooterID` (`ScooterID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`RecordID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ScooterID` (`ScooterID`),
  ADD KEY `PaymentID` (`PaymentID`),
  ADD KEY `idx_reservation_status` (`Status`);

--
-- Indexes for table `ridehistory`
--
ALTER TABLE `ridehistory`
  ADD PRIMARY KEY (`RideID`),
  ADD KEY `ReservationID` (`ReservationID`),
  ADD KEY `RecordID` (`RecordID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `scooter`
--
ALTER TABLE `scooter`
  ADD PRIMARY KEY (`ScooterID`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `idx_scooter_status` (`Status`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`ServiceID`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `RatingID` (`RatingID`),
  ADD KEY `idx_user_email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `defect`
--
ALTER TABLE `defect`
  MODIFY `DefectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `RatingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ridehistory`
--
ALTER TABLE `ridehistory`
  MODIFY `RideID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `scooter`
--
ALTER TABLE `scooter`
  MODIFY `ScooterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `defect`
--
ALTER TABLE `defect`
  ADD CONSTRAINT `defect_ibfk_1` FOREIGN KEY (`ServiceID`) REFERENCES `service` (`ServiceID`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`ScooterID`) REFERENCES `scooter` (`ScooterID`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`ScooterID`) REFERENCES `scooter` (`ScooterID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`PaymentID`) REFERENCES `payment` (`PaymentID`);

--
-- Constraints for table `ridehistory`
--
ALTER TABLE `ridehistory`
  ADD CONSTRAINT `ridehistory_ibfk_1` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`),
  ADD CONSTRAINT `ridehistory_ibfk_2` FOREIGN KEY (`RecordID`) REFERENCES `record` (`RecordID`);

--
-- Constraints for table `scooter`
--
ALTER TABLE `scooter`
  ADD CONSTRAINT `scooter_ibfk_1` FOREIGN KEY (`RecordID`) REFERENCES `record` (`RecordID`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`RecordID`) REFERENCES `record` (`RecordID`),
  ADD CONSTRAINT `service_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`RatingID`) REFERENCES `rating` (`RatingID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
