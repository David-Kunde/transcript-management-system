-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2025 at 04:34 PM
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
-- Table structure for table `administrators`
--

CREATE TABLE `administrators` (
  `Admin_ID` int(11) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Permissions` varchar(255) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Last_Login` date DEFAULT NULL,
  `Is_Active` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`Admin_ID`, `Email`, `Password`, `first_name`, `middle_name`, `last_name`, `Role`, `Permissions`, `Department`, `Last_Login`, `Is_Active`) VALUES
(0, 'admin@gmail.com', '123', 'Ajayi', 'Crowther', 'samuel', NULL, NULL, NULL, '2025-03-21', 1);

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
(4, 'BIO 101', 'General Biology', 3, 'core', 'core', 'core'),
(38, 'BIO 206', 'Biostatistics I', 2, '', '', 'elective'),
(97, 'BSM 106', 'Business Mathematics II', 3, 'elective', NULL, NULL),
(5, 'CHM 101', 'General Physical Chemistry', 2, 'core', 'core', 'core'),
(6, 'CHM 141', 'First Year Practical Chemistry I', 1, 'core', 'core', 'core'),
(3, 'CMP 101', 'Introduction to Computer Science', 2, 'core', 'core', 'core'),
(16, 'CMP 102', 'Introduction to Programming', 3, 'core', 'core', 'core'),
(98, 'CMP 120', 'Digital Electronics I', 3, 'core', NULL, NULL),
(23, 'CMP 201', 'Computer Programming I', 3, 'core', 'core', 'core'),
(39, 'CMP 202', 'Computer Programming II', 3, 'core', 'core', 'elective'),
(28, 'CMP 203', 'Assembly Language', 2, 'core', 'elective', 'elective'),
(131, 'CMP 205', 'Mathematics for Computer Science', 3, 'core', NULL, NULL),
(132, 'CMP 207', 'Foundations of Sequential Program', 3, 'core', NULL, NULL),
(40, 'CMP 210', 'Data Structures', 3, 'core', 'elective', 'elective'),
(134, 'CMP 222', 'Computer Architecture and Organization I', 2, 'core', NULL, NULL),
(133, 'CMP 223', 'Computer Hardware', 3, 'core', NULL, NULL),
(58, 'CMP 264', 'System Analysis and Design', 3, 'core', '', 'core'),
(135, 'CMP 270', 'Computational Science and Numerical Methods', 3, 'core', NULL, NULL),
(137, 'CMP 311', 'Compiler Construction I', 2, 'core', NULL, NULL),
(138, 'CMP 313', 'Survey of Programming Languages', 3, 'core', NULL, NULL),
(51, 'CMP 315', 'Object Oriented Programming', 3, 'core', '', ''),
(96, 'CMP 321', 'Computer Architecture and Organization II', 2, 'core', NULL, NULL),
(139, 'CMP 331', 'Computer Networks and Communication', 3, 'core', NULL, NULL),
(140, 'CMP 333', 'Operating Systems I', 2, 'core', NULL, NULL),
(141, 'CMP 341', 'Data Management I', 2, 'core', NULL, NULL),
(142, 'CMP 360', 'SIWES', 6, 'core', NULL, NULL),
(143, 'CMP 411', 'Compiler Construction II', 2, 'elective', NULL, NULL),
(144, 'CMP 413', 'Algorithm and Complexity Analysis', 3, 'core', NULL, NULL),
(145, 'CMP 415', 'Formal Models of Computation', 2, 'core', NULL, NULL),
(146, 'CMP 431', 'Operating System II', 2, 'core', NULL, NULL),
(147, 'CMP 433', 'Net Centric Computing', 3, 'core', NULL, NULL),
(148, 'CMP 441', 'Artificial Intelligence', 2, 'core', NULL, NULL),
(151, 'CMP 442', 'Data Management II', 2, 'core', NULL, NULL),
(152, 'CMP 466', 'Human Computer Interface', 2, 'core', NULL, NULL),
(153, 'CMP 468', 'Computer Security', 2, 'core', NULL, NULL),
(154, 'CMP 472', 'Software Engineering', 3, 'core', NULL, NULL),
(156, 'CMP 474', 'Ethics and Professional Issues in Computer Science', 2, 'elective', NULL, NULL),
(149, 'CMP 491', 'Research Methodology', 2, 'core', NULL, NULL),
(155, 'CMP 492', 'Individual Project', 6, 'core', NULL, NULL),
(25, 'EPS 201', 'Entrepreneurship Studies I', 2, 'core', 'core', 'core'),
(37, 'EPS 202', 'Entrepreneurship Studies II', 2, 'gst', 'gst', 'gst'),
(45, 'EPS 301', 'Entrepreneurship Studies', 2, 'gst', 'gst', 'gst'),
(150, 'EPS 302', 'Entrepreneurship Studies II', 1, 'gst', NULL, NULL),
(136, 'GOE 204', 'Introduction to Population Geography', 3, 'elective', NULL, NULL),
(9, 'GST 111', 'Communication in English I', 2, 'gst', 'gst', 'gst'),
(10, 'GST 113', 'Nigeria People and Culture', 2, 'gst', 'gst', 'gst'),
(11, 'GST 121', 'Use of Library, Study Skills and ICT', 2, 'gst', 'gst', 'gst'),
(17, 'GST 122', 'Communication in English II', 2, 'gst', 'gst', 'gst'),
(36, 'GST 222', 'Peace Studies and Conflict Resolution', 2, 'core', 'core', 'core'),
(2, 'MTH 101', 'Elementary Mathematics I', 3, 'core', 'core', 'core'),
(18, 'MTH 102', 'Elementary Mathematics II', 3, 'core', 'core', 'elective'),
(15, 'MTH 104', 'Elementary Mathematics III', 3, 'core', 'core', 'core'),
(21, 'MTH 201', 'Mathematical Methods I', 3, 'core', 'core', 'core'),
(34, 'MTH 202', 'Introduction to Numerical Analysis', 3, 'core', 'core', 'core'),
(29, 'MTH 203', 'Sets, Logic & Algebra', 3, '', 'core', 'elective'),
(22, 'MTH 205', 'Linear Algebra I', 2, 'elective', 'core', 'core'),
(30, 'MTH 207', 'Vector Analysis', 2, '', 'core', ''),
(35, 'MTH 208', 'Elementary Differential Equations', 3, 'core', 'core', 'core'),
(49, 'MTH 313', 'Introduction to Mathematics Modeling', 3, 'elective', '', 'elective'),
(93, 'MTH 315', 'Discrete Mathematics', 4, 'elective', NULL, NULL),
(50, 'MTH 323', 'Numerical Analysis I', 3, 'core', 'core', 'elective'),
(86, 'MTH 404', 'Lebesgue Measure and Integration', 3, '', 'core', ''),
(85, 'MTH 406', 'Project', 6, '', 'core', ''),
(88, 'MTH 408', 'Numerical Analysis II', 3, '', 'elective', ''),
(87, 'MTH 410', 'Complex Analysis', 3, '', 'core', ''),
(89, 'MTH 412', 'Mathematical Methods III', 3, '', 'elective', ''),
(90, 'MTH 416', 'Measure Theory', 3, '', 'elective', ''),
(91, 'MTH 418', 'Advanced Algebra', 3, '', 'elective', ''),
(92, 'MTH 424', 'History of Mathematics', 3, '', 'elective', ''),
(7, 'PHY 101', 'Mechanics and Waves', 2, 'core', 'core', 'core'),
(19, 'PHY 102', 'Heat and Properties of Matter', 3, 'core', 'core', 'elective'),
(24, 'PHY 103', 'Electricity and Magnetism', 3, 'core', 'core', 'core'),
(8, 'PHY 105', 'Physics Laboratory I', 1, 'core', 'core', 'core'),
(99, 'PHY 108', 'Physics Laboratory II', 1, 'core', NULL, NULL),
(94, 'PHY 201', 'Elementry Modern Physics', 2, NULL, 'elective', NULL),
(95, 'PHY 205', 'Thermal Physics I', 2, NULL, 'elective', NULL),
(1, 'STA 111', 'Probability', 4, '', '', 'core'),
(12, 'STA 112', 'Statistical Inference I', 4, '', 'elective', 'core'),
(13, 'STA 114', 'Descriptive Statistics', 3, '', '', 'core'),
(14, 'STA 124', 'Statistical Computing I', 2, 'elective', NULL, 'core'),
(26, 'STA 201', 'Statistics for Physical Sciences and Engineering', 4, 'core', 'elective', 'core'),
(27, 'STA 203', 'Statistics for Agriculture & Biological Sciences', 4, '', '', 'core'),
(20, 'STA 211', 'Probability II', 4, '', 'core', 'core'),
(31, 'STA 212', 'Introduction to Social & Economic Statistics', 3, '', '', 'core'),
(32, 'STA 214', 'Statistical Computing II', 2, '', '', 'core'),
(33, 'STA 222', 'Statistical Inference II', 4, '', '', 'core'),
(59, 'STA 302', 'Sequential Methods in Statistics', 3, '', '', 'elective'),
(60, 'STA 304', 'Introduction to Econometrics', 3, '', '', 'elective'),
(41, 'STA 311', 'Probability III', 3, '', '', 'core'),
(52, 'STA 312', 'Biometric Methods', 3, '', '', 'core'),
(53, 'STA 314', 'Distribution Theory I', 3, '', '', 'core'),
(46, 'STA 315', 'Regression and Analysis of Variance I', 2, '', '', 'elective'),
(54, 'STA 318', 'Laboratory/Field Work for Survey Methods and Sampling Theory', 2, '', '', 'core'),
(42, 'STA 319', 'Statistical Inferences III', 3, '', '', 'core'),
(55, 'STA 320', 'Laboratory/Field Work on Experimental Design I', 2, '', '', 'core'),
(43, 'STA 321', 'Survey Methods and Sampling Theory', 3, '', '', 'core'),
(44, 'STA 323', 'Design and Analysis of Experiment I', 3, '', '', 'core'),
(56, 'STA 324', 'Operations Research I', 3, '', '', 'core'),
(47, 'STA 325', 'Statistical Quality Control', 3, '', '', 'elective'),
(57, 'STA 326', 'Statistical Computing III', 2, '', '', 'core'),
(48, 'STA 327', 'Demography I', 3, '', '', 'elective'),
(0, 'STA 406', 'Research Project', 6, 'core', 'core', 'core'),
(61, 'STA 411', 'Probability IV', 3, '', '', 'core'),
(62, 'STA 413', 'Time Series Analysis', 3, '', '', 'core'),
(70, 'STA 415', 'Regression and Analysis of Variance II', 4, '', '', 'elective'),
(63, 'STA 417', 'Statistical Inference IV', 3, '', '', 'core'),
(64, 'STA 419', 'Distribution Theory II', 4, '', '', 'core'),
(65, 'STA 421', 'Stochastic Processes', 3, '', '', 'core'),
(77, 'STA 422', 'Logical Background of Statistics and Decision Theory', 4, '', '', 'core'),
(76, 'STA 424', 'Sampling Techniques', 3, '', '', 'core'),
(75, 'STA 426', 'Design and Analysis of Experiments II', 3, '', '', 'core'),
(78, 'STA 440', 'Multivariate Methods', 3, '', '', 'elective'),
(66, 'STA 441', 'Multivariate Methods', 3, '', '', 'elective'),
(79, 'STA 442', 'Non-parametric Methods', 3, '', '', 'elective'),
(67, 'STA 443', 'Operations Research II', 3, '', '', 'elective'),
(80, 'STA 444', 'Econometric Methods', 3, '', '', 'elective'),
(71, 'STA 445', 'Educational Statistics', 3, '', '', 'elective'),
(68, 'STA 451', 'Biometric Method II', 3, '', '', 'elective'),
(81, 'STA 452', 'Psychomental Methods', 3, '', '', 'elective'),
(69, 'STA 453', 'Bayesian Inference and Decision Theory', 3, '', '', 'elective'),
(82, 'STA 454', 'Environmental Statistics', 3, '', '', 'elective'),
(83, 'STA 456', 'Health Statistics', 3, '', '', 'elective'),
(72, 'STA 457', 'Medical Statistics', 3, '', '', 'elective'),
(84, 'STA 458', 'Energy Statistics', 3, '', '', 'elective'),
(73, 'STA 459', 'Demography II', 3, '', '', 'elective');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `sn` int(11) NOT NULL,
  `grade_ID` varchar(50) NOT NULL,
  `student_ID` varchar(20) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `credit_units` int(11) NOT NULL,
  `score` float NOT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `grade_points` float DEFAULT NULL,
  `semester` varchar(20) DEFAULT NULL,
  `exam_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`sn`, `grade_ID`, `student_ID`, `course_code`, `credit_units`, `score`, `grade`, `grade_points`, `semester`, `exam_year`) VALUES
(233, 'BSU/SC/CMP/19/54286/BIO101/2021', 'BSU/SC/CMP/19/54286', 'BIO 101', 3, 34, 'F', 0, 'First', 2021),
(252, 'BSU/SC/CMP/19/54286/BIO101/2022', 'BSU/SC/CMP/19/54286', 'BIO 101', 3, 44, 'E', 1, 'First', 2022),
(244, 'BSU/SC/CMP/19/54286/BSM106/2021', 'BSU/SC/CMP/19/54286', 'BSM 106', 3, 65, 'B', 4, 'Second', 2021),
(234, 'BSU/SC/CMP/19/54286/CHM101/2021', 'BSU/SC/CMP/19/54286', 'CHM 101', 2, 46, 'D', 2, 'First', 2021),
(235, 'BSU/SC/CMP/19/54286/CHM141/2021', 'BSU/SC/CMP/19/54286', 'CHM 141', 1, 56, 'C', 3, 'First', 2021),
(236, 'BSU/SC/CMP/19/54286/CMP101/2021', 'BSU/SC/CMP/19/54286', 'CMP 101', 2, 57, 'C', 3, 'First', 2021),
(245, 'BSU/SC/CMP/19/54286/CMP102/2021', 'BSU/SC/CMP/19/54286', 'CMP 102', 3, 75, 'A', 5, 'Second', 2021),
(246, 'BSU/SC/CMP/19/54286/CMP120/2021', 'BSU/SC/CMP/19/54286', 'CMP 120', 3, 50, 'C', 3, 'Second', 2021),
(253, 'BSU/SC/CMP/19/54286/CMP201/2022', 'BSU/SC/CMP/19/54286', 'CMP 201', 3, 70, 'A', 5, 'First', 2022),
(260, 'BSU/SC/CMP/19/54286/CMP202/2022', 'BSU/SC/CMP/19/54286', 'CMP 202', 3, 41, 'E', 1, 'Second', 2022),
(254, 'BSU/SC/CMP/19/54286/CMP205/2022', 'BSU/SC/CMP/19/54286', 'CMP 205', 3, 64, 'B', 4, 'First', 2022),
(255, 'BSU/SC/CMP/19/54286/CMP207/2022', 'BSU/SC/CMP/19/54286', 'CMP 207', 3, 65, 'B', 4, 'First', 2022),
(261, 'BSU/SC/CMP/19/54286/CMP210/2022', 'BSU/SC/CMP/19/54286', 'CMP 210', 3, 59, 'C', 3, 'Second', 2022),
(262, 'BSU/SC/CMP/19/54286/CMP222/2022', 'BSU/SC/CMP/19/54286', 'CMP 222', 2, 28, 'F', 0, 'Second', 2022),
(286, 'BSU/SC/CMP/19/54286/CMP222/2024', 'BSU/SC/CMP/19/54286', 'CMP 222', 2, 70, 'A', 5, 'Second', 2024),
(256, 'BSU/SC/CMP/19/54286/CMP223/2022', 'BSU/SC/CMP/19/54286', 'CMP 223', 3, 51, 'C', 3, 'First', 2022),
(263, 'BSU/SC/CMP/19/54286/CMP264/2022', 'BSU/SC/CMP/19/54286', 'CMP 264', 3, 80, 'A', 5, 'Second', 2022),
(264, 'BSU/SC/CMP/19/54286/CMP270/2022', 'BSU/SC/CMP/19/54286', 'CMP 270', 3, 52, 'C', 3, 'Second', 2022),
(269, 'BSU/SC/CMP/19/54286/CMP311/2023', 'BSU/SC/CMP/19/54286', 'CMP 311', 2, 51, 'C', 3, 'First', 2023),
(270, 'BSU/SC/CMP/19/54286/CMP313/2023', 'BSU/SC/CMP/19/54286', 'CMP 313', 3, 60, 'B', 4, 'First', 2023),
(271, 'BSU/SC/CMP/19/54286/CMP315/2023', 'BSU/SC/CMP/19/54286', 'CMP 315', 3, 63, 'B', 4, 'First', 2023),
(272, 'BSU/SC/CMP/19/54286/CMP321/2023', 'BSU/SC/CMP/19/54286', 'CMP 321', 2, 33, 'F', 0, 'First', 2023),
(278, 'BSU/SC/CMP/19/54286/CMP321/2024', 'BSU/SC/CMP/19/54286', 'CMP 321', 2, 68, 'B', 4, 'First', 2024),
(273, 'BSU/SC/CMP/19/54286/CMP331/2023', 'BSU/SC/CMP/19/54286', 'CMP 331', 3, 63, 'B', 4, 'First', 2023),
(274, 'BSU/SC/CMP/19/54286/CMP333/2023', 'BSU/SC/CMP/19/54286', 'CMP 333', 2, 80, 'A', 5, 'First', 2023),
(275, 'BSU/SC/CMP/19/54286/CMP341/2023', 'BSU/SC/CMP/19/54286', 'CMP 341', 2, 70, 'A', 5, 'First', 2023),
(277, 'BSU/SC/CMP/19/54286/CMP360/2023', 'BSU/SC/CMP/19/54286', 'CMP 360', 6, 70, 'A', 5, 'Second', 2023),
(279, 'BSU/SC/CMP/19/54286/CMP411/2024', 'BSU/SC/CMP/19/54286', 'CMP 411', 2, 41, 'E', 1, 'First', 2024),
(280, 'BSU/SC/CMP/19/54286/CMP413/2024', 'BSU/SC/CMP/19/54286', 'CMP 413', 3, 70, 'A', 5, 'First', 2024),
(281, 'BSU/SC/CMP/19/54286/CMP415/2024', 'BSU/SC/CMP/19/54286', 'CMP 415', 2, 71, 'A', 5, 'First', 2024),
(282, 'BSU/SC/CMP/19/54286/CMP431/2024', 'BSU/SC/CMP/19/54286', 'CMP 431', 2, 70, 'A', 5, 'First', 2024),
(283, 'BSU/SC/CMP/19/54286/CMP433/2024', 'BSU/SC/CMP/19/54286', 'CMP 433', 3, 52, 'C', 3, 'First', 2024),
(284, 'BSU/SC/CMP/19/54286/CMP441/2024', 'BSU/SC/CMP/19/54286', 'CMP 441', 2, 73, 'A', 5, 'First', 2024),
(288, 'BSU/SC/CMP/19/54286/CMP442/2024', 'BSU/SC/CMP/19/54286', 'CMP 442', 2, 70, 'A', 5, 'Second', 2024),
(289, 'BSU/SC/CMP/19/54286/CMP466/2024', 'BSU/SC/CMP/19/54286', 'CMP 466', 2, 70, 'A', 5, 'Second', 2024),
(290, 'BSU/SC/CMP/19/54286/CMP468/2024', 'BSU/SC/CMP/19/54286', 'CMP 468', 2, 70, 'A', 5, 'Second', 2024),
(291, 'BSU/SC/CMP/19/54286/CMP472/2024', 'BSU/SC/CMP/19/54286', 'CMP 472', 3, 60, 'B', 4, 'Second', 2024),
(293, 'BSU/SC/CMP/19/54286/CMP474/2024', 'BSU/SC/CMP/19/54286', 'CMP 474', 2, 60, 'B', 4, 'Second', 2024),
(285, 'BSU/SC/CMP/19/54286/CMP491/2024', 'BSU/SC/CMP/19/54286', 'CMP 491', 2, 75, 'A', 5, 'First', 2024),
(292, 'BSU/SC/CMP/19/54286/CMP492/2024', 'BSU/SC/CMP/19/54286', 'CMP 492', 6, 60, 'B', 4, 'Second', 2024),
(257, 'BSU/SC/CMP/19/54286/EPS201/2022', 'BSU/SC/CMP/19/54286', 'EPS 201', 2, 72, 'A', 5, 'First', 2022),
(265, 'BSU/SC/CMP/19/54286/EPS202/2022', 'BSU/SC/CMP/19/54286', 'EPS 202', 2, 70, 'A', 5, 'Second', 2022),
(276, 'BSU/SC/CMP/19/54286/EPS301/2023', 'BSU/SC/CMP/19/54286', 'EPS 301', 2, 72, 'A', 5, 'First', 2023),
(287, 'BSU/SC/CMP/19/54286/EPS302/2024', 'BSU/SC/CMP/19/54286', 'EPS 302', 1, 60, 'B', 4, 'Second', 2024),
(266, 'BSU/SC/CMP/19/54286/GOE204/2022', 'BSU/SC/CMP/19/54286', 'GOE 204', 3, 57, 'C', 3, 'Second', 2022),
(237, 'BSU/SC/CMP/19/54286/GST111/2021', 'BSU/SC/CMP/19/54286', 'GST 111', 2, 67, 'B', 4, 'First', 2021),
(238, 'BSU/SC/CMP/19/54286/GST113/2021', 'BSU/SC/CMP/19/54286', 'GST 113', 2, 55, 'C', 3, 'First', 2021),
(239, 'BSU/SC/CMP/19/54286/GST121/2021', 'BSU/SC/CMP/19/54286', 'GST 121', 2, 78, 'A', 5, 'First', 2021),
(247, 'BSU/SC/CMP/19/54286/GST122/2021', 'BSU/SC/CMP/19/54286', 'GST 122', 2, 68, 'B', 4, 'Second', 2021),
(267, 'BSU/SC/CMP/19/54286/GST222/2022', 'BSU/SC/CMP/19/54286', 'GST 222', 2, 58, 'C', 3, 'Second', 2022),
(240, 'BSU/SC/CMP/19/54286/MTH101/2021', 'BSU/SC/CMP/19/54286', 'MTH 101', 3, 60, 'B', 4, 'First', 2021),
(248, 'BSU/SC/CMP/19/54286/MTH102/2021', 'BSU/SC/CMP/19/54286', 'MTH 102', 3, 52, 'C', 3, 'Second', 2021),
(249, 'BSU/SC/CMP/19/54286/MTH104/2021', 'BSU/SC/CMP/19/54286', 'MTH 104', 3, 54, 'C', 3, 'Second', 2021),
(258, 'BSU/SC/CMP/19/54286/MTH201/2022', 'BSU/SC/CMP/19/54286', 'MTH 201', 3, 55, 'C', 3, 'First', 2022),
(268, 'BSU/SC/CMP/19/54286/MTH208/2022', 'BSU/SC/CMP/19/54286', 'MTH 208', 3, 50, 'C', 3, 'Second', 2022),
(241, 'BSU/SC/CMP/19/54286/PHY101/2021', 'BSU/SC/CMP/19/54286', 'PHY 101', 2, 49, 'D', 2, 'First', 2021),
(250, 'BSU/SC/CMP/19/54286/PHY102/2021', 'BSU/SC/CMP/19/54286', 'PHY 102', 3, 53, 'C', 3, 'Second', 2021),
(242, 'BSU/SC/CMP/19/54286/PHY103/2021', 'BSU/SC/CMP/19/54286', 'PHY 103', 3, 56, 'C', 3, 'First', 2021),
(243, 'BSU/SC/CMP/19/54286/PHY105/2021', 'BSU/SC/CMP/19/54286', 'PHY 105', 1, 53, 'C', 3, 'First', 2021),
(251, 'BSU/SC/CMP/19/54286/PHY108/2021', 'BSU/SC/CMP/19/54286', 'PHY 108', 1, 49, 'D', 2, 'Second', 2021),
(259, 'BSU/SC/CMP/19/54286/STA201/2022', 'BSU/SC/CMP/19/54286', 'STA 201', 4, 60, 'B', 4, 'First', 2022);

--
-- Triggers `grades`
--
DELIMITER $$
CREATE TRIGGER `generate_grade_ID_on_insert` BEFORE INSERT ON `grades` FOR EACH ROW BEGIN
    -- Remove any spaces from student_id and course_code before concatenation
    SET NEW.grade_ID = CONCAT(
        REPLACE(NEW.student_ID, ' ', ''), 
        '/', 
        REPLACE(NEW.course_code, ' ', ''), 
        '/', 
        NEW.exam_year
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_grade_and_gpa` BEFORE INSERT ON `grades` FOR EACH ROW BEGIN
    -- Determine the grade based on the score
    IF NEW.score BETWEEN 70 AND 100 THEN
        SET NEW.grade = 'A', NEW.grade_points = 5 ;
    ELSEIF NEW.score BETWEEN 60 AND 69 THEN
        SET NEW.grade = 'B', NEW.grade_points = 4;
    ELSEIF NEW.score BETWEEN 50 AND 59 THEN
        SET NEW.grade = 'C', NEW.grade_points = 3 ;
    ELSEIF NEW.score BETWEEN 45 AND 49 THEN
        SET NEW.grade = 'D', NEW.grade_points = 2 ;
    ELSEIF NEW.score BETWEEN 40 AND 44 THEN
        SET NEW.grade = 'E', NEW.grade_points = 1 ;
    ELSE
        SET NEW.grade = 'F', NEW.grade_points = 0 ;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_semester_based_on_course` BEFORE INSERT ON `grades` FOR EACH ROW BEGIN
    DECLARE last_digit CHAR(1);

    -- Extract the last character of Course_ID
    SET last_digit = RIGHT(NEW.course_code, 1);

    -- Check if the last character is odd or even and set the semester accordingly
    IF last_digit IN ('1', '3', '5', '7', '9') THEN
        SET NEW.semester = 'First';
    ELSEIF last_digit IN ('0', '2', '4', '6', '8') THEN
        SET NEW.semester = 'Second';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_credit_units_before_insert` BEFORE INSERT ON `grades` FOR EACH ROW BEGIN
    DECLARE found_credit_units INT;
    
    -- Get credit units from courses table where course_code matches
    SELECT creditUnits INTO found_credit_units
    FROM courses
    WHERE courseCode = NEW.course_code
    LIMIT 1;
    
    -- Update the new record's credit_units with the value from courses table
    IF found_credit_units IS NOT NULL THEN
        SET NEW.credit_units = found_credit_units;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Student_ID` varchar(20) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Program` enum('BSc. Computer Science','BSc. Mathematics','BSc. Statistics') DEFAULT NULL,
  `Admission_year` int(11) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `faculty` enum('Science','Art','Social Science','LLB') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `Email`, `password`, `first_name`, `middle_name`, `last_name`, `Department`, `Program`, `Admission_year`, `Phone`, `Address`, `Status`, `date_of_birth`, `sex`, `faculty`) VALUES
