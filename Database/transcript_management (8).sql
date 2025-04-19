-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2025 at 07:17 PM
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
(0, 'admin@gmail.com', '123', 'Ajayi', 'Crowther', 'samuel', NULL, NULL, NULL, '2025-04-19', 1);

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
(19, 'PHY 102', 'Heat and Properties of Matter', 2, 'core', 'core', 'elective'),
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
  `exam_year` int(11) NOT NULL,
  `session` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`sn`, `grade_ID`, `student_ID`, `course_code`, `credit_units`, `score`, `grade`, `grade_points`, `semester`, `exam_year`, `session`) VALUES
(233, 'BSU/SC/CMP/19/54286/BIO101/2021', 'BSU/SC/CMP/19/54286', 'BIO 101', 3, 34, 'F', 0, 'First', 2021, '2021/2022'),
(252, 'BSU/SC/CMP/19/54286/BIO101/2022', 'BSU/SC/CMP/19/54286', 'BIO 101', 3, 44, 'E', 1, 'First', 2022, '2022/2023'),
(244, 'BSU/SC/CMP/19/54286/BSM106/2021', 'BSU/SC/CMP/19/54286', 'BSM 106', 3, 65, 'B', 4, 'Second', 2021, '2021/2022'),
(234, 'BSU/SC/CMP/19/54286/CHM101/2021', 'BSU/SC/CMP/19/54286', 'CHM 101', 2, 46, 'D', 2, 'First', 2021, '2021/2022'),
(235, 'BSU/SC/CMP/19/54286/CHM141/2021', 'BSU/SC/CMP/19/54286', 'CHM 141', 1, 56, 'C', 3, 'First', 2021, '2021/2022'),
(236, 'BSU/SC/CMP/19/54286/CMP101/2021', 'BSU/SC/CMP/19/54286', 'CMP 101', 2, 57, 'C', 3, 'First', 2021, '2021/2022'),
(245, 'BSU/SC/CMP/19/54286/CMP102/2021', 'BSU/SC/CMP/19/54286', 'CMP 102', 3, 75, 'A', 5, 'Second', 2021, '2021/2022'),
(246, 'BSU/SC/CMP/19/54286/CMP120/2021', 'BSU/SC/CMP/19/54286', 'CMP 120', 3, 50, 'C', 3, 'Second', 2021, '2021/2022'),
(253, 'BSU/SC/CMP/19/54286/CMP201/2022', 'BSU/SC/CMP/19/54286', 'CMP 201', 3, 70, 'A', 5, 'First', 2022, '2022/2023'),
(260, 'BSU/SC/CMP/19/54286/CMP202/2022', 'BSU/SC/CMP/19/54286', 'CMP 202', 3, 41, 'E', 1, 'Second', 2022, '2022/2023'),
(254, 'BSU/SC/CMP/19/54286/CMP205/2022', 'BSU/SC/CMP/19/54286', 'CMP 205', 3, 64, 'B', 4, 'First', 2022, '2022/2023'),
(255, 'BSU/SC/CMP/19/54286/CMP207/2022', 'BSU/SC/CMP/19/54286', 'CMP 207', 3, 65, 'B', 4, 'First', 2022, '2022/2023'),
(261, 'BSU/SC/CMP/19/54286/CMP210/2022', 'BSU/SC/CMP/19/54286', 'CMP 210', 3, 59, 'C', 3, 'Second', 2022, '2022/2023'),
(262, 'BSU/SC/CMP/19/54286/CMP222/2022', 'BSU/SC/CMP/19/54286', 'CMP 222', 2, 28, 'F', 0, 'Second', 2022, '2022/2023'),
(286, 'BSU/SC/CMP/19/54286/CMP222/2024', 'BSU/SC/CMP/19/54286', 'CMP 222', 2, 70, 'A', 5, 'Second', 2024, '2024/2025'),
(256, 'BSU/SC/CMP/19/54286/CMP223/2022', 'BSU/SC/CMP/19/54286', 'CMP 223', 3, 51, 'C', 3, 'First', 2022, '2022/2023'),
(263, 'BSU/SC/CMP/19/54286/CMP264/2022', 'BSU/SC/CMP/19/54286', 'CMP 264', 3, 80, 'A', 5, 'Second', 2022, '2022/2023'),
(264, 'BSU/SC/CMP/19/54286/CMP270/2022', 'BSU/SC/CMP/19/54286', 'CMP 270', 3, 52, 'C', 3, 'Second', 2022, '2022/2023'),
(269, 'BSU/SC/CMP/19/54286/CMP311/2023', 'BSU/SC/CMP/19/54286', 'CMP 311', 2, 51, 'C', 3, 'First', 2023, '2023/2024'),
(270, 'BSU/SC/CMP/19/54286/CMP313/2023', 'BSU/SC/CMP/19/54286', 'CMP 313', 3, 60, 'B', 4, 'First', 2023, '2023/2024'),
(271, 'BSU/SC/CMP/19/54286/CMP315/2023', 'BSU/SC/CMP/19/54286', 'CMP 315', 3, 63, 'B', 4, 'First', 2023, '2023/2024'),
(272, 'BSU/SC/CMP/19/54286/CMP321/2023', 'BSU/SC/CMP/19/54286', 'CMP 321', 2, 33, 'F', 0, 'First', 2023, '2023/2024'),
(278, 'BSU/SC/CMP/19/54286/CMP321/2024', 'BSU/SC/CMP/19/54286', 'CMP 321', 2, 68, 'B', 4, 'First', 2024, '2024/2025'),
(273, 'BSU/SC/CMP/19/54286/CMP331/2023', 'BSU/SC/CMP/19/54286', 'CMP 331', 3, 63, 'B', 4, 'First', 2023, '2023/2024'),
(274, 'BSU/SC/CMP/19/54286/CMP333/2023', 'BSU/SC/CMP/19/54286', 'CMP 333', 2, 80, 'A', 5, 'First', 2023, '2023/2024'),
(275, 'BSU/SC/CMP/19/54286/CMP341/2023', 'BSU/SC/CMP/19/54286', 'CMP 341', 2, 70, 'A', 5, 'First', 2023, '2023/2024'),
(277, 'BSU/SC/CMP/19/54286/CMP360/2023', 'BSU/SC/CMP/19/54286', 'CMP 360', 6, 70, 'A', 5, 'Second', 2023, '2023/2024'),
(279, 'BSU/SC/CMP/19/54286/CMP411/2024', 'BSU/SC/CMP/19/54286', 'CMP 411', 2, 41, 'E', 1, 'First', 2024, '2024/2025'),
(280, 'BSU/SC/CMP/19/54286/CMP413/2024', 'BSU/SC/CMP/19/54286', 'CMP 413', 3, 70, 'A', 5, 'First', 2024, '2024/2025'),
(281, 'BSU/SC/CMP/19/54286/CMP415/2024', 'BSU/SC/CMP/19/54286', 'CMP 415', 2, 71, 'A', 5, 'First', 2024, '2024/2025'),
(282, 'BSU/SC/CMP/19/54286/CMP431/2024', 'BSU/SC/CMP/19/54286', 'CMP 431', 2, 70, 'A', 5, 'First', 2024, '2024/2025'),
(283, 'BSU/SC/CMP/19/54286/CMP433/2024', 'BSU/SC/CMP/19/54286', 'CMP 433', 3, 52, 'C', 3, 'First', 2024, '2024/2025'),
(284, 'BSU/SC/CMP/19/54286/CMP441/2024', 'BSU/SC/CMP/19/54286', 'CMP 441', 2, 73, 'A', 5, 'First', 2024, '2024/2025'),
(288, 'BSU/SC/CMP/19/54286/CMP442/2024', 'BSU/SC/CMP/19/54286', 'CMP 442', 2, 70, 'A', 5, 'Second', 2024, '2024/2025'),
(289, 'BSU/SC/CMP/19/54286/CMP466/2024', 'BSU/SC/CMP/19/54286', 'CMP 466', 2, 70, 'A', 5, 'Second', 2024, '2024/2025'),
(290, 'BSU/SC/CMP/19/54286/CMP468/2024', 'BSU/SC/CMP/19/54286', 'CMP 468', 2, 70, 'A', 5, 'Second', 2024, '2024/2025'),
(291, 'BSU/SC/CMP/19/54286/CMP472/2024', 'BSU/SC/CMP/19/54286', 'CMP 472', 3, 60, 'B', 4, 'Second', 2024, '2024/2025'),
(293, 'BSU/SC/CMP/19/54286/CMP474/2024', 'BSU/SC/CMP/19/54286', 'CMP 474', 2, 60, 'B', 4, 'Second', 2024, '2024/2025'),
(285, 'BSU/SC/CMP/19/54286/CMP491/2024', 'BSU/SC/CMP/19/54286', 'CMP 491', 2, 75, 'A', 5, 'First', 2024, '2024/2025'),
(292, 'BSU/SC/CMP/19/54286/CMP492/2024', 'BSU/SC/CMP/19/54286', 'CMP 492', 6, 60, 'B', 4, 'Second', 2024, '2024/2025'),
(257, 'BSU/SC/CMP/19/54286/EPS201/2022', 'BSU/SC/CMP/19/54286', 'EPS 201', 2, 72, 'A', 5, 'First', 2022, '2022/2023'),
(265, 'BSU/SC/CMP/19/54286/EPS202/2022', 'BSU/SC/CMP/19/54286', 'EPS 202', 2, 70, 'A', 5, 'Second', 2022, '2022/2023'),
(276, 'BSU/SC/CMP/19/54286/EPS301/2023', 'BSU/SC/CMP/19/54286', 'EPS 301', 2, 72, 'A', 5, 'First', 2023, '2023/2024'),
(287, 'BSU/SC/CMP/19/54286/EPS302/2024', 'BSU/SC/CMP/19/54286', 'EPS 302', 1, 60, 'B', 4, 'Second', 2024, '2024/2025'),
(266, 'BSU/SC/CMP/19/54286/GOE204/2022', 'BSU/SC/CMP/19/54286', 'GOE 204', 3, 57, 'C', 3, 'Second', 2022, '2022/2023'),
(237, 'BSU/SC/CMP/19/54286/GST111/2021', 'BSU/SC/CMP/19/54286', 'GST 111', 2, 67, 'B', 4, 'First', 2021, '2021/2022'),
(238, 'BSU/SC/CMP/19/54286/GST113/2021', 'BSU/SC/CMP/19/54286', 'GST 113', 2, 55, 'C', 3, 'First', 2021, '2021/2022'),
(239, 'BSU/SC/CMP/19/54286/GST121/2021', 'BSU/SC/CMP/19/54286', 'GST 121', 2, 78, 'A', 5, 'First', 2021, '2021/2022'),
(247, 'BSU/SC/CMP/19/54286/GST122/2021', 'BSU/SC/CMP/19/54286', 'GST 122', 2, 68, 'B', 4, 'Second', 2021, '2021/2022'),
(267, 'BSU/SC/CMP/19/54286/GST222/2022', 'BSU/SC/CMP/19/54286', 'GST 222', 2, 58, 'C', 3, 'Second', 2022, '2022/2023'),
(240, 'BSU/SC/CMP/19/54286/MTH101/2021', 'BSU/SC/CMP/19/54286', 'MTH 101', 3, 60, 'B', 4, 'First', 2021, '2021/2022'),
(248, 'BSU/SC/CMP/19/54286/MTH102/2021', 'BSU/SC/CMP/19/54286', 'MTH 102', 3, 52, 'C', 3, 'Second', 2021, '2021/2022'),
(249, 'BSU/SC/CMP/19/54286/MTH104/2021', 'BSU/SC/CMP/19/54286', 'MTH 104', 3, 54, 'C', 3, 'Second', 2021, '2021/2022'),
(258, 'BSU/SC/CMP/19/54286/MTH201/2022', 'BSU/SC/CMP/19/54286', 'MTH 201', 3, 55, 'C', 3, 'First', 2022, '2022/2023'),
(268, 'BSU/SC/CMP/19/54286/MTH208/2022', 'BSU/SC/CMP/19/54286', 'MTH 208', 3, 50, 'C', 3, 'Second', 2022, '2022/2023'),
(241, 'BSU/SC/CMP/19/54286/PHY101/2021', 'BSU/SC/CMP/19/54286', 'PHY 101', 2, 49, 'D', 2, 'First', 2021, '2021/2022'),
(250, 'BSU/SC/CMP/19/54286/PHY102/2021', 'BSU/SC/CMP/19/54286', 'PHY 102', 2, 53, 'C', 3, 'Second', 2021, '2021/2022'),
(242, 'BSU/SC/CMP/19/54286/PHY103/2021', 'BSU/SC/CMP/19/54286', 'PHY 103', 3, 56, 'C', 3, 'First', 2021, '2021/2022'),
(243, 'BSU/SC/CMP/19/54286/PHY105/2021', 'BSU/SC/CMP/19/54286', 'PHY 105', 1, 53, 'C', 3, 'First', 2021, '2021/2022'),
(251, 'BSU/SC/CMP/19/54286/PHY108/2021', 'BSU/SC/CMP/19/54286', 'PHY 108', 1, 49, 'D', 2, 'Second', 2021, '2021/2022'),
(259, 'BSU/SC/CMP/19/54286/STA201/2022', 'BSU/SC/CMP/19/54286', 'STA 201', 4, 60, 'B', 4, 'First', 2022, '2022/2023'),
(294, 'BSU/SC/MTH/19/54289/MTH323/2023', 'BSU/SC/MTH/19/54289', 'MTH 323', 3, 98, 'A', 5, 'First', 2023, '2023/2024'),
(295, 'BSU/SC/MTH/19/54289/MTH202/2022', 'BSU/SC/MTH/19/54289', 'MTH 202', 3, 84, 'A', 5, 'Second', 2022, '2022/2023'),
(296, 'BSU/SC/MTH/19/54289/MTH416/2024', 'BSU/SC/MTH/19/54289', 'MTH 416', 3, 89, 'A', 5, 'Second', 2024, '2024/2025'),
(297, 'BSU/SC/MTH/19/54289/MTH207/2022', 'BSU/SC/MTH/19/54289', 'MTH 207', 2, 90, 'A', 5, 'First', 2022, '2022/2023'),
(298, 'BSU/SC/MTH/19/54289/MTH104/2021', 'BSU/SC/MTH/19/54289', 'MTH 104', 3, 82, 'A', 5, 'Second', 2021, '2021/2022'),
(299, 'BSU/SC/MTH/19/54289/MTH408/2024', 'BSU/SC/MTH/19/54289', 'MTH 408', 3, 100, 'A', 5, 'Second', 2024, '2024/2025'),
(300, 'BSU/SC/MTH/19/54289/MTH102/2021', 'BSU/SC/MTH/19/54289', 'MTH 102', 3, 94, 'A', 5, 'Second', 2021, '2021/2022'),
(301, 'BSU/SC/MTH/19/54289/MTH201/2022', 'BSU/SC/MTH/19/54289', 'MTH 201', 3, 68, 'B', 4, 'First', 2022, '2022/2023'),
(302, 'BSU/SC/MTH/19/54289/MTH315/2023', 'BSU/SC/MTH/19/54289', 'MTH 315', 4, 82, 'A', 5, 'First', 2023, '2023/2024'),
(303, 'BSU/SC/MTH/19/54289/MTH418/2024', 'BSU/SC/MTH/19/54289', 'MTH 418', 3, 45, 'D', 2, 'Second', 2024, '2024/2025'),
(304, 'BSU/SC/MTH/19/54289/MTH412/2024', 'BSU/SC/MTH/19/54289', 'MTH 412', 3, 61, 'B', 4, 'Second', 2024, '2024/2025'),
(305, 'BSU/SC/MTH/19/54289/MTH208/2022', 'BSU/SC/MTH/19/54289', 'MTH 208', 3, 70, 'A', 5, 'Second', 2022, '2022/2023'),
(306, 'BSU/SC/MTH/19/54289/MTH101/2021', 'BSU/SC/MTH/19/54289', 'MTH 101', 3, 66, 'B', 4, 'First', 2021, '2021/2022'),
(307, 'BSU/SC/MTH/19/54289/MTH424/2024', 'BSU/SC/MTH/19/54289', 'MTH 424', 3, 81, 'A', 5, 'Second', 2024, '2024/2025'),
(308, 'BSU/SC/MTH/19/54289/MTH406/2024', 'BSU/SC/MTH/19/54289', 'MTH 406', 6, 45, 'D', 2, 'Second', 2024, '2024/2025'),
(309, 'BSU/SC/MTH/19/54289/MTH410/2024', 'BSU/SC/MTH/19/54289', 'MTH 410', 3, 65, 'B', 4, 'Second', 2024, '2024/2025'),
(310, 'BSU/SC/MTH/19/54289/MTH205/2022', 'BSU/SC/MTH/19/54289', 'MTH 205', 2, 89, 'A', 5, 'First', 2022, '2022/2023'),
(311, 'BSU/SC/MTH/19/54289/MTH404/2024', 'BSU/SC/MTH/19/54289', 'MTH 404', 3, 91, 'A', 5, 'Second', 2024, '2024/2025'),
(312, 'BSU/SC/MTH/19/54289/MTH203/2022', 'BSU/SC/MTH/19/54289', 'MTH 203', 3, 84, 'A', 5, 'First', 2022, '2022/2023'),
(313, 'BSU/SC/MTH/19/54289/MTH313/2023', 'BSU/SC/MTH/19/54289', 'MTH 313', 3, 49, 'D', 2, 'First', 2023, '2023/2024'),
(314, 'BSU/SC/MTH/19/54289/CMP468/2024', 'BSU/SC/MTH/19/54289', 'CMP 468', 2, 74, 'A', 5, 'Second', 2024, '2024/2025'),
(315, 'BSU/SC/MTH/19/54289/CMP315/2023', 'BSU/SC/MTH/19/54289', 'CMP 315', 3, 60, 'B', 4, 'First', 2023, '2023/2024'),
(316, 'BSU/SC/MTH/19/54289/CMP331/2023', 'BSU/SC/MTH/19/54289', 'CMP 331', 3, 40, 'E', 1, 'First', 2023, '2023/2024'),
(317, 'BSU/SC/MTH/19/54289/STA314/2023', 'BSU/SC/MTH/19/54289', 'STA 314', 3, 40, 'E', 1, 'Second', 2023, '2023/2024'),
(318, 'BSU/SC/MTH/19/54289/STA458/2024', 'BSU/SC/MTH/19/54289', 'STA 458', 3, 42, 'E', 1, 'Second', 2024, '2024/2025'),
(319, 'BSU/SC/MTH/19/54289/STA201/2022', 'BSU/SC/MTH/19/54289', 'STA 201', 4, 48, 'D', 2, 'First', 2022, '2022/2023'),
(320, 'BSU/SC/MTH/19/54289/GST222/2022', 'BSU/SC/MTH/19/54289', 'GST 222', 2, 77, 'A', 5, 'Second', 2022, '2022/2023'),
(321, 'BSU/SC/MTH/19/54289/GST122/2021', 'BSU/SC/MTH/19/54289', 'GST 122', 2, 80, 'A', 5, 'Second', 2021, '2021/2022'),
(322, 'BSU/SC/MTH/19/54289/GST111/2021', 'BSU/SC/MTH/19/54289', 'GST 111', 2, 66, 'B', 4, 'First', 2021, '2021/2022'),
(323, 'BSU/SC/MTH/19/54289/BIO206/2022', 'BSU/SC/MTH/19/54289', 'BIO 206', 2, 51, 'C', 3, 'Second', 2022, '2022/2023'),
(324, 'BSU/SC/MTH/19/54289/BIO101/2021', 'BSU/SC/MTH/19/54289', 'BIO 101', 3, 77, 'A', 5, 'First', 2021, '2021/2022'),
(325, 'BSU/SC/MTH/19/54289/EPS202/2022', 'BSU/SC/MTH/19/54289', 'EPS 202', 2, 74, 'A', 5, 'Second', 2022, '2022/2023'),
(326, 'BSU/SC/MTH/19/54289/EPS301/2023', 'BSU/SC/MTH/19/54289', 'EPS 301', 2, 97, 'A', 5, 'First', 2023, '2023/2024'),
(327, 'BSU/SC/MTH/19/54289/EPS201/2022', 'BSU/SC/MTH/19/54289', 'EPS 201', 2, 42, 'E', 1, 'First', 2022, '2022/2023'),
(328, 'BSU/SC/MTH/19/54289/EPS302/2023', 'BSU/SC/MTH/19/54289', 'EPS 302', 1, 62, 'B', 4, 'Second', 2023, '2023/2024'),
(329, 'BSU/SC/MTH/19/54289/PHY102/2021', 'BSU/SC/MTH/19/54289', 'PHY 102', 3, 82, 'A', 5, 'Second', 2021, '2021/2022'),
(330, 'BSU/SC/MTH/19/54289/PHY108/2021', 'BSU/SC/MTH/19/54289', 'PHY 108', 1, 65, 'B', 4, 'Second', 2021, '2021/2022'),
(331, 'BSU/SC/MTH/19/54289/PHY101/2021', 'BSU/SC/MTH/19/54289', 'PHY 101', 2, 40, 'E', 1, 'First', 2021, '2021/2022'),
(332, 'BSU/SC/MTH/19/54289/PHY201/2022', 'BSU/SC/MTH/19/54289', 'PHY 201', 2, 87, 'A', 5, 'First', 2022, '2022/2023'),
(333, 'BSU/SC/MTH/19/54289/CHM101/2021', 'BSU/SC/MTH/19/54289', 'CHM 101', 2, 93, 'A', 5, 'First', 2021, '2021/2022'),
(334, 'BSU/SC/MTH/19/54289/CHM141/2021', 'BSU/SC/MTH/19/54289', 'CHM 141', 1, 43, 'E', 1, 'First', 2021, '2021/2022'),
(335, 'BSU/SC/STA/19/51655/MTH416/2024', 'BSU/SC/STA/19/51655', 'MTH 416', 3, 34, 'F', 0, 'Second', 2024, '2024/2025'),
(336, 'BSU/SC/STA/19/51655/MTH410/2024', 'BSU/SC/STA/19/51655', 'MTH 410', 3, 56, 'C', 3, 'Second', 2024, '2024/2025'),
(337, 'BSU/SC/STA/19/51655/MTH104/2021', 'BSU/SC/STA/19/51655', 'MTH 104', 3, 68, 'B', 4, 'Second', 2021, '2021/2022'),
(338, 'BSU/SC/STA/19/51655/MTH323/2023', 'BSU/SC/STA/19/51655', 'MTH 323', 3, 61, 'B', 4, 'First', 2023, '2023/2024'),
(339, 'BSU/SC/STA/19/51655/MTH315/2023', 'BSU/SC/STA/19/51655', 'MTH 315', 4, 69, 'B', 4, 'First', 2023, '2023/2024'),
(340, 'BSU/SC/STA/19/51655/MTH404/2024', 'BSU/SC/STA/19/51655', 'MTH 404', 3, 50, 'C', 3, 'Second', 2024, '2024/2025'),
(341, 'BSU/SC/STA/19/51655/MTH313/2023', 'BSU/SC/STA/19/51655', 'MTH 313', 3, 57, 'C', 3, 'First', 2023, '2023/2024'),
(342, 'BSU/SC/STA/19/51655/MTH412/2024', 'BSU/SC/STA/19/51655', 'MTH 412', 3, 62, 'B', 4, 'Second', 2024, '2024/2025'),
(343, 'BSU/SC/STA/19/51655/MTH424/2024', 'BSU/SC/STA/19/51655', 'MTH 424', 3, 70, 'A', 5, 'Second', 2024, '2024/2025'),
(344, 'BSU/SC/STA/19/51655/MTH101/2021', 'BSU/SC/STA/19/51655', 'MTH 101', 3, 54, 'C', 3, 'First', 2021, '2021/2022'),
(345, 'BSU/SC/STA/19/51655/CMP433/2024', 'BSU/SC/STA/19/51655', 'CMP 433', 3, 69, 'B', 4, 'First', 2024, '2024/2025'),
(346, 'BSU/SC/STA/19/51655/CMP341/2023', 'BSU/SC/STA/19/51655', 'CMP 341', 2, 32, 'F', 0, 'First', 2023, '2023/2024'),
(347, 'BSU/SC/STA/19/51655/CMP315/2023', 'BSU/SC/STA/19/51655', 'CMP 315', 3, 47, 'D', 2, 'First', 2023, '2023/2024'),
(348, 'BSU/SC/STA/19/51655/STA419/2024', 'BSU/SC/STA/19/51655', 'STA 419', 4, 66, 'B', 4, 'First', 2024, '2024/2025'),
(349, 'BSU/SC/STA/19/51655/STA323/2023', 'BSU/SC/STA/19/51655', 'STA 323', 3, 38, 'F', 0, 'First', 2023, '2023/2024'),
(350, 'BSU/SC/STA/19/51655/STA424/2024', 'BSU/SC/STA/19/51655', 'STA 424', 3, 45, 'D', 2, 'Second', 2024, '2024/2025'),
(351, 'BSU/SC/STA/19/51655/STA406/2024', 'BSU/SC/STA/19/51655', 'STA 406', 6, 40, 'E', 1, 'Second', 2024, '2024/2025'),
(352, 'BSU/SC/STA/19/51655/STA315/2023', 'BSU/SC/STA/19/51655', 'STA 315', 2, 36, 'F', 0, 'First', 2023, '2023/2024'),
(353, 'BSU/SC/STA/19/51655/STA452/2024', 'BSU/SC/STA/19/51655', 'STA 452', 3, 30, 'F', 0, 'Second', 2024, '2024/2025'),
(354, 'BSU/SC/STA/19/51655/STA318/2023', 'BSU/SC/STA/19/51655', 'STA 318', 2, 55, 'C', 3, 'Second', 2023, '2023/2024'),
(355, 'BSU/SC/STA/19/51655/STA444/2024', 'BSU/SC/STA/19/51655', 'STA 444', 3, 31, 'F', 0, 'Second', 2024, '2024/2025'),
(356, 'BSU/SC/STA/19/51655/STA445/2024', 'BSU/SC/STA/19/51655', 'STA 445', 3, 45, 'D', 2, 'First', 2024, '2024/2025'),
(357, 'BSU/SC/STA/19/51655/STA421/2024', 'BSU/SC/STA/19/51655', 'STA 421', 3, 58, 'C', 3, 'First', 2024, '2024/2025'),
(358, 'BSU/SC/STA/19/51655/STA459/2024', 'BSU/SC/STA/19/51655', 'STA 459', 3, 45, 'D', 2, 'First', 2024, '2024/2025'),
(359, 'BSU/SC/STA/19/51655/STA321/2023', 'BSU/SC/STA/19/51655', 'STA 321', 3, 63, 'B', 4, 'First', 2023, '2023/2024'),
(360, 'BSU/SC/STA/19/51655/STA458/2024', 'BSU/SC/STA/19/51655', 'STA 458', 3, 70, 'A', 5, 'Second', 2024, '2024/2025'),
(361, 'BSU/SC/STA/19/51655/STA319/2023', 'BSU/SC/STA/19/51655', 'STA 319', 3, 48, 'D', 2, 'First', 2023, '2023/2024'),
(362, 'BSU/SC/STA/19/51655/STA451/2024', 'BSU/SC/STA/19/51655', 'STA 451', 3, 42, 'E', 1, 'First', 2024, '2024/2025'),
(363, 'BSU/SC/STA/19/51655/STA222/2022', 'BSU/SC/STA/19/51655', 'STA 222', 4, 36, 'F', 0, 'Second', 2022, '2022/2023'),
(364, 'BSU/SC/STA/19/51655/STA442/2024', 'BSU/SC/STA/19/51655', 'STA 442', 3, 65, 'B', 4, 'Second', 2024, '2024/2025'),
(365, 'BSU/SC/STA/19/51655/STA111/2021', 'BSU/SC/STA/19/51655', 'STA 111', 4, 65, 'B', 4, 'First', 2021, '2021/2022'),
(366, 'BSU/SC/STA/19/51655/STA203/2022', 'BSU/SC/STA/19/51655', 'STA 203', 4, 61, 'B', 4, 'First', 2022, '2022/2023'),
(367, 'BSU/SC/STA/19/51655/STA415/2024', 'BSU/SC/STA/19/51655', 'STA 415', 4, 40, 'E', 1, 'First', 2024, '2024/2025'),
(368, 'BSU/SC/STA/19/51655/STA426/2024', 'BSU/SC/STA/19/51655', 'STA 426', 3, 69, 'B', 4, 'Second', 2024, '2024/2025'),
(369, 'BSU/SC/STA/19/51655/STA304/2023', 'BSU/SC/STA/19/51655', 'STA 304', 3, 32, 'F', 0, 'Second', 2023, '2023/2024'),
(370, 'BSU/SC/STA/19/51655/STA201/2022', 'BSU/SC/STA/19/51655', 'STA 201', 4, 45, 'D', 2, 'First', 2022, '2022/2023'),
(371, 'BSU/SC/STA/19/51655/STA453/2024', 'BSU/SC/STA/19/51655', 'STA 453', 3, 60, 'B', 4, 'First', 2024, '2024/2025'),
(372, 'BSU/SC/STA/19/51655/STA325/2023', 'BSU/SC/STA/19/51655', 'STA 325', 3, 52, 'C', 3, 'First', 2023, '2023/2024'),
(373, 'BSU/SC/STA/19/51655/STA327/2023', 'BSU/SC/STA/19/51655', 'STA 327', 3, 52, 'C', 3, 'First', 2023, '2023/2024'),
(374, 'BSU/SC/STA/19/51655/STA324/2023', 'BSU/SC/STA/19/51655', 'STA 324', 3, 33, 'F', 0, 'Second', 2023, '2023/2024'),
(375, 'BSU/SC/STA/19/51655/STA312/2023', 'BSU/SC/STA/19/51655', 'STA 312', 3, 59, 'C', 3, 'Second', 2023, '2023/2024'),
(376, 'BSU/SC/STA/19/51655/STA211/2022', 'BSU/SC/STA/19/51655', 'STA 211', 4, 47, 'D', 2, 'First', 2022, '2022/2023'),
(377, 'BSU/SC/STA/19/51655/STA112/2021', 'BSU/SC/STA/19/51655', 'STA 112', 4, 68, 'B', 4, 'Second', 2021, '2021/2022'),
(378, 'BSU/SC/STA/19/51655/STA456/2024', 'BSU/SC/STA/19/51655', 'STA 456', 3, 47, 'D', 2, 'Second', 2024, '2024/2025'),
(379, 'BSU/SC/STA/19/51655/STA417/2024', 'BSU/SC/STA/19/51655', 'STA 417', 3, 42, 'E', 1, 'First', 2024, '2024/2025'),
(380, 'BSU/SC/STA/19/51655/STA212/2022', 'BSU/SC/STA/19/51655', 'STA 212', 3, 38, 'F', 0, 'Second', 2022, '2022/2023'),
(381, 'BSU/SC/STA/19/51655/GST222/2022', 'BSU/SC/STA/19/51655', 'GST 222', 2, 35, 'F', 0, 'Second', 2022, '2022/2023'),
(382, 'BSU/SC/STA/19/51655/GST111/2021', 'BSU/SC/STA/19/51655', 'GST 111', 2, 33, 'F', 0, 'First', 2021, '2021/2022'),
(383, 'BSU/SC/STA/19/51655/GST121/2021', 'BSU/SC/STA/19/51655', 'GST 121', 2, 70, 'A', 5, 'First', 2021, '2021/2022'),
(384, 'BSU/SC/STA/19/51655/BIO206/2022', 'BSU/SC/STA/19/51655', 'BIO 206', 2, 59, 'C', 3, 'Second', 2022, '2022/2023'),
(385, 'BSU/SC/STA/19/51655/BIO101/2021', 'BSU/SC/STA/19/51655', 'BIO 101', 3, 53, 'C', 3, 'First', 2021, '2021/2022'),
(386, 'BSU/SC/STA/19/51655/EPS302/2023', 'BSU/SC/STA/19/51655', 'EPS 302', 1, 59, 'C', 3, 'Second', 2023, '2023/2024'),
(387, 'BSU/SC/STA/19/51655/EPS202/2022', 'BSU/SC/STA/19/51655', 'EPS 202', 2, 66, 'B', 4, 'Second', 2022, '2022/2023'),
(388, 'BSU/SC/STA/19/51655/EPS301/2023', 'BSU/SC/STA/19/51655', 'EPS 301', 2, 41, 'E', 1, 'First', 2023, '2023/2024'),
(389, 'BSU/SC/STA/19/51655/EPS201/2022', 'BSU/SC/STA/19/51655', 'EPS 201', 2, 60, 'B', 4, 'First', 2022, '2022/2023'),
(390, 'BSU/SC/STA/19/51655/PHY102/2021', 'BSU/SC/STA/19/51655', 'PHY 102', 3, 66, 'B', 4, 'Second', 2021, '2021/2022'),
(391, 'BSU/SC/STA/19/51655/PHY103/2021', 'BSU/SC/STA/19/51655', 'PHY 103', 3, 36, 'F', 0, 'First', 2021, '2021/2022'),
(392, 'BSU/SC/STA/19/51655/PHY205/2022', 'BSU/SC/STA/19/51655', 'PHY 205', 2, 38, 'F', 0, 'First', 2022, '2022/2023'),
(393, 'BSU/SC/STA/19/51655/PHY201/2022', 'BSU/SC/STA/19/51655', 'PHY 201', 2, 51, 'C', 3, 'First', 2022, '2022/2023'),
(394, 'BSU/SC/STA/19/51655/CHM101/2021', 'BSU/SC/STA/19/51655', 'CHM 101', 2, 31, 'F', 0, 'First', 2021, '2021/2022'),
(395, 'BSU/SC/STA/19/51655/CHM141/2021', 'BSU/SC/STA/19/51655', 'CHM 141', 1, 55, 'C', 3, 'First', 2021, '2021/2022'),
(396, 'BSU/SC/CMP/19/54222/MTH101/2021', 'BSU/SC/CMP/19/54222', 'MTH 101', 3, 53, 'C', 3, 'First', 2021, '2021/2022'),
(397, 'BSU/SC/CMP/19/54222/MTH406/2024', 'BSU/SC/CMP/19/54222', 'MTH 406', 6, 45, 'D', 2, 'Second', 2024, '2024/2025'),
(398, 'BSU/SC/CMP/19/54222/MTH424/2024', 'BSU/SC/CMP/19/54222', 'MTH 424', 3, 38, 'F', 0, 'Second', 2024, '2024/2025'),
(399, 'BSU/SC/CMP/19/54222/MTH205/2022', 'BSU/SC/CMP/19/54222', 'MTH 205', 2, 58, 'C', 3, 'First', 2022, '2022/2023'),
(400, 'BSU/SC/CMP/19/54222/CMP313/2023', 'BSU/SC/CMP/19/54222', 'CMP 313', 3, 51, 'C', 3, 'First', 2023, '2023/2024'),
(401, 'BSU/SC/CMP/19/54222/CMP333/2023', 'BSU/SC/CMP/19/54222', 'CMP 333', 2, 51, 'C', 3, 'First', 2023, '2023/2024'),
(402, 'BSU/SC/CMP/19/54222/CMP315/2023', 'BSU/SC/CMP/19/54222', 'CMP 315', 3, 41, 'E', 1, 'First', 2023, '2023/2024'),
(403, 'BSU/SC/CMP/19/54222/CMP203/2022', 'BSU/SC/CMP/19/54222', 'CMP 203', 2, 54, 'C', 3, 'First', 2022, '2022/2023'),
(404, 'BSU/SC/CMP/19/54222/CMP415/2024', 'BSU/SC/CMP/19/54222', 'CMP 415', 2, 55, 'C', 3, 'First', 2024, '2024/2025'),
(405, 'BSU/SC/CMP/19/54222/CMP102/2021', 'BSU/SC/CMP/19/54222', 'CMP 102', 3, 51, 'C', 3, 'Second', 2021, '2021/2022'),
(406, 'BSU/SC/CMP/19/54222/CMP321/2023', 'BSU/SC/CMP/19/54222', 'CMP 321', 2, 32, 'F', 0, 'First', 2023, '2023/2024'),
(407, 'BSU/SC/CMP/19/54222/CMP101/2021', 'BSU/SC/CMP/19/54222', 'CMP 101', 2, 41, 'E', 1, 'First', 2021, '2021/2022'),
(408, 'BSU/SC/CMP/19/54222/CMP468/2024', 'BSU/SC/CMP/19/54222', 'CMP 468', 2, 46, 'D', 2, 'Second', 2024, '2024/2025'),
(409, 'BSU/SC/CMP/19/54222/CMP413/2024', 'BSU/SC/CMP/19/54222', 'CMP 413', 3, 47, 'D', 2, 'First', 2024, '2024/2025'),
(410, 'BSU/SC/CMP/19/54222/CMP360/2023', 'BSU/SC/CMP/19/54222', 'CMP 360', 6, 36, 'F', 0, 'Second', 2023, '2023/2024'),
(411, 'BSU/SC/CMP/19/54222/CMP270/2022', 'BSU/SC/CMP/19/54222', 'CMP 270', 3, 41, 'E', 1, 'Second', 2022, '2022/2023'),
(412, 'BSU/SC/CMP/19/54222/CMP223/2022', 'BSU/SC/CMP/19/54222', 'CMP 223', 3, 38, 'F', 0, 'First', 2022, '2022/2023'),
(413, 'BSU/SC/CMP/19/54222/CMP202/2022', 'BSU/SC/CMP/19/54222', 'CMP 202', 3, 36, 'F', 0, 'Second', 2022, '2022/2023'),
(414, 'BSU/SC/CMP/19/54222/CMP441/2024', 'BSU/SC/CMP/19/54222', 'CMP 441', 2, 37, 'F', 0, 'First', 2024, '2024/2025'),
(415, 'BSU/SC/CMP/19/54222/CMP433/2024', 'BSU/SC/CMP/19/54222', 'CMP 433', 3, 49, 'D', 2, 'First', 2024, '2024/2025'),
(416, 'BSU/SC/CMP/19/54222/CMP311/2023', 'BSU/SC/CMP/19/54222', 'CMP 311', 2, 42, 'E', 1, 'First', 2023, '2023/2024'),
(417, 'BSU/SC/CMP/19/54222/CMP201/2022', 'BSU/SC/CMP/19/54222', 'CMP 201', 3, 35, 'F', 0, 'First', 2022, '2022/2023'),
(418, 'BSU/SC/CMP/19/54222/CMP205/2022', 'BSU/SC/CMP/19/54222', 'CMP 205', 3, 49, 'D', 2, 'First', 2022, '2022/2023'),
(419, 'BSU/SC/CMP/19/54222/CMP472/2024', 'BSU/SC/CMP/19/54222', 'CMP 472', 3, 47, 'D', 2, 'Second', 2024, '2024/2025'),
(420, 'BSU/SC/CMP/19/54222/CMP331/2023', 'BSU/SC/CMP/19/54222', 'CMP 331', 3, 30, 'F', 0, 'First', 2023, '2023/2024'),
(421, 'BSU/SC/CMP/19/54222/CMP210/2022', 'BSU/SC/CMP/19/54222', 'CMP 210', 3, 42, 'E', 1, 'Second', 2022, '2022/2023'),
(422, 'BSU/SC/CMP/19/54222/CMP442/2024', 'BSU/SC/CMP/19/54222', 'CMP 442', 2, 57, 'C', 3, 'Second', 2024, '2024/2025'),
(423, 'BSU/SC/CMP/19/54222/CMP222/2022', 'BSU/SC/CMP/19/54222', 'CMP 222', 2, 36, 'F', 0, 'Second', 2022, '2022/2023'),
(424, 'BSU/SC/CMP/19/54222/CMP264/2022', 'BSU/SC/CMP/19/54222', 'CMP 264', 3, 41, 'E', 1, 'Second', 2022, '2022/2023'),
(425, 'BSU/SC/CMP/19/54222/CMP341/2023', 'BSU/SC/CMP/19/54222', 'CMP 341', 2, 38, 'F', 0, 'First', 2023, '2023/2024'),
(426, 'BSU/SC/CMP/19/54222/CMP431/2024', 'BSU/SC/CMP/19/54222', 'CMP 431', 2, 38, 'F', 0, 'First', 2024, '2024/2025'),
(427, 'BSU/SC/CMP/19/54222/CMP466/2024', 'BSU/SC/CMP/19/54222', 'CMP 466', 2, 48, 'D', 2, 'Second', 2024, '2024/2025'),
(428, 'BSU/SC/CMP/19/54222/CMP492/2024', 'BSU/SC/CMP/19/54222', 'CMP 492', 6, 33, 'F', 0, 'Second', 2024, '2024/2025'),
(429, 'BSU/SC/CMP/19/54222/CMP474/2024', 'BSU/SC/CMP/19/54222', 'CMP 474', 2, 52, 'C', 3, 'Second', 2024, '2024/2025'),
(430, 'BSU/SC/CMP/19/54222/CMP491/2024', 'BSU/SC/CMP/19/54222', 'CMP 491', 2, 40, 'E', 1, 'First', 2024, '2024/2025'),
(431, 'BSU/SC/CMP/19/54222/CMP120/2021', 'BSU/SC/CMP/19/54222', 'CMP 120', 3, 47, 'D', 2, 'Second', 2021, '2021/2022'),
(432, 'BSU/SC/CMP/19/54222/CMP207/2022', 'BSU/SC/CMP/19/54222', 'CMP 207', 3, 54, 'C', 3, 'First', 2022, '2022/2023'),
(433, 'BSU/SC/CMP/19/54222/CMP411/2024', 'BSU/SC/CMP/19/54222', 'CMP 411', 2, 35, 'F', 0, 'First', 2024, '2024/2025'),
(434, 'BSU/SC/CMP/19/54222/STA222/2022', 'BSU/SC/CMP/19/54222', 'STA 222', 4, 49, 'D', 2, 'Second', 2022, '2022/2023'),
(435, 'BSU/SC/CMP/19/54222/GST122/2021', 'BSU/SC/CMP/19/54222', 'GST 122', 2, 45, 'D', 2, 'Second', 2021, '2021/2022'),
(436, 'BSU/SC/CMP/19/54222/GST222/2022', 'BSU/SC/CMP/19/54222', 'GST 222', 2, 50, 'C', 3, 'Second', 2022, '2022/2023'),
(437, 'BSU/SC/CMP/19/54222/GST121/2021', 'BSU/SC/CMP/19/54222', 'GST 121', 2, 55, 'C', 3, 'First', 2021, '2021/2022'),
(438, 'BSU/SC/CMP/19/54222/BIO206/2022', 'BSU/SC/CMP/19/54222', 'BIO 206', 2, 32, 'F', 0, 'Second', 2022, '2022/2023'),
(439, 'BSU/SC/CMP/19/54222/BIO101/2021', 'BSU/SC/CMP/19/54222', 'BIO 101', 3, 58, 'C', 3, 'First', 2021, '2021/2022'),
(440, 'BSU/SC/CMP/19/54222/EPS202/2022', 'BSU/SC/CMP/19/54222', 'EPS 202', 2, 41, 'E', 1, 'Second', 2022, '2022/2023'),
(441, 'BSU/SC/CMP/19/54222/EPS301/2023', 'BSU/SC/CMP/19/54222', 'EPS 301', 2, 31, 'F', 0, 'First', 2023, '2023/2024'),
(442, 'BSU/SC/CMP/19/54222/EPS302/2023', 'BSU/SC/CMP/19/54222', 'EPS 302', 1, 36, 'F', 0, 'Second', 2023, '2023/2024'),
(443, 'BSU/SC/CMP/19/54222/EPS201/2022', 'BSU/SC/CMP/19/54222', 'EPS 201', 2, 56, 'C', 3, 'First', 2022, '2022/2023'),
(444, 'BSU/SC/CMP/19/54222/PHY205/2022', 'BSU/SC/CMP/19/54222', 'PHY 205', 2, 49, 'D', 2, 'First', 2022, '2022/2023'),
(445, 'BSU/SC/CMP/19/54222/PHY108/2021', 'BSU/SC/CMP/19/54222', 'PHY 108', 1, 49, 'D', 2, 'Second', 2021, '2021/2022'),
(446, 'BSU/SC/CMP/19/54222/PHY201/2022', 'BSU/SC/CMP/19/54222', 'PHY 201', 2, 36, 'F', 0, 'First', 2022, '2022/2023'),
(447, 'BSU/SC/CMP/19/54222/PHY101/2021', 'BSU/SC/CMP/19/54222', 'PHY 101', 2, 33, 'F', 0, 'First', 2021, '2021/2022'),
(448, 'BSU/SC/CMP/19/54222/CHM101/2021', 'BSU/SC/CMP/19/54222', 'CHM 101', 2, 60, 'B', 4, 'First', 2021, '2021/2022'),
(449, 'BSU/SC/CMP/19/54222/CHM141/2021', 'BSU/SC/CMP/19/54222', 'CHM 141', 1, 49, 'D', 2, 'First', 2021, '2021/2022'),
(450, 'BSU/SC/CMP/19/54155/MTH101/2021', 'BSU/SC/CMP/19/54155', 'MTH 101', 3, 38, 'F', 0, 'First', 2021, '2021/2022'),
(451, 'BSU/SC/CMP/19/54155/MTH406/2024', 'BSU/SC/CMP/19/54155', 'MTH 406', 6, 44, 'E', 1, 'Second', 2024, '2024/2025'),
(452, 'BSU/SC/CMP/19/54155/MTH424/2024', 'BSU/SC/CMP/19/54155', 'MTH 424', 3, 77, 'A', 5, 'Second', 2024, '2024/2025'),
(453, 'BSU/SC/CMP/19/54155/MTH205/2022', 'BSU/SC/CMP/19/54155', 'MTH 205', 2, 81, 'A', 5, 'First', 2022, '2022/2023'),
(454, 'BSU/SC/CMP/19/54155/CMP313/2023', 'BSU/SC/CMP/19/54155', 'CMP 313', 3, 76, 'A', 5, 'First', 2023, '2023/2024'),
(455, 'BSU/SC/CMP/19/54155/CMP333/2023', 'BSU/SC/CMP/19/54155', 'CMP 333', 2, 37, 'F', 0, 'First', 2023, '2023/2024'),
(456, 'BSU/SC/CMP/19/54155/CMP315/2023', 'BSU/SC/CMP/19/54155', 'CMP 315', 3, 68, 'B', 4, 'First', 2023, '2023/2024'),
(457, 'BSU/SC/CMP/19/54155/CMP203/2022', 'BSU/SC/CMP/19/54155', 'CMP 203', 2, 57, 'C', 3, 'First', 2022, '2022/2023'),
(458, 'BSU/SC/CMP/19/54155/CMP415/2024', 'BSU/SC/CMP/19/54155', 'CMP 415', 2, 52, 'C', 3, 'First', 2024, '2024/2025'),
(459, 'BSU/SC/CMP/19/54155/CMP102/2021', 'BSU/SC/CMP/19/54155', 'CMP 102', 3, 58, 'C', 3, 'Second', 2021, '2021/2022'),
(460, 'BSU/SC/CMP/19/54155/CMP321/2023', 'BSU/SC/CMP/19/54155', 'CMP 321', 2, 35, 'F', 0, 'First', 2023, '2023/2024'),
(461, 'BSU/SC/CMP/19/54155/CMP101/2021', 'BSU/SC/CMP/19/54155', 'CMP 101', 2, 44, 'E', 1, 'First', 2021, '2021/2022'),
(462, 'BSU/SC/CMP/19/54155/CMP468/2024', 'BSU/SC/CMP/19/54155', 'CMP 468', 2, 83, 'A', 5, 'Second', 2024, '2024/2025'),
(463, 'BSU/SC/CMP/19/54155/CMP413/2024', 'BSU/SC/CMP/19/54155', 'CMP 413', 3, 41, 'E', 1, 'First', 2024, '2024/2025'),
(464, 'BSU/SC/CMP/19/54155/CMP360/2023', 'BSU/SC/CMP/19/54155', 'CMP 360', 6, 68, 'B', 4, 'Second', 2023, '2023/2024'),
(465, 'BSU/SC/CMP/19/54155/CMP270/2022', 'BSU/SC/CMP/19/54155', 'CMP 270', 3, 48, 'D', 2, 'Second', 2022, '2022/2023'),
(466, 'BSU/SC/CMP/19/54155/CMP223/2022', 'BSU/SC/CMP/19/54155', 'CMP 223', 3, 74, 'A', 5, 'First', 2022, '2022/2023'),
(467, 'BSU/SC/CMP/19/54155/CMP202/2022', 'BSU/SC/CMP/19/54155', 'CMP 202', 3, 58, 'C', 3, 'Second', 2022, '2022/2023'),
(468, 'BSU/SC/CMP/19/54155/CMP441/2024', 'BSU/SC/CMP/19/54155', 'CMP 441', 2, 37, 'F', 0, 'First', 2024, '2024/2025'),
(469, 'BSU/SC/CMP/19/54155/CMP433/2024', 'BSU/SC/CMP/19/54155', 'CMP 433', 3, 51, 'C', 3, 'First', 2024, '2024/2025'),
(470, 'BSU/SC/CMP/19/54155/CMP311/2023', 'BSU/SC/CMP/19/54155', 'CMP 311', 2, 43, 'E', 1, 'First', 2023, '2023/2024'),
(471, 'BSU/SC/CMP/19/54155/CMP201/2022', 'BSU/SC/CMP/19/54155', 'CMP 201', 3, 35, 'F', 0, 'First', 2022, '2022/2023'),
(472, 'BSU/SC/CMP/19/54155/CMP205/2022', 'BSU/SC/CMP/19/54155', 'CMP 205', 3, 86, 'A', 5, 'First', 2022, '2022/2023'),
(473, 'BSU/SC/CMP/19/54155/CMP472/2024', 'BSU/SC/CMP/19/54155', 'CMP 472', 3, 83, 'A', 5, 'Second', 2024, '2024/2025'),
(474, 'BSU/SC/CMP/19/54155/CMP331/2023', 'BSU/SC/CMP/19/54155', 'CMP 331', 3, 57, 'C', 3, 'First', 2023, '2023/2024'),
(475, 'BSU/SC/CMP/19/54155/CMP210/2022', 'BSU/SC/CMP/19/54155', 'CMP 210', 3, 76, 'A', 5, 'Second', 2022, '2022/2023'),
(476, 'BSU/SC/CMP/19/54155/CMP442/2024', 'BSU/SC/CMP/19/54155', 'CMP 442', 2, 38, 'F', 0, 'Second', 2024, '2024/2025'),
(477, 'BSU/SC/CMP/19/54155/CMP222/2022', 'BSU/SC/CMP/19/54155', 'CMP 222', 2, 74, 'A', 5, 'Second', 2022, '2022/2023'),
(478, 'BSU/SC/CMP/19/54155/CMP264/2022', 'BSU/SC/CMP/19/54155', 'CMP 264', 3, 86, 'A', 5, 'Second', 2022, '2022/2023'),
(479, 'BSU/SC/CMP/19/54155/CMP341/2023', 'BSU/SC/CMP/19/54155', 'CMP 341', 2, 34, 'F', 0, 'First', 2023, '2023/2024'),
(480, 'BSU/SC/CMP/19/54155/CMP431/2024', 'BSU/SC/CMP/19/54155', 'CMP 431', 2, 98, 'A', 5, 'First', 2024, '2024/2025'),
(481, 'BSU/SC/CMP/19/54155/CMP466/2024', 'BSU/SC/CMP/19/54155', 'CMP 466', 2, 74, 'A', 5, 'Second', 2024, '2024/2025'),
(482, 'BSU/SC/CMP/19/54155/CMP492/2024', 'BSU/SC/CMP/19/54155', 'CMP 492', 6, 48, 'D', 2, 'Second', 2024, '2024/2025'),
(483, 'BSU/SC/CMP/19/54155/CMP474/2024', 'BSU/SC/CMP/19/54155', 'CMP 474', 2, 57, 'C', 3, 'Second', 2024, '2024/2025'),
(484, 'BSU/SC/CMP/19/54155/CMP491/2024', 'BSU/SC/CMP/19/54155', 'CMP 491', 2, 42, 'E', 1, 'First', 2024, '2024/2025'),
(485, 'BSU/SC/CMP/19/54155/CMP120/2021', 'BSU/SC/CMP/19/54155', 'CMP 120', 3, 79, 'A', 5, 'Second', 2021, '2021/2022'),
(486, 'BSU/SC/CMP/19/54155/CMP207/2022', 'BSU/SC/CMP/19/54155', 'CMP 207', 3, 98, 'A', 5, 'First', 2022, '2022/2023'),
(487, 'BSU/SC/CMP/19/54155/CMP411/2024', 'BSU/SC/CMP/19/54155', 'CMP 411', 2, 82, 'A', 5, 'First', 2024, '2024/2025'),
(488, 'BSU/SC/CMP/19/54155/STA222/2022', 'BSU/SC/CMP/19/54155', 'STA 222', 4, 86, 'A', 5, 'Second', 2022, '2022/2023'),
(489, 'BSU/SC/CMP/19/54155/GST122/2021', 'BSU/SC/CMP/19/54155', 'GST 122', 2, 82, 'A', 5, 'Second', 2021, '2021/2022'),
(490, 'BSU/SC/CMP/19/54155/GST222/2022', 'BSU/SC/CMP/19/54155', 'GST 222', 2, 51, 'C', 3, 'Second', 2022, '2022/2023'),
(491, 'BSU/SC/CMP/19/54155/GST121/2021', 'BSU/SC/CMP/19/54155', 'GST 121', 2, 51, 'C', 3, 'First', 2021, '2021/2022'),
(492, 'BSU/SC/CMP/19/54155/BIO206/2022', 'BSU/SC/CMP/19/54155', 'BIO 206', 2, 72, 'A', 5, 'Second', 2022, '2022/2023'),
(493, 'BSU/SC/CMP/19/54155/BIO101/2021', 'BSU/SC/CMP/19/54155', 'BIO 101', 3, 35, 'F', 0, 'First', 2021, '2021/2022'),
(494, 'BSU/SC/CMP/19/54155/EPS202/2022', 'BSU/SC/CMP/19/54155', 'EPS 202', 2, 71, 'A', 5, 'Second', 2022, '2022/2023'),
(495, 'BSU/SC/CMP/19/54155/EPS301/2023', 'BSU/SC/CMP/19/54155', 'EPS 301', 2, 80, 'A', 5, 'First', 2023, '2023/2024'),
(496, 'BSU/SC/CMP/19/54155/EPS302/2023', 'BSU/SC/CMP/19/54155', 'EPS 302', 1, 88, 'A', 5, 'Second', 2023, '2023/2024'),
(497, 'BSU/SC/CMP/19/54155/EPS201/2022', 'BSU/SC/CMP/19/54155', 'EPS 201', 2, 97, 'A', 5, 'First', 2022, '2022/2023'),
(498, 'BSU/SC/CMP/19/54155/PHY205/2022', 'BSU/SC/CMP/19/54155', 'PHY 205', 2, 49, 'D', 2, 'First', 2022, '2022/2023'),
(499, 'BSU/SC/CMP/19/54155/PHY108/2021', 'BSU/SC/CMP/19/54155', 'PHY 108', 1, 68, 'B', 4, 'Second', 2021, '2021/2022'),
(500, 'BSU/SC/CMP/19/54155/PHY201/2022', 'BSU/SC/CMP/19/54155', 'PHY 201', 2, 90, 'A', 5, 'First', 2022, '2022/2023'),
(501, 'BSU/SC/CMP/19/54155/PHY101/2021', 'BSU/SC/CMP/19/54155', 'PHY 101', 2, 78, 'A', 5, 'First', 2021, '2021/2022'),
(502, 'BSU/SC/CMP/19/54155/CHM101/2021', 'BSU/SC/CMP/19/54155', 'CHM 101', 2, 88, 'A', 5, 'First', 2021, '2021/2022'),
(503, 'BSU/SC/CMP/19/54155/CHM141/2021', 'BSU/SC/CMP/19/54155', 'CHM 141', 1, 36, 'F', 0, 'First', 2021, '2021/2022'),
(504, 'BSU/SC/CMP/19/54290/MTH101/2021', 'BSU/SC/CMP/19/54290', 'MTH 101', 3, 98, 'A', 5, 'First', 2021, '2021/2022'),
(505, 'BSU/SC/CMP/19/54290/MTH406/2024', 'BSU/SC/CMP/19/54290', 'MTH 406', 6, 69, 'B', 4, 'Second', 2024, '2024/2025'),
(506, 'BSU/SC/CMP/19/54290/MTH424/2024', 'BSU/SC/CMP/19/54290', 'MTH 424', 3, 93, 'A', 5, 'Second', 2024, '2024/2025'),
(507, 'BSU/SC/CMP/19/54290/MTH205/2022', 'BSU/SC/CMP/19/54290', 'MTH 205', 2, 85, 'A', 5, 'First', 2022, '2022/2023'),
(508, 'BSU/SC/CMP/19/54290/CMP313/2023', 'BSU/SC/CMP/19/54290', 'CMP 313', 3, 46, 'D', 2, 'First', 2023, '2023/2024'),
(509, 'BSU/SC/CMP/19/54290/CMP333/2023', 'BSU/SC/CMP/19/54290', 'CMP 333', 2, 88, 'A', 5, 'First', 2023, '2023/2024'),
(510, 'BSU/SC/CMP/19/54290/CMP315/2023', 'BSU/SC/CMP/19/54290', 'CMP 315', 3, 58, 'C', 3, 'First', 2023, '2023/2024'),
(511, 'BSU/SC/CMP/19/54290/CMP203/2022', 'BSU/SC/CMP/19/54290', 'CMP 203', 2, 70, 'A', 5, 'First', 2022, '2022/2023'),
(512, 'BSU/SC/CMP/19/54290/CMP415/2024', 'BSU/SC/CMP/19/54290', 'CMP 415', 2, 76, 'A', 5, 'First', 2024, '2024/2025'),
(513, 'BSU/SC/CMP/19/54290/CMP102/2021', 'BSU/SC/CMP/19/54290', 'CMP 102', 3, 68, 'B', 4, 'Second', 2021, '2021/2022'),
(514, 'BSU/SC/CMP/19/54290/CMP321/2023', 'BSU/SC/CMP/19/54290', 'CMP 321', 2, 83, 'A', 5, 'First', 2023, '2023/2024'),
(515, 'BSU/SC/CMP/19/54290/CMP101/2021', 'BSU/SC/CMP/19/54290', 'CMP 101', 2, 39, 'F', 0, 'First', 2021, '2021/2022'),
(516, 'BSU/SC/CMP/19/54290/CMP468/2024', 'BSU/SC/CMP/19/54290', 'CMP 468', 2, 60, 'B', 4, 'Second', 2024, '2024/2025'),
(517, 'BSU/SC/CMP/19/54290/CMP413/2024', 'BSU/SC/CMP/19/54290', 'CMP 413', 3, 80, 'A', 5, 'First', 2024, '2024/2025'),
(518, 'BSU/SC/CMP/19/54290/CMP360/2023', 'BSU/SC/CMP/19/54290', 'CMP 360', 6, 50, 'C', 3, 'Second', 2023, '2023/2024'),
(519, 'BSU/SC/CMP/19/54290/CMP270/2022', 'BSU/SC/CMP/19/54290', 'CMP 270', 3, 50, 'C', 3, 'Second', 2022, '2022/2023'),
(520, 'BSU/SC/CMP/19/54290/CMP223/2022', 'BSU/SC/CMP/19/54290', 'CMP 223', 3, 70, 'A', 5, 'First', 2022, '2022/2023'),
(521, 'BSU/SC/CMP/19/54290/CMP202/2022', 'BSU/SC/CMP/19/54290', 'CMP 202', 3, 99, 'A', 5, 'Second', 2022, '2022/2023'),
(522, 'BSU/SC/CMP/19/54290/CMP441/2024', 'BSU/SC/CMP/19/54290', 'CMP 441', 2, 42, 'E', 1, 'First', 2024, '2024/2025'),
(523, 'BSU/SC/CMP/19/54290/CMP433/2024', 'BSU/SC/CMP/19/54290', 'CMP 433', 3, 97, 'A', 5, 'First', 2024, '2024/2025'),
(524, 'BSU/SC/CMP/19/54290/CMP311/2023', 'BSU/SC/CMP/19/54290', 'CMP 311', 2, 45, 'D', 2, 'First', 2023, '2023/2024'),
(525, 'BSU/SC/CMP/19/54290/CMP201/2022', 'BSU/SC/CMP/19/54290', 'CMP 201', 3, 49, 'D', 2, 'First', 2022, '2022/2023'),
(526, 'BSU/SC/CMP/19/54290/CMP205/2022', 'BSU/SC/CMP/19/54290', 'CMP 205', 3, 77, 'A', 5, 'First', 2022, '2022/2023'),
(527, 'BSU/SC/CMP/19/54290/CMP472/2024', 'BSU/SC/CMP/19/54290', 'CMP 472', 3, 69, 'B', 4, 'Second', 2024, '2024/2025'),
(528, 'BSU/SC/CMP/19/54290/CMP331/2023', 'BSU/SC/CMP/19/54290', 'CMP 331', 3, 82, 'A', 5, 'First', 2023, '2023/2024'),
(529, 'BSU/SC/CMP/19/54290/CMP210/2022', 'BSU/SC/CMP/19/54290', 'CMP 210', 3, 35, 'F', 0, 'Second', 2022, '2022/2023'),
(530, 'BSU/SC/CMP/19/54290/CMP442/2024', 'BSU/SC/CMP/19/54290', 'CMP 442', 2, 40, 'E', 1, 'Second', 2024, '2024/2025'),
(531, 'BSU/SC/CMP/19/54290/CMP222/2022', 'BSU/SC/CMP/19/54290', 'CMP 222', 2, 64, 'B', 4, 'Second', 2022, '2022/2023'),
(532, 'BSU/SC/CMP/19/54290/CMP264/2022', 'BSU/SC/CMP/19/54290', 'CMP 264', 3, 98, 'A', 5, 'Second', 2022, '2022/2023'),
(533, 'BSU/SC/CMP/19/54290/CMP341/2023', 'BSU/SC/CMP/19/54290', 'CMP 341', 2, 59, 'C', 3, 'First', 2023, '2023/2024'),
(534, 'BSU/SC/CMP/19/54290/CMP431/2024', 'BSU/SC/CMP/19/54290', 'CMP 431', 2, 42, 'E', 1, 'First', 2024, '2024/2025'),
(535, 'BSU/SC/CMP/19/54290/CMP466/2024', 'BSU/SC/CMP/19/54290', 'CMP 466', 2, 75, 'A', 5, 'Second', 2024, '2024/2025'),
(536, 'BSU/SC/CMP/19/54290/CMP492/2024', 'BSU/SC/CMP/19/54290', 'CMP 492', 6, 79, 'A', 5, 'Second', 2024, '2024/2025'),
(537, 'BSU/SC/CMP/19/54290/CMP474/2024', 'BSU/SC/CMP/19/54290', 'CMP 474', 2, 67, 'B', 4, 'Second', 2024, '2024/2025'),
(538, 'BSU/SC/CMP/19/54290/CMP491/2024', 'BSU/SC/CMP/19/54290', 'CMP 491', 2, 69, 'B', 4, 'First', 2024, '2024/2025'),
(539, 'BSU/SC/CMP/19/54290/CMP120/2021', 'BSU/SC/CMP/19/54290', 'CMP 120', 3, 42, 'E', 1, 'Second', 2021, '2021/2022'),
(540, 'BSU/SC/CMP/19/54290/CMP207/2022', 'BSU/SC/CMP/19/54290', 'CMP 207', 3, 44, 'E', 1, 'First', 2022, '2022/2023'),
(541, 'BSU/SC/CMP/19/54290/CMP411/2024', 'BSU/SC/CMP/19/54290', 'CMP 411', 2, 64, 'B', 4, 'First', 2024, '2024/2025'),
(542, 'BSU/SC/CMP/19/54290/STA222/2022', 'BSU/SC/CMP/19/54290', 'STA 222', 4, 88, 'A', 5, 'Second', 2022, '2022/2023'),
(543, 'BSU/SC/CMP/19/54290/GST122/2021', 'BSU/SC/CMP/19/54290', 'GST 122', 2, 76, 'A', 5, 'Second', 2021, '2021/2022'),
(544, 'BSU/SC/CMP/19/54290/GST222/2022', 'BSU/SC/CMP/19/54290', 'GST 222', 2, 88, 'A', 5, 'Second', 2022, '2022/2023'),
(545, 'BSU/SC/CMP/19/54290/GST121/2021', 'BSU/SC/CMP/19/54290', 'GST 121', 2, 40, 'E', 1, 'First', 2021, '2021/2022'),
(546, 'BSU/SC/CMP/19/54290/BIO206/2022', 'BSU/SC/CMP/19/54290', 'BIO 206', 2, 47, 'D', 2, 'Second', 2022, '2022/2023'),
(547, 'BSU/SC/CMP/19/54290/BIO101/2021', 'BSU/SC/CMP/19/54290', 'BIO 101', 3, 88, 'A', 5, 'First', 2021, '2021/2022'),
(548, 'BSU/SC/CMP/19/54290/EPS202/2022', 'BSU/SC/CMP/19/54290', 'EPS 202', 2, 55, 'C', 3, 'Second', 2022, '2022/2023'),
(549, 'BSU/SC/CMP/19/54290/EPS301/2023', 'BSU/SC/CMP/19/54290', 'EPS 301', 2, 54, 'C', 3, 'First', 2023, '2023/2024'),
(550, 'BSU/SC/CMP/19/54290/EPS302/2023', 'BSU/SC/CMP/19/54290', 'EPS 302', 1, 74, 'A', 5, 'Second', 2023, '2023/2024'),
(551, 'BSU/SC/CMP/19/54290/EPS201/2022', 'BSU/SC/CMP/19/54290', 'EPS 201', 2, 36, 'F', 0, 'First', 2022, '2022/2023'),
(552, 'BSU/SC/CMP/19/54290/PHY205/2022', 'BSU/SC/CMP/19/54290', 'PHY 205', 2, 72, 'A', 5, 'First', 2022, '2022/2023'),
(553, 'BSU/SC/CMP/19/54290/PHY108/2021', 'BSU/SC/CMP/19/54290', 'PHY 108', 1, 78, 'A', 5, 'Second', 2021, '2021/2022'),
(554, 'BSU/SC/CMP/19/54290/PHY201/2022', 'BSU/SC/CMP/19/54290', 'PHY 201', 2, 74, 'A', 5, 'First', 2022, '2022/2023'),
(555, 'BSU/SC/CMP/19/54290/PHY101/2021', 'BSU/SC/CMP/19/54290', 'PHY 101', 2, 37, 'F', 0, 'First', 2021, '2021/2022'),
(556, 'BSU/SC/CMP/19/54290/CHM101/2021', 'BSU/SC/CMP/19/54290', 'CHM 101', 2, 75, 'A', 5, 'First', 2021, '2021/2022'),
(557, 'BSU/SC/CMP/19/54290/CHM141/2021', 'BSU/SC/CMP/19/54290', 'CHM 141', 1, 91, 'A', 5, 'First', 2021, '2021/2022'),
(558, 'BSU/SC/CMP/19/53233/MTH101/2021', 'BSU/SC/CMP/19/53233', 'MTH 101', 3, 61, 'B', 4, 'First', 2021, '2021/2022'),
(559, 'BSU/SC/CMP/19/53233/MTH406/2024', 'BSU/SC/CMP/19/53233', 'MTH 406', 6, 72, 'A', 5, 'Second', 2024, '2024/2025'),
(560, 'BSU/SC/CMP/19/53233/MTH424/2024', 'BSU/SC/CMP/19/53233', 'MTH 424', 3, 78, 'A', 5, 'Second', 2024, '2024/2025'),
(561, 'BSU/SC/CMP/19/53233/MTH205/2022', 'BSU/SC/CMP/19/53233', 'MTH 205', 2, 73, 'A', 5, 'First', 2022, '2022/2023'),
(562, 'BSU/SC/CMP/19/53233/CMP313/2023', 'BSU/SC/CMP/19/53233', 'CMP 313', 3, 30, 'F', 0, 'First', 2023, '2023/2024'),
(563, 'BSU/SC/CMP/19/53233/CMP333/2023', 'BSU/SC/CMP/19/53233', 'CMP 333', 2, 45, 'D', 2, 'First', 2023, '2023/2024'),
(564, 'BSU/SC/CMP/19/53233/CMP315/2023', 'BSU/SC/CMP/19/53233', 'CMP 315', 3, 32, 'F', 0, 'First', 2023, '2023/2024'),
(565, 'BSU/SC/CMP/19/53233/CMP203/2022', 'BSU/SC/CMP/19/53233', 'CMP 203', 2, 69, 'B', 4, 'First', 2022, '2022/2023'),
(566, 'BSU/SC/CMP/19/53233/CMP415/2024', 'BSU/SC/CMP/19/53233', 'CMP 415', 2, 77, 'A', 5, 'First', 2024, '2024/2025'),
(567, 'BSU/SC/CMP/19/53233/CMP102/2021', 'BSU/SC/CMP/19/53233', 'CMP 102', 3, 75, 'A', 5, 'Second', 2021, '2021/2022'),
(568, 'BSU/SC/CMP/19/53233/CMP321/2023', 'BSU/SC/CMP/19/53233', 'CMP 321', 2, 45, 'D', 2, 'First', 2023, '2023/2024'),
(569, 'BSU/SC/CMP/19/53233/CMP101/2021', 'BSU/SC/CMP/19/53233', 'CMP 101', 2, 42, 'E', 1, 'First', 2021, '2021/2022'),
(570, 'BSU/SC/CMP/19/53233/CMP468/2024', 'BSU/SC/CMP/19/53233', 'CMP 468', 2, 47, 'D', 2, 'Second', 2024, '2024/2025'),
(571, 'BSU/SC/CMP/19/53233/CMP413/2024', 'BSU/SC/CMP/19/53233', 'CMP 413', 3, 79, 'A', 5, 'First', 2024, '2024/2025'),
(572, 'BSU/SC/CMP/19/53233/CMP360/2023', 'BSU/SC/CMP/19/53233', 'CMP 360', 6, 80, 'A', 5, 'Second', 2023, '2023/2024'),
(573, 'BSU/SC/CMP/19/53233/CMP270/2022', 'BSU/SC/CMP/19/53233', 'CMP 270', 3, 66, 'B', 4, 'Second', 2022, '2022/2023'),
(574, 'BSU/SC/CMP/19/53233/CMP223/2022', 'BSU/SC/CMP/19/53233', 'CMP 223', 3, 58, 'C', 3, 'First', 2022, '2022/2023'),
(575, 'BSU/SC/CMP/19/53233/CMP202/2022', 'BSU/SC/CMP/19/53233', 'CMP 202', 3, 64, 'B', 4, 'Second', 2022, '2022/2023'),
(576, 'BSU/SC/CMP/19/53233/CMP441/2024', 'BSU/SC/CMP/19/53233', 'CMP 441', 2, 47, 'D', 2, 'First', 2024, '2024/2025'),
(577, 'BSU/SC/CMP/19/53233/CMP433/2024', 'BSU/SC/CMP/19/53233', 'CMP 433', 3, 82, 'A', 5, 'First', 2024, '2024/2025'),
(578, 'BSU/SC/CMP/19/53233/CMP311/2023', 'BSU/SC/CMP/19/53233', 'CMP 311', 2, 97, 'A', 5, 'First', 2023, '2023/2024'),
(579, 'BSU/SC/CMP/19/53233/CMP201/2022', 'BSU/SC/CMP/19/53233', 'CMP 201', 3, 69, 'B', 4, 'First', 2022, '2022/2023'),
(580, 'BSU/SC/CMP/19/53233/CMP205/2022', 'BSU/SC/CMP/19/53233', 'CMP 205', 3, 93, 'A', 5, 'First', 2022, '2022/2023'),
(581, 'BSU/SC/CMP/19/53233/CMP472/2024', 'BSU/SC/CMP/19/53233', 'CMP 472', 3, 90, 'A', 5, 'Second', 2024, '2024/2025'),
(582, 'BSU/SC/CMP/19/53233/CMP331/2023', 'BSU/SC/CMP/19/53233', 'CMP 331', 3, 69, 'B', 4, 'First', 2023, '2023/2024'),
(583, 'BSU/SC/CMP/19/53233/CMP210/2022', 'BSU/SC/CMP/19/53233', 'CMP 210', 3, 46, 'D', 2, 'Second', 2022, '2022/2023'),
(584, 'BSU/SC/CMP/19/53233/CMP442/2024', 'BSU/SC/CMP/19/53233', 'CMP 442', 2, 64, 'B', 4, 'Second', 2024, '2024/2025'),
(585, 'BSU/SC/CMP/19/53233/CMP222/2022', 'BSU/SC/CMP/19/53233', 'CMP 222', 2, 83, 'A', 5, 'Second', 2022, '2022/2023'),
(586, 'BSU/SC/CMP/19/53233/CMP264/2022', 'BSU/SC/CMP/19/53233', 'CMP 264', 3, 52, 'C', 3, 'Second', 2022, '2022/2023'),
(587, 'BSU/SC/CMP/19/53233/CMP341/2023', 'BSU/SC/CMP/19/53233', 'CMP 341', 2, 53, 'C', 3, 'First', 2023, '2023/2024'),
(588, 'BSU/SC/CMP/19/53233/CMP431/2024', 'BSU/SC/CMP/19/53233', 'CMP 431', 2, 80, 'A', 5, 'First', 2024, '2024/2025'),
(589, 'BSU/SC/CMP/19/53233/CMP466/2024', 'BSU/SC/CMP/19/53233', 'CMP 466', 2, 70, 'A', 5, 'Second', 2024, '2024/2025'),
(590, 'BSU/SC/CMP/19/53233/CMP492/2024', 'BSU/SC/CMP/19/53233', 'CMP 492', 6, 79, 'A', 5, 'Second', 2024, '2024/2025'),
(591, 'BSU/SC/CMP/19/53233/CMP474/2024', 'BSU/SC/CMP/19/53233', 'CMP 474', 2, 83, 'A', 5, 'Second', 2024, '2024/2025'),
(592, 'BSU/SC/CMP/19/53233/CMP491/2024', 'BSU/SC/CMP/19/53233', 'CMP 491', 2, 78, 'A', 5, 'First', 2024, '2024/2025'),
(593, 'BSU/SC/CMP/19/53233/CMP120/2021', 'BSU/SC/CMP/19/53233', 'CMP 120', 3, 41, 'E', 1, 'Second', 2021, '2021/2022'),
(594, 'BSU/SC/CMP/19/53233/CMP207/2022', 'BSU/SC/CMP/19/53233', 'CMP 207', 3, 83, 'A', 5, 'First', 2022, '2022/2023'),
(595, 'BSU/SC/CMP/19/53233/CMP411/2024', 'BSU/SC/CMP/19/53233', 'CMP 411', 2, 52, 'C', 3, 'First', 2024, '2024/2025'),
(596, 'BSU/SC/CMP/19/53233/STA222/2022', 'BSU/SC/CMP/19/53233', 'STA 222', 4, 51, 'C', 3, 'Second', 2022, '2022/2023'),
(597, 'BSU/SC/CMP/19/53233/GST122/2021', 'BSU/SC/CMP/19/53233', 'GST 122', 2, 67, 'B', 4, 'Second', 2021, '2021/2022'),
(598, 'BSU/SC/CMP/19/53233/GST222/2022', 'BSU/SC/CMP/19/53233', 'GST 222', 2, 85, 'A', 5, 'Second', 2022, '2022/2023'),
(599, 'BSU/SC/CMP/19/53233/GST121/2021', 'BSU/SC/CMP/19/53233', 'GST 121', 2, 52, 'C', 3, 'First', 2021, '2021/2022'),
(600, 'BSU/SC/CMP/19/53233/BIO206/2022', 'BSU/SC/CMP/19/53233', 'BIO 206', 2, 47, 'D', 2, 'Second', 2022, '2022/2023'),
(601, 'BSU/SC/CMP/19/53233/BIO101/2021', 'BSU/SC/CMP/19/53233', 'BIO 101', 3, 48, 'D', 2, 'First', 2021, '2021/2022'),
(602, 'BSU/SC/CMP/19/53233/EPS202/2022', 'BSU/SC/CMP/19/53233', 'EPS 202', 2, 72, 'A', 5, 'Second', 2022, '2022/2023'),
(603, 'BSU/SC/CMP/19/53233/EPS301/2023', 'BSU/SC/CMP/19/53233', 'EPS 301', 2, 42, 'E', 1, 'First', 2023, '2023/2024'),
(604, 'BSU/SC/CMP/19/53233/EPS302/2023', 'BSU/SC/CMP/19/53233', 'EPS 302', 1, 38, 'F', 0, 'Second', 2023, '2023/2024'),
(605, 'BSU/SC/CMP/19/53233/EPS201/2022', 'BSU/SC/CMP/19/53233', 'EPS 201', 2, 32, 'F', 0, 'First', 2022, '2022/2023'),
(606, 'BSU/SC/CMP/19/53233/PHY205/2022', 'BSU/SC/CMP/19/53233', 'PHY 205', 2, 89, 'A', 5, 'First', 2022, '2022/2023'),
(607, 'BSU/SC/CMP/19/53233/PHY108/2021', 'BSU/SC/CMP/19/53233', 'PHY 108', 1, 34, 'F', 0, 'Second', 2021, '2021/2022'),
(608, 'BSU/SC/CMP/19/53233/PHY201/2022', 'BSU/SC/CMP/19/53233', 'PHY 201', 2, 87, 'A', 5, 'First', 2022, '2022/2023'),
(609, 'BSU/SC/CMP/19/53233/PHY101/2021', 'BSU/SC/CMP/19/53233', 'PHY 101', 2, 90, 'A', 5, 'First', 2021, '2021/2022'),
(610, 'BSU/SC/CMP/19/53233/CHM101/2021', 'BSU/SC/CMP/19/53233', 'CHM 101', 2, 87, 'A', 5, 'First', 2021, '2021/2022'),
(611, 'BSU/SC/CMP/19/53233/CHM141/2021', 'BSU/SC/CMP/19/53233', 'CHM 141', 1, 68, 'B', 4, 'First', 2021, '2021/2022'),
(612, 'BSU/SC/CMP/19/53617/MTH101/2021', 'BSU/SC/CMP/19/53617', 'MTH 101', 3, 48, 'D', 2, 'First', 2021, '2021/2022'),
(613, 'BSU/SC/CMP/19/53617/MTH406/2024', 'BSU/SC/CMP/19/53617', 'MTH 406', 6, 77, 'A', 5, 'Second', 2024, '2024/2025'),
(614, 'BSU/SC/CMP/19/53617/MTH424/2024', 'BSU/SC/CMP/19/53617', 'MTH 424', 3, 71, 'A', 5, 'Second', 2024, '2024/2025'),
(615, 'BSU/SC/CMP/19/53617/MTH205/2022', 'BSU/SC/CMP/19/53617', 'MTH 205', 2, 95, 'A', 5, 'First', 2022, '2022/2023'),
(616, 'BSU/SC/CMP/19/53617/CMP313/2023', 'BSU/SC/CMP/19/53617', 'CMP 313', 3, 90, 'A', 5, 'First', 2023, '2023/2024'),
(617, 'BSU/SC/CMP/19/53617/CMP333/2023', 'BSU/SC/CMP/19/53617', 'CMP 333', 2, 66, 'B', 4, 'First', 2023, '2023/2024'),
(618, 'BSU/SC/CMP/19/53617/CMP315/2023', 'BSU/SC/CMP/19/53617', 'CMP 315', 3, 100, 'A', 5, 'First', 2023, '2023/2024'),
(619, 'BSU/SC/CMP/19/53617/CMP203/2022', 'BSU/SC/CMP/19/53617', 'CMP 203', 2, 61, 'B', 4, 'First', 2022, '2022/2023'),
(620, 'BSU/SC/CMP/19/53617/CMP415/2024', 'BSU/SC/CMP/19/53617', 'CMP 415', 2, 44, 'E', 1, 'First', 2024, '2024/2025'),
(621, 'BSU/SC/CMP/19/53617/CMP102/2021', 'BSU/SC/CMP/19/53617', 'CMP 102', 3, 81, 'A', 5, 'Second', 2021, '2021/2022'),
(622, 'BSU/SC/CMP/19/53617/CMP321/2023', 'BSU/SC/CMP/19/53617', 'CMP 321', 2, 30, 'F', 0, 'First', 2023, '2023/2024'),
(623, 'BSU/SC/CMP/19/53617/CMP101/2021', 'BSU/SC/CMP/19/53617', 'CMP 101', 2, 92, 'A', 5, 'First', 2021, '2021/2022'),
(624, 'BSU/SC/CMP/19/53617/CMP468/2024', 'BSU/SC/CMP/19/53617', 'CMP 468', 2, 55, 'C', 3, 'Second', 2024, '2024/2025'),
(625, 'BSU/SC/CMP/19/53617/CMP413/2024', 'BSU/SC/CMP/19/53617', 'CMP 413', 3, 40, 'E', 1, 'First', 2024, '2024/2025'),
(626, 'BSU/SC/CMP/19/53617/CMP360/2023', 'BSU/SC/CMP/19/53617', 'CMP 360', 6, 76, 'A', 5, 'Second', 2023, '2023/2024'),
(627, 'BSU/SC/CMP/19/53617/CMP270/2022', 'BSU/SC/CMP/19/53617', 'CMP 270', 3, 89, 'A', 5, 'Second', 2022, '2022/2023'),
(628, 'BSU/SC/CMP/19/53617/CMP223/2022', 'BSU/SC/CMP/19/53617', 'CMP 223', 3, 45, 'D', 2, 'First', 2022, '2022/2023'),
(629, 'BSU/SC/CMP/19/53617/CMP202/2022', 'BSU/SC/CMP/19/53617', 'CMP 202', 3, 69, 'B', 4, 'Second', 2022, '2022/2023'),
(630, 'BSU/SC/CMP/19/53617/CMP441/2024', 'BSU/SC/CMP/19/53617', 'CMP 441', 2, 40, 'E', 1, 'First', 2024, '2024/2025'),
(631, 'BSU/SC/CMP/19/53617/CMP433/2024', 'BSU/SC/CMP/19/53617', 'CMP 433', 3, 33, 'F', 0, 'First', 2024, '2024/2025'),
(632, 'BSU/SC/CMP/19/53617/CMP311/2023', 'BSU/SC/CMP/19/53617', 'CMP 311', 2, 88, 'A', 5, 'First', 2023, '2023/2024'),
(633, 'BSU/SC/CMP/19/53617/CMP201/2022', 'BSU/SC/CMP/19/53617', 'CMP 201', 3, 98, 'A', 5, 'First', 2022, '2022/2023'),
(634, 'BSU/SC/CMP/19/53617/CMP205/2022', 'BSU/SC/CMP/19/53617', 'CMP 205', 3, 55, 'C', 3, 'First', 2022, '2022/2023'),
(635, 'BSU/SC/CMP/19/53617/CMP472/2024', 'BSU/SC/CMP/19/53617', 'CMP 472', 3, 93, 'A', 5, 'Second', 2024, '2024/2025'),
(636, 'BSU/SC/CMP/19/53617/CMP331/2023', 'BSU/SC/CMP/19/53617', 'CMP 331', 3, 57, 'C', 3, 'First', 2023, '2023/2024'),
(637, 'BSU/SC/CMP/19/53617/CMP210/2022', 'BSU/SC/CMP/19/53617', 'CMP 210', 3, 50, 'C', 3, 'Second', 2022, '2022/2023'),
(638, 'BSU/SC/CMP/19/53617/CMP442/2024', 'BSU/SC/CMP/19/53617', 'CMP 442', 2, 49, 'D', 2, 'Second', 2024, '2024/2025'),
(639, 'BSU/SC/CMP/19/53617/CMP222/2022', 'BSU/SC/CMP/19/53617', 'CMP 222', 2, 63, 'B', 4, 'Second', 2022, '2022/2023'),
(640, 'BSU/SC/CMP/19/53617/CMP264/2022', 'BSU/SC/CMP/19/53617', 'CMP 264', 3, 68, 'B', 4, 'Second', 2022, '2022/2023'),
(641, 'BSU/SC/CMP/19/53617/CMP341/2023', 'BSU/SC/CMP/19/53617', 'CMP 341', 2, 50, 'C', 3, 'First', 2023, '2023/2024'),
(642, 'BSU/SC/CMP/19/53617/CMP431/2024', 'BSU/SC/CMP/19/53617', 'CMP 431', 2, 89, 'A', 5, 'First', 2024, '2024/2025'),
(643, 'BSU/SC/CMP/19/53617/CMP466/2024', 'BSU/SC/CMP/19/53617', 'CMP 466', 2, 51, 'C', 3, 'Second', 2024, '2024/2025'),
(644, 'BSU/SC/CMP/19/53617/CMP492/2024', 'BSU/SC/CMP/19/53617', 'CMP 492', 6, 31, 'F', 0, 'Second', 2024, '2024/2025'),
(645, 'BSU/SC/CMP/19/53617/CMP474/2024', 'BSU/SC/CMP/19/53617', 'CMP 474', 2, 41, 'E', 1, 'Second', 2024, '2024/2025'),
(646, 'BSU/SC/CMP/19/53617/CMP491/2024', 'BSU/SC/CMP/19/53617', 'CMP 491', 2, 83, 'A', 5, 'First', 2024, '2024/2025'),
(647, 'BSU/SC/CMP/19/53617/CMP120/2021', 'BSU/SC/CMP/19/53617', 'CMP 120', 3, 50, 'C', 3, 'Second', 2021, '2021/2022'),
(648, 'BSU/SC/CMP/19/53617/CMP207/2022', 'BSU/SC/CMP/19/53617', 'CMP 207', 3, 42, 'E', 1, 'First', 2022, '2022/2023'),
(649, 'BSU/SC/CMP/19/53617/CMP411/2024', 'BSU/SC/CMP/19/53617', 'CMP 411', 2, 33, 'F', 0, 'First', 2024, '2024/2025'),
(650, 'BSU/SC/CMP/19/53617/STA222/2022', 'BSU/SC/CMP/19/53617', 'STA 222', 4, 79, 'A', 5, 'Second', 2022, '2022/2023'),
(651, 'BSU/SC/CMP/19/53617/GST122/2021', 'BSU/SC/CMP/19/53617', 'GST 122', 2, 51, 'C', 3, 'Second', 2021, '2021/2022'),
(652, 'BSU/SC/CMP/19/53617/GST222/2022', 'BSU/SC/CMP/19/53617', 'GST 222', 2, 63, 'B', 4, 'Second', 2022, '2022/2023'),
(653, 'BSU/SC/CMP/19/53617/GST121/2021', 'BSU/SC/CMP/19/53617', 'GST 121', 2, 61, 'B', 4, 'First', 2021, '2021/2022'),
(654, 'BSU/SC/CMP/19/53617/BIO206/2022', 'BSU/SC/CMP/19/53617', 'BIO 206', 2, 85, 'A', 5, 'Second', 2022, '2022/2023'),
(655, 'BSU/SC/CMP/19/53617/BIO101/2021', 'BSU/SC/CMP/19/53617', 'BIO 101', 3, 69, 'B', 4, 'First', 2021, '2021/2022'),
(656, 'BSU/SC/CMP/19/53617/EPS202/2022', 'BSU/SC/CMP/19/53617', 'EPS 202', 2, 63, 'B', 4, 'Second', 2022, '2022/2023');
INSERT INTO `grades` (`sn`, `grade_ID`, `student_ID`, `course_code`, `credit_units`, `score`, `grade`, `grade_points`, `semester`, `exam_year`, `session`) VALUES
(657, 'BSU/SC/CMP/19/53617/EPS301/2023', 'BSU/SC/CMP/19/53617', 'EPS 301', 2, 78, 'A', 5, 'First', 2023, '2023/2024'),
(658, 'BSU/SC/CMP/19/53617/EPS302/2023', 'BSU/SC/CMP/19/53617', 'EPS 302', 1, 99, 'A', 5, 'Second', 2023, '2023/2024'),
(659, 'BSU/SC/CMP/19/53617/EPS201/2022', 'BSU/SC/CMP/19/53617', 'EPS 201', 2, 89, 'A', 5, 'First', 2022, '2022/2023'),
(660, 'BSU/SC/CMP/19/53617/PHY205/2022', 'BSU/SC/CMP/19/53617', 'PHY 205', 2, 46, 'D', 2, 'First', 2022, '2022/2023'),
(661, 'BSU/SC/CMP/19/53617/PHY108/2021', 'BSU/SC/CMP/19/53617', 'PHY 108', 1, 79, 'A', 5, 'Second', 2021, '2021/2022'),
(662, 'BSU/SC/CMP/19/53617/PHY201/2022', 'BSU/SC/CMP/19/53617', 'PHY 201', 2, 86, 'A', 5, 'First', 2022, '2022/2023'),
(663, 'BSU/SC/CMP/19/53617/PHY101/2021', 'BSU/SC/CMP/19/53617', 'PHY 101', 2, 91, 'A', 5, 'First', 2021, '2021/2022'),
(664, 'BSU/SC/CMP/19/53617/CHM101/2021', 'BSU/SC/CMP/19/53617', 'CHM 101', 2, 96, 'A', 5, 'First', 2021, '2021/2022'),
(665, 'BSU/SC/CMP/19/53617/CHM141/2021', 'BSU/SC/CMP/19/53617', 'CHM 141', 1, 38, 'F', 0, 'First', 2021, '2021/2022');

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
('BSU/SC/CMP/19/53233', 'sarah@gmail.com', '123', 'Sarah', 'Ngovihiga', 'Terhumba', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '07045136267', '12 South wing North Bank Makurdi', NULL, '24/07/1999', 'Female', 'Science'),
('BSU/SC/CMP/19/53617', 'paul@gmail.com', '123', 'paul', 'Adangbe', 'Tyovihi', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '08075643234', 'block 3 Akinde Road Makurdi', NULL, '13/11/2004', 'Male', 'Science'),
('BSU/SC/CMP/19/54155', 'Veronica@gmail.com', '123', 'Veronica', 'Vihiga', 'Tsavseer', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '0806536517', '45A shinwa road Makurdi, Benue', NULL, '04/12/1997', 'Female', 'Science'),
('BSU/SC/CMP/19/54222', 'mariam@gmail.com', '123', 'Mariam', 'Kadoon', 'Ternenge', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '08065365357', '71 off George Akume Way Makurdi, Benue state', NULL, '18/11/1996', 'Female', 'Science'),
('BSU/SC/CMP/19/54286', 'david@gmail.com', '123', 'David', 'Agerber', 'Gundusaa', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '07034567890', '15 Makurdi Road, Benue State', '', '02/03/2002', 'Male', 'Science'),
('BSU/SC/CMP/19/54290', 'silas@gmail.com', '123', 'Silas', 'Zwungega', 'Akaartenger', 'Mathematics and Computer Science', 'BSc. Computer Science', 2019, '09123134511', '51 ade friday road Naka Makurdi', NULL, '21/04/2002', 'Male', 'Science'),
('BSU/SC/CMP/19/54721', 'samson@gmail.com', '123', 'samson', 'sesugh', 'Terwamber', 'mathematics and computer science', 'BSc. Computer Science', NULL, '08054254276', '23 er street off otukpo road makurdi', NULL, '12/02/1998', '', 'Science'),
('BSU/SC/MTH/19/54289', 'emmanuel@gmail.com', '123', 'Emmanuel', 'Peter', 'Timilehin', 'Mathematics and Computer Science', 'BSc. Mathematics', 2019, '08165432198', '42 High Level Road, Makurdi', '', '', 'Male', 'Science'),
('BSU/SC/STA/19/51655', 'andrew@gmail.com', '123', 'Andrew', 'Tartaver', 'Abuwambe', 'Mathematics and Computer Science', 'BSc. Statistics', 2019, '09123716388', '23 Opoga Street High level Makurdi', NULL, '20/08/2001', 'Male', 'Science');

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
(1, 'BSU/SC/MTH/19/54245', 'reded4@gmail.com', 'Rejected', '2025-03-23', '2025-04-14', NULL, 'Dispatch', 'Request submitted successfully', ''),
(2, 'BSU/SC/MTH/19/54289', 'emmanuel@gmail.com', 'Approved', '2025-03-26', '2025-04-19', NULL, 'Email', 'Request submitted successfully', ''),
(3, 'BSU/SC/CMP/19/54286', 'david@gmail.com', 'Rejected', '2025-04-04', '2025-04-19', NULL, 'Email', 'Request submitted successfully', '');

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
  MODIFY `sn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=666;

--
-- AUTO_INCREMENT for table `transcript_requests`
--
ALTER TABLE `transcript_requests`
  MODIFY `request_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
