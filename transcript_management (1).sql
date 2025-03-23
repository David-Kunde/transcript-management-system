-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2025 at 01:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transcript_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `Admin_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Permissions` varchar(255) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` int(11) NOT NULL,
  `courseCode` varchar(10) NOT NULL,
  `courseTitle` varchar(255) NOT NULL,
  `creditUnits` int(11) NOT NULL,
  `course_type_for_computer` enum('core','elective','gst') DEFAULT NULL,
  `course_type_for_mathematics` enum('core','elective','gst') DEFAULT NULL,
  `course_type_for_statistics` enum('core','elective','gst') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseID`, `courseCode`, `courseTitle`, `creditUnits`, `course_type_for_computer`, `course_type_for_mathematics`, `course_type_for_statistics`) VALUES
(0, 'STA 406', 'Research Project', 6, 'core', 'core', 'core'),
(1, 'STA 111', 'Probability', 4, '', '', 'core'),
(2, 'MTH 101', 'Elementary Mathematics I', 3, 'core', 'core', 'core'),
(3, 'CMP 101', 'Introduction to Computer Science', 2, 'core', 'core', 'core'),
(4, 'BIO 101', 'General Biology', 3, 'core', 'core', 'core'),
(5, 'CHM 101', 'General Physical Chemistry', 2, 'core', 'core', 'core'),
(6, 'CHM 141', 'First Year Practical Chemistry I', 1, 'core', 'core', 'core'),
(7, 'PHY 101', 'Mechanics and Waves', 2, 'core', 'core', 'core'),
(8, 'PHY 105', 'Physics Laboratory I', 1, 'core', 'core', 'core'),
(9, 'GST 111', 'Communication in English I', 2, 'gst', 'gst', 'gst'),
(10, 'GST 113', 'Nigeria People and Culture', 2, 'gst', 'gst', 'gst'),
(11, 'GST 121', 'Use of Library, Study Skills and ICT', 2, 'gst', 'gst', 'gst'),
(12, 'STA 112', 'Statistical Inference I', 4, '', 'elective', 'core'),
(13, 'STA 114', 'Descriptive Statistics', 3, '', '', 'core'),
(14, 'STA 124', 'Statistical Computing I', 2, 'elective', NULL, 'core'),
(15, 'MTH 104', 'Elementary Mathematics III', 3, 'core', 'core', 'core'),
(16, 'CMP 102', 'Introduction to Programming', 3, 'core', 'core', 'core'),
(17, 'GST 122', 'Communication in English II', 2, 'gst', 'gst', 'gst'),
(18, 'MTH 102', 'Elementary Mathematics II', 3, 'core', 'core', 'elective'),
(19, 'PHY 102', 'Heat and Properties of Matter', 3, 'core', 'core', 'elective'),
(20, 'STA 211', 'Probability II', 4, '', 'core', 'core'),
(21, 'MTH 201', 'Mathematical Methods I', 3, 'core', 'core', 'core'),
(22, 'MTH 205', 'Linear Algebra I', 2, 'elective', 'core', 'core'),
(23, 'CMP 201', 'Computer Programming I', 3, 'core', 'core', 'core'),
(24, 'PHY 103', 'Electricity and Magnetism', 3, 'core', 'core', 'core'),
(25, 'EPS 201', 'Entrepreneurship Studies I', 2, 'core', 'core', 'core'),
(26, 'STA 201', 'Statistics for Physical Sciences and Engineering', 4, 'core', 'elective', 'core'),
(27, 'STA 203', 'Statistics for Agriculture & Biological Sciences', 4, '', '', 'core'),
(28, 'CMP 203', 'Assembly Language', 2, 'core', 'elective', 'elective'),
(29, 'MTH 203', 'Sets, Logic & Algebra', 3, '', 'core', 'elective'),
(30, 'MTH 207', 'Vector Analysis', 2, '', 'core', ''),
(31, 'STA 212', 'Introduction to Social & Economic Statistics', 3, '', '', 'core'),
(32, 'STA 214', 'Statistical Computing II', 2, '', '', 'core'),
(33, 'STA 222', 'Statistical Inference II', 4, '', '', 'core'),
(34, 'MTH 202', 'Introduction to Numerical Analysis', 3, 'core', 'core', 'core'),
(35, 'MTH 208', 'Elementary Differential Equations', 3, 'core', 'core', 'core'),
(36, 'GST 222', 'Peace Studies and Conflict Resolution', 2, 'core', 'core', 'core'),
(37, 'EPS 202', 'Entrepreneurship Studies II', 2, 'gst', 'gst', 'gst'),
(38, 'BIO 206', 'Biostatistics I', 2, '', '', 'elective'),
(39, 'CMP 202', 'Computer Programming II', 3, 'core', 'core', 'elective'),
(40, 'CMP 210', 'Data Structures', 3, 'core', 'elective', 'elective'),
(41, 'STA 311', 'Probability III', 3, '', '', 'core'),
(42, 'STA 319', 'Statistical Inferences III', 3, '', '', 'core'),
(43, 'STA 321', 'Survey Methods and Sampling Theory', 3, '', '', 'core'),
(44, 'STA 323', 'Design and Analysis of Experiment I', 3, '', '', 'core'),
(45, 'EPS 301', 'Entrepreneurship Studies', 2, 'gst', 'gst', 'gst'),
(46, 'STA 315', 'Regression and Analysis of Variance I', 2, '', '', 'elective'),
(47, 'STA 325', 'Statistical Quality Control', 3, '', '', 'elective'),
(48, 'STA 327', 'Demography I', 3, '', '', 'elective'),
(49, 'MTH 313', 'Introduction to Mathematics Modeling', 3, 'elective', '', 'elective'),
(50, 'MTH 323', 'Numerical Analysis I', 3, 'core', 'core', 'elective'),
(51, 'CMP 315', 'Object Oriented Programming', 3, 'core', '', ''),
(52, 'STA 312', 'Biometric Methods', 3, '', '', 'core'),
(53, 'STA 314', 'Distribution Theory I', 3, '', '', 'core'),
(54, 'STA 318', 'Laboratory/Field Work for Survey Methods and Sampling Theory', 2, '', '', 'core'),
(55, 'STA 320', 'Laboratory/Field Work on Experimental Design I', 2, '', '', 'core'),
(56, 'STA 324', 'Operations Research I', 3, '', '', 'core'),
(57, 'STA 326', 'Statistical Computing III', 2, '', '', 'core'),
(58, 'CMP 264', 'System Analysis and Design', 3, 'core', '', 'core'),
(59, 'STA 302', 'Sequential Methods in Statistics', 3, '', '', 'elective'),
(60, 'STA 304', 'Introduction to Econometrics', 3, '', '', 'elective'),
(61, 'STA 411', 'Probability IV', 3, '', '', 'core'),
(62, 'STA 413', 'Time Series Analysis', 3, '', '', 'core'),
(63, 'STA 417', 'Statistical Inference IV', 3, '', '', 'core'),
(64, 'STA 419', 'Distribution Theory II', 4, '', '', 'core'),
(65, 'STA 421', 'Stochastic Processes', 3, '', '', 'core'),
(66, 'STA 441', 'Multivariate Methods', 3, '', '', 'elective'),
(67, 'STA 443', 'Operations Research II', 3, '', '', 'elective'),
(68, 'STA 451', 'Biometric Method II', 3, '', '', 'elective'),
(69, 'STA 453', 'Bayesian Inference and Decision Theory', 3, '', '', 'elective'),
(70, 'STA 415', 'Regression and Analysis of Variance II', 4, '', '', 'elective'),
(71, 'STA 445', 'Educational Statistics', 3, '', '', 'elective'),
(72, 'STA 457', 'Medical Statistics', 3, '', '', 'elective'),
(73, 'STA 459', 'Demography II', 3, '', '', 'elective'),
(75, 'STA 426', 'Design and Analysis of Experiments II', 3, '', '', 'core'),
(76, 'STA 424', 'Sampling Techniques', 3, '', '', 'core'),
(77, 'STA 422', 'Logical Background of Statistics and Decision Theory', 4, '', '', 'core'),
(78, 'STA 440', 'Multivariate Methods', 3, '', '', 'elective'),
(79, 'STA 442', 'Non-parametric Methods', 3, '', '', 'elective'),
(80, 'STA 444', 'Econometric Methods', 3, '', '', 'elective'),
(81, 'STA 452', 'Psychomental Methods', 3, '', '', 'elective'),
(82, 'STA 454', 'Environmental Statistics', 3, '', '', 'elective'),
(83, 'STA 456', 'Health Statistics', 3, '', '', 'elective'),
(84, 'STA 458', 'Energy Statistics', 3, '', '', 'elective'),
(85, 'MTH 406', 'Project', 6, '', 'core', ''),
(86, 'MTH 404', 'Lebesgue Measure and Integration', 3, '', 'core', ''),
(87, 'MTH 410', 'Complex Analysis', 3, '', 'core', ''),
(88, 'MTH 408', 'Numerical Analysis II', 3, '', 'elective', ''),
(89, 'MTH 412', 'Mathematical Methods III', 3, '', 'elective', ''),
(90, 'MTH 416', 'Measure Theory', 3, '', 'elective', ''),
(91, 'MTH 418', 'Advanced Algebra', 3, '', 'elective', ''),
(92, 'MTH 424', 'History of Mathematics', 3, '', 'elective', ''),
(93, 'MTH 315', 'Discrete Mathematics', 4, 'elective', NULL, NULL),
(94, 'PHY 201', 'Elementry Modern Physics', 2, NULL, 'elective', NULL),
(95, 'PHY 205', 'Thermal Physics I', 2, NULL, 'elective', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `sn` int(11) NOT NULL,
  `grade_id` varchar(50) NOT NULL,
  `Student_ID` varchar(20) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `Score` float NOT NULL,
  `Grade` varchar(5) DEFAULT NULL,
  `GPA_Points` float DEFAULT NULL,
  `Semester` varchar(20) DEFAULT NULL,
  `Year` int(11) NOT NULL,
  `Date_Recorded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`sn`, `grade_id`, `Student_ID`, `course_code`, `Score`, `Grade`, `GPA_Points`, `Semester`, `Year`, `Date_Recorded`) VALUES
(1, 'BSU/SC/CMP/19/54286_CMP101_2022', 'BSU/SC/CMP/19/54286', 'CMP101', 85, 'A', 5, 'First', 2022, '2022-06-10'),
(2, 'BSU/SC/CMP/19/54286_CMP203_2022', 'BSU/SC/CMP/19/54286', 'CMP203', 91, 'A', 5, 'First', 2022, '2022-11-18'),
(3, 'BSU/SC/CMP/19/54286_CMP264_2022', 'BSU/SC/CMP/19/54286', 'CMP264', 93, 'A', 5, 'Second', 2022, '2022-06-10'),
(4, 'BSU/SC/CMP/19/54286_CMP301_2023', 'BSU/SC/CMP/19/54286', 'CMP301', 79, 'A', 5, 'First', 2023, '2023-06-12'),
(5, 'BSU/SC/CMP/19/54286_CMP310_2023', 'BSU/SC/CMP/19/54286', 'CMP310', 88, 'A', 5, 'Second', 2023, '2023-06-12'),
(6, 'BSU/SC/CMP/19/54286_CMP315_2024', 'BSU/SC/CMP/19/54286', 'CMP315', 85, 'A', 5, 'First', 2024, '2024-06-14'),
(7, 'BSU/SC/CMP/19/54286_CMP318_2024', 'BSU/SC/CMP/19/54286', 'CMP318', 92, 'A', 5, 'Second', 2024, '2024-11-24'),
(8, 'BSU/SC/CMP/19/54286_CMP405_2023', 'BSU/SC/CMP/19/54286', 'CMP405', 55, 'C', 3, 'First', 2023, '2023-06-12'),
(9, 'BSU/SC/CMP/19/54286_CMP411_2023', 'BSU/SC/CMP/19/54286', 'CMP411', 73, 'A', 5, 'First', 2023, '2023-11-22'),
(10, 'BSU/SC/CMP/19/54286_CMP417_2024', 'BSU/SC/CMP/19/54286', 'CMP417', 83, 'A', 5, 'First', 2024, '2024-06-14'),
(11, 'BSU/SC/CMP/19/54286_CMP430_2024', 'BSU/SC/CMP/19/54286', 'CMP430', 94, 'A', 5, 'Second', 2024, '2024-11-24'),
(12, 'BSU/SC/CMP/19/54286_CMP450_2024', 'BSU/SC/CMP/19/54286', 'CMP450', 89, 'A', 5, 'Second', 2024, '2024-06-14'),
(13, 'BSU/SC/CMP/19/54286_CMP452_2024', 'BSU/SC/CMP/19/54286', 'CMP452', 79, 'A', 5, 'Second', 2024, '2024-11-24'),
(14, 'BSU/SC/CMP/19/54286_CMP454_2025', 'BSU/SC/CMP/19/54286', 'CMP454', 95, 'A', 5, 'Second', 2025, '2025-06-12'),
(15, 'BSU/SC/CMP/19/54286_CMP460_2025', 'BSU/SC/CMP/19/54286', 'CMP460', 87, 'A', 5, 'Second', 2025, '2025-06-12'),
(16, 'BSU/SC/CMP/19/54286_CMP470_2025', 'BSU/SC/CMP/19/54286', 'CMP470', 66, 'B', 4, 'Second', 2025, '2025-11-19'),
(17, 'BSU/SC/CMP/19/54286_CMP499_2025', 'BSU/SC/CMP/19/54286', 'CMP499', 92, 'A', 5, 'First', 2025, '2025-11-19'),
(18, 'BSU/SC/CMP/19/54286_GST111_2022', 'BSU/SC/CMP/19/54286', 'GST111', 69, 'B', 4, 'First', 2022, '2022-06-10'),
(19, 'BSU/SC/CMP/19/54286_GST113_2021', 'BSU/SC/CMP/19/54286', 'GST113', 88, 'A', 5, 'First', 2021, '2021-06-15'),
(20, 'BSU/SC/CMP/19/54286_GST122_2021', 'BSU/SC/CMP/19/54286', 'GST122', 76, 'A', 5, 'Second', 2021, '2021-11-20'),
(21, 'BSU/SC/CMP/19/54286_GST222_2023', 'BSU/SC/CMP/19/54286', 'GST222', 72, 'A', 5, 'Second', 2023, '2023-11-22'),
(22, 'BSU/SC/CMP/19/54286_MTH201_2022', 'BSU/SC/CMP/19/54286', 'MTH201', 41, 'E', 1, 'First', 2022, '2022-11-18'),
(23, 'BSU/SC/CMP/19/54286_MTH202_2022', 'BSU/SC/CMP/19/54286', 'MTH202', 58, 'C', 3, 'Second', 2022, '2022-11-18'),
(24, 'BSU/SC/CMP/19/54286_MTH206_2023', 'BSU/SC/CMP/19/54286', 'MTH206', 67, 'B', 4, 'Second', 2023, '2023-06-12'),
(25, 'BSU/SC/CMP/19/54286_MTH208_2021', 'BSU/SC/CMP/19/54286', 'MTH208', 84, 'A', 5, 'Second', 2021, '2021-11-20'),
(26, 'BSU/SC/CMP/19/54286_MTH405_2024', 'BSU/SC/CMP/19/54286', 'MTH405', 90, 'A', 5, 'First', 2024, '2024-06-14'),
(27, 'BSU/SC/CMP/19/54286_STA111_2022', 'BSU/SC/CMP/19/54286', 'STA111', 97, 'A', 5, 'First', 2022, '2022-06-10'),
(28, 'BSU/SC/CMP/19/54286_STA112_2022', 'BSU/SC/CMP/19/54286', 'STA112', 74, 'A', 5, 'Second', 2022, '2022-06-10'),
(29, 'BSU/SC/CMP/19/54286_STA124_2021', 'BSU/SC/CMP/19/54286', 'STA124', 63, 'B', 4, 'Second', 2021, '2021-06-15'),
(30, 'BSU/SC/CMP/19/54286_STA201_2021', 'BSU/SC/CMP/19/54286', 'STA201', 70, 'A', 5, 'First', 2021, '2021-06-15'),
(31, 'BSU/SC/CMP/19/54286_STA208_2024', 'BSU/SC/CMP/19/54286', 'STA208', 77, 'A', 5, 'Second', 2024, '2024-11-24'),
(32, 'BSU/SC/CMP/19/54286_STA306_2024', 'BSU/SC/CMP/19/54286', 'STA306', 62, 'B', 4, 'Second', 2024, '2024-06-14'),
(33, 'BSU/SC/CMP/19/54286_STA312_2022', 'BSU/SC/CMP/19/54286', 'STA312', 65, 'B', 4, 'Second', 2022, '2022-11-18'),
(34, 'BSU/SC/CMP/19/54286_STA321_2022', 'BSU/SC/CMP/19/54286', 'STA321', 72, 'A', 5, 'First', 2022, '2022-06-10'),
(35, 'BSU/SC/CMP/19/54286_STA401_2023', 'BSU/SC/CMP/19/54286', 'STA401', 81, 'A', 5, 'First', 2023, '2023-11-22'),
(36, 'BSU/SC/CMP/19/54286_STA412_2024', 'BSU/SC/CMP/19/54286', 'STA412', 68, 'B', 4, 'Second', 2024, '2024-11-24'),
(37, 'BSU/SC/CMP/19/54286_STA413_2024', 'BSU/SC/CMP/19/54286', 'STA413', 80, 'A', 5, 'First', 2024, '2024-11-24'),
(38, 'BSU/SC/CMP/19/54286_STA414_2023', 'BSU/SC/CMP/19/54286', 'STA414', 66, 'B', 4, 'Second', 2023, '2023-11-22'),
(39, 'BSU/SC/CMP/19/54286_STA415_2024', 'BSU/SC/CMP/19/54286', 'STA415', 60, 'B', 4, 'First', 2024, '2024-06-14'),
(40, 'BSU/SC/CMP/19/54286_STA416_2024', 'BSU/SC/CMP/19/54286', 'STA416', 79, 'A', 5, 'Second', 2024, '2024-06-14'),
(41, 'BSU/SC/CMP/19/54286_STA426_2021', 'BSU/SC/CMP/19/54286', 'STA426', 75, 'A', 5, 'Second', 2021, '2021-11-20'),
(42, 'BSU/SC/CMP/19/54286_STA430_2025', 'BSU/SC/CMP/19/54286', 'STA430', 82, 'A', 5, 'Second', 2025, '2025-06-12'),
(43, 'BSU/SC/CMP/19/54286_STA431_2024', 'BSU/SC/CMP/19/54286', 'STA431', 56, 'C', 3, 'First', 2024, '2024-11-24'),
(44, 'BSU/SC/CMP/19/54286_STA432_2025', 'BSU/SC/CMP/19/54286', 'STA432', 78, 'A', 5, 'Second', 2025, '2025-11-19'),
(109, 'BSU/SC/MTH/19/54288_GST 111_2021', 'BSU/SC/MTH/19/54288', 'GST 111', 62, 'B', 4, 'First', 2021, '2021-09-30'),
(110, 'BSU/SC/MTH/19/54288_GST 113_2021', 'BSU/SC/MTH/19/54288', 'GST 113', 58, 'C', 3, 'First', 2021, '2021-09-30'),
(111, 'BSU/SC/MTH/19/54288_GST 121_2021', 'BSU/SC/MTH/19/54288', 'GST 121', 55, 'C', 3, 'First', 2021, '2021-09-30'),
(112, 'BSU/SC/MTH/19/54288_GST 122_2021', 'BSU/SC/MTH/19/54288', 'GST 122', 57, 'C', 3, 'Second', 2021, '2021-09-30'),
(103, 'BSU/SC/MTH/19/54288_MTH 101_2021', 'BSU/SC/MTH/19/54288', 'MTH 101', 58, 'C', 3, 'First', 2021, '2021-09-30'),
(104, 'BSU/SC/MTH/19/54288_MTH 102_2021', 'BSU/SC/MTH/19/54288', 'MTH 102', 62, 'B', 4, 'Second', 2021, '2021-09-30'),
(105, 'BSU/SC/MTH/19/54288_MTH 104_2021', 'BSU/SC/MTH/19/54288', 'MTH 104', 55, 'C', 3, 'Second', 2021, '2021-09-30'),
(113, 'BSU/SC/MTH/19/54288_MTH 201_2022', 'BSU/SC/MTH/19/54288', 'MTH 201', 60, 'B', 4, 'First', 2022, '2022-09-30'),
(114, 'BSU/SC/MTH/19/54288_MTH 202_2022', 'BSU/SC/MTH/19/54288', 'MTH 202', 53, 'C', 3, 'Second', 2022, '2022-09-30'),
(115, 'BSU/SC/MTH/19/54288_MTH 203_2022', 'BSU/SC/MTH/19/54288', 'MTH 203', 57, 'C', 3, 'First', 2022, '2022-09-30'),
(116, 'BSU/SC/MTH/19/54288_MTH 205_2022', 'BSU/SC/MTH/19/54288', 'MTH 205', 63, 'B', 4, 'First', 2022, '2022-09-30'),
(117, 'BSU/SC/MTH/19/54288_MTH 207_2022', 'BSU/SC/MTH/19/54288', 'MTH 207', 52, 'C', 3, 'First', 2022, '2022-09-30'),
(118, 'BSU/SC/MTH/19/54288_MTH 208_2022', 'BSU/SC/MTH/19/54288', 'MTH 208', 59, 'C', 3, 'Second', 2022, '2022-09-30'),
(123, 'BSU/SC/MTH/19/54288_MTH 313_2023', 'BSU/SC/MTH/19/54288', 'MTH 313', 61, 'B', 4, 'First', 2023, '2023-09-30'),
(124, 'BSU/SC/MTH/19/54288_MTH 315_2023', 'BSU/SC/MTH/19/54288', 'MTH 315', 55, 'C', 3, 'First', 2023, '2023-09-30'),
(125, 'BSU/SC/MTH/19/54288_MTH 323_2023', 'BSU/SC/MTH/19/54288', 'MTH 323', 60, 'B', 4, 'First', 2023, '2023-09-30'),
(126, 'BSU/SC/MTH/19/54288_MTH 324_2023', 'BSU/SC/MTH/19/54288', 'MTH 324', 58, 'C', 3, 'Second', 2023, '2023-09-30'),
(133, 'BSU/SC/MTH/19/54288_MTH 404_2024', 'BSU/SC/MTH/19/54288', 'MTH 404', 57, 'C', 3, 'Second', 2024, '2024-09-30'),
(134, 'BSU/SC/MTH/19/54288_MTH 406_2024', 'BSU/SC/MTH/19/54288', 'MTH 406', 56, 'C', 3, 'Second', 2024, '2024-09-30'),
(135, 'BSU/SC/MTH/19/54288_MTH 408_2024', 'BSU/SC/MTH/19/54288', 'MTH 408', 62, 'B', 4, 'Second', 2024, '2024-09-30'),
(136, 'BSU/SC/MTH/19/54288_MTH 410_2024', 'BSU/SC/MTH/19/54288', 'MTH 410', 61, 'B', 4, 'Second', 2024, '2024-09-30'),
(137, 'BSU/SC/MTH/19/54288_MTH 412_2024', 'BSU/SC/MTH/19/54288', 'MTH 412', 54, 'C', 3, 'Second', 2024, '2024-09-30'),
(138, 'BSU/SC/MTH/19/54288_MTH 416_2024', 'BSU/SC/MTH/19/54288', 'MTH 416', 58, 'C', 3, 'Second', 2024, '2024-09-30'),
(139, 'BSU/SC/MTH/19/54288_MTH 418_2024', 'BSU/SC/MTH/19/54288', 'MTH 418', 63, 'B', 4, 'Second', 2024, '2024-09-30'),
(140, 'BSU/SC/MTH/19/54288_MTH 424_2024', 'BSU/SC/MTH/19/54288', 'MTH 424', 60, 'B', 4, 'Second', 2024, '2024-09-30'),
(106, 'BSU/SC/MTH/19/54288_STA 111_2021', 'BSU/SC/MTH/19/54288', 'STA 111', 59, 'C', 3, 'First', 2021, '2021-09-30'),
(107, 'BSU/SC/MTH/19/54288_STA 112_2021', 'BSU/SC/MTH/19/54288', 'STA 112', 55, 'C', 3, 'Second', 2021, '2021-09-30'),
(108, 'BSU/SC/MTH/19/54288_STA 114_2021', 'BSU/SC/MTH/19/54288', 'STA 114', 61, 'B', 4, 'Second', 2021, '2021-09-30'),
(119, 'BSU/SC/MTH/19/54288_STA 124_2022', 'BSU/SC/MTH/19/54288', 'STA 124', 52, 'C', 3, 'Second', 2022, '2022-09-30'),
(120, 'BSU/SC/MTH/19/54288_STA 201_2022', 'BSU/SC/MTH/19/54288', 'STA 201', 57, 'C', 3, 'First', 2022, '2022-09-30'),
(121, 'BSU/SC/MTH/19/54288_STA 211_2022', 'BSU/SC/MTH/19/54288', 'STA 211', 58, 'C', 3, 'First', 2022, '2022-09-30'),
(122, 'BSU/SC/MTH/19/54288_STA 212_2022', 'BSU/SC/MTH/19/54288', 'STA 212', 60, 'B', 4, 'Second', 2022, '2022-09-30'),
(127, 'BSU/SC/MTH/19/54288_STA 214_2023', 'BSU/SC/MTH/19/54288', 'STA 214', 59, 'C', 3, 'Second', 2023, '2023-09-30'),
(128, 'BSU/SC/MTH/19/54288_STA 222_2023', 'BSU/SC/MTH/19/54288', 'STA 222', 62, 'B', 4, 'Second', 2023, '2023-09-30'),
(129, 'BSU/SC/MTH/19/54288_STA 311_2023', 'BSU/SC/MTH/19/54288', 'STA 311', 55, 'C', 3, 'First', 2023, '2023-09-30'),
(130, 'BSU/SC/MTH/19/54288_STA 312_2023', 'BSU/SC/MTH/19/54288', 'STA 312', 56, 'C', 3, 'Second', 2023, '2023-09-30'),
(131, 'BSU/SC/MTH/19/54288_STA 314_2023', 'BSU/SC/MTH/19/54288', 'STA 314', 61, 'B', 4, 'Second', 2023, '2023-09-30'),
(132, 'BSU/SC/MTH/19/54288_STA 318_2023', 'BSU/SC/MTH/19/54288', 'STA 318', 53, 'C', 3, 'Second', 2023, '2023-09-30'),
(141, 'BSU/SC/MTH/19/54288_STA 417_2024', 'BSU/SC/MTH/19/54288', 'STA 417', 61, 'B', 4, 'First', 2024, '2024-09-30'),
(142, 'BSU/SC/MTH/19/54288_STA 419_2024', 'BSU/SC/MTH/19/54288', 'STA 419', 60, 'B', 4, 'First', 2024, '2024-09-30'),
(143, 'BSU/SC/MTH/19/54288_STA 421_2024', 'BSU/SC/MTH/19/54288', 'STA 421', 52, 'C', 3, 'First', 2024, '2024-09-30'),
(144, 'BSU/SC/MTH/19/54288_STA 422_2024', 'BSU/SC/MTH/19/54288', 'STA 422', 59, 'C', 3, 'Second', 2024, '2024-09-30'),
(145, 'BSU/SC/MTH/19/54288_STA 424_2024', 'BSU/SC/MTH/19/54288', 'STA 424', 58, 'C', 3, 'Second', 2024, '2024-09-30'),
(146, 'BSU/SC/MTH/19/54288_STA 426_2024', 'BSU/SC/MTH/19/54288', 'STA 426', 62, 'B', 4, 'Second', 2024, '2024-09-30'),
(147, 'BSU/SC/MTH/19/54288_STA 441_2024', 'BSU/SC/MTH/19/54288', 'STA 441', 55, 'C', 3, 'First', 2024, '2024-09-30'),
(148, 'BSU/SC/MTH/19/54288_STA 443_2024', 'BSU/SC/MTH/19/54288', 'STA 443', 56, 'C', 3, 'First', 2024, '2024-09-30'),
(149, 'BSU/SC/MTH/19/54288_STA 445_2024', 'BSU/SC/MTH/19/54288', 'STA 445', 61, 'B', 4, 'First', 2024, '2024-09-30'),
(150, 'BSU/SC/MTH/19/54288_STA 451_2024', 'BSU/SC/MTH/19/54288', 'STA 451', 57, 'C', 3, 'First', 2024, '2024-09-30'),
(151, 'BSU/SC/MTH/19/54288_STA 453_2024', 'BSU/SC/MTH/19/54288', 'STA 453', 58, 'C', 3, 'First', 2024, '2024-09-30'),
(152, 'BSU/SC/MTH/19/54288_STA 457_2024', 'BSU/SC/MTH/19/54288', 'STA 457', 60, 'B', 4, 'First', 2024, '2024-09-30');

--
-- Triggers `grade`
--
DELIMITER $$
CREATE TRIGGER `before_insert_grade` BEFORE INSERT ON `grade` FOR EACH ROW BEGIN
    SET NEW.grade_id = CONCAT(NEW.student_id, '_', NEW.course_code, '_', NEW.year);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_grade_and_gpa` BEFORE INSERT ON `grade` FOR EACH ROW BEGIN
    -- Determine the grade based on the score
    IF NEW.Score BETWEEN 70 AND 100 THEN
        SET NEW.Grade = 'A', NEW.GPA_Points = 5;
    ELSEIF NEW.Score BETWEEN 60 AND 69 THEN
        SET NEW.Grade = 'B', NEW.GPA_Points = 4;
    ELSEIF NEW.Score BETWEEN 50 AND 59 THEN
        SET NEW.Grade = 'C', NEW.GPA_Points = 3;
    ELSEIF NEW.Score BETWEEN 45 AND 49 THEN
        SET NEW.Grade = 'D', NEW.GPA_Points = 2;
    ELSEIF NEW.Score BETWEEN 40 AND 44 THEN
        SET NEW.Grade = 'E', NEW.GPA_Points = 1;
    ELSE
        SET NEW.Grade = 'F', NEW.GPA_Points = 0;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_semester_based_on_course` BEFORE INSERT ON `grade` FOR EACH ROW BEGIN
    DECLARE last_digit CHAR(1);

    -- Extract the last character of Course_ID
    SET last_digit = RIGHT(NEW.course_code, 1);

    -- Check if the last character is odd or even and set the semester accordingly
    IF last_digit IN ('1', '3', '5', '7', '9') THEN
        SET NEW.Semester = 'First';
    ELSEIF last_digit IN ('0', '2', '4', '6', '8') THEN
        SET NEW.Semester = 'Second';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Admission_year` int(11) DEFAULT NULL,
  `Program` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `Department`, `Admission_year`, `Program`, `Email`, `Phone`, `Address`, `Status`) VALUES