('BSU/SC/CMP/19/54286', 'daniel@gmail.com', '123', 'Daniel', 'Chibuike', 'Okonkwo', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '07034567890', '15 Makurdi Road, Benue State', '', '02/03/2002', 'Male', 'Science'),
('BSU/SC/CMP/19/54321', 'timothy@gmail.com', '123', 'Timothy', 'Terungwa', 'Orhungur', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '09033641285', 'Behind dav memorial secondary school North Bank', '', '', 'Male', 'Science'),
('BSU/SC/CMP/20/54289', 'arinze@gmail.com', '123', 'Peter', 'Arinze', 'Eze', 'Mathematics and Computer Science', 'BSc. Computer Science', 2020, '08165432198', '42 High Level Road, Makurdi', '', '', 'Male', 'Science'),
('BSU/SC/CMP/21/54292', 'success@gmail.com', '123', 'Success', 'Ngozi', 'Okafor', 'Mathematics and Computer Science', 'BSc. Computer Science', 2021, '09056789012', '18 Wurukum Market Area, Makurdi', '', '', 'Male', 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `transcript_requests`
--

CREATE TABLE `transcript_requests` (
  `request_ID` int(11) NOT NULL,
  `matric_number` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `date_requested` date DEFAULT NULL,
  `date_processed` date DEFAULT NULL,
  `admin_ID` int(11) DEFAULT NULL,
  `delivery_method` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `transcript_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transcript_requests`
--

INSERT INTO `transcript_requests` (`request_ID`, `matric_number`, `email`, `status`, `date_requested`, `date_processed`, `admin_ID`, `delivery_method`, `notes`, `transcript_path`) VALUES
(1, 'BSU/SC/CMP/19/54286', 'kundedavid565@gmail.com', 'Approved', '2025-03-17', '2025-03-20', NULL, 'Dispatch', 'Request submitted successfully', ''),
(2, 'BSU/SC/MTH/19/54288', 'sam@gmail.com', 'Rejected', '2025-03-18', '2025-03-20', NULL, 'Email', 'Request submitted successfully', ''),
(3, 'BSU/SC/CMP/19/54284', 'get@gmail.com', 'Rejected', '2025-03-18', '2025-03-18', NULL, 'Pickup', 'Request submitted successfully', ''),
(4, 'BSU/SC/CMP/22/54295', 'kundwedavid565@gmail.com', 'Approved', '2025-03-18', '2025-03-18', NULL, 'Dispatch', 'Request submitted successfully', ''),
(5, 'BSU/SC/MTH/19/54283', 'kundedavirrd565@gmail.com', 'Approved', '2025-03-19', '2025-03-20', NULL, 'Email', 'Request submitted successfully', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrators`
--
ALTER TABLE `administrators`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseCode`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_ID`),
  ADD KEY `serial_no` (`sn`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `transcript_requests`
--
ALTER TABLE `transcript_requests`
  ADD PRIMARY KEY (`request_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT for table `transcript_requests`
--
ALTER TABLE `transcript_requests`
  MODIFY `request_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`);

--
-- Constraints for table `transcript_requests`
--
ALTER TABLE `transcript_requests`
  ADD CONSTRAINT `transcript_requests_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `students` (`Student_ID`),
  ADD CONSTRAINT `transcript_requests_ibfk_2` FOREIGN KEY (`Admin_ID`) REFERENCES `administrators` (`Admin_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
