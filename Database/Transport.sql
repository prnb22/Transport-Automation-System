-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 03, 2018 at 09:12 PM
-- Server version: 5.5.58-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `Transport`
--

-- --------------------------------------------------------

--
-- Table structure for table `Company`
--

CREATE TABLE IF NOT EXISTS `Company` (
  `Company_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Name` varchar(255) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Company_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `DeptInfo`
--

CREATE TABLE IF NOT EXISTS `DeptInfo` (
  `Dept_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Dept_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Dept_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Designation`
--

CREATE TABLE IF NOT EXISTS `Designation` (
  `Designation_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Designation_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`Designation_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Device`
--

CREATE TABLE IF NOT EXISTS `Device` (
  `Device_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Device_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `IMEI` bigint(20) NOT NULL,
  `Sim_Num` text NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Device_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `DriverConductor`
--

CREATE TABLE IF NOT EXISTS `DriverConductor` (
  `DriverConductor_Id` int(11) NOT NULL AUTO_INCREMENT,
  `DriverConductor_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Phone` text NOT NULL,
  `License_Num` text NOT NULL,
  `Dsignation_Id` int(11) NOT NULL,
  `Media_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`DriverConductor_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `HallInfo`
--

CREATE TABLE IF NOT EXISTS `HallInfo` (
  `Hall_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Hall_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`Hall_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Media`
--

CREATE TABLE IF NOT EXISTS `Media` (
  `Media_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Company_Id` int(11) NOT NULL,
  `Image` blob,
  `Relative_path` varchar(255) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Update_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Media_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `OfficeType`
--

CREATE TABLE IF NOT EXISTS `OfficeType` (
  `OfficeType_Id` int(11) NOT NULL AUTO_INCREMENT,
  `OfficeType_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`OfficeType_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `OtherOffice`
--

CREATE TABLE IF NOT EXISTS `OtherOffice` (
  `Office_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Office_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`Office_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Requisition`
--

CREATE TABLE IF NOT EXISTS `Requisition` (
  `Requisition_Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) NOT NULL,
  `Requisition_Start` datetime NOT NULL,
  `Requisition_End` datetime NOT NULL,
  `Vehicle_Id` int(11) NOT NULL,
  `Driver_Id` int(11) NOT NULL,
  `Conductor_Id` int(11) NOT NULL,
  `Actual_Start` datetime NOT NULL,
  `Actual_End` datetime NOT NULL,
  `Purpose` text NOT NULL,
  `Travel_Distance` double NOT NULL,
  `Requisition_Code` int(11) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Requisition_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE IF NOT EXISTS `Role` (
  `Role_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Role_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`Role_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Route`
--

CREATE TABLE IF NOT EXISTS `Route` (
  `Route_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Route_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Up_Down` varchar(255) NOT NULL,
  `From_To` varchar(255) NOT NULL,
  `Subtitle` text NOT NULL,
  `Comments` text NOT NULL,
  `Route_Map_Id` int(11) NOT NULL,
  `Media_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Route_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE IF NOT EXISTS `Schedule` (
  `Schedule_Id` int(11) NOT NULL AUTO_INCREMENT,
  `ScheduleType_Id` int(11) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Time` time NOT NULL,
  `Type_Id` int(11) NOT NULL,
  `Category_Id` int(11) NOT NULL,
  `Route_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Schedule_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ScheduleType`
--

CREATE TABLE IF NOT EXISTS `ScheduleType` (
  `ScheduleType_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Schedule_Type` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`ScheduleType_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE IF NOT EXISTS `Student` (
  `Student_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Hall_Id` int(11) NOT NULL,
  `Session` text NOT NULL,
  `Reg_No` int(11) NOT NULL,
  `Dept_Id` int(11) NOT NULL,
  `Email` text NOT NULL,
  `Phone` text NOT NULL,
  `Media_id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Student_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `TeacherStaff`
--

CREATE TABLE IF NOT EXISTS `TeacherStaff` (
  `TeacherStaff_Id` int(11) NOT NULL AUTO_INCREMENT,
  `TeacherStaff_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `OfficeType_Id` int(11) NOT NULL,
  `Office_Id` int(11) NOT NULL,
  `Designation_Id` int(11) NOT NULL,
  `Email` text NOT NULL,
  `Phone` text NOT NULL,
  `Media_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`TeacherStaff_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Track`
--

CREATE TABLE IF NOT EXISTS `Track` (
  `Track_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Device_Id` int(11) NOT NULL,
  `Time` time NOT NULL,
  `Latitude` double NOT NULL,
  `Longitude` double NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Track_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Trip`
--

CREATE TABLE IF NOT EXISTS `Trip` (
  `Trip_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Trip_Date` date NOT NULL,
  `Schedule_Id` int(11) NOT NULL,
  `Vehicle_Id` int(11) NOT NULL,
  `Driver_Id` int(11) NOT NULL,
  `Conductor_Id` int(11) NOT NULL,
  `End_Time` time NOT NULL,
  `Trip_Code` int(11) DEFAULT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Trip_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserType_Id` int(11) NOT NULL,
  `UserMeta_Id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Password` text NOT NULL,
  `Media_Id` int(11) NOT NULL,
  `Role_Id` int(11) NOT NULL,
  `Reset_Token` enum('0','1') NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`User_Id`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `UserFavourite`
--

CREATE TABLE IF NOT EXISTS `UserFavourite` (
  `UserFavourite_Id` int(11) NOT NULL AUTO_INCREMENT,
  `User_Id` int(11) NOT NULL,
  `Route_Id` int(11) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`UserFavourite_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `UserType`
--

CREATE TABLE IF NOT EXISTS `UserType` (
  `UserType_Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserType_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Update_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`UserType_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Vehicle`
--

CREATE TABLE IF NOT EXISTS `Vehicle` (
  `Vehicle_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Vehicle_Num` text NOT NULL,
  `VehicleType_Id` int(11) NOT NULL,
  `Device_Id` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Fitness_Deadline` date NOT NULL,
  `Maker` text NOT NULL,
  `Media_Id` int(11) NOT NULL,
  `Vehicle_Status` enum('0','1') NOT NULL,
  `Chesis_Num` text NOT NULL,
  `Engine_Num` text NOT NULL,
  `Make_Year` date NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`Vehicle_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VehicleCategory`
--

CREATE TABLE IF NOT EXISTS `VehicleCategory` (
  `Category_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Category_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','3') NOT NULL,
  PRIMARY KEY (`Category_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `VehicleType`
--

CREATE TABLE IF NOT EXISTS `VehicleType` (
  `VehicleType_Id` int(11) NOT NULL AUTO_INCREMENT,
  `VehicleType_Name` varchar(255) NOT NULL,
  `Company_Id` int(11) NOT NULL,
  `Ac_Nonac` enum('0','1') NOT NULL,
  `Base_Price` double NOT NULL,
  `Per_kilorate` double NOT NULL,
  `Haltage_Price_Per_Hour` double NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Updated_at` timestamp NULL DEFAULT NULL,
  `Deleted_at` timestamp NULL DEFAULT NULL,
  `Status` enum('0','1','2') NOT NULL,
  PRIMARY KEY (`VehicleType_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