('BSU/SC/CMP/19/54286', 'Chibuike Okonkwo', 'Mathematics and Computer Science', 2019, 'BSc. Computer Science', 'chibuikeokonkwo21@bsumail.edu.ng', '07034567890', '15 Makurdi Road, Benue State', 'Graduated'),
('BSU/SC/CMP/20/54289', 'Chinedu Eze', 'Mathematics and Computer Science', 2020, 'BSc. Computer Science', 'chinedueze12@bsumail.edu.ng', '08165432198', '42 High Level Road, Makurdi', 'Student'),
('BSU/SC/CMP/21/54292', 'Ngozi Okafor', 'Mathematics and Computer Science', 2021, 'BSc. Computer Science', 'ngoziokafor33@bsumail.edu.ng', '09056789012', '18 Wurukum Market Area, Makurdi', 'Student'),
('BSU/SC/CMP/22/54295', 'Tunde Bakare', 'Mathematics and Computer Science', 2022, 'BSc. Computer Science', 'tundebakare45@bsumail.edu.ng', '08134567890', '27 Judges Quarters, Makurdi', 'Student'),
('BSU/SC/MTH/19/54288', 'Oluwaseun Adeyemi', 'Mathematics and Computer Science', 2019, 'BSc. Mathematics', 'oluwaseunadeyemi5@bsumail.edu.ng', '09087654321', '23 University Road, Makurdi', 'Student'),
('BSU/SC/MTH/20/54291', 'Ibrahim Abubakar', 'Mathematics and Computer Science', 2020, 'BSc. Mathematics', 'ibrahimabubakar@bsumail.edu.ng', '08176543210', '5 Modern Market Road, Makurdi', 'Student'),
('BSU/SC/MTH/21/54294', 'Halima Mohammed', 'Mathematics and Computer Science', 2021, 'BSc. Mathematics', 'halimamohammed@bsumail.edu.ng', '07062345678', '9 Logo Road, Makurdi', 'Student'),
('BSU/SC/STA/19/54287', 'Adaobi Nwachukwu', 'Mathematics and Computer Science', 2019, 'BSc. Statistics', 'adaobinwachukwu@bsumail.edu.ng', '08123456789', '7 Gboko Street, Makurdi', 'Graduated'),
('BSU/SC/STA/20/54290', 'Funmilayo Ogunlade', 'Mathematics and Computer Science', 2020, 'BSc. Statistics', 'funmilayoogunlade7@bsumail.edu.ng', '07098765432', '10 North Bank Area, Makurdi', 'Student'),
('BSU/SC/STA/21/54293', 'Emeka Nnamdi', 'Mathematics and Computer Science', 2021, 'BSc. Statistics', 'emekannamdi101@bsumail.edu.ng', '08187654321', '32 Nyiman Layout, Makurdi', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `transcript_request`
--

CREATE TABLE `transcript_request` (
  `Request_ID` int(11) NOT NULL,
  `Student_ID` varchar(20) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Date_Requested` date DEFAULT NULL,
  `Date_Processed` date DEFAULT NULL,
  `Admin_ID` int(11) DEFAULT NULL,
  `Purpose` varchar(100) DEFAULT NULL,
  `Format` varchar(50) DEFAULT NULL,
  `Delivery_Method` varchar(50) DEFAULT NULL,
  `Additional_Notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `userType` enum('student','admin','','') NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) DEFAULT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Password_Hash` varchar(255) NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT current_timestamp(),
  `Last_Login` timestamp NULL DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `userType`, `First_Name`, `Middle_Name`, `Last_Name`, `Email`, `Phone_Number`, `Password_Hash`, `Created_At`, `Last_Login`, `Is_Active`) VALUES
(26, 'student', 'David', '', 'Kunde', 'kundedavid565@gmail.com', '09075037519', '$2y$10$JXWs0VcAvb5Pya8cmKKP8u1Ht9iTSkmZQLsIMTbbDuw2hHKsQ2X3i', '2025-03-01 12:23:59', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`grade_id`),
  ADD UNIQUE KEY `Course_ID` (`course_code`),
  ADD KEY `serial_no` (`sn`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `transcript_request`
--
ALTER TABLE `transcript_request`
  ADD PRIMARY KEY (`Request_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transcript_request`
--
ALTER TABLE `transcript_request`
  ADD CONSTRAINT `transcript_request_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `transcript_request_ibfk_2` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
